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
    return 1
  file = argv[0]
  filename, extension = os.path.splitext(file)

  res = prep.run([file])
  if res != 0:
    return res
  res = instcov.run(['-mf', file, filename+'.i'+extension])
  if res != 0:
    return res
  res = instcov_view.run(
        ['-di-only', filename+'.i'+extension+'.dbginfo', '-o',
        filename+'.di'])
  if res != 0:
    return res
  if os.name == 'nt':
    return ccwraper.run([filename+'.i.trans'+extension, '-Fe'+filename])
  else:
    return ccwraper.run([filename+'.i.trans'+extension, '-o', filename])

    
if __name__ == "__main__":
  sys.exit(run(sys.argv[1:]))
