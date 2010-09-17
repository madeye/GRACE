/*
 * QEMU KVM support
 *
 * Copyright IBM, Corp. 2008
 *           Red Hat, Inc. 2008
 *
 * Authors:
 *  Anthony Liguori   <aliguori@us.ibm.com>
 *  Glauber Costa     <gcosta@redhat.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2 or later.
 * See the COPYING file in the top-level directory.
 *
 */

#include <sys/types.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <stdarg.h>

#include <linux/kvm.h>

#include "qemu-common.h"
#include "qemu-barrier.h"
#include "sysemu.h"
#include "hw/hw.h"
#include "gdbstub.h"
#include "kvm.h"
#include "bswap.h"

/* KVM uses PAGE_SIZE in it's definition of COALESCED_MMIO_MAX */
#define PAGE_SIZE TARGET_PAGE_SIZE

//#define DEBUG_KVM

#ifdef DEBUG_KVM
#define DPRINTF(fmt, ...) \
    do { fprintf(stderr, fmt, ## __VA_ARGS__); } while (0)
#else
#define DPRINTF(fmt, ...) \
    do { } while (0)
#endif

typedef struct KVMSlot
{
    target_phys_addr_t start_addr;
    ram_addr_t memory_size;
    ram_addr_t phys_offset;
    int slot;
    int flags;
} KVMSlot;

typedef struct kvm_dirty_log KVMDirtyLog;

struct KVMState
{
    KVMSlot slots[32];
    int fd;
    int vmfd;
    int coalesced_mmio;
#ifdef KVM_CAP_COALESCED_MMIO
    struct kvm_coalesced_mmio_ring *coalesced_mmio_ring;
#endif
    int broken_set_mem_region;
    int migration_log;
    int vcpu_events;
    int robust_singlestep;
    int debugregs;
#ifdef KVM_CAP_SET_GUEST_DEBUG
    struct kvm_sw_breakpoint_head kvm_sw_breakpoints;
#endif
    int irqchip_in_kernel;
    int pit_in_kernel;
};

static KVMState *kvm_state;

static KVMSlot *kvm_alloc_slot(KVMState *s)
{
    int i;

    for (i = 0; i < ARRAY_SIZE(s->slots); i++) {
        /* KVM private memory slots */
        if (i >= 8 && i < 12)
            continue;
        if (s->slots[i].memory_size == 0)
            return &s->slots[i];
    }

    fprintf(stderr, "%s: no free slot available\n", __func__);
    abort();
}

static KVMSlot *kvm_lookup_matching_slot(KVMState *s,
                                         target_phys_addr_t start_addr,
                                         target_phys_addr_t end_addr)
{
    int i;

    for (i = 0; i < ARRAY_SIZE(s->slots); i++) {
        KVMSlot *mem = &s->slots[i];

        if (start_addr == mem->start_addr &&
            end_addr == mem->start_addr + mem->memory_size) {
            return mem;
        }
    }

    return NULL;
}

/*
 * Find overlapping slot with lowest start address
 */
static KVMSlot *kvm_lookup_overlapping_slot(KVMState *s,
                                            target_phys_addr_t start_addr,
                                            target_phys_addr_t end_addr)
{
    KVMSlot *found = NULL;
    int i;

    for (i = 0; i < ARRAY_SIZE(s->slots); i++) {
        KVMSlot *mem = &s->slots[i];

        if (mem->memory_size == 0 ||
            (found && found->start_addr < mem->start_addr)) {
            continue;
        }

        if (end_addr > mem->start_addr &&
            start_addr < mem->start_addr + mem->memory_size) {
            found = mem;
        }
    }

    return found;
}

static int kvm_set_user_memory_region(KVMState *s, KVMSlot *slot)
{
    struct kvm_userspace_memory_region mem;

    mem.slot = slot->slot;
    mem.guest_phys_addr = slot->start_addr;
    mem.memory_size = slot->memory_size;
    mem.userspace_addr = (unsigned long)qemu_get_ram_ptr(slot->phys_offset);
    mem.flags = slot->flags;
    if (s->migration_log) {
        mem.flags |= KVM_MEM_LOG_DIRTY_PAGES;
    }
    return kvm_vm_ioctl(s, KVM_SET_USER_MEMORY_REGION, &mem);
}

static void kvm_reset_vcpu(void *opaque)
{
    CPUState *env = opaque;

    kvm_arch_reset_vcpu(env);
}

int kvm_irqchip_in_kernel(void)
{
    return kvm_state->irqchip_in_kernel;
}

int kvm_pit_in_kernel(void)
{
    return kvm_state->pit_in_kernel;
}


int kvm_init_vcpu(CPUState *env)
{
    KVMState *s = kvm_state;
    long mmap_size;
    int ret;

    DPRINTF("kvm_init_vcpu\n");

    ret = kvm_vm_ioctl(s, KVM_CREATE_VCPU, env->cpu_index);
    if (ret < 0) {
        DPRINTF("kvm_create_vcpu failed\n");
        goto err;
    }

    env->kvm_fd = ret;
    env->kvm_state = s;

    mmap_size = kvm_ioctl(s, KVM_GET_VCPU_MMAP_SIZE, 0);
    if (mmap_size < 0) {
        DPRINTF("KVM_GET_VCPU_MMAP_SIZE failed\n");
        goto err;
    }

    env->kvm_run = mmap(NULL, mmap_size, PROT_READ | PROT_WRITE, MAP_SHARED,
                        env->kvm_fd, 0);
    if (env->kvm_run == MAP_FAILED) {
        ret = -errno;
        DPRINTF("mmap'ing vcpu state failed\n");
        goto err;
    }

#ifdef KVM_CAP_COALESCED_MMIO
    if (s->coalesced_mmio && !s->coalesced_mmio_ring)
        s->coalesced_mmio_ring = (void *) env->kvm_run +
		s->coalesced_mmio * PAGE_SIZE;
#endif

    ret = kvm_arch_init_vcpu(env);
    if (ret == 0) {
        qemu_register_reset(kvm_reset_vcpu, env);
        kvm_arch_reset_vcpu(env);
    }
err:
    return ret;
}

/*
 * dirty pages logging control
 */
static int kvm_dirty_pages_log_change(target_phys_addr_t phys_addr,
                                      ram_addr_t size, int flags, int mask)
{
    KVMState *s = kvm_state;
    KVMSlot *mem = kvm_lookup_matching_slot(s, phys_addr, phys_addr + size);
    int old_flags;

    if (mem == NULL)  {
            fprintf(stderr, "BUG: %s: invalid parameters " TARGET_FMT_plx "-"
                    TARGET_FMT_plx "\n", __func__, phys_addr,
                    (target_phys_addr_t)(phys_addr + size - 1));
            return -EINVAL;
    }

    old_flags = mem->flags;

    flags = (mem->flags & ~mask) | flags;
    mem->flags = flags;

    /* If nothing changed effectively, no need to issue ioctl */
    if (s->migration_log) {
        flags |= KVM_MEM_LOG_DIRTY_PAGES;
    }
    if (flags == old_flags) {
            return 0;
    }

    return kvm_set_user_memory_region(s, mem);
}

int kvm_log_start(target_phys_addr_t phys_addr, ram_addr_t size)
{
        return kvm_dirty_pages_log_change(phys_addr, size,
                                          KVM_MEM_LOG_DIRTY_PAGES,
                                          KVM_MEM_LOG_DIRTY_PAGES);
}

int kvm_log_stop(target_phys_addr_t phys_addr, ram_addr_t size)
{
        return kvm_dirty_pages_log_change(phys_addr, size,
                                          0,
                                          KVM_MEM_LOG_DIRTY_PAGES);
}

static int kvm_set_migration_log(int enable)
{
    KVMState *s = kvm_state;
    KVMSlot *mem;
    int i, err;

    s->migration_log = enable;

    for (i = 0; i < ARRAY_SIZE(s->slots); i++) {
        mem = &s->slots[i];

        if (!!(mem->flags & KVM_MEM_LOG_DIRTY_PAGES) == enable) {
            continue;
        }
        err = kvm_set_user_memory_region(s, mem);
        if (err) {
            return err;
        }
    }
    return 0;
}

/* get kvm's dirty pages bitmap and update qemu's */
static int kvm_get_dirty_pages_log_range(unsigned long start_addr,
                                         unsigned long *bitmap,
                                         unsigned long offset,
                                         unsigned long mem_size)
{
    unsigned int i, j;
    unsigned long page_number, addr, addr1, c;
    ram_addr_t ram_addr;
    unsigned int len = ((mem_size / TARGET_PAGE_SIZE) + HOST_LONG_BITS - 1) /
        HOST_LONG_BITS;

    /*
     * bitmap-traveling is faster than memory-traveling (for addr...)
     * especially when most of the memory is not dirty.
     */
    for (i = 0; i < len; i++) {
        if (bitmap[i] != 0) {
            c = leul_to_cpu(bitmap[i]);
            do {
                j = ffsl(c) - 1;
                c &= ~(1ul << j);
                page_number = i * HOST_LONG_BITS + j;
                addr1 = page_number * TARGET_PAGE_SIZE;
                addr = offset + addr1;
                ram_addr = cpu_get_physical_page_desc(addr);
                cpu_physical_memory_set_dirty(ram_addr);
            } while (c != 0);
        }
    }
    return 0;
}

#define ALIGN(x, y)  (((x)+(y)-1) & ~((y)-1))

/**
 * kvm_physical_sync_dirty_bitmap - Grab dirty bitmap from kernel space
 * This function updates qemu's dirty bitmap using cpu_physical_memory_set_dirty().
 * This means all bits are set to dirty.
 *
 * @start_add: start of logged region.
 * @end_addr: end of logged region.
 */
static int kvm_physical_sync_dirty_bitmap(target_phys_addr_t start_addr,
					  target_phys_addr_t end_addr)
{
    KVMState *s = kvm_state;
    unsigned long size, allocated_size = 0;
    KVMDirtyLog d;
    KVMSlot *mem;
    int ret = 0;

    d.dirty_bitmap = NULL;
    while (start_addr < end_addr) {
        mem = kvm_lookup_overlapping_slot(s, start_addr, end_addr);
        if (mem == NULL) {
            break;
        }

        size = ALIGN(((mem->memory_size) >> TARGET_PAGE_BITS), HOST_LONG_BITS) / 8;
        if (!d.dirty_bitmap) {
            d.dirty_bitmap = qemu_malloc(size);
        } else if (size > allocated_size) {
            d.dirty_bitmap = qemu_realloc(d.dirty_bitmap, size);
        }
        allocated_size = size;
        memset(d.dirty_bitmap, 0, allocated_size);

        d.slot = mem->slot;

        if (kvm_vm_ioctl(s, KVM_GET_DIRTY_LOG, &d) == -1) {
            DPRINTF("ioctl failed %d\n", errno);
            ret = -1;
            break;
        }

        kvm_get_dirty_pages_log_range(mem->start_addr, d.dirty_bitmap,
                                      mem->start_addr, mem->memory_size);
        start_addr = mem->start_addr + mem->memory_size;
    }
    qemu_free(d.dirty_bitmap);

    return ret;
}

int kvm_coalesce_mmio_region(target_phys_addr_t start, ram_addr_t size)
{
    int ret = -ENOSYS;
#ifdef KVM_CAP_COALESCED_MMIO
    KVMState *s = kvm_state;

    if (s->coalesced_mmio) {
        struct kvm_coalesced_mmio_zone zone;

        zone.addr = start;
        zone.size = size;

        ret = kvm_vm_ioctl(s, KVM_REGISTER_COALESCED_MMIO, &zone);
    }
#endif

    return ret;
}

int kvm_uncoalesce_mmio_region(target_phys_addr_t start, ram_addr_t size)
{
    int ret = -ENOSYS;
#ifdef KVM_CAP_COALESCED_MMIO
    KVMState *s = kvm_state;

    if (s->coalesced_mmio) {
        struct kvm_coalesced_mmio_zone zone;

        zone.addr = start;
        zone.size = size;

        ret = kvm_vm_ioctl(s, KVM_UNREGISTER_COALESCED_MMIO, &zone);
    }
#endif

    return ret;
}

int kvm_check_extension(KVMState *s, unsigned int extension)
{
    int ret;

    ret = kvm_ioctl(s, KVM_CHECK_EXTENSION, extension);
    if (ret < 0) {
        ret = 0;
    }

    return ret;
}

static void kvm_set_phys_mem(target_phys_addr_t start_addr,
			     ram_addr_t size,
			     ram_addr_t phys_offset)
{
    KVMState *s = kvm_state;
    ram_addr_t flags = phys_offset & ~TARGET_PAGE_MASK;
    KVMSlot *mem, old;
    int err;

    if (start_addr & ~TARGET_PAGE_MASK) {
        if (flags >= IO_MEM_UNASSIGNED) {
            if (!kvm_lookup_overlapping_slot(s, start_addr,
                                             start_addr + size)) {
                return;
            }
            fprintf(stderr, "Unaligned split of a KVM memory slot\n");
        } else {
            fprintf(stderr, "Only page-aligned memory slots supported\n");
        }
        abort();
    }

    /* KVM does not support read-only slots */
    phys_offset &= ~IO_MEM_ROM;

    while (1) {
        mem = kvm_lookup_overlapping_slot(s, start_addr, start_addr + size);
        if (!mem) {
            break;
        }

        if (flags < IO_MEM_UNASSIGNED && start_addr >= mem->start_addr &&
            (start_addr + size <= mem->start_addr + mem->memory_size) &&
            (phys_offset - start_addr == mem->phys_offset - mem->start_addr)) {
            /* The new slot fits into the existing one and comes with
             * identical parameters - nothing to be done. */
            return;
        }

        old = *mem;

        /* unregister the overlapping slot */
        mem->memory_size = 0;
        err = kvm_set_user_memory_region(s, mem);
        if (err) {
            fprintf(stderr, "%s: error unregistering overlapping slot: %s\n",
                    __func__, strerror(-err));
            abort();
        }

        /* Workaround for older KVM versions: we can't join slots, even not by
         * unregistering the previous ones and then registering the larger
         * slot. We have to maintain the existing fragmentation. Sigh.
         *
         * This workaround assumes that the new slot starts at the same
         * address as the first existing one. If not or if some overlapping
         * slot comes around later, we will fail (not seen in practice so far)
         * - and actually require a recent KVM version. */
        if (s->broken_set_mem_region &&
            old.start_addr == start_addr && old.memory_size < size &&
            flags < IO_MEM_UNASSIGNED) {
            mem = kvm_alloc_slot(s);
            mem->memory_size = old.memory_size;
            mem->start_addr = old.start_addr;
            mem->phys_offset = old.phys_offset;
            mem->flags = 0;

            err = kvm_set_user_memory_region(s, mem);
            if (err) {
                fprintf(stderr, "%s: error updating slot: %s\n", __func__,
                        strerror(-err));
                abort();
            }

            start_addr += old.memory_size;
            phys_offset += old.memory_size;
            size -= old.memory_size;
            continue;
        }

        /* register prefix slot */
        if (old.start_addr < start_addr) {
            mem = kvm_alloc_slot(s);
            mem->memory_size = start_addr - old.start_addr;
            mem->start_addr = old.start_addr;
            mem->phys_offset = old.phys_offset;
            mem->flags = 0;

            err = kvm_set_user_memory_region(s, mem);
            if (err) {
                fprintf(stderr, "%s: error registering prefix slot: %s\n",
                        __func__, strerror(-err));
                abort();
            }
        }

        /* register suffix slot */
        if (old.start_addr + old.memory_size > start_addr + size) {
            ram_addr_t size_delta;

            mem = kvm_alloc_slot(s);
            mem->start_addr = start_addr + size;
            size_delta = mem->start_addr - old.start_addr;
            mem->memory_size = old.memory_size - size_delta;
            mem->phys_offset = old.phys_offset + size_delta;
            mem->flags = 0;

            err = kvm_set_user_memory_region(s, mem);
            if (err) {
                fprintf(stderr, "%s: error registering suffix slot: %s\n",
                        __func__, strerror(-err));
                abort();
            }
        }
    }

    /* in case the KVM bug workaround already "consumed" the new slot */
    if (!size)
        return;

    /* KVM does not need to know about this memory */
    if (flags >= IO_MEM_UNASSIGNED)
        return;

    mem = kvm_alloc_slot(s);
    mem->memory_size = size;
    mem->start_addr = start_addr;
    mem->phys_offset = phys_offset;
    mem->flags = 0;

    err = kvm_set_user_memory_region(s, mem);
    if (err) {
        fprintf(stderr, "%s: error registering slot: %s\n", __func__,
                strerror(-err));
        abort();
    }
}

static void kvm_client_set_memory(struct CPUPhysMemoryClient *client,
				  target_phys_addr_t start_addr,
				  ram_addr_t size,
				  ram_addr_t phys_offset)
{
	kvm_set_phys_mem(start_addr, size, phys_offset);
}

static int kvm_client_sync_dirty_bitmap(struct CPUPhysMemoryClient *client,
					target_phys_addr_t start_addr,
					target_phys_addr_t end_addr)
{
	return kvm_physical_sync_dirty_bitmap(start_addr, end_addr);
}

static int kvm_client_migration_log(struct CPUPhysMemoryClient *client,
				    int enable)
{
	return kvm_set_migration_log(enable);
}

static CPUPhysMemoryClient kvm_cpu_phys_memory_client = {
	.set_memory = kvm_client_set_memory,
	.sync_dirty_bitmap = kvm_client_sync_dirty_bitmap,
	.migration_log = kvm_client_migration_log,
};

int kvm_init(int smp_cpus)
{
    static const char upgrade_note[] =
        "Please upgrade to at least kernel 2.6.29 or recent kvm-kmod\n"
        "(see http://sourceforge.net/projects/kvm).\n";
    KVMState *s;
    int ret;
    int i;

    if (smp_cpus > 1) {
        fprintf(stderr, "No SMP KVM support, use '-smp 1'\n");
        return -EINVAL;
    }

    s = qemu_mallocz(sizeof(KVMState));

#ifdef KVM_CAP_SET_GUEST_DEBUG
    QTAILQ_INIT(&s->kvm_sw_breakpoints);
#endif
    for (i = 0; i < ARRAY_SIZE(s->slots); i++)
        s->slots[i].slot = i;

    s->vmfd = -1;
    s->fd = qemu_open("/dev/kvm", O_RDWR);
    if (s->fd == -1) {
        fprintf(stderr, "Could not access KVM kernel module: %m\n");
        ret = -errno;
        goto err;
    }

    ret = kvm_ioctl(s, KVM_GET_API_VERSION, 0);
    if (ret < KVM_API_VERSION) {
        if (ret > 0)
            ret = -EINVAL;
        fprintf(stderr, "kvm version too old\n");
        goto err;
    }

    if (ret > KVM_API_VERSION) {
        ret = -EINVAL;
        fprintf(stderr, "kvm version not supported\n");
        goto err;
    }

    s->vmfd = kvm_ioctl(s, KVM_CREATE_VM, 0);
    if (s->vmfd < 0) {
#ifdef TARGET_S390X
        fprintf(stderr, "Please add the 'switch_amode' kernel parameter to "
                        "your host kernel command line\n");
#endif
        goto err;
    }

    /* initially, KVM allocated its own memory and we had to jump through
     * hooks to make phys_ram_base point to this.  Modern versions of KVM
     * just use a user allocated buffer so we can use regular pages
     * unmodified.  Make sure we have a sufficiently modern version of KVM.
     */
    if (!kvm_check_extension(s, KVM_CAP_USER_MEMORY)) {
        ret = -EINVAL;
        fprintf(stderr, "kvm does not support KVM_CAP_USER_MEMORY\n%s",
                upgrade_note);
        goto err;
    }

    /* There was a nasty bug in < kvm-80 that prevents memory slots from being
     * destroyed properly.  Since we rely on this capability, refuse to work
     * with any kernel without this capability. */
    if (!kvm_check_extension(s, KVM_CAP_DESTROY_MEMORY_REGION_WORKS)) {
        ret = -EINVAL;

        fprintf(stderr,
                "KVM kernel module broken (DESTROY_MEMORY_REGION).\n%s",
                upgrade_note);
        goto err;
    }

    s->coalesced_mmio = 0;
#ifdef KVM_CAP_COALESCED_MMIO
    s->coalesced_mmio = kvm_check_extension(s, KVM_CAP_COALESCED_MMIO);
    s->coalesced_mmio_ring = NULL;
#endif

    s->broken_set_mem_region = 1;
#ifdef KVM_CAP_JOIN_MEMORY_REGIONS_WORKS
    ret = kvm_ioctl(s, KVM_CHECK_EXTENSION, KVM_CAP_JOIN_MEMORY_REGIONS_WORKS);
    if (ret > 0) {
        s->broken_set_mem_region = 0;
    }
#endif

    s->vcpu_events = 0;
#ifdef KVM_CAP_VCPU_EVENTS
    s->vcpu_events = kvm_check_extension(s, KVM_CAP_VCPU_EVENTS);
#endif

    s->robust_singlestep = 0;
#ifdef KVM_CAP_X86_ROBUST_SINGLESTEP
    s->robust_singlestep =
        kvm_check_extension(s, KVM_CAP_X86_ROBUST_SINGLESTEP);
#endif

    s->debugregs = 0;
#ifdef KVM_CAP_DEBUGREGS
    s->debugregs = kvm_check_extension(s, KVM_CAP_DEBUGREGS);
#endif

    ret = kvm_arch_init(s, smp_cpus);
    if (ret < 0)
        goto err;

    kvm_state = s;
    cpu_register_phys_memory_client(&kvm_cpu_phys_memory_client);

    return 0;

err:
    if (s) {
        if (s->vmfd != -1)
            close(s->vmfd);
        if (s->fd != -1)
            close(s->fd);
    }
    qemu_free(s);

    return ret;
}

static int kvm_handle_io(uint16_t port, void *data, int direction, int size,
                         uint32_t count)
{
    int i;
    uint8_t *ptr = data;

    for (i = 0; i < count; i++) {
        if (direction == KVM_EXIT_IO_IN) {
            switch (size) {
            case 1:
                stb_p(ptr, cpu_inb(port));
                break;
            case 2:
                stw_p(ptr, cpu_inw(port));
                break;
            case 4:
                stl_p(ptr, cpu_inl(port));
                break;
            }
        } else {
            switch (size) {
            case 1:
                cpu_outb(port, ldub_p(ptr));
                break;
            case 2:
                cpu_outw(port, lduw_p(ptr));
                break;
            case 4:
                cpu_outl(port, ldl_p(ptr));
                break;
            }
        }

        ptr += size;
    }

    return 1;
}

#ifdef KVM_CAP_INTERNAL_ERROR_DATA
static void kvm_handle_internal_error(CPUState *env, struct kvm_run *run)
{

    if (kvm_check_extension(kvm_state, KVM_CAP_INTERNAL_ERROR_DATA)) {
        int i;

        fprintf(stderr, "KVM internal error. Suberror: %d\n",
                run->internal.suberror);

        for (i = 0; i < run->internal.ndata; ++i) {
            fprintf(stderr, "extra data[%d]: %"PRIx64"\n",
                    i, (uint64_t)run->internal.data[i]);
        }
    }
    cpu_dump_state(env, stderr, fprintf, 0);
    if (run->internal.suberror == KVM_INTERNAL_ERROR_EMULATION) {
        fprintf(stderr, "emulation failure\n");
    }
    /* FIXME: Should trigger a qmp message to let management know
     * something went wrong.
     */
    vm_stop(0);
}
#endif

void kvm_flush_coalesced_mmio_buffer(void)
{
#ifdef KVM_CAP_COALESCED_MMIO
    KVMState *s = kvm_state;
    if (s->coalesced_mmio_ring) {
        struct kvm_coalesced_mmio_ring *ring = s->coalesced_mmio_ring;
        while (ring->first != ring->last) {
            struct kvm_coalesced_mmio *ent;

            ent = &ring->coalesced_mmio[ring->first];

            cpu_physical_memory_write(ent->phys_addr, ent->data, ent->len);
            smp_wmb();
            ring->first = (ring->first + 1) % KVM_COALESCED_MMIO_MAX;
        }
    }
#endif
}

void kvm_cpu_synchronize_state(CPUState *env)
{
    if (!env->kvm_vcpu_dirty) {
        kvm_arch_get_registers(env);
        env->kvm_vcpu_dirty = 1;
    }
}

void kvm_cpu_synchronize_post_reset(CPUState *env)
{
    kvm_arch_put_registers(env, KVM_PUT_RESET_STATE);
    env->kvm_vcpu_dirty = 0;
}

void kvm_cpu_synchronize_post_init(CPUState *env)
{
    kvm_arch_put_registers(env, KVM_PUT_FULL_STATE);
    env->kvm_vcpu_dirty = 0;
}

int kvm_cpu_exec(CPUState *env)
{
    struct kvm_run *run = env->kvm_run;
    int ret;

    DPRINTF("kvm_cpu_exec()\n");

    do {
#ifndef CONFIG_IOTHREAD
        if (env->exit_request) {
            DPRINTF("interrupt exit requested\n");
            ret = 0;
            break;
        }
#endif

        if (env->kvm_vcpu_dirty) {
            kvm_arch_put_registers(env, KVM_PUT_RUNTIME_STATE);
            env->kvm_vcpu_dirty = 0;
        }

        kvm_arch_pre_run(env, run);
        qemu_mutex_unlock_iothread();
        ret = kvm_vcpu_ioctl(env, KVM_RUN, 0);
        qemu_mutex_lock_iothread();
        kvm_arch_post_run(env, run);

        if (ret == -EINTR || ret == -EAGAIN) {
            cpu_exit(env);
            DPRINTF("io window exit\n");
            ret = 0;
            break;
        }

        if (ret < 0) {
            DPRINTF("kvm run failed %s\n", strerror(-ret));
            abort();
        }

        kvm_flush_coalesced_mmio_buffer();

        ret = 0; /* exit loop */
        switch (run->exit_reason) {
        case KVM_EXIT_IO:
            DPRINTF("handle_io\n");
            ret = kvm_handle_io(run->io.port,
                                (uint8_t *)run + run->io.data_offset,
                                run->io.direction,
                                run->io.size,
                                run->io.count);
            break;
        case KVM_EXIT_MMIO:
            DPRINTF("handle_mmio\n");
            cpu_physical_memory_rw(run->mmio.phys_addr,
                                   run->mmio.data,
                                   run->mmio.len,
                                   run->mmio.is_write);
            ret = 1;
            break;
        case KVM_EXIT_IRQ_WINDOW_OPEN:
            DPRINTF("irq_window_open\n");
            break;
        case KVM_EXIT_SHUTDOWN:
            DPRINTF("shutdown\n");
            qemu_system_reset_request();
            ret = 1;
            break;
        case KVM_EXIT_UNKNOWN:
            DPRINTF("kvm_exit_unknown\n");
            break;
        case KVM_EXIT_FAIL_ENTRY:
            DPRINTF("kvm_exit_fail_entry\n");
            break;
        case KVM_EXIT_EXCEPTION:
            DPRINTF("kvm_exit_exception\n");
            break;
#ifdef KVM_CAP_INTERNAL_ERROR_DATA
        case KVM_EXIT_INTERNAL_ERROR:
            kvm_handle_internal_error(env, run);
            break;
#endif
        case KVM_EXIT_DEBUG:
            DPRINTF("kvm_exit_debug\n");
#ifdef KVM_CAP_SET_GUEST_DEBUG
            if (kvm_arch_debug(&run->debug.arch)) {
                gdb_set_stop_cpu(env);
                vm_stop(EXCP_DEBUG);
                env->exception_index = EXCP_DEBUG;
                return 0;
            }
            /* re-enter, this exception was guest-internal */
            ret = 1;
#endif /* KVM_CAP_SET_GUEST_DEBUG */
            break;
        default:
            DPRINTF("kvm_arch_handle_exit\n");
            ret = kvm_arch_handle_exit(env, run);
            break;
        }
    } while (ret > 0);

    if (env->exit_request) {
        env->exit_request = 0;
        env->exception_index = EXCP_INTERRUPT;
    }

    return ret;
}

int kvm_ioctl(KVMState *s, int type, ...)
{
    int ret;
    void *arg;
    va_list ap;

    va_start(ap, type);
    arg = va_arg(ap, void *);
    va_end(ap);

    ret = ioctl(s->fd, type, arg);
    if (ret == -1)
        ret = -errno;

    return ret;
}

int kvm_vm_ioctl(KVMState *s, int type, ...)
{
    int ret;
    void *arg;
    va_list ap;

    va_start(ap, type);
    arg = va_arg(ap, void *);
    va_end(ap);

    ret = ioctl(s->vmfd, type, arg);
    if (ret == -1)
        ret = -errno;

    return ret;
}

int kvm_vcpu_ioctl(CPUState *env, int type, ...)
{
    int ret;
    void *arg;
    va_list ap;

    va_start(ap, type);
    arg = va_arg(ap, void *);
    va_end(ap);

    ret = ioctl(env->kvm_fd, type, arg);
    if (ret == -1)
        ret = -errno;

    return ret;
}

int kvm_has_sync_mmu(void)
{
#ifdef KVM_CAP_SYNC_MMU
    KVMState *s = kvm_state;

    return kvm_check_extension(s, KVM_CAP_SYNC_MMU);
#else
    return 0;
#endif
}

int kvm_has_vcpu_events(void)
{
    return kvm_state->vcpu_events;
}

int kvm_has_robust_singlestep(void)
{
    return kvm_state->robust_singlestep;
}

int kvm_has_debugregs(void)
{
    return kvm_state->debugregs;
}

void kvm_setup_guest_memory(void *start, size_t size)
{
    if (!kvm_has_sync_mmu()) {
#ifdef MADV_DONTFORK
        int ret = madvise(start, size, MADV_DONTFORK);

        if (ret) {
            perror("madvice");
            exit(1);
        }
#else
        fprintf(stderr,
                "Need MADV_DONTFORK in absence of synchronous KVM MMU\n");
        exit(1);
#endif
    }
}

#ifdef KVM_CAP_SET_GUEST_DEBUG
static void on_vcpu(CPUState *env, void (*func)(void *data), void *data)
{
#ifdef CONFIG_IOTHREAD
    if (env != cpu_single_env) {
        abort();
    }
#endif
    func(data);
}

struct kvm_sw_breakpoint *kvm_find_sw_breakpoint(CPUState *env,
                                                 target_ulong pc)
{
    struct kvm_sw_breakpoint *bp;

    QTAILQ_FOREACH(bp, &env->kvm_state->kvm_sw_breakpoints, entry) {
        if (bp->pc == pc)
            return bp;
    }
    return NULL;
}

int kvm_sw_breakpoints_active(CPUState *env)
{
    return !QTAILQ_EMPTY(&env->kvm_state->kvm_sw_breakpoints);
}

struct kvm_set_guest_debug_data {
    struct kvm_guest_debug dbg;
    CPUState *env;
    int err;
};

static void kvm_invoke_set_guest_debug(void *data)
{
    struct kvm_set_guest_debug_data *dbg_data = data;
    CPUState *env = dbg_data->env;

    dbg_data->err = kvm_vcpu_ioctl(env, KVM_SET_GUEST_DEBUG, &dbg_data->dbg);
}

int kvm_update_guest_debug(CPUState *env, unsigned long reinject_trap)
{
    struct kvm_set_guest_debug_data data;

    data.dbg.control = reinject_trap;

    if (env->singlestep_enabled) {
        data.dbg.control |= KVM_GUESTDBG_ENABLE | KVM_GUESTDBG_SINGLESTEP;
    }
    kvm_arch_update_guest_debug(env, &data.dbg);
    data.env = env;

    on_vcpu(env, kvm_invoke_set_guest_debug, &data);
    return data.err;
}

int kvm_insert_breakpoint(CPUState *current_env, target_ulong addr,
                          target_ulong len, int type)
{
    struct kvm_sw_breakpoint *bp;
    CPUState *env;
    int err;

    if (type == GDB_BREAKPOINT_SW) {
        bp = kvm_find_sw_breakpoint(current_env, addr);
        if (bp) {
            bp->use_count++;
            return 0;
        }

        bp = qemu_malloc(sizeof(struct kvm_sw_breakpoint));
        if (!bp)
            return -ENOMEM;

        bp->pc = addr;
        bp->use_count = 1;
        err = kvm_arch_insert_sw_breakpoint(current_env, bp);
        if (err) {
            free(bp);
            return err;
        }

        QTAILQ_INSERT_HEAD(&current_env->kvm_state->kvm_sw_breakpoints,
                          bp, entry);
    } else {
        err = kvm_arch_insert_hw_breakpoint(addr, len, type);
        if (err)
            return err;
    }

    for (env = first_cpu; env != NULL; env = env->next_cpu) {
        err = kvm_update_guest_debug(env, 0);
        if (err)
            return err;
    }
    return 0;
}

int kvm_remove_breakpoint(CPUState *current_env, target_ulong addr,
                          target_ulong len, int type)
{
    struct kvm_sw_breakpoint *bp;
    CPUState *env;
    int err;

    if (type == GDB_BREAKPOINT_SW) {
        bp = kvm_find_sw_breakpoint(current_env, addr);
        if (!bp)
            return -ENOENT;

        if (bp->use_count > 1) {
            bp->use_count--;
            return 0;
        }

        err = kvm_arch_remove_sw_breakpoint(current_env, bp);
        if (err)
            return err;

        QTAILQ_REMOVE(&current_env->kvm_state->kvm_sw_breakpoints, bp, entry);
        qemu_free(bp);
    } else {
        err = kvm_arch_remove_hw_breakpoint(addr, len, type);
        if (err)
            return err;
    }

    for (env = first_cpu; env != NULL; env = env->next_cpu) {
        err = kvm_update_guest_debug(env, 0);
        if (err)
            return err;
    }
    return 0;
}

void kvm_remove_all_breakpoints(CPUState *current_env)
{
    struct kvm_sw_breakpoint *bp, *next;
    KVMState *s = current_env->kvm_state;
    CPUState *env;

    QTAILQ_FOREACH_SAFE(bp, &s->kvm_sw_breakpoints, entry, next) {
        if (kvm_arch_remove_sw_breakpoint(current_env, bp) != 0) {
            /* Try harder to find a CPU that currently sees the breakpoint. */
            for (env = first_cpu; env != NULL; env = env->next_cpu) {
                if (kvm_arch_remove_sw_breakpoint(env, bp) == 0)
                    break;
            }
        }
    }
    kvm_arch_remove_all_hw_breakpoints();

    for (env = first_cpu; env != NULL; env = env->next_cpu)
        kvm_update_guest_debug(env, 0);
}

#else /* !KVM_CAP_SET_GUEST_DEBUG */

int kvm_update_guest_debug(CPUState *env, unsigned long reinject_trap)
{
    return -EINVAL;
}

int kvm_insert_breakpoint(CPUState *current_env, target_ulong addr,
                          target_ulong len, int type)
{
    return -EINVAL;
}

int kvm_remove_breakpoint(CPUState *current_env, target_ulong addr,
                          target_ulong len, int type)
{
    return -EINVAL;
}

void kvm_remove_all_breakpoints(CPUState *current_env)
{
}
#endif /* !KVM_CAP_SET_GUEST_DEBUG */

int kvm_set_signal_mask(CPUState *env, const sigset_t *sigset)
{
    struct kvm_signal_mask *sigmask;
    int r;

    if (!sigset)
        return kvm_vcpu_ioctl(env, KVM_SET_SIGNAL_MASK, NULL);

    sigmask = qemu_malloc(sizeof(*sigmask) + sizeof(*sigset));

    sigmask->len = 8;
    memcpy(sigmask->sigset, sigset, sizeof(*sigset));
    r = kvm_vcpu_ioctl(env, KVM_SET_SIGNAL_MASK, sigmask);
    free(sigmask);

    return r;
}

int kvm_set_ioeventfd_pio_word(int fd, uint16_t addr, uint16_t val, bool assign)
{
#ifdef KVM_IOEVENTFD
    struct kvm_ioeventfd kick = {
        .datamatch = val,
        .addr = addr,
        .len = 2,
        .flags = KVM_IOEVENTFD_FLAG_DATAMATCH | KVM_IOEVENTFD_FLAG_PIO,
        .fd = fd,
    };
    int r;
    if (!kvm_enabled())
        return -ENOSYS;
    if (!assign)
        kick.flags |= KVM_IOEVENTFD_FLAG_DEASSIGN;
    r = kvm_vm_ioctl(kvm_state, KVM_IOEVENTFD, &kick);
    if (r < 0)
        return r;
    return 0;
#else
    return -ENOSYS;
#endif
}
