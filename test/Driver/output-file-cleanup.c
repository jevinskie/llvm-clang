// RUN: touch %t.s
// RUN: not %clang -S -DCRASH -o %t.s -MMD -MF %t.d %s
// RUN: test ! -f %t.s
// RUN: test ! -f %t.d

// RUN: touch %t.s
// RUN: not %clang -S -DMISSING -o %t.s -MMD -MF %t.d %s
// RUN: test ! -f %t.s
// RUN: test ! -f %t.d

// RUN: touch %t.s
// RUN: not %clang -S -o %t.s -MMD -MF %t.d %s
// RUN: test ! -f %t.s
// RUN: test -f %t.d

// REQUIRES: shell
// REQUIRES: crash-recovery

#ifdef CRASH
#pragma clang __debug crash
#elif defined(MISSING)
#include "nonexistent.h"
#else
invalid C code
#endif

// RUN: touch %t1.c
// RUN: echo "invalid C code" > %t2.c
// RUN: cd %T && not %clang -S %t1.c %t2.c
// RUN: test -f %t1.s
// RUN: test ! -f %t2.s

// RUN: touch %t1.c
// RUN: touch %t2.c
// RUN: chmod -r %t2.c
// RUN: cd %T && not %clang -S %t1.c %t2.c
// RUN: test -f %t1.s
// RUN: test ! -f %t2.s
