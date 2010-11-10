#ifndef _CM_INSTRUMENT_H
#define _CM_INSTRUMENT_H

#include <stdint.h>
#include <stdio.h>
#include "cm-features/logbuffer.h"

target_ulong cm_get_cpu_eip(void);
int cm_get_cpu_idx(void);
target_ulong cm_get_stack_page_addr(void);

void cm_record_dumpstack(FILE *logfile, void *paddr);
void cm_dump_stack(int level, CMLogbuf *buf);

void cm_instrument_init(void *handle);
#endif /* _CM_INSTRUMENT_H */
