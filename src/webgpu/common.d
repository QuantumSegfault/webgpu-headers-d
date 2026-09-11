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
