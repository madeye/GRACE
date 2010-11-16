#include <stdio.h>
#include <string.h>
#include <assert.h>
#include <stdlib.h>

typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned int uint32_t;
typedef unsigned long uint64_t;

#define DETECTOR_INFO_PRINT
#define DETECTOR_STATISTICS_PRINT

#include "interface.h"
#include "process.h"

#include "race.c"

#include "info.c"

#include "timestamp.c"

#define MOD_HISTORY
#define MOD_MATCH

#include "history.c"

#define MOD_FILTER

#include "filter.c"

/* interface */

void data_race_detector_init() 
{
    module_race_init();
    module_info_init();
    module_filter_init();
    module_history_init();
}

void data_race_detector(uint8_t tid, uint32_t size, struct trace_content *buf) 
{
    uint32_t i;
    struct trace_content *content;

    if (!info.exist[tid]) {
        printf("\tnew tid: %d\n", tid);

        if (info.max_tid_num < (tid + 1)) {
            info.max_tid_num = (tid + 1);
        }

        info.exist[tid] = 1;
    }

    for (i = 0; i < size; i++) {
        content = &buf[i];

        content->tid = tid;

        if (content->type == TRACE_MEM_LOAD) {
            module_history_load_record(content);
            module_filter_load(content);
        } else if (content->type == TRACE_MEM_STORE) {
            module_history_store_record(content);
            module_filter_store(content);
        } else {
            fprintf(stderr, "unknown type : %d\n", content->type);
            assert(0);
        }
    }
}

void data_race_detector_report() 
{
    module_race_print();
#ifdef DETECTOR_INFO_PRINT
    // module_syn_print();
#ifdef DETECTOR_STATISTICS_PRINT
    // module_syn_statistics_print();
#endif
    // module_timestamp_print();
#endif
}

