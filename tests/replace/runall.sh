#!/bin/sh

../../scripts/prep.sh replace.c
../../scripts/instcov.sh -inst-conditions replace.i.c
../../scripts/ccwraper.sh replace.i.trans.c
./a.out '-?' 'a&'  < 1.inp.1.1
../../scripts/instcov-view.sh dump.instcov replace.i.c.dbginfo
