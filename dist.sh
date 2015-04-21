#!/usr/bin/env bash

VER=`cat VERSION`

rm -rf instcov-dist

mkdir -p instcov-dist
mkdir -p instcov-dist/lib
mkdir -p instcov-dist/bin

cp ../build/bin/instcov instcov-dist/bin
cp ../build/bin/instcov-view instcov-dist/bin
cp ../build/lib/libinstcov_rt.a instcov-dist/lib
cp -r ./runtime/include/ instcov-dist
cp -r ./tests instcov-dist
cp -r ./scripts instcov-dist
cp README.md instcov-dist

tar -czf instcov-dist_${VER}.tar.gz instcov-dist
