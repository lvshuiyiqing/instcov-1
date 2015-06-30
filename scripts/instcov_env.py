#!/usr/bin/env python

import os

INSTCOV_RT_PATH = '/Users/zzq/llvm/3.6/instcov/runtime/include/'
INSTCOV_LIBRARY_PATH = '/Users/zzq/llvm/3.6/build/lib'
INSTCOV_BIN_PATH = '/Users/zzq/llvm/3.6/build/bin'
#INSTCOV_RT_PATH = 'D:/Labwork/Works/instcov/instcov/runtime/include'
#INSTCOV_LIBRARY_PATH = 'D:/Labwork/Works/instcov/build_msvc/Release/lib'
#INSTCOV_BIN_PATH = 'D:/Labwork/Works/instcov/build_msvc/Release/bin'

# uncomment the next line to disable short circuiting
ENABLE_SHORT_CIRCUITING = True
CC = 'gcc'

if CC == '':
  if os.name == 'nt':
    CC='cl'
  else:
    CC='gcc'
