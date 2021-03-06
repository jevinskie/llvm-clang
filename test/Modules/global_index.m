// RUN: rm -rf %t
// Run without global module index
// RUN: %clang_cc1 -Wauto-import -fmodule-cache-path %t -fdisable-module-hash -fmodules -fno-modules-global-index -F %S/Inputs %s -verify
// RUN: ls %t|not grep modules.idx
// Run and create the global module index
// RUN: %clang_cc1 -Wauto-import -fmodule-cache-path %t -fdisable-module-hash -fmodules -F %S/Inputs %s -verify
// RUN: ls %t|grep modules.idx
// Run and use the global module index
// RUN: %clang_cc1 -Wauto-import -fmodule-cache-path %t -fdisable-module-hash -fmodules -F %S/Inputs %s -verify -print-stats 2>&1 | FileCheck %s

// expected-no-diagnostics
@import DependsOnModule;
@import Module;

// CHECK: *** Global Module Index Statistics:

int *get_sub() {
  return Module_Sub;
}
