CC 	:= gcc
LD 	:= gcc
OBJDUMP := objdump
RM 	:= rm

OBJDIR    := obj
BINDIR    := bin
COREMUDIR := $(CURDIR)

AIOLIB 	  := -lrt

# Include a configure generated file.
# So configure will not change this file and mess up with git
include coremu.mk

QEMUOBJ_DIR := obj/qemu

CFLAGS    := -pthread -O2 -Wall -Wfatal-errors -g -Iincl -Imain
LDFLAGS   := -pthread $(AIOLIB) -O2 -g -Wall -Wfatal-errors --warn-error -rdynamic $(pkg-config --libs topology)

# libtopology support
CFLAGS  += `pkg-config --cflags topology`
LDFLAGS += `pkg-config --libs topology`

include_dirs := incl
vpath %.h $(include_dirs)

programs :=
objects  :=
archive  := $(OBJDIR)/libcoremu.a

modules  := main utils
