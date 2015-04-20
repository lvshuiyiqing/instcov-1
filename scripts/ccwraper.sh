#!/usr/bin/env bash

INSTCOV_INCLUDE_DIR=/Users/zzq/llvm/3.6/instcov/runtime/include
INSTCOV_LIBRARY_DIR=/Users/zzq/llvm/3.6/build/lib

#LDFLAGS=$LDFLAGS 

clang -I${INSTCOV_INCLUDE_DIR} -include instcov_rt.h $@ -L${INSTCOV_LIBRARY_DIR} -linstcov_rt -lstdc++

