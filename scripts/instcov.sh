#!/usr/bin/env bash

INSTCOV_RT_PATH=/Users/zzq/llvm/3.6/instcov/runtime/include/

/Users/zzq/llvm/3.6/build/bin/instcov \
    $@ -- clang -I $INSTCOV_RT_PATH \
    -include instcov_rt.h
