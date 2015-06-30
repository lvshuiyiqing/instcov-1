#!/usr/bin/env bash

rpath=`dirname $0`
source ${rpath}/instcov_env

if [ $# -lt 1 ]; then
    echo "syntax: <input file> ..."
    exit 1
fi

for file in $@; do
    extension="${file##*.}"
    filename="${file%.*}"
    $INSTCOV_CC -E $file -o ${filename}.i.${extension} -I $INSTCOV_RT_PATH -include instcov_rt.h
done
