#!/usr/bin/env bash

rpath=`dirname $0`
source ${rpath}/instcov_env

clang "$@" -L${INSTCOV_LIBRARY_PATH} -linstcov_rt -lstdc++
