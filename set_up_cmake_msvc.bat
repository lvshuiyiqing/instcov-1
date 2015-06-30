@echo off

if "%3" == "" goto usage

if "%2" == "static" goto static
if "%2" == "dynamic" goto dynamic
goto usage

:check_target
if "%1" == "x86" goto x86
if "%1" == "x64" goto x64
goto usage

:generate
cmake -G %GENERATOR% -T v120_xp -DCMAKE_BUILD_TYPE=Release -DLLVM_TARGETS_TO_BUILD="X86" %MTARG% ../llvm
goto :eof

:usage
echo usage: ^<path-to-set-up-cmake^> ^<x86^|x64^> ^<static^|dynamic^> ^<llvm-root-dir^>
goto :eof

:x86
set GENERATOR="Visual Studio 12 2013"
goto generate

:x64
set GENERATOR="Visual Studio 12 2013 Win64"
goto generate

:static
set MTARG=-DLLVM_USE_CRT_RELEASE=MT
goto check_target

:dynamic
set MTARG=
goto check_target
