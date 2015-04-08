#!/bin/sh

rm -rf instcov-dist

mkdir -p instcov-dist

cp ../build/bin/instcov instcov-dist
cp ../build/lib/libinstcov_rt.a instcov-dist
cp ./runtime/include/ instcov-dist -r
tar -czf instcov-dist.tar.gz instcov-dist
