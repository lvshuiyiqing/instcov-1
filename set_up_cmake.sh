#!/usr/bin/env bash

USAGE="usage: <path-to-set-up-cmake> <static|dynamic> <llvm-root-dir>"

if [ $# -ne 2 ]; then
    echo $USAGE
    exit 1
fi

Darwin=0

if [ `uname -s` == "Darwin" ]; then
    Darwin=1
fi

if [ $1 == "static" ]; then
    if [ $Darwin -eq 1 ]; then
	echo "cannot set static build for OS X"
	exit 1
    fi
    cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DLLVM_TARGETS_TO_BUILD="X86" \
	  -DLLVM_BUILD_STATIC=ON -DLIBCLANG_BUILD_STATIC=ON $2
elif [ $1 == "dynamic" ]; then
    cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DLLVM_TARGETS_TO_BUILD="X86" $2
else
    echo "unrecognized static/dynamic"
fi
