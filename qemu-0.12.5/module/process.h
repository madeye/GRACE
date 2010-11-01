#ifndef PROCESS_H
#define PROCESS_H

struct ProcessIdentify {
    unsigned long long cr3;
    unsigned long long kernel_esp;
    unsigned int id;
};

struct ProcessQueue {
    struct ProcessIdentify process[MAX_PROCESS_NUM]; 
    unsigned int count;
};

#ifdef PPI_PROCESS_INIT
static inline void process_queue_init(struct ProcessQueue *process_queue)
{
    memset(process_queue, 0, sizeof(struct ProcessQueue));
}
#else
static inline int is_empty(struct ProcessQueue *queue) 
{
    return (queue->count == 0);
}

static inline int process_enqueue(struct ProcessQueue *queue, unsigned long long cr3, unsigned long long esp, unsigned int id) 
{
    unsigned int count;

    count = queue->count;

    if (count >= MAX_PROCESS_NUM) {
        return -1;
    }

    queue->process[count].cr3 = cr3;
    queue->process[count].kernel_esp = esp;
    queue->process[count].id = id;

    queue->count++;

    return count;
}

static inline int process_dequeue(struct ProcessQueue *queue, unsigned long long cr3) 
{
    int i, count;
    int index = 0;
    int find = 0;

    for (i = 0; i < queue->count; i++) {
        if (find) {
            queue->process[i - 1].cr3 = queue->process[i].cr3;
            queue->process[i - 1].kernel_esp = queue->process[i].kernel_esp;
            queue->process[i - 1].id = queue->process[i].id;
        } else if ((queue->process[i].cr3 == cr3)) {
            find = 1;
            index = i;	
        }
    }

    if (!find) {
        return -1;
    }

    queue->count--;

    count = queue->count;

    queue->process[count].cr3 = 0;
    queue->process[count].kernel_esp = 0;
    queue->process[count].id = 0;

    return index;
}

static inline int is_process_in_queue(struct ProcessQueue *queue, unsigned long long cr3) 
{
    int i;

    for (i = 0; i < queue->count; i++) {
        if (queue->process[i].cr3 == cr3) {
            return i;
        }
    }

    return -1;
}

static inline int is_thread_in_queue(struct ProcessQueue *queue, unsigned long long cr3, unsigned long long esp) 
{
    int i;

    for (i = 0; i < queue->count; i++) {
        if ((queue->process[i].cr3 == cr3) && (queue->process[i].kernel_esp == esp)) {
            return i;
        }
    }

    return -1;
}

static inline unsigned int get_thread_id(struct ProcessQueue *queue, int index) 
{
    return queue->process[index].id;
}
#endif

#endif /* PROCESS_H */
