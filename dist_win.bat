@echo off

set /p VER=<VERSION

set PLATFORM=%1
if "%PLATFORM%" == "" goto usage
if NOT "%PLATFORM%" == "x86" (
  if NOT "%PLATFORM%" == "x64" goto usage
)

set MACHINE=win

rd /s /q instcov-dist
md instcov-dist
md instcov-dist\lib
md instcov-dist\bin


markdown2.py README.md > README.html
markdown2.py doc/InstCovImpl.md > doc/InstCovImpl.html

set build_dir=..\build_msvc_%PLATFORM%

xcopy %build_dir%\Release\bin\instcov.exe instcov-dist\bin
xcopy %build_dir%\Release\bin\instcov-view.exe instcov-dist\bin
xcopy %build_dir%\Release\bin\mcdc-scan.exe instcov-dist\bin
xcopy %build_dir%\Release\lib\instcov_rt.lib instcov-dist\lib
robocopy /njh /njs /ndl /nc /ns /nfl /S /E .\runtime\include instcov-dist\include
robocopy /njh /njs /ndl /nc /ns /nfl /S /E .\tests instcov-dist\tests
robocopy /njh /njs /ndl /nc /ns /nfl /S /E .\scripts instcov-dist\scripts *.py
xcopy README.md instcov-dist
xcopy README.html instcov-dist
robocopy /njh /njs /ndl /nc /ns /nfl /S /E .\doc instcov-dist\doc

7z a instcov-dist_%VER%_%PLATFORM%_%MACHINE%.zip instcov-dist

goto :eof

:usage
echo usage: ^<path-to-dist_win^> ^<x86^|x64^>
goto :eof
