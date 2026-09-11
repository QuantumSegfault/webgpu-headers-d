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
            Nullable!string pointer;
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

    switch (str) {
        static foreach (keyword; AliasSeq!(
                "null", "auto", "false", "true", "float", "uint"
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
    import std.conv;

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

    return doc.replace("\\n", "\n").byChar.array.wrap(80, indentStr, indentStr).stripRight("\n");
}

void main()
{
    API api = FileIopipe("generator/webgpu-headers/webgpu.json").refCounted
        .bufd
        .assumeText.deserialize!API;

    auto outFile = File("src/webgpu/webgpu.d", "w");

    outFile.writeln("module webgpu.webgpu;");
    outFile.writeln();
    outFile.writeln("import webgpu.common : BitFlags;");

    outFile.writeln();

    foreach (ref constant; api.constants) {
        import std.string : toUpper;

        outFile.writeln(constant.doc.toDocBlock);
        outFile.writeln("enum " ~ constant.name.toUpper ~ " = " ~ constant.value.asDCode ~ ";");
    }

    outFile.writeln();

    foreach (ref enum_; api.enums) {
        outFile.writeln(enum_.doc.toDocBlock);
        outFile.writeln("enum " ~ enum_.name.snakeToCamel(true) ~ " : uint {");
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
        outFile.writeln("struct " ~ bitflag.name.snakeToCamel(true) ~ " {");
        outFile.writeln("    mixin BitFlags!();");
        outFile.writeln();
        foreach (i, ref entry; bitflag.entries) {
            outFile.writeln(entry.doc.toDocBlock(1));
            auto entryName = entry.name.snakeToCamel(false)
                .escapeIdentifier;
            if (entry.valueCombination.isNull) {
                if (i == 0) {
                    assert(entry.name == "none");

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
        outFile.writeln("struct " ~ callback.name.snakeToCamel(true) ~ " {}");
    }

    outFile.writeln();

    foreach (ref func; api.functions) {
        outFile.writeln("void " ~ func.name.snakeToCamel(false).escapeIdentifier ~ "() {}");
    }

    outFile.writeln();

    foreach (ref struct_; api.structs) {
        outFile.writeln("struct " ~ struct_.name.snakeToCamel(true) ~ " {}");
    }

    outFile.writeln();

    foreach (ref object; api.objects) {
        outFile.writeln("struct " ~ object.name.snakeToCamel(true) ~ " {}");
    }
}
