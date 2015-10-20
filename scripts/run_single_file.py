#!/usr/bin/env python

import os
import sys
import string
import instcov_env
import subprocess
import compile_single_file
import instcov_view

def run(argv):
    if len(argv) < 1:
        print "syntax: <path>/run_single_file.sh <file> [args ...]"
        return 1

    file=argv[0]
    filename, extension = os.path.splitext(file)
    res = compile_single_file.run([file])
    if res != 0:
        return res
    print "executing ./"+filename+' '+string.join(argv[1:])
    subprocess.call(['./'+filename] + argv[1:])
    if os.path.isfile(filename+'.trace'):
      os.remove(filename+'.trace')
    os.rename('dump.instcov', filename+'.trace')
  
if __name__ == "__main__":
    sys.exit(run(sys.argv[1:]))
