#!/usr/bin/env bash

echo 0 > TID

./test_wrapper_sc 1 1 1 1
./test_wrapper_sc 1 0 0 0
./test_wrapper_sc 0 1 0 0
./test_wrapper_sc 0 0 0 1
./test_wrapper_sc 0 0 0 0
