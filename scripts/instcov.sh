#!/usr/bin/env bash

rpath=`dirname $0`
source ${rpath}/instcov_env

INSTCOV_ARGS="-inst-conditions -inst-switch -inst-assignment"
if [ "$ENABLE_SHORT_CIRCUITING" != "1" ]; then
    echo "short circuit disabled"
    INSTCOV_ARGS="${INSTCOV_ARGS} -no-short-circuits"
fi

${INSTCOV_BIN_PATH}/instcov ${INSTCOV_ARGS} "$@" --
