#!/usr/bin/env bash

echo 0 > TID

./test_wrapper 1 1 0 1
./test_wrapper 1 0 0 0
./test_wrapper 0 0 0 0
./test_wrapper 0 0 1 1

