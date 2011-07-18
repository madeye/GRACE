
/* thread info */

#include <sys/time.h>

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
#define MAX_CHUNK_HISTORY_NUM 4
#define MAX_CHUNK_MATCH_NUM (MAX_CHUNK_NUM)
#define TRACE_SHARED_BUF_SIZE (TRACE_BUF_SIZE)

struct trace_info {
    volatile uint32_t buf_size;
    volatile uint8_t thread_id;
    volatile uint8_t is_buf_full;
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

double doTime_s1=0;
double noWaitTime_s1=0;
double doTime_s2=0;
double noWaitTime_s2=0;

double WaitTime_s1=0;
double WaitTime_s2=0;

int isStarts1=0;
int isStarts2=0;


struct timeval s1t1;	
struct timeval s1t2;	

struct timeval s2t1;	
struct timeval s2t2;

inline double	
tsub(struct timeval t2, struct timeval t1)	
{	
	return (double)((unsigned long)(t2.tv_usec + t2.tv_sec * 1000000) - (unsigned long)(t1.tv_usec + t1.tv_sec * 1000000));	

}


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
                while (shared_buf.stage[i].core[j].chunk[k].info->is_buf_full);
            }
        }
    }
}

static inline void module_shared_buf_copy(uint8_t sid, uint8_t cid, uint8_t kid,
                uint8_t tid, uint32_t size, struct trace_content *buf)
{
    struct shared_trace_chunk *temp_chunk;

    temp_chunk = &shared_buf.stage[sid].core[cid].chunk[kid];

    while (temp_chunk->info->is_buf_full);

    memcpy(temp_chunk->buf, buf, size * sizeof(struct trace_content));

    temp_chunk->info->buf_size = size;
    temp_chunk->info->thread_id = tid;

    temp_chunk->info->is_buf_full = 1;
}
#endif

