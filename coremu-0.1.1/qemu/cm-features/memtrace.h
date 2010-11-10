#ifndef _CM_MEMTRACE_H
#define _CM_MEMTRACE_H

void cm_memtrace_init(int cpuidx);
void cm_memtrace_logging(uint64_t addr, int write);

#include "cm-features/logbuffer.h"
extern __thread CMLogbuf *memtrace_buf;

#endif
