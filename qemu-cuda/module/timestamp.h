#ifndef TIMESTAMP_H
#define TIMESTAMP_H

/* timestamp */

struct timestamp {
    uint32_t scalar[MAX_PROCESS_NUM];
};

#define MAX_TIMESTAMP_NUM (1 << 16)

struct timestamp_queue {
    struct timestamp entry[MAX_TIMESTAMP_NUM];
    uint32_t count;
};

struct global_timestamp_queue {
    struct timestamp_queue thread[MAX_PROCESS_NUM];
    //struct timestamp current_ts[MAX_PROCESS_NUM];
    //uint32_t current_ts_index[MAX_PROCESS_NUM];
};

struct current_timestamp_array {
    struct timestamp ts[MAX_PROCESS_NUM];
    uint32_t index[MAX_PROCESS_NUM];
};

#ifdef PPI_TIMESTAMP_INIT
static inline void module_timestamp_init(
        struct global_timestamp_queue *gts, 
        struct current_timestamp_array *cts)
{
    uint8_t i;

    memset(gts, 0, sizeof(struct global_timestamp_queue));
    memset(cts, 0, sizeof(struct current_timestamp_array));

    for (i = 0; i < MAX_PROCESS_NUM; i++) {
#if 0
        ts->thread[i] = (struct timestamp_queue *)malloc(sizeof(struct timestamp_queue));	
        memset(ts->thread[i], 0, sizeof(struct timestamp_queue));
#endif

        /* 0th entry for scalar of all 0s */
        gts->thread[i].count++;
    }

    fprintf(stderr, "global timestamp queue size : 0x%lx\n", 
            sizeof(struct global_timestamp_queue));
}
#else
static inline void module_timestamp_print_entry(struct timestamp *ts)
{
    int i;

    for (i = 0; i < MAX_PROCESS_NUM; i++) {
        fprintf(stderr, "\t%d", ts->scalar[i]);
    }

    fprintf(stderr, "\n");
}

static inline void module_timestamp_print(struct global_timestamp_queue *gts)
{
    uint32_t i, isWrong = 0;

    for (i = 0; i < MAX_PROCESS_NUM; i++) {
        fprintf(stderr, "tid : %d ; timestamp count : %d\n", 
                i, gts->thread[i].count);

        if ((i < 1) || (i > max_thread_num)) {
            if (gts->thread[i].count > 1) {
                isWrong = 1;
            }
        }
#if 0
        uint32_t j;

        for (j = 0; j < gts->thread[i].count; j++) { 
            fprintf(stderr, "No.%d : ", j);

            module_timestamp_print_entry(&gts->thread[i].entry[j]);
        }
#endif
    }

    fprintf(stderr, "\n");

    if (isWrong) {
        fprintf(stderr, "\n*** The result is wrong! ***\n\n");
    }
}
#endif

#endif /* TIMESTAMP_H */
