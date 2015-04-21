#!/usr/bin/env bash

INSTCOV_RT_PATH=/Users/zzq/llvm/3.6/instcov/runtime/include/

if [ $# -lt 1 ]; then
    echo "syntax: <input file> ..."
    exit 1
fi

for file in $@; do
    extension="${file##*.}"
    filename="${file%.*}"
    clang -E $file -o ${filename}.i.${extension} -I $INSTCOV_RT_PATH -include instcov_rt.h
done
