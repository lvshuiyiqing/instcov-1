#!/usr/bin/env python

import os
import sys
import string
import instcov_env
import subprocess

def run(argv):
  ARGS = [ instcov_env.INSTCOV_BIN_PATH+'/instcov-view' ] + argv
  return subprocess.call(ARGS)

if __name__ == "__main__":
  sys.exit(run(sys.argv[1:]))
  
