#!/usr/bin/env python

import os
import sys
import string
import instcov_env
import subprocess
import prep
import instcov
import instcov_view
import ccwraper

def run(argv):
  if len(argv) < 1:
    print 'syntax: <path>/compile_single_file.sh <file>'
    return
  file = argv[0]
  filename, extension = os.path.splitext(file)

  prep.run([file])
  instcov.run(['-mf', file, filename+'.i'+extension])
  instcov_view.run(['-di-only', filename+'.i'+extension+'.dbginfo', '-o', filename+'.di'])
  if os.name == 'nt':
    ccwraper.run([filename+'.i.trans'+extension, '-Fe'+filename])
  else:
    ccwraper.run([filename+'.i.trans'+extension, '-o', filename])
  
if __name__ == "__main__":
  run(sys.argv[1:])
