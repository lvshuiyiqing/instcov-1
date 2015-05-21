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

${rpath}/prep.sh $file
${rpath}/instcov.sh -inst-conditions -inst-switch ${filename}.i.${extension}
${rpath}/ccwraper.sh ${filename}.i.trans.${extension} -o ${filename}