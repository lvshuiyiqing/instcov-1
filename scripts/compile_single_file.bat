@echo off
set bin_path=%~dp0

python %bin_path%\compile_single_file.py %*
