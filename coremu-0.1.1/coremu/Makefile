### Makefile --- 

## Author: wu.andrew.xi@gmail.com
## Version: $Id: Makefile,v 0.0 2009/01/10 07:08:39 wuxi Exp $

# This makefile system follows the structuring conventions
# recommended by Peter Miller in his excellent paper:
#
#       Recursive Make Considered Harmful
#       http://aegis.sourceforge.net/auug97.pdf

# Make sure that 'all' is the first target
all:

include config.mk
include $(addsuffix /module.mk, $(modules))

objects += $(patsubst %.c, $(OBJDIR)/%.o, $(foreach dir, $(modules), $(wildcard $(dir)/*.c)))

all: $(objects) $(programs) $(archive) qemu

install: qemu-install bios-install

LIBOBJS =  $(OBJDIR)/main/core.o
LIBOBJS += $(OBJDIR)/main/hw.o
LIBOBJS += $(OBJDIR)/main/sched.o
LIBOBJS += $(OBJDIR)/main/timer.o
LIBOBJS += $(OBJDIR)/main/intr.o
LIBOBJS += $(OBJDIR)/main/malloc-helper.o
LIBOBJS += $(OBJDIR)/main/lock-queue.o
LIBOBJS += $(OBJDIR)/main/utils.o

libcoremu: $(OBJDIR)/libcoremu.a

$(OBJDIR)/libcoremu.a: $(LIBOBJS)
	$(call quiet-command,rm -f $@ && $(AR) rcs $@ $^,"  AR    $(TARGET_DIR)$@")
qemu:
	@echo "---- [coremu]: build qemu ----"
	$(MAKE) -C $(COREMUDIR)/obj/qemu

qemu-install:
	$(MAKE) -C $(COREMUDIR)/obj/qemu install

seabios = $(COREMUDIR)/bios/seabios/out/bios.bin
$(seabios): bios/seabios/src/acpi.c
	(cd bios/seabios; make)

bios-install: $(seabios)
	mkdir -p $(PREFIXDIR)
	cp $(seabios) $(PREFIXDIR)/share/qemu/seabios.bin

clean:
	$(RM) -rf $(addprefix obj/, $(modules))  $(addprefix bin/, $(modules))

distclean:
	$(RM) -rf obj/ bin/
	$(RM) -rf coremu.mk

.PHONY: distclean clean all qemu qemu-install install coremu

include rules.mk

