# -*-Makefile-*-
$(OBJDIR)/%.o: %.c
	$(call quiet-command, $(CC) $(CFLAGS) -c -o $@ $<, "  CC    $@")

$(OBJDIR)/%.d: %.c
	@mkdir -p $(@D)
	$(call quiet-command, $(CC) -Iincl -Imain -MM -MF $@ -MT $@ -MT $(subst .d,.o, $@) $<, "  DEP    $@")

quiet-command = $(if $(V),$1,$(if $(2),@echo $2 && $1, @$1))

dependencies = $(patsubst %.c, $(OBJDIR)/%.d, $(foreach dir, $(modules), $(wildcard $(dir)/*.c)))

ifeq ($(MAKECMDGOALS), clean)
else
ifeq ($(MAKECMDGOALS), distclean)
else
-include $(dependencies)
endif
endif
