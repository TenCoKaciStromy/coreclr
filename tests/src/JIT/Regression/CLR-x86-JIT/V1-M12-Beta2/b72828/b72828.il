// Copyright (c) Microsoft. All rights reserved.
// Licensed under the MIT license. See LICENSE file in the project root for full license information.

.assembly extern legacy library mscorlib {}
.assembly b72828 { }
.class ILGEN_0x3531e7ef {
.method static int16  Method_0xac3c20e0() {
.maxstack	3
.locals (int8[] LOCAL_0x0)
 ldc.i4 255
 newarr [mscorlib]System.SByte 
 stloc LOCAL_0x0
  ldloc LOCAL_0x0
  ldc.i4 0x33b75e17
 ldelema [mscorlib]System.SByte
ldind.i1
 ret
}
.method static int32 Main() {
.entrypoint
.maxstack	5
.try {
 call int16  ILGEN_0x3531e7ef::Method_0xac3c20e0()
conv.i4
 leave.s IL_FAIL
} catch [mscorlib]System.IndexOutOfRangeException {
leave.s IL_END
}
IL_END:
ldc.i4.s 100
ret
IL_FAIL:
ldc.i4.s 101
ret


}
}