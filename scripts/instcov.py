#!/usr/bin/env bash

import os
import sys
import string
import instcov_env
import subprocess

def run(argv):
  ARGS = [instcov_env.INSTCOV_BIN_PATH+'/instcov', '-inst-conditions', '-inst-switch', '-inst-RHS']
  if instcov_env.ENABLE_SHORT_CIRCUITING != True:
    print "short circuit disabled"
    ARGS += ['-no-short-circuits']

  ARGS += argv
  ARGS += ['--']
  subprocess.call(ARGS)

if __name__ == "__main__":
  run(sys.argv[1:])
