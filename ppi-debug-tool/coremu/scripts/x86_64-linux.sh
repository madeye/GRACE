echo "(usage) x86_64-linux.sh <path2qemu> <path2img> <core number>"

qemu=$1
img=$2
cores=$3

memsize=4096

sudo $qemu \
    -smp $cores \
    -net none \
    -hda $img \
    -m $memsize \
    -serial mon:/dev/tty \
    -k en-us \
    -nographic \
    -bios seabios.bin
