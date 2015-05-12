@echo off

set SDK_PATH=C:\Program Files (x86)\Microsoft SDKs\Windows\7.1A

if "%1" == "x86" goto x86
if "%1" == "x64" goto x64
echo unrecognized x86/x64
goto usage

:x86
echo Generating for x86 platform
call vcvarsall.bat x86
set INCLUDE=%SDK_PATH%\Include;%INCLUDE%
set PATH=%SDK_PATH%\Bin;%PATH%
set LIB=%SDK_PATH%\Lib;%LIB%
set CL=/D_USING_V110_SDK71_;%CL%
set LINK=/SUBSYSTEM:CONSOLE,5.01 %LINK%
goto other

:x64
echo Generating for x64 platform
call vcvarsall.bat x64
set INCLUDE=%SDK_PATH%\Include;%INCLUDE%
set PATH=%SDK_PATH%\Bin\x64;%PATH%
set LIB=%SDK_PATH%\Lib\x64;%LIB%
set CL=/D_USING_V110_SDK71_;%CL%
set LINK=/SUBSYSTEM:CONSOLE,5.02 %LINK%
goto other

:other
if "%2" == "" goto :eof

if "%3" == "" goto usage
if not "%4" == "" goto usage

set llvm_dir=%4

if %2 == static goto static
if %2 == dynamic goto dynamic
echo cannot recognize static/dynamic
goto :usage

:usage
echo usage: ^<path-to-set-up-cmake^> ^<x86^|x64^> ^[^<static^|dynamic^> ^<llvm-root-dir^>^]
goto :eof

:static
rem cmake -G "Visual Studio 12 2013" -T v120_xp -DCMAKE_BUILD_TYPE=Release -DLLVM_TARGETS_TO_BUILD="X86" -DLLVM_USE_CRT_RELEASE=MT ../llvm
echo Using static runtime
cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DLLVM_TARGETS_TO_BUILD="X86" -DLLVM_USE_CRT_RELEASE=MT ../llvm
goto :eof

:dynamic
rem cmake -G "Visual Studio 12 2013" -T v120_xp -DCMAKE_BUILD_TYPE=Release -DLLVM_TARGETS_TO_BUILD="X86" ../llvm
echo Using dynamic runtime
cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DLLVM_TARGETS_TO_BUILD="X86" ../llvm
got :eof