#!/usr/bin/env python

import sys
import os
import string
import instcov_env
import subprocess

def run(argv):
  args = [instcov_env.CC] + argv + ['-w']
  if os.name == 'nt':
    args += ['/link', '/LIBPATH:'+instcov_env.INSTCOV_LIBRARY_PATH, 'instcov_rt.lib']
  else:
    args += ['-L', instcov_env.INSTCOV_LIBRARY_PATH, '-linstcov_rt', '-lstdc++']
  return subprocess.call(args)

if __name__ == "__main__":
  sys.exit(run(sys.argv[1:]))
