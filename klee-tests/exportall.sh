#!/usr/bin/env bash

dirs="abs calDate complex findMiddle isLeapYear isTriangle nextDate showHand spaceManage tcas"

rm -rf export
mkdir -p export

for dir in $dirs; do
    dir=`basename $dir`
    cp -Hr $dir/klee-last export/$dir
done
