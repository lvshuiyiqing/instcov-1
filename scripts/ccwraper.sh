#!/usr/bin/env bash

rpath=`dirname $0`
source ${rpath}/instcov_env

$INSTCOV_CC "$@" -L${INSTCOV_LIBRARY_PATH} -linstcov_rt -lstdc++
