#!/usr/bin/env bash

INSTCOV_RT_PATH=/Users/zzq/llvm/3.6/instcov/runtime/include/

if [ $# != 1 ]; then
    echo "syntax: <input>"
    exit 1
fi

FN=$1
extension="${FN##*.}"
filename="${FN%.*}"

clang -E $FN -o ${filename}.i.${extension} -I $INSTCOV_RT_PATH -include instcov_rt.h
