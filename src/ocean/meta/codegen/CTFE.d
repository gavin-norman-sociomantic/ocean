/*******************************************************************************

    Utilities for common CTFE operations needed for code generation

    Copyright:
        Copyright (c) 2017 sociomantic Labs GmbH. All rights reserved.

    License:
        Boost Software License Version 1.0. See LICENSE_BOOST.txt for details.
        Alternatively, this file may be distributed under the terms of the Tango
        3-Clause BSD License (see LICENSE_BSD.txt for details).

*******************************************************************************/

module ocean.meta.codegen.CTFE;

import ocean.meta.types.Qualifiers;

/*******************************************************************************

    Converts integer to string

    Params:
        i = integer to convert

*******************************************************************************/

istring toString ( long i )
{
    if (i == 0)
        return "0";

    if (i < 0)
        return "-" ~ toString(cast(ulong) -i);

    return toString(cast(ulong) i);
}

unittest
{
    static assert (toString(0L) == "0");
    static assert (toString(42L) == "42");
    static assert (toString(-42L) == "-42");
    static assert (toString(31L) == "31");
    static assert (toString(-31L) == "-31");
    static assert (toString(14L) == "14");
    static assert (toString(long.max) == "9223372036854775807");
    static assert (toString(long.min) == "-9223372036854775808");
}

/*******************************************************************************

    Ditto

*******************************************************************************/

istring toString ( ulong i )
{
    istring digit = "0123456789";

    if (i == 0)
        return "0";

    istring res;

    while (i > 0)
    {
        res = digit[i % 10] ~ res;
        i /= 10;
    }

    return res;
}

unittest
{
    assert (toString(14UL) == "14");
    static assert (toString(14UL) == "14");
    assert (toString(ulong.max) == "18446744073709551615");
    static assert (toString(ulong.max) == "18446744073709551615");
}

/*******************************************************************************

    Utility to strip the part before the '.' in a string.

    Params:
        name = string to scan

*******************************************************************************/

public istring stripQualifiedPrefix ( istring name )
{
    ptrdiff_t idx = name.length - 1;

    while (idx > 0 && name[idx] != '.')
        --idx;

    if (idx == 0)
        return name;
    else
        return name[idx + 1 .. $];
}

unittest
{
    assert (stripQualifiedPrefix("aa.bb") == "bb");
    static assert (stripQualifiedPrefix("aa.bb") == "bb");
    assert (stripQualifiedPrefix("aa.bb.cc") == "cc");
    static assert (stripQualifiedPrefix("aa.bb.cc") == "cc");
    assert (stripQualifiedPrefix("aabb") == "aabb");
    static assert (stripQualifiedPrefix("aabb") == "aabb");
}
