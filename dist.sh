#!/bin/sh

rm -rf instcov-dist

mkdir -p instcov-dist

cp ../build/bin/instcov instcov-dist
cp ../build/lib/libinstcov_rt.a instcov-dist
cp -r ./runtime/include/ instcov-dist
cp -r ./tests instcov-dist
cp -r ./scripts instcov-dist
cp README instcov-dist

tar -czf instcov-dist.tar.gz instcov-dist
