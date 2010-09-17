bindir    := $(BINDIR)/utils
#programs  += $(bindir)/kill $(bindir)/monitor

UTILS_LINK := -lcurses

$(bindir)/kill:  $(OBJDIR)/utils/kill.o
	@mkdir -p $(@D)
	$(call quiet-command, $(LD) $(LDFLAGS) $(UTILS_LINK) -o $@ $^, "  LINK    $@")

$(bindir)/monitor:  $(OBJDIR)/utils/monitor.o
	@mkdir -p $(@D)
	$(call quiet-command, $(LD) $(LDFLAGS) $(UTILS_LINK) -o $@ $^, "  LINK    $@")
