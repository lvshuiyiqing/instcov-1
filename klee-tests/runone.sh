#!/usr/bin/env bash

if [ $1 == "" ]; then
    exit 1
fi

file=`basename $1`
cd $file
llvm-gcc -g -c -emit-llvm $file.c
klee -allow-external-sym-calls -disable-opt -max-solver-time=1 $file.o
