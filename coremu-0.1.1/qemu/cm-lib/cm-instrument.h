#ifndef _CM_INSTRUMENT_H
#define _CM_INSTRUMENT_H

#include "stdint.h"
#include "cm-logbuffer.h"

uint64_t cm_get_cpu_eip(void);
int cm_get_cpu_idx(void);
uint64_t cm_get_stack_page_addr(void);

void cm_record_dumpstack(FILE *logfile, void *paddr);
void cm_dump_stack(int level, CMLogbuf *buf);
#endif /* _CM_INSTRUMENT_H */
