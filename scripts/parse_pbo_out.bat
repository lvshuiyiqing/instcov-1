@echo off
set bin_path=%~dp0

python %bin_path%\parse_pbo_out.py %*
