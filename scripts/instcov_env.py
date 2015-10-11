#!/usr/bin/env python

import os

#INSTCOV_RT_PATH = '/Users/zzq/llvm/3.6/instcov/runtime/include/'
#INSTCOV_LIBRARY_PATH = '/Users/zzq/llvm/3.6/build/lib/instcov'
#INSTCOV_BIN_PATH = '/Users/zzq/llvm/3.6/build/bin'
INSTCOV_RT_PATH = 'D:/Labwork/Works/instcov/instcov/runtime/include'
INSTCOV_LIBRARY_PATH = 'D:/Labwork/Works/instcov/build_msvc_x64/Release/lib'
INSTCOV_BIN_PATH = 'D:/Labwork/Works/instcov/build_msvc_x64/Release/bin'

# uncomment the next line to disable short circuiting
ENABLE_SHORT_CIRCUITING = True

CC = os.getenv('CC', '')

if CC == '':
    if os.name == 'nt':
        CC='cl'
    else:
        CC='gcc'
