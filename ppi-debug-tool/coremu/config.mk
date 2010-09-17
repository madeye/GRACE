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

# Make COREMU awares of some target  specific emulation
QEMUSRC_TARGET := $(QEMUSRC)/target-$(TARGET)
QEMUOBJ_DIR_TARGET := $(QEMUOBJ_DIR)/$(TARGET)-softmmu

CFLAGS    := -pthread -O2 -Wall -Wfatal-errors -g -Iincl -Imain -I$(QEMUSRC) -I$(QEMUSRC_TARGET) -I$(QEMUOBJ_DIR) -I$(QEMUOBJ_DIR_TARGET)
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
