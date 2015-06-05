#!/usr/bin/env bash

dirs="abs calDate complex findMiddle isLeapYear isTriangle nextDate showHand spaceManage tcas"

for dir in $dirs; do
    ./runone.sh $dir
done
