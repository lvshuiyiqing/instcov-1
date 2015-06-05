#!/usr/bin/env bash

dirs="abs calDate complex findMiddle isLeapYear isTriangle nextDate showHand spaceManage tcas"

rm -rf reports
mkdir -p reports
for dir in $dirs; do
    cp source-original/$dir/MCDC_REPORT reports/$dir
    cp source-original/$dir/$dir.c reports/$dir.c
done

