// RUN: not llvm-mc -triple=aarch64 -show-encoding -mattr=+sve  2>&1 < %s| FileCheck %s

// ------------------------------------------------------------------------- //
// Invalid result register

incp sp, p0
// CHECK: [[@LINE-1]]:{{[0-9]+}}: error: invalid operand
// CHECK-NEXT: incp sp, p0
// CHECK-NOT: [[@LINE-1]]:{{[0-9]+}}:

incp z0.b, p0
// CHECK: [[@LINE-1]]:{{[0-9]+}}: error: invalid element width
// CHECK-NEXT: incp z0.b, p0
// CHECK-NOT: [[@LINE-1]]:{{[0-9]+}}:


// ------------------------------------------------------------------------- //
// Invalid predicate operand

incp x0, p0
// CHECK: [[@LINE-1]]:{{[0-9]+}}: error: invalid predicate register
// CHECK-NEXT: incp x0, p0
// CHECK-NOT: [[@LINE-1]]:{{[0-9]+}}:

incp x0, p0/z
// CHECK: [[@LINE-1]]:{{[0-9]+}}: error: invalid predicate register
// CHECK-NEXT: incp x0, p0/z
// CHECK-NOT: [[@LINE-1]]:{{[0-9]+}}:

incp x0, p0/m
// CHECK: [[@LINE-1]]:{{[0-9]+}}: error: invalid predicate register
// CHECK-NEXT: incp x0, p0/m
// CHECK-NOT: [[@LINE-1]]:{{[0-9]+}}:

incp x0, p0.q
// CHECK: [[@LINE-1]]:{{[0-9]+}}: error: invalid predicate register
// CHECK-NEXT: incp x0, p0.q
// CHECK-NOT: [[@LINE-1]]:{{[0-9]+}}:
