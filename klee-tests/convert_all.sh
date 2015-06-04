#!/usr/bin/env bash

dirs="abs calDate complex findMiddle isLeapYear isTriangle nextDate showHand spaceManage tcas"

rm -rf tests
mkdir -p tests

function convert_one {
    local dir=$1
    rm -rf tests/$dir
    mkdir -p tests
    ktests=`find ktests/$dir -name *.ktest | sort`
    for ktest in $ktests; do
	echo $ktest
	test=`./convert_ktest.sh $ktest`
	echo $test >> tests/$dir
    done
}

for dir in $dirs; do
    convert_one $dir
done

