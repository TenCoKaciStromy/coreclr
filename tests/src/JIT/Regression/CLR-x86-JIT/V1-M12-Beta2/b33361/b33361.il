// Copyright (c) Microsoft. All rights reserved.
// Licensed under the MIT license. See LICENSE file in the project root for full license information.

.assembly extern legacy library mscorlib {}
.assembly ILGEN_0x8b849bfe {}
.class ILGEN_0x8b849bfe {

.field static	unsigned int8 field_0x3

.method static int32 Method_0x83() {
.maxstack	9

 .locals (unsigned int64 local_0x0,unsigned int32 local_0x2,int8 local_0x4)

ldc.i4 0x249e758f 
stloc local_0x2
ldc.i4 0x69e95125 
stloc local_0x4

ldc.i4 0x53b22398 
stsfld unsigned int8 ILGEN_0x8b849bfe::field_0x3

Start_Orphan_0:
 ldsfld unsigned int8 ILGEN_0x8b849bfe::field_0x3
 conv.i8
 ldloc local_0x4
 conv.ovf.u8
 mul
 stloc local_0x0
End_Orphan_0:

 ldc.i4 55
ret
}
.method static int32 Main() {
.entrypoint
.maxstack	20

call int32 ILGEN_0x8b849bfe::Method_0x83()
ldc.i4 55
sub
ldc.i4 100
add
ret
}

}
