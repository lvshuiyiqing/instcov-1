#!/usr/bin/env bash

rpath=`dirname $0`

$rpath/ktest-tool --write-ints $1 | grep data | awk '{ print $4 }' | tr "\\n" " "


