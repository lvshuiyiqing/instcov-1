#!/usr/bin/env bash

if [ $# -lt 1 ]; then
    echo "syntax: <path>/run_single_file.sh <file> [args ...]"
    exit 1
fi

rpath=`dirname $0`

file=$1
extension="${file##*.}"
filename="${file%.*}"

shift 1
args="$@"

${rpath}/compile_single_file.sh ${file}
echo "executing ./${filename} $args"
./${filename} $args
${rpath}/instcov-view.sh -t dump.instcov ${filename}.i.${extension}.dbginfo -o ${filename}.pt
