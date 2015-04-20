#!/usr/bin/env bash

INSTCOV_RT_PATH=/Users/zzq/llvm/3.6/instcov/runtime/include/

echo /Users/zzq/llvm/3.6/build/bin/instcov \
    $@ -- clang -I $INSTCOV_RT_PATH

/Users/zzq/llvm/3.6/build/bin/instcov \
    $@ -- clang -I $INSTCOV_RT_PATH
