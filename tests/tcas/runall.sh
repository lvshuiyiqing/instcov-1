#!/bin/sh

../../scripts/prep.sh tcas.c
../../scripts/instcov.sh -inst-conditions tcas.i.c
../../scripts/ccwraper.sh tcas.i.trans.c
./a.out 958 1 1 2597  574 4253 0  399  400 0 0 1
../../scripts/instcov-view.sh dump.instcov tcas.i.c.dbginfo
