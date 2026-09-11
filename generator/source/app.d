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

void main()
{
    auto api = FileIopipe("generator/webgpu-headers/webgpu.json").refCounted
        .bufd
        .assumeText.deserialize!API;
}
