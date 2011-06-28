#!/bin/bash
export LDFLAGS="$LDFLAGS -ldl"
make distclean
./configure --prefix=/root/qemu --target-list=x86_64-softmmu --disable-user \
--disable-kvm --disable-vnc-tls --disable-bluez --disable-vnc-sasl \
--enable-io-thread
pushd ./module/gpu/match
make clean
#make dbg=1
make
popd
make -j4
make install
