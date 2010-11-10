#ifndef _CM_WATCH_UTIL_H
#define _CM_WATCH_UTIL_H

#include <stdint.h>

typedef long CMTriggerID;
typedef void (*CMWatch_Trigger)(void *opaque);
typedef struct CMWParams {
    uint64_t paddr;
    uint64_t vaddr;
    uint64_t value;
    uint64_t len;
    int is_write;
} CMWParams;

void cm_register_wtrigger_func(CMTriggerID id, CMWatch_Trigger tfunc);
void print_wpara(CMWParams *wpara);

#endif /* _CM_WATCH_UTIL_H */
