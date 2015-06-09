#!/usr/bin/env bash

dirs="abs calDate complex findMiddle isLeapYear isTriangle nextDate showHand spaceManage tcas"

rm -rf ktests
mkdir -p ktests

for dir in $dirs; do
    dir=`basename $dir`
    cp -Hr $dir/klee-last ktests/$dir
done
