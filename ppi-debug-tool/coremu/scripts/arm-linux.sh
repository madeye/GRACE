#!/bin/bash

echo "(usage) arm-linux.sh <path2qemu> <kernel> <initrd> <core number>"

qemu=$1
#kern=./linux-2.6.28/arch/arm/boot/zImage
kern=$2
initrd=$3
cores=$4

sudo $qemu \
	-k en_us \
	-M realview-pbx-a9 \
	-nographic \
	-serial mon:/dev/tty \
	-smp $cores \
	-kernel $kern \
	-initrd $initrd \
	#-net none \
	#-smp $1 \
	#-initrd armv6vfp_min.cramfs
	#-append 'root=/dev/ram0'
	#-append 'console=ttyAMA0 -p' \
        #-m 128M	\
	#-s \

