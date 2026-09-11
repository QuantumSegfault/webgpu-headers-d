module webgpu.common;

package mixin template BitFlags() {
    alias F = typeof(this);

    ulong bits;

@safe nothrow @nogc pure:

    static typeof(this) opIndex(size_t i)
    in (i < 64) => F(cast(T)(1 << i));

    auto opUnary(string op : "~")() const => F(~bits);

    auto ref opOpAssign(string op)(F rhs) if (op == "|" || op == "&" || op == "^")
    {
        mixin("bits " ~ op ~ "= rhs.bits;");
        return this;
    }

    auto opBinary(string op)(F flags) const
    if (op == "|" || op == "&" || op == "^")
    {
        F result = this;
        result.opOpAssign!op(flags);
        return result;
    }
}

struct StringView {
@safe @nogc pure nothrow:
    const(char)* ptr;
    size_t length;

    this(inout T[] slice) inout @trusted
    {
        ptr = slice.ptr;
        length = slice.length;
    }

    void opAssign(T[] slice) @trusted
    {
        ptr = slice.ptr;
        length = slice.length;
    }

    alias asDSlice this;
    inout(T)[] asDSlice() @trusted inout
    {
        return (ptr && length) ? ptr[0 .. length] : null;
    }

    bool opEquals(in T[] other) const => this[] == other;
    size_t toHash() const => this[].hashOf;
}

auto toSlice(T)(inout T[] slice) => inout Slice!T(slice);

alias StringView = Slice!(const char);
