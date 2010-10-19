# Automatically generated by configure - do not modify
CONFIG_QEMU_PREFIX="/usr/gnemul/qemu-x86_64"
TARGET_ARCH=x86_64
TARGET_X86_64=y
TARGET_ARCH2=x86_64
TARGET_BASE_ARCH=i386
TARGET_ABI_DIR=x86_64
TARGET_PHYS_ADDR_BITS=64
CONFIG_SOFTMMU=y
LIBS+=-lutil -lcurl   -lncurses  -luuid -lsasl2 -lgnutls   -lSDL -lpthread -lX11 
HWLIB=../libhw64/libqemuhw64.a
CONFIG_NOSOFTFLOAT=y
CONFIG_I386_DIS=y
CONFIG_I386_DIS=y
LDFLAGS+=
QEMU_CFLAGS+=-DHAS_AUDIO -DHAS_AUDIO_CHOICE -I$(SRC_PATH)/fpu -I$(SRC_PATH)/tcg -I$(SRC_PATH)/tcg/$(ARCH) 
