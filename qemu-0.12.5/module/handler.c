
/* synchronization */

struct mutex_entry {
    uint64_t id;
    int is_lock;
    int is_require[MAX_PROCESS_NUM];
    uint8_t last_lock_tid;
    uint8_t last_unlock_tid;
    uint32_t last_lock_ts_index;
    uint32_t last_unlock_ts_index;
};

#define MAX_MUTEX_NUM (1 << 16)

struct mutex_queue {
    struct mutex_entry entry[MAX_MUTEX_NUM];
    uint32_t count;
};

struct barrier_entry {
    uint64_t id;
    uint8_t is_barrier;
    uint8_t is_require[MAX_PROCESS_NUM];
    uint32_t last_barrier_ts_index[MAX_PROCESS_NUM];
};

#define MAX_BARRIER_NUM (1 << 10)

struct barrier_queue {
    struct barrier_entry entry[MAX_BARRIER_NUM];
    uint32_t count;
};

struct cond_entry {
    uint64_t id;
    uint64_t lock_id;
    uint8_t is_cond;
    uint8_t is_require[MAX_PROCESS_NUM];
    uint32_t last_cond_ts_index[MAX_PROCESS_NUM];
};

#define MAX_COND_NUM (1 << 10)

struct cond_queue {
    struct cond_entry entry[MAX_COND_NUM];
    uint32_t count;
};

struct thread_info {
    uint32_t create_ts_index;
    uint32_t join_ts_index[MAX_PROCESS_NUM];
};

struct global_syn_info {
    struct mutex_queue mutex;
    struct barrier_queue barrier;
    struct cond_queue cond;
    struct thread_info thread;
};

struct global_syn_info syn;

static inline void module_syn_init()
{
    memset(&syn, 0, sizeof(struct global_syn_info));
}

static inline void module_syn_print()
{
    printf("mutex count : %d\n", syn.mutex.count);
    printf("barrier count : %d\n", syn.barrier.count);
    printf("cond count : %d\n\n", syn.cond.count);    
}

#ifdef DETECTOR_STATISTICS_PRINT
struct statistics_syn_info {
    uint32_t lock_count;
    uint32_t unlock_count;
    uint32_t barrier_count;
    uint32_t create_count;
    uint32_t join_count;
    uint32_t cond_wait_count;
    uint32_t cond_broadcast_count;
};

struct statistics_syn_info stat_syn;

static inline void module_syn_statistics_init() 
{
    memset(&stat_syn, 0, sizeof(struct statistics_syn_info));
}

static inline void module_syn_statistics_print() 
{
    printf("lock count : %d\n", stat_syn.lock_count);
    printf("unlock count : %d\n", stat_syn.unlock_count);
    printf("barrier count : %d\n", stat_syn.barrier_count);
    printf("create count : %d\n", stat_syn.create_count);
    printf("join count : %d\n", stat_syn.join_count);
    printf("cond wait count : %d\n", stat_syn.cond_wait_count);
    printf("cond broadcast count : %d\n\n", stat_syn.cond_broadcast_count);
}
#endif

/* handler */

static inline void module_mem_load_handler(struct trace_content *content) 
{
    uint8_t tid;

    tid = content->tid;

    content->value.mem.index = ts.current_ts_index[tid];

    module_history_load_record(content);

    module_filter_load(content);
}

static inline void module_mem_store_handler(struct trace_content *content) 
{
    uint8_t tid;

    tid = content->tid;

    content->value.mem.index = ts.current_ts_index[tid];

    module_history_store_record(content);

    module_filter_store(content);
}

void module_syn_lock_handler(struct trace_content *content) 
{
    uint32_t i, k;
    uint8_t tid;
    uint64_t lock_id;
    uint32_t index;

    tid = content->tid;
    lock_id = content->value.syn.args[0];

    index = ts.current_ts_index[tid];

#if 0
    printf("lock : tid : %d ; lock id : 0x%x ; index : %d\n", tid, lock_id, index);
#endif

    for (i = 0; i < syn.mutex.count; i++) {
        if (lock_id == syn.mutex.entry[i].id) {
            syn.mutex.entry[i].is_require[tid]++;
            syn.mutex.entry[i].last_lock_tid = tid;
            syn.mutex.entry[i].last_lock_ts_index = index;
            syn.mutex.entry[i].is_lock++;

            module_timestamp_merge_two(syn.mutex.entry[i].last_unlock_tid, 
                    &ts.thread[syn.mutex.entry[i].last_unlock_tid]->entry[syn.mutex.entry[i].last_unlock_ts_index], 
                    tid, &ts.current_ts[tid]);

            break;
        }
    }

    if (i >= syn.mutex.count) {
        syn.mutex.entry[i].id = lock_id;

        syn.mutex.entry[i].is_require[tid]++;
        syn.mutex.entry[i].last_lock_tid = tid;
        syn.mutex.entry[i].last_lock_ts_index = index;
        syn.mutex.entry[i].is_lock++;

        syn.mutex.count++;
        if (syn.mutex.count >= MAX_MUTEX_NUM) {
            printf("mutex queue overflow!\n");
            assert(0);
        }
    }

    for (i = 0; i < syn.cond.count; i++) {
        if (lock_id == syn.cond.entry[i].lock_id) {
            for (k = 0; k < MAX_PROCESS_NUM; k++) {
                if (syn.cond.entry[i].is_require[k]) {
                    module_timestamp_merge_two(k, 
                            &ts.thread[k]->entry[syn.cond.entry[i].last_cond_ts_index[k]], 
                            tid, &ts.current_ts[tid]);
                }
            }
        }
    }

#ifdef DETECTOR_STATISTICS_PRINT
    stat_syn.lock_count++;
#endif
}

void module_syn_unlock_handler(struct trace_content *content) 
{
    uint32_t i, k;
    uint8_t tid;
    uint64_t lock_id;
    uint32_t index;

    tid = content->tid;
    lock_id = content->value.syn.args[0];

    index = ts.current_ts_index[tid];

    ts.current_ts[tid].scalar[tid]++;

    module_timestamp_save(tid);

#if 0
    printf("unlock : tid : %d ; lock id : 0x%x ; index : %d\n", tid, lock_id, index);
#endif

    for (i = 0; i < syn.mutex.count; i++) {
        if (lock_id == syn.mutex.entry[i].id) {
            syn.mutex.entry[i].is_require[tid]--;
            syn.mutex.entry[i].last_unlock_tid = tid;
            syn.mutex.entry[i].last_unlock_ts_index = index;
            syn.mutex.entry[i].is_lock--;

            for (k = 0; k < MAX_PROCESS_NUM; k++) {
                if (syn.mutex.entry[i].is_require[k] > 0) {
                    module_timestamp_merge_two(syn.mutex.entry[i].last_unlock_tid, 
                            &ts.thread[syn.mutex.entry[i].last_unlock_tid]->entry[syn.mutex.entry[i].last_unlock_ts_index], 
                            k, &ts.current_ts[k]);
                }
            }

            break;
        }
    }

#if 0
    if (i >= syn.mutex.count) {
        printf("invalid unlock : mutex not found : tid : %d ; lock id : 0x%x\n", tid, lock_id);
    }
#endif

#ifdef DETECTOR_STATISTICS_PRINT
    stat_syn.unlock_count++;
#endif
}

void module_syn_barrier_handler(struct trace_content *content)
{
    uint32_t i, k;
    uint8_t tid;
    uint64_t barrier_id;
    uint32_t index;

    tid = content->tid;
    barrier_id = content->value.syn.args[0];

    index = ts.current_ts_index[tid];

#if 0
    printf("barrier : tid : %d ; barrier id : 0x%x ; index : %d\n", tid, barrier_id, index);
#endif

    for (i = 0; i < syn.barrier.count; i++) {
        if (barrier_id == syn.barrier.entry[i].id) {
            syn.barrier.entry[i].is_require[tid]++;
            syn.barrier.entry[i].last_barrier_ts_index[tid] = index;
            syn.barrier.entry[i].is_barrier++;	     

            if (syn.barrier.entry[i].is_barrier >= max_thread_num) {
#if 0
                printf("%d threads have reached barriers!\n", syn.barrier.entry[i].is_barrier);
#endif
				
                struct timestamp *ts1[MAX_PROCESS_NUM], *ts2[MAX_PROCESS_NUM];

                memset(ts1, 0, MAX_PROCESS_NUM * sizeof(struct timestamp *));
                memset(ts2, 0, MAX_PROCESS_NUM * sizeof(struct timestamp *));

                for (k = 0; k < MAX_PROCESS_NUM; k++) {
                    if (syn.barrier.entry[i].is_require[k]) {
                        ts1[k] = &ts.thread[k]->entry[syn.barrier.entry[i].last_barrier_ts_index[k]];
                        ts2[k] = &ts.current_ts[k];
                    }
                }

                module_timestamp_merge_more(ts1, ts2, syn.barrier.entry[i].is_require);

                memset(&syn.barrier.entry[i], 0, sizeof(struct barrier_entry));
            }

            break;
        }
    }

    if (i >= syn.barrier.count) {
        syn.barrier.entry[i].id = barrier_id;
        syn.barrier.entry[i].is_require[tid]++;
        syn.barrier.entry[i].last_barrier_ts_index[tid] = index;
        syn.barrier.entry[i].is_barrier++;

        syn.barrier.count++;
        if (syn.barrier.count >= MAX_BARRIER_NUM) {
            printf("barrier queue overflow!\n");
            assert(0);
        }
    }

#ifdef DETECTOR_STATISTICS_PRINT
    stat_syn.barrier_count++;
#endif
}

void module_syn_create_handler(struct trace_content *content)
{
    uint8_t tid;
    uint32_t index;

    tid = content->tid;

    index = ts.current_ts_index[tid];

    ts.current_ts[tid].scalar[tid]++;

    module_timestamp_save(tid);

#if 0
    printf("create : tid : %d ; index : %d\n", tid, index);
#endif

    syn.thread.create_ts_index = index;

#ifdef DETECTOR_STATISTICS_PRINT
    stat_syn.create_count++;
#endif
}

void module_syn_join_handler(struct trace_content *content) 
{
    uint8_t tid;
    uint32_t index;

    tid = content->tid;

    index = ts.current_ts_index[tid];

    ts.current_ts[tid].scalar[tid]++;

    module_timestamp_save(tid);

#if 0
    printf("join : tid : %d ; index : %d\n", tid, index);
#endif

    syn.thread.join_ts_index[tid] = index;

    module_timestamp_merge_two(tid, 
            &ts.thread[tid]->entry[syn.thread.join_ts_index[tid]], 
            0, &ts.current_ts[0]);

#ifdef DETECTOR_STATISTICS_PRINT
    stat_syn.join_count++;
#endif
}

void module_syn_cond_wait_handler(struct trace_content *content)
{
    uint32_t i;
    uint8_t tid;
    uint64_t cond_id, lock_id;
    uint32_t index;

    tid = content->tid;
    cond_id = content->value.syn.args[0];
    lock_id = content->value.syn.args[1];

    index = ts.current_ts_index[tid];

    ts.current_ts[tid].scalar[tid]++;

    module_timestamp_save(tid);

#if 0
    printf("cond wait : tid : %d ; cond id : 0x%x ; lock id : 0x%x ; index : %d\n", tid, cond_id, lock_id, index);
#endif

    for (i = 0; i < syn.cond.count; i++) {
        if (cond_id == syn.cond.entry[i].id) {
#if 0
            if (lock_id != syn.cond.entry[i].lock_id) {
                printf("invalid cond wait : lock id is different ; first lock id : 0x%x ; current lock id : 0x%x\n", 
                        syn.cond.entry[i].lock_id, lock_id);
            }
#endif

            syn.cond.entry[i].is_require[tid]++;
            syn.cond.entry[i].last_cond_ts_index[tid] = index;
            syn.cond.entry[i].is_cond++;

            break;
        }
    }

    if (i >= syn.cond.count) {
        syn.cond.entry[i].id = cond_id;
        syn.cond.entry[i].lock_id = lock_id;
        syn.cond.entry[i].is_require[tid]++;
        syn.cond.entry[i].last_cond_ts_index[tid] = index;
        syn.cond.entry[i].is_cond++;

        syn.cond.count++;
        if (syn.cond.count >= MAX_COND_NUM) {
            printf("cond queue overflow!\n");
            assert(0);
        }
    }

#ifdef DETECTOR_STATISTICS_PRINT
    stat_syn.cond_wait_count++;
#endif
}

void module_syn_cond_broadcast_handler(struct trace_content *content) 
{
    uint32_t i, k;
    uint8_t tid;
    uint64_t cond_id;
    uint32_t index;

    tid = content->tid;
    cond_id = content->value.syn.args[0];

    index = ts.current_ts_index[tid];

#if 0
    printf("cond broadcast : tid : %d ; cond id : 0x%x ; index : %d\n", tid, cond_id, index);
#endif

    for (i = 0; i < syn.cond.count; i++) {
        if (cond_id == syn.cond.entry[i].id) {
            syn.cond.entry[i].is_require[tid]++;
            syn.cond.entry[i].last_cond_ts_index[tid] = index;
            syn.cond.entry[i].is_cond++;

            struct timestamp *ts1[MAX_PROCESS_NUM], *ts2[MAX_PROCESS_NUM];

            memset(ts1, 0, MAX_PROCESS_NUM * sizeof(struct timestamp *));
            memset(ts2, 0, MAX_PROCESS_NUM * sizeof(struct timestamp *));

            for (k = 0; k < MAX_PROCESS_NUM; k++) {
                if (syn.cond.entry[i].is_require[k]) {
                    ts1[k] = &ts.thread[k]->entry[syn.cond.entry[i].last_cond_ts_index[k]];
                    ts2[k] = &ts.current_ts[k];
                }
            }

            module_timestamp_merge_more(ts1, ts2, 
				syn.cond.entry[i].is_require);

            memset(&syn.cond.entry[i], 0, sizeof(struct cond_entry));

            break;
        }
    }

#if 0
    if (i >= syn.cond.count) {
        printf("invalid cond broadcast : cond not found : tid : %d ; cond id : 0x%x\n", tid, cond_id);
    }
#endif

#ifdef DETECTOR_STATISTICS_PRINT
    stat_syn.cond_broadcast_count++;
#endif
}

void (*fun_handler[TRACE_TYPE_LIMIT])(struct trace_content *) = {NULL};

static inline void module_handler_init()
{
    fun_handler[TRACE_MEM_LOAD] = &module_mem_load_handler;
    fun_handler[TRACE_MEM_STORE] = &module_mem_store_handler;
    fun_handler[TRACE_SYN_LOCK] = &module_syn_lock_handler;
    fun_handler[TRACE_SYN_UNLOCK] = &module_syn_unlock_handler;
    fun_handler[TRACE_SYN_BARRIER] = &module_syn_barrier_handler;
    fun_handler[TRACE_SYN_CREATE] = &module_syn_create_handler;
    fun_handler[TRACE_SYN_JOIN] = &module_syn_join_handler;
    fun_handler[TRACE_SYN_COND_WAIT] = &module_syn_cond_wait_handler;
    fun_handler[TRACE_SYN_COND_BROADCAST] = &module_syn_cond_broadcast_handler;
}

