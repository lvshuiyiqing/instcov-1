#!/usr/bin/env bash

rpath=`dirname $0`
source ${rpath}/instcov_env

${INSTCOV_BIN_PATH}/mcdc-scan "$@"