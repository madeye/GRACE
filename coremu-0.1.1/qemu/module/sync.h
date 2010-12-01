#ifndef SYNC_H
#define SYNC_H

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
    uint8_t create_ts_tid;
    uint32_t create_ts_index;
    // uint32_t join_ts_index[MAX_PROCESS_NUM];
    // uint32_t clone_ts_index[MAX_PROCESS_NUM];
    uint32_t exit_ts_index[MAX_PROCESS_NUM];
};

struct global_syn_info {
    struct mutex_queue mutex;
    struct barrier_queue barrier;
    struct cond_queue cond;
    struct thread_info thread;
};

#ifdef PPI_SYNC_INIT
static inline void module_syn_init(struct global_syn_info *syn)
{
    memset(syn, 0, sizeof(struct global_syn_info));
}
#else
static inline void module_syn_print(struct global_syn_info *syn)
{
    fprintf(stderr, "mutex count : %d\n", syn->mutex.count);
    fprintf(stderr, "barrier count : %d\n", syn->barrier.count);
    fprintf(stderr, "cond count : %d\n\n", syn->cond.count);    
}
#endif

struct statistics_syn_info {
    uint32_t lock_count;
    uint32_t unlock_count;
    uint32_t barrier_count;
    uint32_t create_count;
    uint32_t join_count;
    uint32_t clone_count;
    uint32_t exit_count;
    uint32_t cond_wait_count;
    uint32_t cond_broadcast_count;
};

#ifdef PPI_SYNC_INIT
static inline void module_syn_statistics_init(struct statistics_syn_info *stat_syn) 
{
    memset(stat_syn, 0, sizeof(struct statistics_syn_info));
}
#else
static inline void module_syn_statistics_print(struct statistics_syn_info *stat_syn) 
{
    fprintf(stderr, "lock count : %d\n", stat_syn->lock_count);
    fprintf(stderr, "unlock count : %d\n", stat_syn->unlock_count);
    fprintf(stderr, "barrier count : %d\n", stat_syn->barrier_count);
    fprintf(stderr, "create count : %d\n", stat_syn->create_count);
    fprintf(stderr, "join count : %d\n", stat_syn->join_count);
    fprintf(stderr, "clone count : %d\n", stat_syn->clone_count);
    fprintf(stderr, "exit count : %d\n", stat_syn->exit_count);
    fprintf(stderr, "cond wait count : %d\n", stat_syn->cond_wait_count);
    fprintf(stderr, "cond broadcast count : %d\n\n", stat_syn->cond_broadcast_count);
}
#endif

#endif /* SYNC_H*/
