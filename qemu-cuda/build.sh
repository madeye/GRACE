#!/bin/bash
export LDFLAGS="$LDFLAGS -ldl"
make distclean
./configure --prefix=/root/qemu --target-list=x86_64-softmmu
pushd ./module/match
make clean
#make dbg=1
make
popd
make -j4
make install