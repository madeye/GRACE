#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include "coremu-config.h"
#include "coremu-atomic.h"
#include "coremu-intr.h"
#include "coremu-sched.h"
#include "coremu-debug.h"
#include "coremu-malloc.h"
#include "cm-features/logbuffer.h"
#include "cm-features/memtrace.h"
#include "cm-intr.h"
#include "exec.h"

typedef struct CMMemtraceReq {
    CMIntr *base;
} CMMemtraceReq;

uint64_t global_mem_event_counter;
int memtrace_enable=0;
COREMU_THREAD int flush_cnt;

__thread FILE *memtrace_log;
__thread CMLogbuf *memtrace_buf;

void cm_memtrace_buf_full(void);
void cm_memtrace_buf_full(void)
{	

#if defined(VERBOSE_COREMU)
    /* Report when any buffer gets full */
    flush_cnt++;
    printf("\033[1;40;32m [COREMU Core %d] Memtrace Buffer Flush %d (%lu Records) \033[0m \n",
            cpu_single_env->cpu_index,flush_cnt,
	    (memtrace_buf->cur-memtrace_buf->buf)/16);
    fflush(stdout);
    if(!memtrace_enable)
        flush_cnt=0;
#endif

#if defined(DEBUG)
    /* Do some simple check on the records */
    uint64_t *ptr = (uint64_t *)memtrace_buf->buf;
    uint64_t *end = (uint64_t *)memtrace_buf->cur;

    for(;ptr!=end;ptr+=2){
        if(ptr[1] == 0) {
            printf("Bad Record Check: %016lx %016lx \n",ptr[0],ptr[1]);
            abort();
            return;
        }
    }
#endif

    cm_logbuf_flush(memtrace_buf);
}

static void cm_print_memtrace(FILE *file, void *bufv)
{
    uint64_t *buf = (uint64_t *)bufv;

#if defined(DEBUG)
    if (buf[1] == 0) {
        printf("Bad Record : %016lx %016lx \n",buf[0],buf[1]);
        return;
    }
#endif
    /* Retrive an record from buffer */
    uint64_t addr = qemu_ram_addr_from_host((void*)buf[1]);
    uint64_t cnt = buf[0];
    int write=cnt&1;
    cnt >>= 1;

    /* You may want to modify the following line to change the output format */
    fprintf(file,"%016lx %lx 0 %s\n",cnt,addr,write?"ST":"LD");
    //fwrite(&buf[0], 8, 1, file);
    //fwrite(&addr, 8, 1, file);
}

void cm_memtrace_logging(uint64_t addr, int write)
{	
    if (!memtrace_enable)
        return;
    CMLogbuf *buffer = memtrace_buf;
    uint64_t* buf_ptr = ((uint64_t*)buffer->cur);
    uint64_t cnt = atomic_xadd2(&global_mem_event_counter) | write;
    buf_ptr[1] = (uint64_t)addr;
    buf_ptr[0] = cnt;
    buffer->cur += 16;
    if (buffer->cur == buffer->end){
        cm_memtrace_buf_full();
    }
}

static void tb_flush_handler(void *opaque)
{
    tb_flush(cpu_single_env);
    if (!memtrace_enable) {
        cm_memtrace_buf_full();
        cm_logbuf_wait_flush(memtrace_buf);
        fflush(memtrace_buf->file);
    	printf("cpu[%d] finish flush buffer\n", cpu_single_env->cpu_index);
        fflush(stdout);
    }
}

static void broadcast_tb_flush(void)
{
    int cpu_idx;
    for(cpu_idx = 0; cpu_idx < coremu_get_targetcpu(); cpu_idx++) {
	CMIntr *req = coremu_mallocz(sizeof(*req));
        req->handler = tb_flush_handler;
        coremu_send_intr(req, cpu_idx);
    }
}

static void cm_memtrace_start(void)
{
    memtrace_enable=1;
    broadcast_tb_flush();
}

static void cm_memtrace_stop(void)
{
    memtrace_enable=0;
    broadcast_tb_flush();
}

void cm_memtrace_init(int cpuidx)
{
    char filename[255];

    sprintf(filename,"memtrace-core%d.log",cpu_single_env->cpu_index);
    FILE *memtrace_log = fopen(filename, "w");
    if (!memtrace_log) {
        fprintf(stderr, "Can't open memtrace log\n");
        abort();
    }
    memtrace_buf = cm_logbuf_new(100 * 1024 * 1024 / 16 , 16,
		    cm_print_memtrace, memtrace_log);
}

enum {
    CM_MEMTRACE_START = 7,
    CM_MEMTRACE_STOP  = 8,
};

void helper_memtrace_hypercall(void)
{
    target_ulong req = cpu_single_env->regs[R_EAX];
    coremu_debug("memtrace request %ld", req);
    switch (req) {
    case CM_MEMTRACE_START:
        cm_memtrace_start();
        break;
    case CM_MEMTRACE_STOP:
        cm_memtrace_stop();
        break;
    default:
        printf("error hypercall command : %ld", req);
    }
}

