#ifndef TIMESTAMP_H
#define TIMESTAMP_H

/* timestamp */

#define CUDA

struct timestamp {
    uint32_t scalar[MAX_PROCESS_NUM];
};

#define MAX_TIMESTAMP_NUM (1 << 18)

struct timestamp_queue {
    uint32_t count;
    struct timestamp entry[MAX_TIMESTAMP_NUM];
};

struct global_timestamp_queue {
#ifndef CUDA
    struct timestamp_queue thread[MAX_PROCESS_NUM];
#else
    struct timestamp_queue *thread;
#endif
    struct timestamp current_ts[MAX_PROCESS_NUM];
    uint32_t current_ts_index[MAX_PROCESS_NUM];
};

#ifdef PPI_TIMESTAMP_INIT
//static inline void module_timestamp_init(struct global_timestamp_queue *ts)
//{
    //uint8_t i;

    //memset(ts, 0, sizeof(struct global_timestamp_queue));

    //for (i = 0; i < MAX_PROCESS_NUM; i++) {
        //ts->thread[i] = (struct timestamp_queue *)malloc(sizeof(struct timestamp_queue));	
        //memset(ts->thread[i], 0, sizeof(struct timestamp_queue));

        //[> 0th entry for scalar of all 0s <]
        //ts->thread[i]->count++;
    //}
//}
#else
static inline void module_timestamp_print(struct global_timestamp_queue *ts)
{
    uint32_t i;

    for (i = 0; i < MAX_PROCESS_NUM; i++) {
        fprintf(stderr, "tid : %d ; timestamp count : 0x%x\n", 
                i, ts->thread[i].count);
    }

    fprintf(stderr, "\n");
}
#endif

#endif /* TIMESTAMP_H */
