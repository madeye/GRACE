
/* thread info */

struct global_info {
    uint8_t max_tid_num;
    uint8_t exist[MAX_PROCESS_NUM];
    uint8_t core_id;
#if 1
    uint8_t last_tid;
#endif
#ifdef PPI_THREE_STAGE
    uint8_t chunk_id;
#endif
};

#ifdef PPI_THREE_STAGE
__thread struct global_info info;
#else
struct global_info info;
#endif

static inline void module_info_init(void)
{
    memset(&info, 0, sizeof(struct global_info));
}

#ifdef PPI_THREE_STAGE
#define STAGE_ONE_BASE_CPU_ID 0
#define STAGE_TWO_BASE_CPU_ID 1
#define STAGE_THREE_BASE_CPU_ID 2

#define MAX_STAGE_NUM 2
#ifdef CUDA
#define MAX_CORE_NUM 1
#define MAX_CHUNK_NUM 256
#else
#define MAX_CORE_NUM 4
#define MAX_CHUNK_NUM 4
#endif
#define MAX_CHUNK_HISTORY_NUM MAX_CHUNK_NUM
#define MAX_CHUNK_MATCH_NUM MAX_CHUNK_NUM
#define TRACE_SHARED_BUF_SIZE (TRACE_BUF_SIZE)

struct trace_info {
    volatile uint32_t buf_size;
    volatile uint8_t thread_id;
    volatile uint8_t is_buf_full_0;
    volatile uint8_t is_buf_full_1;
};

struct shared_trace_chunk {
    struct trace_content *buf;
    struct trace_info *info;
};

struct shared_trace_core {
    struct shared_trace_chunk chunk[MAX_CHUNK_NUM];
};

struct shared_trace_stage {
    struct shared_trace_core core[MAX_CORE_NUM];
};

struct global_shared_trace_buf {
    struct shared_trace_stage stage[MAX_STAGE_NUM];
};

struct global_shared_trace_buf shared_buf;

static inline void module_shared_buf_init(void)
{
    int i, j, k;

    memset(&shared_buf, 0, sizeof(struct global_shared_trace_buf));

    for (i = 0; i < MAX_STAGE_NUM; i++) {
        for (j = 0; j < MAX_CORE_NUM; j++) {
            for (k = 0; k < MAX_CHUNK_NUM; k++) {
                shared_buf.stage[i].core[j].chunk[k].buf = 
                    (struct trace_content *)malloc(TRACE_SHARED_BUF_SIZE * sizeof(struct trace_content));
                memset(shared_buf.stage[i].core[j].chunk[k].buf, 0, 
                        TRACE_SHARED_BUF_SIZE * sizeof(struct trace_content));
                shared_buf.stage[i].core[j].chunk[k].info = 
                    (struct trace_info *)malloc(sizeof(struct trace_info));
                memset(shared_buf.stage[i].core[j].chunk[k].info, 0, 
                        sizeof(struct trace_info));
            }
        }
    }

    fprintf(stderr, "\ntrace shared buf size : 0x%lx\n", 
            TRACE_SHARED_BUF_SIZE * sizeof(struct trace_content));
    fprintf(stderr, "shared trace info size : 0x%lx\n\n", 
            sizeof(struct trace_info));
}

static inline void module_shared_buf_all_empty(void)
{
    int i, j, k;

    for (i = 0; i < MAX_STAGE_NUM; i++) {
        for (j = 0; j < MAX_CORE_NUM; j++) {
            for (k = 0; k < MAX_CHUNK_NUM; k++) {
                while (shared_buf.stage[i].core[j].chunk[k].info->is_buf_full_0 ||
                        shared_buf.stage[i].core[j].chunk[k].info->is_buf_full_1);
            }
        }
    }
}

#if 0
void *module_pthread_stage_one_memcpy(void *args)
{
    uint32_t i, j;

    i = (uint32_t) args;
    fprintf(stderr, "stage one memcpy : core %d start!\n", i);

    ppi_set_cpu_thread(i);

    while(1) {
        pthread_mutex_lock(&stage_one_memcpy_lock);
        pthread_cond_wait(&stage_one_memcpy_cond, &stage_one_memcpy_lock);
        stage_one_copying = 1;
        pthread_mutex_unlock(&stage_one_memcpy_lock);

        memcpy(stage_one_dst, stage_one_src, stage_one_size);
        
        stage_one_info->is_buf_full_0 = 1;
        stage_one_info->is_buf_full_1 = 1;
        
        pthread_mutex_lock(&stage_one_memcpy_lock);
        stage_one_copying = 0;
        pthread_cond_broadcast(&stage_one_memcpy_cond);
        pthread_mutex_unlock(&stage_one_memcpy_lock);
    }
}
#endif

#if 0
void *module_pthread_stage_two_memcpy(void *args)
{
    uint32_t i, j;

    i = (uint32_t) args;
    fprintf(stderr, "stage two memcpy : core %d start!\n", i);

    ppi_set_cpu_thread(i);

    while(1) {
        pthread_mutex_lock(&stage_two_memcpy_lock);
        pthread_cond_wait(&stage_two_memcpy_cond, &stage_two_memcpy_lock);
        stage_two_copying = 1;
        pthread_mutex_unlock(&stage_two_memcpy_lock);

        memcpy(stage_two_dst, stage_two_src, stage_two_size);
        
        pthread_mutex_lock(&stage_two_memcpy_lock);
        stage_two_copying = 0;
        pthread_cond_broadcast(&stage_two_memcpy_cond);
        pthread_mutex_unlock(&stage_two_memcpy_lock);
    }
}

#endif

#if 0

static inline void module_stage_one_shared_buf_copy(uint8_t sid, uint8_t cid, uint8_t kid,
                uint8_t tid, uint32_t size, struct trace_content *buf)
{
    struct shared_trace_chunk *temp_chunk;

    temp_chunk = &shared_buf.stage[sid].core[cid].chunk[kid];

    while (temp_chunk->info->is_buf_full_0 ||
            temp_chunk->info->is_buf_full_1);

    if (stage_one_copying) {
        pthread_mutex_lock(&stage_one_memcpy_lock);
        pthread_cond_wait(&stage_one_memcpy_cond, &stage_one_memcpy_lock);
        pthread_mutex_unlock(&stage_one_memcpy_lock);
    }

    stage_one_src = buf;
    stage_one_dst = temp_chunk->buf;
    stage_one_size = size * sizeof(struct trace_content);
    stage_one_info = temp_chunk->info;

    temp_chunk->info->buf_size = size;
    temp_chunk->info->thread_id = tid;

    pthread_mutex_lock(&stage_one_memcpy_lock);
    pthread_cond_broadcast(&stage_one_memcpy_cond);
    pthread_mutex_unlock(&stage_one_memcpy_lock);

}

#endif

#if 0

static inline void module_stage_two_shared_buf_copy(uint8_t sid, uint8_t cid, uint8_t kid,
                uint8_t tid, uint32_t size, struct trace_content *buf)
{
    struct shared_trace_chunk *temp_chunk;

    temp_chunk = &shared_buf.stage[sid].core[cid].chunk[kid];

    while (temp_chunk->info->is_buf_full);

    if (stage_two_copying) {
        pthread_mutex_lock(&stage_two_memcpy_lock);
        pthread_cond_wait(&stage_two_memcpy_cond, &stage_two_memcpy_lock);
        pthread_mutex_unlock(&stage_two_memcpy_lock);
    }

    stage_two_src = buf;
    stage_two_dst = temp_chunk->buf;
    stage_two_size = size * sizeof(struct trace_content);

    pthread_mutex_lock(&stage_two_memcpy_lock);
    pthread_cond_broadcast(&stage_two_memcpy_cond);
    pthread_mutex_unlock(&stage_two_memcpy_lock);

    temp_chunk->info->buf_size = size;
    temp_chunk->info->thread_id = tid;

    temp_chunk->info->is_buf_full = 1;
}

#endif

#if 1
static inline void module_shared_buf_copy(uint8_t sid, uint8_t cid, uint8_t kid,
                uint8_t tid, uint32_t size, struct trace_content *buf)
{
    struct shared_trace_chunk *temp_chunk;

    temp_chunk = &shared_buf.stage[sid].core[cid].chunk[kid];

    while (temp_chunk->info->is_buf_full_0 || temp_chunk->info->is_buf_full_1);

    memcpy(temp_chunk->buf, buf, size * sizeof(struct trace_content));

    temp_chunk->info->buf_size = size;
    temp_chunk->info->thread_id = tid;
    temp_chunk->info->is_buf_full_0 = 1;
    temp_chunk->info->is_buf_full_1 = 1;
}
#endif
#endif

