#!/usr/bin/env bash

dir=$1

cd source-original/$dir

rm -f TID
rm -rf traces
../../../scripts/compile_single_file.py $dir.c
../../tests/$dir
../../../scripts/mcdc-scan.py traces/* > MCDC_REPORT

