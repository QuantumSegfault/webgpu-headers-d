import std.io : FileIopipe = File;
import iopipe.refc : refCounted;
import iopipe.bufpipe;
import iopipe.textpipe;
import iopipe.valve;
import iopipe.buffer;
import iopipe.json.parser;
import iopipe.json.serialize;

import std.typecons : Nullable;
import std.format : format;
import std.ascii : toUpper, isDigit;
import std.stdio : writeln, File;
import std.meta : AliasSeq;
import std.exception : enforce;

@ignoreExtras
struct API {
    struct Value64 {
        enum Tag : ubyte {
            integer,
            usizeMax,
            uint32Max,
            uint64Max,
            nan
        }

        Tag tag;
        ulong value;

        static Value64 fromJSON(JT, P)(ref JT tokenizer, ref P policy)
        {
            auto start = tokenizer.peekSignificant;
            if (start == JSONToken.Number) {
                return Value64(Value64.Tag.integer, tokenizer.deserialize!ulong);
            } else if (start == JSONToken.String) {
                auto str = tokenizer.deserialize!string;
                switch (str) {
                    case "usize_max":
                        return Value64(Tag.usizeMax, 0);
                    case "uint32_max":
                        return Value64(Tag.uint32Max, 0);
                    case "uint64_max":
                        return Value64(Tag.uint64Max, 0);
                    case "nan":
                        return Value64(Tag.nan, 0);
                    default:
                        throw new Exception(format("Error: unknown Value64: %s", str));
                }
            } else {
                throw new Exception(format("Error: expected Number or String, got %s", start));
            }
        }
    }

    struct ParameterType {
        struct Default {
            enum Tag : ubyte {
                string,
                number,
                boolean
            }

            Tag tag;
            union {
                string str;
                double number;
                bool boolean;
            }

            static Default fromJSON(JT, P)(ref JT tokenizer, ref P policy)
            {
                auto start = tokenizer.peekSignificant;
                Default ret;
                if (start == JSONToken.String) {
                    ret.tag = Tag.string;
                    ret.str = tokenizer.deserialize!string;
                } else if (start == JSONToken.Number) {
                    ret.tag = Tag.number;
                    ret.number = tokenizer.deserialize!double;
                } else if (start == JSONToken.True || start == JSONToken.False) {
                    ret.tag = Tag.boolean;
                    ret.boolean = tokenizer.deserialize!bool;
                } else {
                    throw new Exception(format("Error: expected String, Number, True, or False, got %s", start));
                }
                return ret;
            }
        }

        string doc;
        string name;
        string type;
        @(.optional) @alternateName("passed_with_ownership")
        Nullable!(bool) passedWithOwnership;
        @(.optional)
        string pointer;
        @(.optional)
        bool optional = false;
        @(.optional) @alternateName("default")
        Nullable!Default default_;
    }

    struct BitFlag {
        struct Entry {
            string doc;
            string name;

            @optional @alternateName("value_combination")
            Nullable!(string[]) valueCombination;
        }

        string doc;
        string name;
        Entry[] entries;
    }

    struct Callback {
        enum Style {
            callback_mode,
            immediate
        }

        string doc;
        string name;
        Style style;
        ParameterType[] args;
    }

    struct Constant {
        string doc;
        string name;
        Value64 value;
    }

    struct Enum {
        struct Entry {
            string doc;
            string name;
        }

        string doc;
        string name;
        Nullable!Entry[] entries;
    }

    struct Function {
        string doc;
        string name;
        @optional
        ParameterType[] args;

        struct ReturnType {
            string doc;
            string type;
            @(.optional)
            Nullable!bool optional;
            @(.optional) @alternateName("passed_with_ownership")
            Nullable!bool passedWithOwnership;
            @(.optional)
            string pointer;
        }

        @optional
        Nullable!ReturnType returns;
        @optional
        string callback;
    }

    struct Object {
        string doc;
        string name;
        Function[] methods;
    }

    struct Struct {
        enum Type {
            extensible,
            extensible_callback_arg,
            extension,
            standalone
        }

        string doc;
        string name;
        Type type;
        @optional
        string[] extends;
        @optional @alternateName("free_members")
        bool freeMembers;
        @optional
        ParameterType[] members;
    }

    BitFlag[] bitflags;
    Callback[] callbacks;
    Constant[] constants;
    Enum[] enums;
    Function[] functions;
    Object[] objects;
    Struct[] structs;
}

string snakeToCamel(const scope char[] str, bool upperFirst)
{
    import std.string : count;

    auto result = new char[str.length - str.count('_')];

    auto wordBegin = upperFirst;
    auto next = 0;

    foreach (c; str) {
        if (c == '_') {
            wordBegin = true;
            continue;
        }
        result[next++] = wordBegin ? c.toUpper : c;
        wordBegin = false;
    }

    return cast(string)result;
}

string escapeIdentifier(return scope string str)
{
    if (str[0].isDigit) {
        return "_" ~ str;
    }

    // `self` is not technically not a keyword, but we reserve for use by methods
    switch (str) {
        static foreach (keyword; AliasSeq!(
                "null", "auto", "false", "true", "float", "uint", "module",
                "self"
            )) {
            case keyword:
                return keyword ~ "_";
        }
        default:
            return str;
    }
}

string asDCode(in API.Value64 value)
{
    import std.conv : to;

    final switch (value.tag) with (API.Value64.Tag) {
        case integer:
            return to!string(value.value);
        case usizeMax:
            return "size_t.max";
        case uint32Max:
            return "uint.max";
        case uint64Max:
            return "ulong.max";
        case nan:
            return "float.nan";
    }
}

string toDocBlock(string doc, uint indent = 0)
{
    import std.string : replace, wrap;
    import std.array : array;
    import std.utf : byChar;

    string indentStr;
    {
        char[] tmp = new char[indent * 4 + 4];
        tmp[0 .. $ - 4] = ' ';
        tmp[$ - 4 .. $] = "/// ";
        indentStr = cast(string)tmp[];
    }

    import std.string : replace, stripRight;

    return doc.replace("\\\"", "\"").replace("\\n", "\n").byChar.array.wrap(80, indentStr, indentStr).stripRight(
        "\n");
}

enum TypeLocation {
    field,
    dParam,
    cParam,
    dRet,
    cRet
}

string toDType(string type, TypeLocation loc, string pointer, const scope string[string] identifierMap)
{
    import std.string : startsWith;

    if (type.startsWith("array\\u003c")) {
        enforce(loc != TypeLocation.dRet && loc != TypeLocation.cRet);
        enforce(pointer == "mutable" || pointer == "immutable");
        auto innerType = toDType(type[11 .. $ - 6], TypeLocation.field, null, identifierMap);
        return (loc == TypeLocation.dParam ? "scope " : "") ~ (pointer == "immutable" ? (
                "const(" ~ innerType ~ ")") : innerType) ~ (loc == TypeLocation.cParam ? "*" : "[]");
    }

    string result;
    switch (type) {
        case "out_string":
        case "string_with_default_empty":
        case "nullable_string":
            result = loc == TypeLocation.dParam ? "scope StringView" : "StringView";
            enforce(loc != TypeLocation.dRet && loc != TypeLocation.cRet);
            break;
        case "uint16":
            result = "ushort";
            break;
        case "int32":
            result = "int";
            break;
        case "uint32":
            result = "uint";
            break;
        case "uint64":
            result = "ulong";
            break;
        case "usize":
            result = "size_t";
            break;
        case "bool":
            result = (loc == TypeLocation.field) ? "Bool" : ((loc == TypeLocation.dParam || loc == TypeLocation
                    .dRet) ? "bool" : "uint");
            break;
        case "float32":
        case "nullable_float32":
            result = "float";
            break;
        case "float64_supertype":
            result = "double";
            break;
        case "c_void":
            result = "void";
            break;
        default:
            break;
    }

    if (type.startsWith("object.")) {
        result = (loc == TypeLocation.dParam ? "scope " : "") ~ identifierMap[type] ~ (
            loc == TypeLocation.dRet ? ".Uniq" : ".Handle");
    }

    if (!result) {
        result = identifierMap[type];
    }

    if (result) {
        if (pointer) {
            if (loc == TypeLocation.dParam && result != "void") {
                if (pointer == "immutable")
                    return "scope ref const " ~ result;
                else
                    return "scope ref " ~ result;
            } else {
                if (pointer == "immutable")
                    return "const(" ~ result ~ ")*";
                else
                    return result ~ "*";
            }
        }
        return result;
    }

    return result;
}

void writeFunction(const ref API.Function func, string objIdent, File outFile, string[string] identifierMap)
{
    import std.string : startsWith, replace;

    outFile.writeln(func.doc.toDocBlock);

    string dRetType = "void";
    string cRetType = "void";
    bool returnsObject = false;

    if (!func.returns.isNull) {
        auto ret = func.returns.get;
        if (ret.type.startsWith("object."))
            returnsObject = true;
        dRetType = ret.type.toDType(TypeLocation.dRet, ret.pointer, identifierMap);
        cRetType = ret.type.toDType(TypeLocation.cRet, ret.pointer, identifierMap);
    }

    string[] cArgs;
    string[] dArgs;
    string[] callArgs;

    if (objIdent) {
        cArgs ~= objIdent ~ ".Handle";
        dArgs ~= "scope " ~ objIdent ~ ".Handle self";
        callArgs ~= "self";
    }

    foreach (ref arg; func.args) {
        enforce(arg.default_.isNull);

        string argName = arg.name.snakeToCamel(false).escapeIdentifier;

        dArgs ~= arg.type.toDType(TypeLocation.dParam, arg.pointer, identifierMap) ~ " " ~ argName;

        if (arg.type.startsWith("array\\u003c")) {
            enforce(arg.pointer == "mutable" || arg.pointer == "immutable");

            cArgs ~= "size_t";
            cArgs ~= arg.type.toDType(TypeLocation.cParam, arg.pointer, identifierMap);

            callArgs ~= argName ~ ".length";
            callArgs ~= argName ~ ".ptr";
        } else {
            cArgs ~= arg.type.toDType(TypeLocation.cParam, arg.pointer, identifierMap);
            callArgs ~= (arg.pointer ? "&" : "") ~ argName;
        }
    }

    string dFuncName = func.name.snakeToCamel(false).escapeIdentifier;
    string cFuncName = "wgpu" ~ objIdent ~ func.name.snakeToCamel(true);

    outFile.writefln!"%s %s(%(%r, %)) @trusted nothrow @nogc {"(
        dRetType,
        dFuncName,
        dArgs
    );

    if (returnsObject) {
        outFile.writefln!"    return %s(%s(%(%r, %)));"(dRetType, cFuncName, callArgs);
    } else if (dRetType == "bool") {
        outFile.writefln!"    return %s(%(%r, %)) != 0;"(cFuncName, callArgs);
    } else if (dRetType == "void") {
        outFile.writefln!"    %s(%(%r, %));"(cFuncName, callArgs);
    } else {
        outFile.writefln!"    return %s(%(%r, %));"(cFuncName, callArgs);
    }

    outFile.writeln("}");

    outFile.writefln!"private extern(C) %s %s(%(%r, %)) nothrow @nogc;"(
        cRetType,
        cFuncName,
        cArgs
    );

    outFile.writeln();
}

void main()
{
    API api = FileIopipe("generator/webgpu-headers/webgpu.json").refCounted
        .bufd
        .assumeText.deserialize!API;

    string[string] identifierMap;
    foreach (ref constant; api.constants) {
        import std.string : toUpper;

        identifierMap["constant." ~ constant.name] = constant.name.toUpper;
    }
    foreach (ref enum_; api.enums) {
        identifierMap["enum." ~ enum_.name] = enum_.name.snakeToCamel(true);
    }
    foreach (ref bitflag; api.bitflags) {
        identifierMap["bitflag." ~ bitflag.name] = bitflag.name.snakeToCamel(true);
    }
    foreach (ref callback; api.callbacks) {
        identifierMap["callback." ~ callback.name] = callback.name.snakeToCamel(true) ~ "Callback";
    }
    foreach (ref struct_; api.structs) {
        identifierMap["struct." ~ struct_.name] = struct_.name.snakeToCamel(true);
    }

    foreach (ref object; api.objects) {
        identifierMap["object." ~ object.name] = object.name.snakeToCamel(true);
    }

    auto outFile = File("src/webgpu/webgpu.d", "w");

    outFile.writeln("module webgpu.webgpu;");
    outFile.writeln();
    outFile.writeln("import webgpu.common;");

    outFile.writeln();

    foreach (ref constant; api.constants) {
        import std.string : toUpper;

        outFile.writeln(constant.doc.toDocBlock);
        outFile.writeln(
            "enum " ~ identifierMap["constant." ~ constant.name] ~ " = " ~ constant
                .value.asDCode ~ ";");
    }

    outFile.writeln();

    foreach (ref enum_; api.enums) {
        outFile.writeln(enum_.doc.toDocBlock);
        outFile.writeln("enum " ~ identifierMap["enum." ~ enum_.name] ~ " : uint {");
        foreach (i, ref entry; enum_.entries) {
            if (entry.isNull)
                continue;

            outFile.writeln(entry.get.doc.toDocBlock(1));
            outFile.writefln!"    %s = %d,"(entry.get.name.snakeToCamel(false)
                    .escapeIdentifier, i);
        }
        outFile.writeln("}");
        outFile.writeln();
    }

    outFile.writeln();

    foreach (ref bitflag; api.bitflags) {
        import std.algorithm.iteration : map;
        import std.string : join;

        outFile.writeln(bitflag.doc.toDocBlock);
        outFile.writeln("struct " ~ identifierMap["bitflag." ~ bitflag.name] ~ " {");
        outFile.writeln("    mixin BitFlags!();");
        outFile.writeln();
        foreach (i, ref entry; bitflag.entries) {
            outFile.writeln(entry.doc.toDocBlock(1));
            auto entryName = entry.name.snakeToCamel(false)
                .escapeIdentifier;
            if (entry.valueCombination.isNull) {
                if (i == 0) {
                    enforce(entry.name == "none");

                    outFile.writeln("    enum none = typeof(this).init;");
                } else {
                    outFile.writefln!"    enum %s = typeof(this)[%d];"(entryName, i - 1);
                }
            } else {
                outFile.writefln!"    enum %s = %s;"(
                    entryName,
                    entry.valueCombination.get.map!((n) => n.snakeToCamel(false)
                        .escapeIdentifier).join(" | ")
                );
            }
        }
        outFile.writeln("}");
        outFile.writeln();
    }

    outFile.writeln();

    foreach (ref callback; api.callbacks) {
        outFile.writeln("struct " ~ identifierMap["callback." ~ callback.name] ~ " {}");
    }

    outFile.writeln();

    foreach (ref func; api.functions) {
        writeFunction(func, null, outFile, identifierMap);
    }

    outFile.writeln();

    foreach (ref struct_; api.structs) {
        import std.string : startsWith;
        import std.range : only;
        import std.algorithm.searching : canFind;
        import std.conv : to;

        outFile.writeln(struct_.doc.toDocBlock);
        outFile.writeln("struct " ~ identifierMap["struct." ~ struct_.name] ~ " {");
        final switch (struct_.type) {
            case API.Struct.Type.extensible:
            case API.Struct.Type.extensible_callback_arg:
                outFile.writeln("    ChainableStruct* nextInChain;");
                break;
            case API.Struct.Type.extension:
                outFile.writeln("    ChainableStruct chain = { sType: SType." ~ struct_.name.snakeToCamel(false)
                        .escapeIdentifier ~ " };");
                break;
            case API.Struct.Type.standalone:
                break;
        }
        foreach (ref member; struct_.members) {
            enforce(member.passedWithOwnership.isNull);
            enforce(!member.optional || member.pointer || member.type.startsWith("object."));

            string initializer = "";
            if (member.pointer) {
                enforce(member.default_.isNull);

                initializer = "null";
            } else if (member.type.startsWith("enum.")) {
                if (member.default_.isNull) {
                    immutable string enumName = member.type[5 .. $];
                    bool hasUndefined = false;
                    bool foundEnum = false;
                    foreach (ref e; api.enums) {
                        if (e.name == enumName) {
                            foundEnum = true;
                            foreach (ref entry; e.entries) {
                                if (!entry.isNull && entry.get.name == "undefined") {
                                    hasUndefined = true;
                                    break;
                                }
                            }
                            break;
                        }
                    }
                    enforce(foundEnum);

                    if (hasUndefined) {
                        initializer = identifierMap[member.type] ~ ".undefined";
                    } else {
                        initializer = "cast(" ~ identifierMap[member.type] ~ ")0";
                    }
                } else {
                    auto default_ = member.default_.get;
                    enforce(default_.tag == API.ParameterType.Default.Tag.string);
                    initializer = identifierMap[member.type] ~ "." ~ default_.str.snakeToCamel(false)
                        .escapeIdentifier;
                }
            } else if (member.type.startsWith("bitflag.")) {
                if (member.default_.isNull) {
                    initializer = identifierMap[member.type] ~ ".none";
                } else {
                    auto default_ = member.default_.get;
                    enforce(default_.tag == API.ParameterType.Default.Tag.string);
                    initializer = identifierMap[member.type] ~ "." ~ default_.str.snakeToCamel(false)
                        .escapeIdentifier;
                }
            } else if (only("uint16", "uint32", "uint64", "usize", "int32").canFind(member.type)) {
                if (member.default_.isNull) {
                    initializer = "0";
                } else {
                    auto default_ = member.default_.get;

                    enforce(default_.tag == API.ParameterType.Default.Tag.number || default_.tag == API
                            .ParameterType.Default.Tag.string);

                    if (
                        default_.tag == API.ParameterType.Default.Tag.number) {
                        initializer = (cast(long)default_.number).to!string;
                    } else if (default_.tag == API.ParameterType.Default.Tag.string) {
                        if (default_.str.startsWith("constant."))
                            initializer = identifierMap[default_.str];
                        else
                            initializer = default_.str;
                    } else {
                        assert(0);
                    }
                }
            } else if (only("float32", "nullable_float32", "float64", "float64_supertype").canFind(
                    member.type)) {
                if (member.default_.isNull) {
                    initializer = (member.type == "float32" || member.type == "nullable_float32") ? "0.0f"
                        : "0.0";
                } else {
                    auto default_ = member.default_.get;

                    enforce(default_.tag == API.ParameterType.Default.Tag.number || default_.tag == API
                            .ParameterType.Default.Tag.string);

                    if (default_.tag == API.ParameterType.Default.Tag.number) {
                        initializer = format("%.20g", default_.number);
                        if (!initializer.canFind("."))
                            initializer ~= ".0";

                        if (member.type == "float32" || member.type == "nullable_float32")
                            initializer ~= "f";
                    } else if (default_.tag == API.ParameterType.Default.Tag.string) {
                        enforce(default_.str.startsWith("constant."));
                        initializer = identifierMap[default_.str];
                    } else {
                        assert(0);
                    }
                }
            } else if (member.type == "bool") {
                if (member.default_.isNull) {
                    initializer = "false";
                } else {
                    auto default_ = member.default_.get;

                    enforce(default_.tag == API.ParameterType.Default.Tag.boolean);
                    initializer = default_.boolean ? "true" : "false";
                }
            } else if (member.type.startsWith("struct.")) {
                if (member.default_.isNull) {
                    initializer = identifierMap[member.type] ~ ".init";
                } else {
                    auto default_ = member.default_.get;

                    enforce(default_.tag == API.ParameterType.Default.Tag.string);
                    enforce(default_.str == "zero");

                    initializer = "ZeroInit!" ~ identifierMap[member.type];
                }
            } else {
                enforce(member.default_.isNull);

                enforce(member.type.startsWith("callback.") ||
                        member.type.startsWith("object.") ||
                        only("out_string", "string_with_default_empty", "nullable_string")
                            .canFind(member.type));
                initializer = member.type.toDType(TypeLocation.field, member.pointer, identifierMap) ~ ".init";
            }

            outFile.writeln(member.doc.toDocBlock(1));
            outFile.writefln!"    %s %s = %s;"(
                member.type.toDType(TypeLocation.field, member.pointer, identifierMap), member
                    .name.snakeToCamel(false).escapeIdentifier, initializer);
        }
        outFile.writeln("}");
        outFile.writeln();
    }

    outFile.writeln();

    foreach (ref object; api.objects) {
        string objIdent = identifierMap["object." ~ object.name];
        outFile.writeln(object.doc.toDocBlock);
        outFile.writeln(
            "alias " ~ objIdent ~ " = " ~ "WebGPUObject!\"" ~ objIdent ~ "\";");

        outFile.writeln();

        foreach (ref method; object.methods) {
            writeFunction(method, objIdent, outFile, identifierMap);
        }
        outFile.writeln();
        outFile.writeln();
    }
}
