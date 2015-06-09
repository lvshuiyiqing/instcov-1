#!/usr/bin/env bash

dirs="abs calDate complex findMiddle isLeapYear isTriangle nextDate showHand spaceManage tcas"

rm -rf MCDC_reports
mkdir -p MCDC_reports
for dir in $dirs; do
    cp source-original/$dir/MCDC_REPORT MCDC_reports/$dir.report
    cp source-original/$dir/$dir.c MCDC_reports/$dir.c
done

tar -czf MCDC_reports.tar.gz MCDC_reports
