
/* timestamp */

struct timestamp {
    uint64_t scalar[MAX_PROCESS_NUM];
};

#define MAX_TIMESTAMP_NUM (1 << 18)

struct timestamp_queue {
    struct timestamp entry[MAX_TIMESTAMP_NUM];
    uint64_t count;
};

struct global_timestamp_queue {
    struct timestamp_queue *thread[MAX_PROCESS_NUM];
    struct timestamp current_ts[MAX_PROCESS_NUM];
    uint64_t current_ts_index[MAX_PROCESS_NUM];
};

struct global_timestamp_queue ts;

static inline void module_timestamp_init()
{
    uint8_t i;

    memset(&ts, 0, sizeof(struct global_timestamp_queue));

    for (i = 0; i < MAX_PROCESS_NUM; i++) {
        ts.thread[i] = (struct timestamp_queue *)malloc(sizeof(struct timestamp_queue));	
        memset(ts.thread[i], 0, sizeof(struct timestamp_queue));

        /* 0th entry for scalar of all 0s */
        ts.thread[i]->count++;
    }
}

static inline void module_timestamp_print()
{
    uint8_t i;

    for (i = 0; i < MAX_PROCESS_NUM; i++) {
        printf("tid : %d ; timestamp count : 0x%x\n", i, ts.thread[i]->count);
    }

    printf("\n");
}

static inline uint8_t module_timestamp_order(uint8_t tid1, uint64_t index1, uint8_t tid2, uint64_t index2) 
{
    struct timestamp *ts1, *ts2;

    ts1 = &ts.thread[tid1]->entry[index1];
    ts2 = &ts.thread[tid2]->entry[index2];

    if ((ts1->scalar[tid1] < ts2->scalar[tid1]) && (ts1->scalar[tid2] < ts2->scalar[tid2])) {
        return 1;
    }

    return 0;
}

static inline void module_timestamp_save(uint8_t tid)
{
    uint64_t index;
    struct timestamp_queue *temp_queue;

    temp_queue = ts.thread[tid];
    index = temp_queue->count;

    memcpy(&temp_queue->entry[index], &ts.current_ts[tid], sizeof(struct timestamp));

    ts.current_ts_index[tid] = index;

    index++;
    if (index >= MAX_TIMESTAMP_NUM) {
        index = 1;
    }
    temp_queue->count = index;
}

static inline void module_timestamp_merge_two(uint8_t tid1, struct timestamp *ts1, 
	uint8_t tid2, struct timestamp *ts2) 
{
    uint8_t j;
    uint64_t scalar;

    for (j = 0; j < MAX_PROCESS_NUM; j++) {
        scalar = ts1->scalar[j];
		
        if ((j == tid1) || (j == tid2)) {
            scalar++;
        } 
		
        if (ts2->scalar[j] < scalar) {
            ts2->scalar[j] = scalar;
        }
    }

    module_timestamp_save(tid2);
}

static inline void module_timestamp_merge_more(struct timestamp **ts1, 
	struct timestamp **ts2, uint8_t *is_require)
{
    uint8_t j, k;
    struct timestamp temp;

    memset(&temp, 0, sizeof(struct timestamp));

    for (j = 0; j < MAX_PROCESS_NUM; j++) {
        for (k = 0; k < MAX_PROCESS_NUM; k++) {
            if (is_require[k]) {
                if (temp.scalar[j] < ts1[k]->scalar[j]) {
                    temp.scalar[j] = ts1[k]->scalar[j];
                }
            }
        }
		
        temp.scalar[j]++;
    }

    for (j = 0 ; j < MAX_PROCESS_NUM; j++) {
        for (k = 0; k < MAX_PROCESS_NUM; k++) {
            if (is_require[k]) {
                if (ts2[k]->scalar[j] < temp.scalar[j]) {
                    ts2[k]->scalar[j] = temp.scalar[j];
                }
            }
        }
    }

    for (k = 0; k < MAX_PROCESS_NUM; k++) {
        if (is_require[k]) {
            module_timestamp_save(k);
        }
    }
}

