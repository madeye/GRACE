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
    struct timestamp_queue *thread[MAX_PROCESS_NUM];
    struct timestamp current_ts[MAX_PROCESS_NUM];
    uint32_t current_ts_index[MAX_PROCESS_NUM];
};

#ifdef PPI_TIMESTAMP_INIT
static inline void module_timestamp_init(struct global_timestamp_queue *ts)
{
    uint8_t i;

    memset(ts, 0, sizeof(struct global_timestamp_queue));

    for (i = 0; i < MAX_PROCESS_NUM; i++) {
        ts->thread[i] = (struct timestamp_queue *)malloc(sizeof(struct timestamp_queue));	
        memset(ts->thread[i], 0, sizeof(struct timestamp_queue));

        /* 0th entry for scalar of all 0s */
        ts->thread[i]->count++;
    }
}
#else
static inline void module_timestamp_print(struct global_timestamp_queue *ts)
{
    uint32_t i, isWrong = 0;

    for (i = 0; i < MAX_PROCESS_NUM; i++) {
        fprintf(stderr, "tid : %d ; timestamp count : %d\n", 
                i, ts->thread[i]->count);
        if ((i < 1) || (i > MAX_THREAD_NUM)) {
            if (ts->thread[i]->count > 1) {
                isWrong = 1;
            }
        }
    }

    fprintf(stderr, "\n");

    if (isWrong) {
        fprintf(stderr, "\n*** The result is wrong! ***\n\n");
    }
}
#endif

#endif /* TIMESTAMP_H */
