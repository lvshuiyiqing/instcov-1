#!/usr/bin/env bash

dirs="abs calDate complex findMiddle isLeapYear isTriangle nextDate showHand spaceManage tcas"

for dir in $dirs; do
    ./genone.sh $dir
done
