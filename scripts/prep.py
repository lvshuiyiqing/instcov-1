#!/usr/bin/env python

import os
import sys
import string
import instcov_env
import subprocess

def run(argv):
  if len(argv) < 1:
    print 'syntax: <input file>'
    return 1

  for file in argv:
    filename, extension = os.path.splitext(file)
    if instcov_env.CC == 'cl':
      args=[instcov_env.CC, '/P', file, '/Fi'+filename+'.i'+extension, '-I', instcov_env.INSTCOV_RT_PATH, '/FIinstcov_rt.h'] 
    else:
      args=[instcov_env.CC, '-E', file, '-o', filename+'.i'+extension, '-I', instcov_env.INSTCOV_RT_PATH, '-include', 'instcov_rt.h'] 
    res = subprocess.call(args)
    if res != 0:
      return res
  return 0

if __name__ == "__main__":
  sys.exit(run(sys.argv[1:]))
