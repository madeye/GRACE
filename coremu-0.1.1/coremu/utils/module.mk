bindir    := $(BINDIR)/utils

programs  += $(bindir)/watch-test $(bindir)/watch-control $(bindir)/monitor

$(bindir)/watch-test:  $(OBJDIR)/utils/watch-test.o
	@mkdir -p $(@D)
	$(call quiet-command, $(LD) -o $@ $^, "  LINK    $@")

$(bindir)/watch-control: $(OBJDIR)/utils/watch-control.o
	@mkdir -p $(@D)
	$(call quiet-command, $(LD) -o $@ $^, "  LINK    $@")

$(bindir)/monitor:  $(OBJDIR)/utils/monitor.o
	@mkdir -p $(@D)
	$(call quiet-command, $(LD) -lcurses -o $@ $^, "  LINK    $@")
