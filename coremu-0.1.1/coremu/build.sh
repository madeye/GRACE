#!/bin/bash
export LDFLAGS="$LDFLAGS -ldl"
make distclean
./configure --prefix=/root/qemu --target=x86_64 /root/projects/repo-ppi-debug/coremu-0.1.1/qemu
pushd ../qemu/module/match
make clean
make
popd
cp -f ../qemu/module/lib/libmatch_x86_64.a ./obj
make
make install
