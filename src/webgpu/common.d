module webgpu.common;

import webgpu.webgpu : SType, CallbackMode;

struct Bool {
    private uint value;

@safe nothrow @nogc:
    this(bool v)
    {
        value = v ? 1 : 0;
    }

    void opAssign(bool v)
    {
        value = v ? 1 : 0;
    }

    alias asDBool this;
    bool asDBool() const => value != 0;
}

package mixin template BitFlags() {
    alias F = typeof(this);

    ulong bits;

@safe nothrow @nogc pure:

    static typeof(this) opIndex(size_t i)
    in (i < 64) => F(cast(ulong)(1 << i));

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

    this(const(char)[] slice) @trusted
    {
        ptr = slice.ptr;
        length = slice.length;
    }

    void opAssign(const(char)[] slice) @trusted
    {
        ptr = slice.ptr;
        length = slice.length;
    }

    alias asDStr this;
    const(char)[] asDStr() @trusted inout
    {
        return (ptr && length) ? ptr[0 .. length] : null;
    }

    bool opEquals(const(char)[] other) const => this[] == other;
    size_t toHash() const => this[].hashOf;
}

auto asStringView(const(char)[] slice) => StringView(slice);

package enum ZeroInit(T) = () {
    static if (__traits(isZeroInit, T)) {
        return T.init;
    } else {
        T t;

        static foreach (field; t.tupleof) {
            {
                alias FT = typeof(field);

                static if (__traits(isZeroInit, FT))
                    __traits(child, t, field) = FT.init;
                else static if (is(FT == struct))
                    __traits(child, t, field) = ZeroInit!(typeof(field));
                else static if (is(FT == enum))
                    __traits(child, t, field) = cast(FT)0;
                else static if (__traits(isFloating, FT))
                    __traits(child, t, field) = 0;
                else
                    static assert(0, "Cannot ZeroInit field of type `", typeof(field), "`");
            }
        }

        return t;
    }
}();

struct ChainedStruct {
    ChainedStruct* next;
    SType sType;
}

template WebGPUObject(string ident) {
    package struct Impl;

    alias Handle = Impl*;

    extern (C) nothrow @nogc {
        pragma(mangle, "wgpu" ~ ident ~ "AddRef")
        private void addRef(Handle);

        pragma(mangle, "wgpu" ~ ident ~ "Release")
        private void release(Handle);
    }

    struct Uniq {
    nothrow @nogc:
        Handle handle;

        /+package +/
        this(Handle handle)
        {
            this.handle = handle;
        }

        @disable this(ref Uniq rhs);
        this(return scope Uniq rhs) @safe
        {
            handle = rhs.handle;
            rhs.handle = null;
        }

        Handle getHandle() return @safe => handle;
        alias getHandle this;

        Uniq dupRef() @trusted
        {
            if (handle)
                addRef(handle);
            return Uniq(handle);
        }

        void clear() @trusted
        {
            if (handle)
                release(handle);
            handle = null;
        }

        ~this() scope @trusted
        {
            if (handle)
                release(handle);
        }
    }

    struct Rc {
    nothrow @nogc:
        package Handle handle;

        package this(Handle handle)
        {
            this.handle = handle;
        }

        this(ref return scope Rc rhs) @trusted
        {
            handle = rhs.handle;
            if (handle)
                addRef(rhs);
        }

        Handle getHandle() return @safe => handle;
        alias getHandle this;

        void clear() @trusted
        {
            if (handle)
                release(handle);
            handle = null;
        }

        ~this() scope @trusted
        {
            if (handle)
                release(handle);
        }
    }
}

private template isWebGPUObject(alias T : Base!ident, alias Base : WebGPUObject, string ident) {
    enum isWebGPUObject = true;
}

private template isWebGPUObject(alias T) {
    enum isWebGPUObject = false;
}

template asRef(U) if (isWebGPUObject!(__traits(parent, U))) {
    alias T = __traits(parent, U);
    T.Rc asRef(U u)
    {
        auto handle = u.handle;
        u.handle = null;

        return T.Rc(handle);
    }
}

template asUniq(R) if (isWebGPUObject!(__traits(parent, R))) {
    alias T = __traits(parent, R);
    T.Uniq asUniq(R r)
    {
        auto handle = r.handle;
        r.handle = null;

        return T.Uniq(handle);
    }
}

struct CallbackInfo(bool withMode, Func, Delegate, alias invokeCallback) {
    import std.traits : Parameters;

    ChainedStruct* nextInChain;
    static if (withMode) {
        CallbackMode mode = cast(CallbackMode)0;
    }
    private typeof(&(invokeCallback!false)) callback;
    private void* userdata1;
    private void* userdata2;

    void setFunc(Func fn, void* userdata) @trusted @nogc nothrow
    {
        callback = &(invokeCallback!false);
        userdata1 = fn;
        userdata2 = userdata;
    }

    void setDelegate(Delegate dg) @trusted @nogc nothrow
    {
        callback = &(invokeCallback!true);
        userdata1 = dg.funcptr;
        userdata2 = dg.ptr;
    }
}
