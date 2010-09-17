/*
 * QEMU System Emulator
 *
 * Copyright (c) 2003-2008 Fabrice Bellard
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
#include <unistd.h>
#include <fcntl.h>
#include <signal.h>
#include <time.h>
#include <errno.h>
#include <sys/time.h>
#include <zlib.h>

/* Needed early for CONFIG_BSD etc. */
#include "config-host.h"

#ifndef _WIN32
#include <libgen.h>
#include <pwd.h>
#include <sys/times.h>
#include <sys/wait.h>
#include <termios.h>
#include <sys/mman.h>
#include <sys/ioctl.h>
#include <sys/resource.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <net/if.h>
#include <arpa/inet.h>
#include <dirent.h>
#include <netdb.h>
#include <sys/select.h>
#ifdef CONFIG_BSD
#include <sys/stat.h>
#if defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || defined(__DragonFly__)
#include <libutil.h>
#include <sys/sysctl.h>
#else
#include <util.h>
#endif
#else
#ifdef __linux__
#include <pty.h>
#include <malloc.h>
#include <sys/prctl.h>

#include <linux/ppdev.h>
#include <linux/parport.h>
#endif
#ifdef __sun__
#include <sys/stat.h>
#include <sys/ethernet.h>
#include <sys/sockio.h>
#include <netinet/arp.h>
#include <netinet/in.h>
#include <netinet/in_systm.h>
#include <netinet/ip.h>
#include <netinet/ip_icmp.h> // must come after ip.h
#include <netinet/udp.h>
#include <netinet/tcp.h>
#include <net/if.h>
#include <syslog.h>
#include <stropts.h>
/* See MySQL bug #7156 (http://bugs.mysql.com/bug.php?id=7156) for
   discussion about Solaris header problems */
extern int madvise(caddr_t, size_t, int);
#endif
#endif
#endif

#if defined(__OpenBSD__)
#include <util.h>
#endif

#if defined(CONFIG_VDE)
#include <libvdeplug.h>
#endif

#ifdef _WIN32
#include <windows.h>
#endif

#ifdef CONFIG_SDL
#if defined(__APPLE__) || defined(main)
#include <SDL.h>
int qemu_main(int argc, char **argv, char **envp);
int main(int argc, char **argv)
{
    return qemu_main(argc, argv, NULL);
}
#undef main
#define main qemu_main
#endif
#endif /* CONFIG_SDL */

#ifdef CONFIG_COCOA
#undef main
#define main qemu_main
#endif /* CONFIG_COCOA */

#include "hw/hw.h"
#include "hw/boards.h"
#include "hw/usb.h"
#include "hw/pcmcia.h"
#include "hw/pc.h"
#include "hw/isa.h"
#include "hw/baum.h"
#include "hw/bt.h"
#include "hw/watchdog.h"
#include "hw/smbios.h"
#include "hw/xen.h"
#include "hw/qdev.h"
#include "hw/loader.h"
#include "bt-host.h"
#include "net.h"
#include "net/slirp.h"
#include "monitor.h"
#include "console.h"
#include "sysemu.h"
#include "gdbstub.h"
#include "qemu-timer.h"
#include "qemu-char.h"
#include "cache-utils.h"
#include "block.h"
#include "block_int.h"
#include "block-migration.h"
#include "dma.h"
#include "audio/audio.h"
#include "migration.h"
#include "kvm.h"
#include "qemu-option.h"
#include "qemu-config.h"
#include "qemu-objects.h"
#ifdef CONFIG_LINUX
#include "fsdev/qemu-fsdev.h"
#endif

#include "disas.h"

#include "qemu_socket.h"

#include "slirp/libslirp.h"

#include "qemu-queue.h"
#include "cpus.h"
#include "arch_init.h"

//#define DEBUG_NET
//#define DEBUG_SLIRP
#include "coremu-config.h"
#include "coremu-init.h"
#include "coremu-core.h"
#include "coremu-intr.h"
#include "coremu-thread.h"
#include "coremu-debug.h"
#include "cm-loop.h"
#include "cm-intr.h"
#include "cm-init.h"
#include "cm-timer.h"

//#include "cm-i386-intr.h"

#define DEFAULT_RAM_SIZE 128

#define MAX_VIRTIO_CONSOLES 1

static const char *data_dir;
const char *bios_name = NULL;
/* Note: drives_table[MAX_DRIVES] is a dummy block driver if none available
   to store the VM snapshots */
struct drivelist drives = QTAILQ_HEAD_INITIALIZER(drives);
struct driveoptlist driveopts = QTAILQ_HEAD_INITIALIZER(driveopts);
enum vga_retrace_method vga_retrace_method = VGA_RETRACE_DUMB;
DisplayType display_type = DT_DEFAULT;
const char* keyboard_layout = NULL;
ram_addr_t ram_size;
const char *mem_path = NULL;
#ifdef MAP_POPULATE
int mem_prealloc = 0; /* force preallocation of physical target memory */
#endif
int nb_nics;
NICInfo nd_table[MAX_NICS];
int vm_running;
int autostart;
static int rtc_utc = 1;
static int rtc_date_offset = -1; /* -1 means no change */
QEMUClock *rtc_clock;
int vga_interface_type = VGA_NONE;
static int full_screen = 0;
#ifdef CONFIG_SDL
static int no_frame = 0;
#endif
int no_quit = 0;
CharDriverState *serial_hds[MAX_SERIAL_PORTS];
CharDriverState *parallel_hds[MAX_PARALLEL_PORTS];
CharDriverState *virtcon_hds[MAX_VIRTIO_CONSOLES];
int win2k_install_hack = 0;
int rtc_td_hack = 0;
int usb_enabled = 0;
int singlestep = 0;
int smp_cpus = 1;
int max_cpus = 0;
int smp_cores = 1;
int smp_threads = 1;
const char *vnc_display;
int acpi_enabled = 1;
int no_hpet = 0;
int fd_bootchk = 1;
int no_reboot = 0;
int no_shutdown = 0;
int cursor_hide = 1;
int graphic_rotate = 0;
uint8_t irq0override = 1;
#ifndef _WIN32
int daemonize = 0;
#endif
const char *watchdog;
const char *option_rom[MAX_OPTION_ROMS];
int nb_option_roms;
int semihosting_enabled = 0;
int old_param = 0;
const char *qemu_name;
int alt_grab = 0;
int ctrl_grab = 0;
unsigned int nb_prom_envs = 0;
const char *prom_envs[MAX_PROM_ENVS];
int boot_menu;

int nb_numa_nodes;
uint64_t node_mem[MAX_NODES];
uint64_t node_cpumask[MAX_NODES];

static QEMUTimer *nographic_timer;

uint8_t qemu_uuid[16];

static QEMUBootSetHandler *boot_set_handler;
static void *boot_set_opaque;

int kvm_allowed = 0;
uint32_t xen_domid;
enum xen_mode xen_mode = XEN_EMULATE;

static int default_serial = 1;
static int default_parallel = 1;
static int default_virtcon = 1;
static int default_monitor = 1;
static int default_vga = 1;
static int default_floppy = 1;
static int default_cdrom = 1;
static int default_sdcard = 1;

static struct {
    const char *driver;
    int *flag;
} default_list[] = {
    { .driver = "isa-serial",           .flag = &default_serial    },
    { .driver = "isa-parallel",         .flag = &default_parallel  },
    { .driver = "isa-fdc",              .flag = &default_floppy    },
    { .driver = "ide-drive",            .flag = &default_cdrom     },
    { .driver = "virtio-serial-pci",    .flag = &default_virtcon   },
    { .driver = "virtio-serial-s390",   .flag = &default_virtcon   },
    { .driver = "virtio-serial",        .flag = &default_virtcon   },
    { .driver = "VGA",                  .flag = &default_vga       },
    { .driver = "cirrus-vga",           .flag = &default_vga       },
    { .driver = "vmware-svga",          .flag = &default_vga       },
};

static int default_driver_check(QemuOpts *opts, void *opaque)
{
    const char *driver = qemu_opt_get(opts, "driver");
    int i;

    if (!driver)
        return 0;
    for (i = 0; i < ARRAY_SIZE(default_list); i++) {
        if (strcmp(default_list[i].driver, driver) != 0)
            continue;
        *(default_list[i].flag) = 0;
    }
    return 0;
}

/***********************************************************/

static void set_proc_name(const char *s)
{
#if defined(__linux__) && defined(PR_SET_NAME)
    char name[16];
    if (!s)
        return;
    name[sizeof(name) - 1] = 0;
    strncpy(name, s, sizeof(name));
    /* Could rewrite argv[0] too, but that's a bit more complicated.
       This simple way is enough for `top'. */
    prctl(PR_SET_NAME, name);
#endif    	
}
 
/***********************************************************/
/* real time host monotonic timer */

/* compute with 96 bit intermediate result: (a*b)/c */
uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c)
{
    union {
        uint64_t ll;
        struct {
#ifdef HOST_WORDS_BIGENDIAN
            uint32_t high, low;
#else
            uint32_t low, high;
#endif
        } l;
    } u, res;
    uint64_t rl, rh;

    u.ll = a;
    rl = (uint64_t)u.l.low * (uint64_t)b;
    rh = (uint64_t)u.l.high * (uint64_t)b;
    rh += (rl >> 32);
    res.l.high = rh / c;
    res.l.low = (((rh % c) << 32) + (rl & 0xffffffff)) / c;
    return res.ll;
}

/***********************************************************/
/* host time/date access */
void qemu_get_timedate(struct tm *tm, int offset)
{
    time_t ti;
    struct tm *ret;

    time(&ti);
    ti += offset;
    if (rtc_date_offset == -1) {
        if (rtc_utc)
            ret = gmtime(&ti);
        else
            ret = localtime(&ti);
    } else {
        ti -= rtc_date_offset;
        ret = gmtime(&ti);
    }

    memcpy(tm, ret, sizeof(struct tm));
}

int qemu_timedate_diff(struct tm *tm)
{
    time_t seconds;

    if (rtc_date_offset == -1)
        if (rtc_utc)
            seconds = mktimegm(tm);
        else
            seconds = mktime(tm);
    else
        seconds = mktimegm(tm) + rtc_date_offset;

    return seconds - time(NULL);
}

void rtc_change_mon_event(struct tm *tm)
{
    QObject *data;

    data = qobject_from_jsonf("{ 'offset': %d }", qemu_timedate_diff(tm));
    monitor_protocol_event(QEVENT_RTC_CHANGE, data);
    qobject_decref(data);
}

static void configure_rtc_date_offset(const char *startdate, int legacy)
{
    time_t rtc_start_date;
    struct tm tm;

    if (!strcmp(startdate, "now") && legacy) {
        rtc_date_offset = -1;
    } else {
        if (sscanf(startdate, "%d-%d-%dT%d:%d:%d",
                   &tm.tm_year,
                   &tm.tm_mon,
                   &tm.tm_mday,
                   &tm.tm_hour,
                   &tm.tm_min,
                   &tm.tm_sec) == 6) {
            /* OK */
        } else if (sscanf(startdate, "%d-%d-%d",
                          &tm.tm_year,
                          &tm.tm_mon,
                          &tm.tm_mday) == 3) {
            tm.tm_hour = 0;
            tm.tm_min = 0;
            tm.tm_sec = 0;
        } else {
            goto date_fail;
        }
        tm.tm_year -= 1900;
        tm.tm_mon--;
        rtc_start_date = mktimegm(&tm);
        if (rtc_start_date == -1) {
        date_fail:
            fprintf(stderr, "Invalid date format. Valid formats are:\n"
                            "'2006-06-17T16:01:21' or '2006-06-17'\n");
            exit(1);
        }
        rtc_date_offset = time(NULL) - rtc_start_date;
    }
}

static void configure_rtc(QemuOpts *opts)
{
    const char *value;

    value = qemu_opt_get(opts, "base");
    if (value) {
        if (!strcmp(value, "utc")) {
            rtc_utc = 1;
        } else if (!strcmp(value, "localtime")) {
            rtc_utc = 0;
        } else {
            configure_rtc_date_offset(value, 0);
        }
    }
    value = qemu_opt_get(opts, "clock");
    if (value) {
        if (!strcmp(value, "host")) {
            rtc_clock = host_clock;
        } else if (!strcmp(value, "vm")) {
            rtc_clock = vm_clock;
        } else {
            fprintf(stderr, "qemu: invalid option value '%s'\n", value);
            exit(1);
        }
    }
    value = qemu_opt_get(opts, "driftfix");
    if (value) {
        if (!strcmp(value, "slew")) {
            rtc_td_hack = 1;
        } else if (!strcmp(value, "none")) {
            rtc_td_hack = 0;
        } else {
            fprintf(stderr, "qemu: invalid option value '%s'\n", value);
            exit(1);
        }
    }
}

/***********************************************************/
/* Bluetooth support */
static int nb_hcis;
static int cur_hci;
static struct HCIInfo *hci_table[MAX_NICS];

static struct bt_vlan_s {
    struct bt_scatternet_s net;
    int id;
    struct bt_vlan_s *next;
} *first_bt_vlan;

/* find or alloc a new bluetooth "VLAN" */
static struct bt_scatternet_s *qemu_find_bt_vlan(int id)
{
    struct bt_vlan_s **pvlan, *vlan;
    for (vlan = first_bt_vlan; vlan != NULL; vlan = vlan->next) {
        if (vlan->id == id)
            return &vlan->net;
    }
    vlan = qemu_mallocz(sizeof(struct bt_vlan_s));
    vlan->id = id;
    pvlan = &first_bt_vlan;
    while (*pvlan != NULL)
        pvlan = &(*pvlan)->next;
    *pvlan = vlan;
    return &vlan->net;
}

static void null_hci_send(struct HCIInfo *hci, const uint8_t *data, int len)
{
}

static int null_hci_addr_set(struct HCIInfo *hci, const uint8_t *bd_addr)
{
    return -ENOTSUP;
}

static struct HCIInfo null_hci = {
    .cmd_send = null_hci_send,
    .sco_send = null_hci_send,
    .acl_send = null_hci_send,
    .bdaddr_set = null_hci_addr_set,
};

struct HCIInfo *qemu_next_hci(void)
{
    if (cur_hci == nb_hcis)
        return &null_hci;

    return hci_table[cur_hci++];
}

static struct HCIInfo *hci_init(const char *str)
{
    char *endp;
    struct bt_scatternet_s *vlan = 0;

    if (!strcmp(str, "null"))
        /* null */
        return &null_hci;
    else if (!strncmp(str, "host", 4) && (str[4] == '\0' || str[4] == ':'))
        /* host[:hciN] */
        return bt_host_hci(str[4] ? str + 5 : "hci0");
    else if (!strncmp(str, "hci", 3)) {
        /* hci[,vlan=n] */
        if (str[3]) {
            if (!strncmp(str + 3, ",vlan=", 6)) {
                vlan = qemu_find_bt_vlan(strtol(str + 9, &endp, 0));
                if (*endp)
                    vlan = 0;
            }
        } else
            vlan = qemu_find_bt_vlan(0);
        if (vlan)
           return bt_new_hci(vlan);
    }

    fprintf(stderr, "qemu: Unknown bluetooth HCI `%s'.\n", str);

    return 0;
}

static int bt_hci_parse(const char *str)
{
    struct HCIInfo *hci;
    bdaddr_t bdaddr;

    if (nb_hcis >= MAX_NICS) {
        fprintf(stderr, "qemu: Too many bluetooth HCIs (max %i).\n", MAX_NICS);
        return -1;
    }

    hci = hci_init(str);
    if (!hci)
        return -1;

    bdaddr.b[0] = 0x52;
    bdaddr.b[1] = 0x54;
    bdaddr.b[2] = 0x00;
    bdaddr.b[3] = 0x12;
    bdaddr.b[4] = 0x34;
    bdaddr.b[5] = 0x56 + nb_hcis;
    hci->bdaddr_set(hci, bdaddr.b);

    hci_table[nb_hcis++] = hci;

    return 0;
}

static void bt_vhci_add(int vlan_id)
{
    struct bt_scatternet_s *vlan = qemu_find_bt_vlan(vlan_id);

    if (!vlan->slave)
        fprintf(stderr, "qemu: warning: adding a VHCI to "
                        "an empty scatternet %i\n", vlan_id);

    bt_vhci_init(bt_new_hci(vlan));
}

static struct bt_device_s *bt_device_add(const char *opt)
{
    struct bt_scatternet_s *vlan;
    int vlan_id = 0;
    char *endp = strstr(opt, ",vlan=");
    int len = (endp ? endp - opt : strlen(opt)) + 1;
    char devname[10];

    pstrcpy(devname, MIN(sizeof(devname), len), opt);

    if (endp) {
        vlan_id = strtol(endp + 6, &endp, 0);
        if (*endp) {
            fprintf(stderr, "qemu: unrecognised bluetooth vlan Id\n");
            return 0;
        }
    }

    vlan = qemu_find_bt_vlan(vlan_id);

    if (!vlan->slave)
        fprintf(stderr, "qemu: warning: adding a slave device to "
                        "an empty scatternet %i\n", vlan_id);

    if (!strcmp(devname, "keyboard"))
        return bt_keyboard_init(vlan);

    fprintf(stderr, "qemu: unsupported bluetooth device `%s'\n", devname);
    return 0;
}

static int bt_parse(const char *opt)
{
    const char *endp, *p;
    int vlan;

    if (strstart(opt, "hci", &endp)) {
        if (!*endp || *endp == ',') {
            if (*endp)
                if (!strstart(endp, ",vlan=", 0))
                    opt = endp + 1;

            return bt_hci_parse(opt);
       }
    } else if (strstart(opt, "vhci", &endp)) {
        if (!*endp || *endp == ',') {
            if (*endp) {
                if (strstart(endp, ",vlan=", &p)) {
                    vlan = strtol(p, (char **) &endp, 0);
                    if (*endp) {
                        fprintf(stderr, "qemu: bad scatternet '%s'\n", p);
                        return 1;
                    }
                } else {
                    fprintf(stderr, "qemu: bad parameter '%s'\n", endp + 1);
                    return 1;
                }
            } else
                vlan = 0;

            bt_vhci_add(vlan);
            return 0;
        }
    } else if (strstart(opt, "device:", &endp))
        return !bt_device_add(endp);

    fprintf(stderr, "qemu: bad bluetooth parameter '%s'\n", opt);
    return 1;
}

/***********************************************************/
/* QEMU Block devices */

#define HD_ALIAS "index=%d,media=disk"
#define CDROM_ALIAS "index=2,media=cdrom"
#define FD_ALIAS "index=%d,if=floppy"
#define PFLASH_ALIAS "if=pflash"
#define MTD_ALIAS "if=mtd"
#define SD_ALIAS "index=0,if=sd"

QemuOpts *drive_add(const char *file, const char *fmt, ...)
{
    va_list ap;
    char optstr[1024];
    QemuOpts *opts;

    va_start(ap, fmt);
    vsnprintf(optstr, sizeof(optstr), fmt, ap);
    va_end(ap);

    opts = qemu_opts_parse(&qemu_drive_opts, optstr, 0);
    if (!opts) {
        return NULL;
    }
    if (file)
        qemu_opt_set(opts, "file", file);
    return opts;
}

DriveInfo *drive_get(BlockInterfaceType type, int bus, int unit)
{
    DriveInfo *dinfo;

    /* seek interface, bus and unit */

    QTAILQ_FOREACH(dinfo, &drives, next) {
        if (dinfo->type == type &&
	    dinfo->bus == bus &&
	    dinfo->unit == unit)
            return dinfo;
    }

    return NULL;
}

DriveInfo *drive_get_by_id(const char *id)
{
    DriveInfo *dinfo;

    QTAILQ_FOREACH(dinfo, &drives, next) {
        if (strcmp(id, dinfo->id))
            continue;
        return dinfo;
    }
    return NULL;
}

int drive_get_max_bus(BlockInterfaceType type)
{
    int max_bus;
    DriveInfo *dinfo;

    max_bus = -1;
    QTAILQ_FOREACH(dinfo, &drives, next) {
        if(dinfo->type == type &&
           dinfo->bus > max_bus)
            max_bus = dinfo->bus;
    }
    return max_bus;
}

const char *drive_get_serial(BlockDriverState *bdrv)
{
    DriveInfo *dinfo;

    QTAILQ_FOREACH(dinfo, &drives, next) {
        if (dinfo->bdrv == bdrv)
            return dinfo->serial;
    }

    return "\0";
}

BlockInterfaceErrorAction drive_get_on_error(
    BlockDriverState *bdrv, int is_read)
{
    DriveInfo *dinfo;

    QTAILQ_FOREACH(dinfo, &drives, next) {
        if (dinfo->bdrv == bdrv)
            return is_read ? dinfo->on_read_error : dinfo->on_write_error;
    }

    return is_read ? BLOCK_ERR_REPORT : BLOCK_ERR_STOP_ENOSPC;
}

static void bdrv_format_print(void *opaque, const char *name)
{
    fprintf(stderr, " %s", name);
}

void drive_uninit(DriveInfo *dinfo)
{
    qemu_opts_del(dinfo->opts);
    bdrv_delete(dinfo->bdrv);
    QTAILQ_REMOVE(&drives, dinfo, next);
    qemu_free(dinfo);
}

static int parse_block_error_action(const char *buf, int is_read)
{
    if (!strcmp(buf, "ignore")) {
        return BLOCK_ERR_IGNORE;
    } else if (!is_read && !strcmp(buf, "enospc")) {
        return BLOCK_ERR_STOP_ENOSPC;
    } else if (!strcmp(buf, "stop")) {
        return BLOCK_ERR_STOP_ANY;
    } else if (!strcmp(buf, "report")) {
        return BLOCK_ERR_REPORT;
    } else {
        fprintf(stderr, "qemu: '%s' invalid %s error action\n",
            buf, is_read ? "read" : "write");
        return -1;
    }
}

DriveInfo *drive_init(QemuOpts *opts, void *opaque,
                      int *fatal_error)
{
    const char *buf;
    const char *file = NULL;
    char devname[128];
    const char *serial;
    const char *mediastr = "";
    BlockInterfaceType type;
    enum { MEDIA_DISK, MEDIA_CDROM } media;
    int bus_id, unit_id;
    int cyls, heads, secs, translation;
    BlockDriver *drv = NULL;
    QEMUMachine *machine = opaque;
    int max_devs;
    int index;
    int ro = 0;
    int bdrv_flags = 0;
    int on_read_error, on_write_error;
    const char *devaddr;
    DriveInfo *dinfo;
    int snapshot = 0;

    *fatal_error = 1;

    translation = BIOS_ATA_TRANSLATION_AUTO;

    if (machine && machine->use_scsi) {
        type = IF_SCSI;
        max_devs = MAX_SCSI_DEVS;
        pstrcpy(devname, sizeof(devname), "scsi");
    } else {
        type = IF_IDE;
        max_devs = MAX_IDE_DEVS;
        pstrcpy(devname, sizeof(devname), "ide");
    }
    media = MEDIA_DISK;

    /* extract parameters */
    bus_id  = qemu_opt_get_number(opts, "bus", 0);
    unit_id = qemu_opt_get_number(opts, "unit", -1);
    index   = qemu_opt_get_number(opts, "index", -1);

    cyls  = qemu_opt_get_number(opts, "cyls", 0);
    heads = qemu_opt_get_number(opts, "heads", 0);
    secs  = qemu_opt_get_number(opts, "secs", 0);

    snapshot = qemu_opt_get_bool(opts, "snapshot", 0);
    ro = qemu_opt_get_bool(opts, "readonly", 0);

    file = qemu_opt_get(opts, "file");
    serial = qemu_opt_get(opts, "serial");

    if ((buf = qemu_opt_get(opts, "if")) != NULL) {
        pstrcpy(devname, sizeof(devname), buf);
        if (!strcmp(buf, "ide")) {
	    type = IF_IDE;
            max_devs = MAX_IDE_DEVS;
        } else if (!strcmp(buf, "scsi")) {
	    type = IF_SCSI;
            max_devs = MAX_SCSI_DEVS;
        } else if (!strcmp(buf, "floppy")) {
	    type = IF_FLOPPY;
            max_devs = 0;
        } else if (!strcmp(buf, "pflash")) {
	    type = IF_PFLASH;
            max_devs = 0;
	} else if (!strcmp(buf, "mtd")) {
	    type = IF_MTD;
            max_devs = 0;
	} else if (!strcmp(buf, "sd")) {
	    type = IF_SD;
            max_devs = 0;
        } else if (!strcmp(buf, "virtio")) {
            type = IF_VIRTIO;
            max_devs = 0;
	} else if (!strcmp(buf, "xen")) {
	    type = IF_XEN;
            max_devs = 0;
	} else if (!strcmp(buf, "none")) {
	    type = IF_NONE;
            max_devs = 0;
	} else {
            fprintf(stderr, "qemu: unsupported bus type '%s'\n", buf);
            return NULL;
	}
    }

    if (cyls || heads || secs) {
        if (cyls < 1 || (type == IF_IDE && cyls > 16383)) {
            fprintf(stderr, "qemu: '%s' invalid physical cyls number\n", buf);
	    return NULL;
	}
        if (heads < 1 || (type == IF_IDE && heads > 16)) {
            fprintf(stderr, "qemu: '%s' invalid physical heads number\n", buf);
	    return NULL;
	}
        if (secs < 1 || (type == IF_IDE && secs > 63)) {
            fprintf(stderr, "qemu: '%s' invalid physical secs number\n", buf);
	    return NULL;
	}
    }

    if ((buf = qemu_opt_get(opts, "trans")) != NULL) {
        if (!cyls) {
            fprintf(stderr,
                    "qemu: '%s' trans must be used with cyls,heads and secs\n",
                    buf);
            return NULL;
        }
        if (!strcmp(buf, "none"))
            translation = BIOS_ATA_TRANSLATION_NONE;
        else if (!strcmp(buf, "lba"))
            translation = BIOS_ATA_TRANSLATION_LBA;
        else if (!strcmp(buf, "auto"))
            translation = BIOS_ATA_TRANSLATION_AUTO;
	else {
            fprintf(stderr, "qemu: '%s' invalid translation type\n", buf);
	    return NULL;
	}
    }

    if ((buf = qemu_opt_get(opts, "media")) != NULL) {
        if (!strcmp(buf, "disk")) {
	    media = MEDIA_DISK;
	} else if (!strcmp(buf, "cdrom")) {
            if (cyls || secs || heads) {
                fprintf(stderr,
                        "qemu: '%s' invalid physical CHS format\n", buf);
	        return NULL;
            }
	    media = MEDIA_CDROM;
	} else {
	    fprintf(stderr, "qemu: '%s' invalid media\n", buf);
	    return NULL;
	}
    }

    if ((buf = qemu_opt_get(opts, "cache")) != NULL) {
        if (!strcmp(buf, "off") || !strcmp(buf, "none")) {
            bdrv_flags |= BDRV_O_NOCACHE;
        } else if (!strcmp(buf, "writeback")) {
            bdrv_flags |= BDRV_O_CACHE_WB;
        } else if (!strcmp(buf, "writethrough")) {
            /* this is the default */
        } else {
           fprintf(stderr, "qemu: invalid cache option\n");
           return NULL;
        }
    }

#ifdef CONFIG_LINUX_AIO
    if ((buf = qemu_opt_get(opts, "aio")) != NULL) {
        if (!strcmp(buf, "native")) {
            bdrv_flags |= BDRV_O_NATIVE_AIO;
        } else if (!strcmp(buf, "threads")) {
            /* this is the default */
        } else {
           fprintf(stderr, "qemu: invalid aio option\n");
           return NULL;
        }
    }
#endif

    if ((buf = qemu_opt_get(opts, "format")) != NULL) {
       if (strcmp(buf, "?") == 0) {
            fprintf(stderr, "qemu: Supported formats:");
            bdrv_iterate_format(bdrv_format_print, NULL);
            fprintf(stderr, "\n");
	    return NULL;
        }
        drv = bdrv_find_whitelisted_format(buf);
        if (!drv) {
            fprintf(stderr, "qemu: '%s' invalid format\n", buf);
            return NULL;
        }
    }

    on_write_error = BLOCK_ERR_STOP_ENOSPC;
    if ((buf = qemu_opt_get(opts, "werror")) != NULL) {
        if (type != IF_IDE && type != IF_SCSI && type != IF_VIRTIO) {
            fprintf(stderr, "werror is no supported by this format\n");
            return NULL;
        }

        on_write_error = parse_block_error_action(buf, 0);
        if (on_write_error < 0) {
            return NULL;
        }
    }

    on_read_error = BLOCK_ERR_REPORT;
    if ((buf = qemu_opt_get(opts, "rerror")) != NULL) {
        if (type != IF_IDE && type != IF_VIRTIO) {
            fprintf(stderr, "rerror is no supported by this format\n");
            return NULL;
        }

        on_read_error = parse_block_error_action(buf, 1);
        if (on_read_error < 0) {
            return NULL;
        }
    }

    if ((devaddr = qemu_opt_get(opts, "addr")) != NULL) {
        if (type != IF_VIRTIO) {
            fprintf(stderr, "addr is not supported\n");
            return NULL;
        }
    }

    /* compute bus and unit according index */

    if (index != -1) {
        if (bus_id != 0 || unit_id != -1) {
            fprintf(stderr,
                    "qemu: index cannot be used with bus and unit\n");
            return NULL;
        }
        if (max_devs == 0)
        {
            unit_id = index;
            bus_id = 0;
        } else {
            unit_id = index % max_devs;
            bus_id = index / max_devs;
        }
    }

    /* if user doesn't specify a unit_id,
     * try to find the first free
     */

    if (unit_id == -1) {
       unit_id = 0;
       while (drive_get(type, bus_id, unit_id) != NULL) {
           unit_id++;
           if (max_devs && unit_id >= max_devs) {
               unit_id -= max_devs;
               bus_id++;
           }
       }
    }

    /* check unit id */

    if (max_devs && unit_id >= max_devs) {
        fprintf(stderr, "qemu: unit %d too big (max is %d)\n",
                unit_id, max_devs - 1);
        return NULL;
    }

    /*
     * ignore multiple definitions
     */

    if (drive_get(type, bus_id, unit_id) != NULL) {
        *fatal_error = 0;
        return NULL;
    }

    /* init */

    dinfo = qemu_mallocz(sizeof(*dinfo));
    if ((buf = qemu_opts_id(opts)) != NULL) {
        dinfo->id = qemu_strdup(buf);
    } else {
        /* no id supplied -> create one */
        dinfo->id = qemu_mallocz(32);
        if (type == IF_IDE || type == IF_SCSI)
            mediastr = (media == MEDIA_CDROM) ? "-cd" : "-hd";
        if (max_devs)
            snprintf(dinfo->id, 32, "%s%i%s%i",
                     devname, bus_id, mediastr, unit_id);
        else
            snprintf(dinfo->id, 32, "%s%s%i",
                     devname, mediastr, unit_id);
    }
    dinfo->bdrv = bdrv_new(dinfo->id);
    dinfo->devaddr = devaddr;
    dinfo->type = type;
    dinfo->bus = bus_id;
    dinfo->unit = unit_id;
    dinfo->on_read_error = on_read_error;
    dinfo->on_write_error = on_write_error;
    dinfo->opts = opts;
    if (serial)
        strncpy(dinfo->serial, serial, sizeof(serial));
    QTAILQ_INSERT_TAIL(&drives, dinfo, next);

    switch(type) {
    case IF_IDE:
    case IF_SCSI:
    case IF_XEN:
    case IF_NONE:
        switch(media) {
	case MEDIA_DISK:
            if (cyls != 0) {
                bdrv_set_geometry_hint(dinfo->bdrv, cyls, heads, secs);
                bdrv_set_translation_hint(dinfo->bdrv, translation);
            }
	    break;
	case MEDIA_CDROM:
            bdrv_set_type_hint(dinfo->bdrv, BDRV_TYPE_CDROM);
	    break;
	}
        break;
    case IF_SD:
        /* FIXME: This isn't really a floppy, but it's a reasonable
           approximation.  */
    case IF_FLOPPY:
        bdrv_set_type_hint(dinfo->bdrv, BDRV_TYPE_FLOPPY);
        break;
    case IF_PFLASH:
    case IF_MTD:
        break;
    case IF_VIRTIO:
        /* add virtio block device */
        opts = qemu_opts_create(&qemu_device_opts, NULL, 0);
        qemu_opt_set(opts, "driver", "virtio-blk-pci");
        qemu_opt_set(opts, "drive", dinfo->id);
        if (devaddr)
            qemu_opt_set(opts, "addr", devaddr);
        break;
    case IF_COUNT:
        abort();
    }
    if (!file) {
        *fatal_error = 0;
        return NULL;
    }
    if (snapshot) {
        /* always use write-back with snapshot */
        bdrv_flags &= ~BDRV_O_CACHE_MASK;
        bdrv_flags |= (BDRV_O_SNAPSHOT|BDRV_O_CACHE_WB);
    }

    if (media == MEDIA_CDROM) {
        /* CDROM is fine for any interface, don't check.  */
        ro = 1;
    } else if (ro == 1) {
        if (type != IF_SCSI && type != IF_VIRTIO && type != IF_FLOPPY) {
            fprintf(stderr, "qemu: readonly flag not supported for drive with this interface\n");
            return NULL;
        }
    }

    bdrv_flags |= ro ? 0 : BDRV_O_RDWR;

    if (bdrv_open(dinfo->bdrv, file, bdrv_flags, drv) < 0) {
        fprintf(stderr, "qemu: could not open disk image %s: %s\n",
                        file, strerror(errno));
        return NULL;
    }

    if (bdrv_key_required(dinfo->bdrv))
        autostart = 0;
    *fatal_error = 0;
    return dinfo;
}

static int drive_init_func(QemuOpts *opts, void *opaque)
{
    QEMUMachine *machine = opaque;
    int fatal_error = 0;

    if (drive_init(opts, machine, &fatal_error) == NULL) {
        if (fatal_error)
            return 1;
    }
    return 0;
}

static int drive_enable_snapshot(QemuOpts *opts, void *opaque)
{
    if (NULL == qemu_opt_get(opts, "snapshot")) {
        qemu_opt_set(opts, "snapshot", "on");
    }
    return 0;
}

void qemu_register_boot_set(QEMUBootSetHandler *func, void *opaque)
{
    boot_set_handler = func;
    boot_set_opaque = opaque;
}

int qemu_boot_set(const char *boot_devices)
{
    if (!boot_set_handler) {
        return -EINVAL;
    }
    return boot_set_handler(boot_set_opaque, boot_devices);
}

static void validate_bootdevices(char *devices)
{
    /* We just do some generic consistency checks */
    const char *p;
    int bitmap = 0;

    for (p = devices; *p != '\0'; p++) {
        /* Allowed boot devices are:
         * a-b: floppy disk drives
         * c-f: IDE disk drives
         * g-m: machine implementation dependant drives
         * n-p: network devices
         * It's up to each machine implementation to check if the given boot
         * devices match the actual hardware implementation and firmware
         * features.
         */
        if (*p < 'a' || *p > 'p') {
            fprintf(stderr, "Invalid boot device '%c'\n", *p);
            exit(1);
        }
        if (bitmap & (1 << (*p - 'a'))) {
            fprintf(stderr, "Boot device '%c' was given twice\n", *p);
            exit(1);
        }
        bitmap |= 1 << (*p - 'a');
    }
}

static void restore_boot_devices(void *opaque)
{
    char *standard_boot_devices = opaque;
    static int first = 1;

    /* Restore boot order and remove ourselves after the first boot */
    if (first) {
        first = 0;
        return;
    }

    qemu_boot_set(standard_boot_devices);

    qemu_unregister_reset(restore_boot_devices, standard_boot_devices);
    qemu_free(standard_boot_devices);
}

static void numa_add(const char *optarg)
{
    char option[128];
    char *endptr;
    unsigned long long value, endvalue;
    int nodenr;

    optarg = get_opt_name(option, 128, optarg, ',') + 1;
    if (!strcmp(option, "node")) {
        if (get_param_value(option, 128, "nodeid", optarg) == 0) {
            nodenr = nb_numa_nodes;
        } else {
            nodenr = strtoull(option, NULL, 10);
        }

        if (get_param_value(option, 128, "mem", optarg) == 0) {
            node_mem[nodenr] = 0;
        } else {
            value = strtoull(option, &endptr, 0);
            switch (*endptr) {
            case 0: case 'M': case 'm':
                value <<= 20;
                break;
            case 'G': case 'g':
                value <<= 30;
                break;
            }
            node_mem[nodenr] = value;
        }
        if (get_param_value(option, 128, "cpus", optarg) == 0) {
            node_cpumask[nodenr] = 0;
        } else {
            value = strtoull(option, &endptr, 10);
            if (value >= 64) {
                value = 63;
                fprintf(stderr, "only 64 CPUs in NUMA mode supported.\n");
            } else {
                if (*endptr == '-') {
                    endvalue = strtoull(endptr+1, &endptr, 10);
                    if (endvalue >= 63) {
                        endvalue = 62;
                        fprintf(stderr,
                            "only 63 CPUs in NUMA mode supported.\n");
                    }
                    value = (2ULL << endvalue) - (1ULL << value);
                } else {
                    value = 1ULL << value;
                }
            }
            node_cpumask[nodenr] = value;
        }
        nb_numa_nodes++;
    }
    return;
}

static void smp_parse(const char *optarg)
{
    int smp, sockets = 0, threads = 0, cores = 0;
    char *endptr;
    char option[128];

    smp = strtoul(optarg, &endptr, 10);
    if (endptr != optarg) {
        if (*endptr == ',') {
            endptr++;
        }
    }
    if (get_param_value(option, 128, "sockets", endptr) != 0)
        sockets = strtoull(option, NULL, 10);
    if (get_param_value(option, 128, "cores", endptr) != 0)
        cores = strtoull(option, NULL, 10);
    if (get_param_value(option, 128, "threads", endptr) != 0)
        threads = strtoull(option, NULL, 10);
    if (get_param_value(option, 128, "maxcpus", endptr) != 0)
        max_cpus = strtoull(option, NULL, 10);

    /* compute missing values, prefer sockets over cores over threads */
    if (smp == 0 || sockets == 0) {
        sockets = sockets > 0 ? sockets : 1;
        cores = cores > 0 ? cores : 1;
        threads = threads > 0 ? threads : 1;
        if (smp == 0) {
            smp = cores * threads * sockets;
        }
    } else {
        if (cores == 0) {
            threads = threads > 0 ? threads : 1;
            cores = smp / (sockets * threads);
        } else {
            if (sockets) {
                threads = smp / (cores * sockets);
            }
        }
    }
    smp_cpus = smp;
    smp_cores = cores > 0 ? cores : 1;
    smp_threads = threads > 0 ? threads : 1;
    if (max_cpus == 0)
        max_cpus = smp_cpus;
}

/***********************************************************/
/* USB devices */

static int usb_device_add(const char *devname, int is_hotplug)
{
    const char *p;
    USBDevice *dev = NULL;

    if (!usb_enabled)
        return -1;

    /* drivers with .usbdevice_name entry in USBDeviceInfo */
    dev = usbdevice_create(devname);
    if (dev)
        goto done;

    /* the other ones */
    if (strstart(devname, "host:", &p)) {
        dev = usb_host_device_open(p);
    } else if (!strcmp(devname, "bt") || strstart(devname, "bt:", &p)) {
        dev = usb_bt_init(devname[2] ? hci_init(p) :
                        bt_new_hci(qemu_find_bt_vlan(0)));
    } else {
        return -1;
    }
    if (!dev)
        return -1;

done:
    return 0;
}

static int usb_device_del(const char *devname)
{
    int bus_num, addr;
    const char *p;

    if (strstart(devname, "host:", &p))
        return usb_host_device_close(p);

    if (!usb_enabled)
        return -1;

    p = strchr(devname, '.');
    if (!p)
        return -1;
    bus_num = strtoul(devname, NULL, 0);
    addr = strtoul(p + 1, NULL, 0);

    return usb_device_delete_addr(bus_num, addr);
}

static int usb_parse(const char *cmdline)
{
    int r;
    r = usb_device_add(cmdline, 0);
    if (r < 0) {
        fprintf(stderr, "qemu: could not add USB device '%s'\n", cmdline);
    }
    return r;
}

void do_usb_add(Monitor *mon, const QDict *qdict)
{
    const char *devname = qdict_get_str(qdict, "devname");
    if (usb_device_add(devname, 1) < 0) {
        error_report("could not add USB device '%s'", devname);
    }
}

void do_usb_del(Monitor *mon, const QDict *qdict)
{
    const char *devname = qdict_get_str(qdict, "devname");
    if (usb_device_del(devname) < 0) {
        error_report("could not delete USB device '%s'", devname);
    }
}

/***********************************************************/
/* PCMCIA/Cardbus */

static struct pcmcia_socket_entry_s {
    PCMCIASocket *socket;
    struct pcmcia_socket_entry_s *next;
} *pcmcia_sockets = 0;

void pcmcia_socket_register(PCMCIASocket *socket)
{
    struct pcmcia_socket_entry_s *entry;

    entry = qemu_malloc(sizeof(struct pcmcia_socket_entry_s));
    entry->socket = socket;
    entry->next = pcmcia_sockets;
    pcmcia_sockets = entry;
}

void pcmcia_socket_unregister(PCMCIASocket *socket)
{
    struct pcmcia_socket_entry_s *entry, **ptr;

    ptr = &pcmcia_sockets;
    for (entry = *ptr; entry; ptr = &entry->next, entry = *ptr)
        if (entry->socket == socket) {
            *ptr = entry->next;
            qemu_free(entry);
        }
}

void pcmcia_info(Monitor *mon)
{
    struct pcmcia_socket_entry_s *iter;

    if (!pcmcia_sockets)
        monitor_printf(mon, "No PCMCIA sockets\n");

    for (iter = pcmcia_sockets; iter; iter = iter->next)
        monitor_printf(mon, "%s: %s\n", iter->socket->slot_string,
                       iter->socket->attached ? iter->socket->card_string :
                       "Empty");
}

/***********************************************************/
/* I/O handling */

typedef struct IOHandlerRecord {
    int fd;
    IOCanReadHandler *fd_read_poll;
    IOHandler *fd_read;
    IOHandler *fd_write;
    int deleted;
    void *opaque;
    /* temporary data */
    struct pollfd *ufd;
    QLIST_ENTRY(IOHandlerRecord) next;
} IOHandlerRecord;

static QLIST_HEAD(, IOHandlerRecord) io_handlers =
    QLIST_HEAD_INITIALIZER(io_handlers);


/* XXX: fd_read_poll should be suppressed, but an API change is
   necessary in the character devices to suppress fd_can_read(). */
int qemu_set_fd_handler2(int fd,
                         IOCanReadHandler *fd_read_poll,
                         IOHandler *fd_read,
                         IOHandler *fd_write,
                         void *opaque)
{
    IOHandlerRecord *ioh;

    if (!fd_read && !fd_write) {
        QLIST_FOREACH(ioh, &io_handlers, next) {
            if (ioh->fd == fd) {
                ioh->deleted = 1;
                break;
            }
        }
    } else {
        QLIST_FOREACH(ioh, &io_handlers, next) {
            if (ioh->fd == fd)
                goto found;
        }
        ioh = qemu_mallocz(sizeof(IOHandlerRecord));
        QLIST_INSERT_HEAD(&io_handlers, ioh, next);
    found:
        ioh->fd = fd;
        ioh->fd_read_poll = fd_read_poll;
        ioh->fd_read = fd_read;
        ioh->fd_write = fd_write;
        ioh->opaque = opaque;
        ioh->deleted = 0;
    }
    return 0;
}

int qemu_set_fd_handler(int fd,
                        IOHandler *fd_read,
                        IOHandler *fd_write,
                        void *opaque)
{
    return qemu_set_fd_handler2(fd, NULL, fd_read, fd_write, opaque);
}

#ifdef _WIN32
/***********************************************************/
/* Polling handling */

typedef struct PollingEntry {
    PollingFunc *func;
    void *opaque;
    struct PollingEntry *next;
} PollingEntry;

static PollingEntry *first_polling_entry;

int qemu_add_polling_cb(PollingFunc *func, void *opaque)
{
    PollingEntry **ppe, *pe;
    pe = qemu_mallocz(sizeof(PollingEntry));
    pe->func = func;
    pe->opaque = opaque;
    for(ppe = &first_polling_entry; *ppe != NULL; ppe = &(*ppe)->next);
    *ppe = pe;
    return 0;
}

void qemu_del_polling_cb(PollingFunc *func, void *opaque)
{
    PollingEntry **ppe, *pe;
    for(ppe = &first_polling_entry; *ppe != NULL; ppe = &(*ppe)->next) {
        pe = *ppe;
        if (pe->func == func && pe->opaque == opaque) {
            *ppe = pe->next;
            qemu_free(pe);
            break;
        }
    }
}

/***********************************************************/
/* Wait objects support */
typedef struct WaitObjects {
    int num;
    HANDLE events[MAXIMUM_WAIT_OBJECTS + 1];
    WaitObjectFunc *func[MAXIMUM_WAIT_OBJECTS + 1];
    void *opaque[MAXIMUM_WAIT_OBJECTS + 1];
} WaitObjects;

static WaitObjects wait_objects = {0};

int qemu_add_wait_object(HANDLE handle, WaitObjectFunc *func, void *opaque)
{
    WaitObjects *w = &wait_objects;

    if (w->num >= MAXIMUM_WAIT_OBJECTS)
        return -1;
    w->events[w->num] = handle;
    w->func[w->num] = func;
    w->opaque[w->num] = opaque;
    w->num++;
    return 0;
}

void qemu_del_wait_object(HANDLE handle, WaitObjectFunc *func, void *opaque)
{
    int i, found;
    WaitObjects *w = &wait_objects;

    found = 0;
    for (i = 0; i < w->num; i++) {
        if (w->events[i] == handle)
            found = 1;
        if (found) {
            w->events[i] = w->events[i + 1];
            w->func[i] = w->func[i + 1];
            w->opaque[i] = w->opaque[i + 1];
        }
    }
    if (found)
        w->num--;
}
#endif

/***********************************************************/
/* machine registration */

static QEMUMachine *first_machine = NULL;
QEMUMachine *current_machine = NULL;

int qemu_register_machine(QEMUMachine *m)
{
    QEMUMachine **pm;
    pm = &first_machine;
    while (*pm != NULL)
        pm = &(*pm)->next;
    m->next = NULL;
    *pm = m;
    return 0;
}

static QEMUMachine *find_machine(const char *name)
{
    QEMUMachine *m;

    for(m = first_machine; m != NULL; m = m->next) {
        if (!strcmp(m->name, name))
            return m;
        if (m->alias && !strcmp(m->alias, name))
            return m;
    }
    return NULL;
}

static QEMUMachine *find_default_machine(void)
{
    QEMUMachine *m;

    for(m = first_machine; m != NULL; m = m->next) {
        if (m->is_default) {
            return m;
        }
    }
    return NULL;
}

/***********************************************************/
/* main execution loop */

static void gui_update(void *opaque)
{
    uint64_t interval = GUI_REFRESH_INTERVAL;
    DisplayState *ds = opaque;
    DisplayChangeListener *dcl = ds->listeners;

    qemu_flush_coalesced_mmio_buffer();
    dpy_refresh(ds);

    while (dcl != NULL) {
        if (dcl->gui_timer_interval &&
            dcl->gui_timer_interval < interval)
            interval = dcl->gui_timer_interval;
        dcl = dcl->next;
    }
    qemu_mod_timer(ds->gui_timer, interval + qemu_get_clock(rt_clock));
}

static void nographic_update(void *opaque)
{
    uint64_t interval = GUI_REFRESH_INTERVAL;

    qemu_flush_coalesced_mmio_buffer();
    qemu_mod_timer(nographic_timer, interval + qemu_get_clock(rt_clock));
}

struct vm_change_state_entry {
    VMChangeStateHandler *cb;
    void *opaque;
    QLIST_ENTRY (vm_change_state_entry) entries;
};

static QLIST_HEAD(vm_change_state_head, vm_change_state_entry) vm_change_state_head;

VMChangeStateEntry *qemu_add_vm_change_state_handler(VMChangeStateHandler *cb,
                                                     void *opaque)
{
    VMChangeStateEntry *e;

    e = qemu_mallocz(sizeof (*e));

    e->cb = cb;
    e->opaque = opaque;
    QLIST_INSERT_HEAD(&vm_change_state_head, e, entries);
    return e;
}

void qemu_del_vm_change_state_handler(VMChangeStateEntry *e)
{
    QLIST_REMOVE (e, entries);
    qemu_free (e);
}

void vm_state_notify(int running, int reason)
{
    VMChangeStateEntry *e;

    for (e = vm_change_state_head.lh_first; e; e = e->entries.le_next) {
        e->cb(e->opaque, running, reason);
    }
}

void vm_start(void)
{
    if (!vm_running) {
        cpu_enable_ticks();
        vm_running = 1;
        vm_state_notify(1, 0);
        resume_all_vcpus();
        monitor_protocol_event(QEVENT_RESUME, NULL);
    }
}

/* reset/shutdown handler */

typedef struct QEMUResetEntry {
    QTAILQ_ENTRY(QEMUResetEntry) entry;
    QEMUResetHandler *func;
    void *opaque;
} QEMUResetEntry;

static QTAILQ_HEAD(reset_handlers, QEMUResetEntry) reset_handlers =
    QTAILQ_HEAD_INITIALIZER(reset_handlers);
static int reset_requested;
static int shutdown_requested;
static int powerdown_requested;
int debug_requested;
int vmstop_requested;
static int exit_requested;

#ifdef CONFIG_COREMU
int test_reset_request(void)
{
	return reset_requested;
}
#endif

int qemu_shutdown_requested(void)
{
    int r = shutdown_requested;
    shutdown_requested = 0;
    return r;
}

int qemu_reset_requested(void)
{
    int r = reset_requested;
    reset_requested = 0;
    return r;
}

int qemu_powerdown_requested(void)
{
    int r = powerdown_requested;
    powerdown_requested = 0;
    return r;
}

int qemu_exit_requested(void)
{
    /* just return it, we'll exit() anyway */
    return exit_requested;
}

static int qemu_debug_requested(void)
{
    int r = debug_requested;
    debug_requested = 0;
    return r;
}

static int qemu_vmstop_requested(void)
{
    int r = vmstop_requested;
    vmstop_requested = 0;
    return r;
}

void qemu_register_reset(QEMUResetHandler *func, void *opaque)
{
    QEMUResetEntry *re = qemu_mallocz(sizeof(QEMUResetEntry));

    re->func = func;
    re->opaque = opaque;
    QTAILQ_INSERT_TAIL(&reset_handlers, re, entry);
}

void qemu_unregister_reset(QEMUResetHandler *func, void *opaque)
{
    QEMUResetEntry *re;

    QTAILQ_FOREACH(re, &reset_handlers, entry) {
        if (re->func == func && re->opaque == opaque) {
            QTAILQ_REMOVE(&reset_handlers, re, entry);
            qemu_free(re);
            return;
        }
    }
}

void qemu_system_reset(void)
{
    QEMUResetEntry *re, *nre;

    /* reset all devices */
    QTAILQ_FOREACH_SAFE(re, &reset_handlers, entry, nre) {
        re->func(re->opaque);
    }
    monitor_protocol_event(QEVENT_RESET, NULL);
    cpu_synchronize_all_post_reset();
}

void qemu_system_reset_request(void)
{
    if (no_reboot) {
        shutdown_requested = 1;
    } else {
        reset_requested = 1;
    }
    qemu_notify_event();
}

void qemu_system_shutdown_request(void)
{
    shutdown_requested = 1;
    qemu_notify_event();
}

void qemu_system_powerdown_request(void)
{
    powerdown_requested = 1;
    qemu_notify_event();
}

void qemu_system_exit_request(void)
{
    exit_requested = 1;
    qemu_notify_event();
}

#ifdef _WIN32
static void host_main_loop_wait(int *timeout)
{
    int ret, ret2, i;
    PollingEntry *pe;


    /* XXX: need to suppress polling by better using win32 events */
    ret = 0;
    for(pe = first_polling_entry; pe != NULL; pe = pe->next) {
        ret |= pe->func(pe->opaque);
    }
    if (ret == 0) {
        int err;
        WaitObjects *w = &wait_objects;

        ret = WaitForMultipleObjects(w->num, w->events, FALSE, *timeout);
        if (WAIT_OBJECT_0 + 0 <= ret && ret <= WAIT_OBJECT_0 + w->num - 1) {
            if (w->func[ret - WAIT_OBJECT_0])
                w->func[ret - WAIT_OBJECT_0](w->opaque[ret - WAIT_OBJECT_0]);

            /* Check for additional signaled events */
            for(i = (ret - WAIT_OBJECT_0 + 1); i < w->num; i++) {

                /* Check if event is signaled */
                ret2 = WaitForSingleObject(w->events[i], 0);
                if(ret2 == WAIT_OBJECT_0) {
                    if (w->func[i])
                        w->func[i](w->opaque[i]);
                } else if (ret2 == WAIT_TIMEOUT) {
                } else {
                    err = GetLastError();
                    fprintf(stderr, "WaitForSingleObject error %d %d\n", i, err);
                }
            }
        } else if (ret == WAIT_TIMEOUT) {
        } else {
            err = GetLastError();
            fprintf(stderr, "WaitForMultipleObjects error %d %d\n", ret, err);
        }
    }

    *timeout = 0;
}
#else
static void host_main_loop_wait(int *timeout)
{
}
#endif

void main_loop_wait(int nonblocking)
{
    IOHandlerRecord *ioh;
    fd_set rfds, wfds, xfds;
    int ret, nfds;
    struct timeval tv;
    int timeout;

    if (nonblocking)
        timeout = 0;
    else {
#ifdef CONFIG_COREMU
        timeout = 1000;
#else
        timeout = qemu_calculate_timeout();
        qemu_bh_update_timeout(&timeout);
#endif
    }

    host_main_loop_wait(&timeout);

    /* poll any events */
    /* XXX: separate device handlers from system ones */
    nfds = -1;
    FD_ZERO(&rfds);
    FD_ZERO(&wfds);
    FD_ZERO(&xfds);
    QLIST_FOREACH(ioh, &io_handlers, next) {
        if (ioh->deleted)
            continue;
        if (ioh->fd_read &&
            (!ioh->fd_read_poll ||
             ioh->fd_read_poll(ioh->opaque) != 0)) {
            FD_SET(ioh->fd, &rfds);
            if (ioh->fd > nfds)
                nfds = ioh->fd;
        }
        if (ioh->fd_write) {
            FD_SET(ioh->fd, &wfds);
            if (ioh->fd > nfds)
                nfds = ioh->fd;
        }
    }

    tv.tv_sec = timeout / 1000;
    tv.tv_usec = (timeout % 1000) * 1000;

    slirp_select_fill(&nfds, &rfds, &wfds, &xfds);

    qemu_mutex_unlock_iothread();
    ret = select(nfds + 1, &rfds, &wfds, &xfds, &tv);
    qemu_mutex_lock_iothread();
    if (ret > 0) {
        IOHandlerRecord *pioh;

        QLIST_FOREACH_SAFE(ioh, &io_handlers, next, pioh) {
            if (ioh->deleted) {
                QLIST_REMOVE(ioh, next);
                qemu_free(ioh);
                continue;
            }
            if (ioh->fd_read && FD_ISSET(ioh->fd, &rfds)) {
                ioh->fd_read(ioh->opaque);
            }
            if (ioh->fd_write && FD_ISSET(ioh->fd, &wfds)) {
                ioh->fd_write(ioh->opaque);
            }
        }
    }

    slirp_select_poll(&rfds, &wfds, &xfds, (ret < 0));

    qemu_run_all_timers();

    /* Check bottom-halves last in case any of the earlier events triggered
       them.  */
    qemu_bh_poll();

}

static int vm_can_run(void)
{
    if (powerdown_requested)
        return 0;
    if (reset_requested)
        return 0;
    if (shutdown_requested)
        return 0;
    if (debug_requested)
        return 0;
    if (exit_requested)
        return 0;
    return 1;
}

qemu_irq qemu_system_powerdown;

static void main_loop(void)
{
    int r;
#ifdef CONFIG_COREMU
    /* 1. Not finish: need some initialization */

    /* 2. register hook functions */
    /* register the interrupt handler */
    coremu_register_event_handler((void (*)(void*))cm_common_intr_handler);
    /* register the event notifier */
    coremu_register_event_notifier(cm_notify_event);

    /* 3. register core alarm handler. */
    struct sigaction act;
    sigfillset(&act.sa_mask);
    act.sa_flags = 0;
    extern void cm_local_host_alarm_handler(int host_signum);
    act.sa_handler = cm_local_host_alarm_handler;
    sigaction(COREMU_CORE_ALARM, &act, NULL);

    /* 4. Create cpu thread body*/
    coremu_run_all_cores(cm_cpu_loop);
#else
    qemu_main_loop_start();
#endif

    for (;;) {
        do {
            bool nonblocking = false;
#ifdef CONFIG_PROFILER
            int64_t ti;
#endif
#ifndef CONFIG_COREMU
#ifndef CONFIG_IOTHREAD
            nonblocking = tcg_cpu_exec();
#endif
#endif
#ifdef CONFIG_PROFILER
            ti = profile_getclock();
#endif
            main_loop_wait(nonblocking);
#ifdef CONFIG_PROFILER
            dev_time += profile_getclock() - ti;
#endif
        } while (vm_can_run());

        if ((r = qemu_debug_requested())) {
            vm_stop(r);
        }
        if (qemu_shutdown_requested()) {
            monitor_protocol_event(QEVENT_SHUTDOWN, NULL);
            if (no_shutdown) {
                vm_stop(0);
                no_shutdown = 0;
            } else
                break;
        }
#ifndef CONFIG_COREMU
        if (qemu_reset_requested()) {
            pause_all_vcpus();
            qemu_system_reset();
            resume_all_vcpus();
        }
        if (qemu_powerdown_requested()) {
            monitor_protocol_event(QEVENT_POWERDOWN, NULL);
            qemu_irq_raise(qemu_system_powerdown);
        }
#else
        if (reset_requested) {
            coremu_wait_all_cores_pause();
            qemu_system_reset();
            reset_requested=0;
            coremu_restart_all_cores();
        }
        if (qemu_powerdown_requested()) {
            monitor_protocol_event(QEVENT_POWERDOWN, NULL);
            exit(0);
        }
#endif
        if ((r = qemu_vmstop_requested())) {
            vm_stop(r);
        }
        if (qemu_exit_requested()) {
            exit(0);
        }
    }
    pause_all_vcpus();
}

static void version(void)
{
    printf("QEMU emulator version " QEMU_VERSION QEMU_PKGVERSION ", Copyright (c) 2003-2008 Fabrice Bellard\n");
}

static void help(int exitcode)
{
    const char *options_help =
#define DEF(option, opt_arg, opt_enum, opt_help, arch_mask)     \
        opt_help
#define DEFHEADING(text) stringify(text) "\n"
#include "qemu-options.h"
#undef DEF
#undef DEFHEADING
#undef GEN_DOCS
        ;
    version();
    printf("usage: %s [options] [disk_image]\n"
           "\n"
           "'disk_image' is a raw hard disk image for IDE hard disk 0\n"
           "\n"
           "%s\n"
           "During emulation, the following keys are useful:\n"
           "ctrl-alt-f      toggle full screen\n"
           "ctrl-alt-n      switch to virtual console 'n'\n"
           "ctrl-alt        toggle mouse and keyboard grab\n"
           "\n"
           "When using -nographic, press 'ctrl-a h' to get some help.\n",
           "qemu",
           options_help);
    exit(exitcode);
}

#define HAS_ARG 0x0001

enum {
#define DEF(option, opt_arg, opt_enum, opt_help, arch_mask)     \
    opt_enum,
#define DEFHEADING(text)
#include "qemu-options.h"
#undef DEF
#undef DEFHEADING
#undef GEN_DOCS
};

typedef struct QEMUOption {
    const char *name;
    int flags;
    int index;
    uint32_t arch_mask;
} QEMUOption;

static const QEMUOption qemu_options[] = {
    { "h", 0, QEMU_OPTION_h, QEMU_ARCH_ALL },
#define DEF(option, opt_arg, opt_enum, opt_help, arch_mask)     \
    { option, opt_arg, opt_enum, arch_mask },
#define DEFHEADING(text)
#include "qemu-options.h"
#undef DEF
#undef DEFHEADING
#undef GEN_DOCS
    { NULL },
};
static void select_vgahw (const char *p)
{
    const char *opts;

    default_vga = 0;
    vga_interface_type = VGA_NONE;
    if (strstart(p, "std", &opts)) {
        vga_interface_type = VGA_STD;
    } else if (strstart(p, "cirrus", &opts)) {
        vga_interface_type = VGA_CIRRUS;
    } else if (strstart(p, "vmware", &opts)) {
        vga_interface_type = VGA_VMWARE;
    } else if (strstart(p, "xenfb", &opts)) {
        vga_interface_type = VGA_XENFB;
    } else if (!strstart(p, "none", &opts)) {
    invalid_vga:
        fprintf(stderr, "Unknown vga type: %s\n", p);
        exit(1);
    }
    while (*opts) {
        const char *nextopt;

        if (strstart(opts, ",retrace=", &nextopt)) {
            opts = nextopt;
            if (strstart(opts, "dumb", &nextopt))
                vga_retrace_method = VGA_RETRACE_DUMB;
            else if (strstart(opts, "precise", &nextopt))
                vga_retrace_method = VGA_RETRACE_PRECISE;
            else goto invalid_vga;
        } else goto invalid_vga;
        opts = nextopt;
    }
}

static int balloon_parse(const char *arg)
{
    QemuOpts *opts;

    if (strcmp(arg, "none") == 0) {
        return 0;
    }

    if (!strncmp(arg, "virtio", 6)) {
        if (arg[6] == ',') {
            /* have params -> parse them */
            opts = qemu_opts_parse(&qemu_device_opts, arg+7, 0);
            if (!opts)
                return  -1;
        } else {
            /* create empty opts */
            opts = qemu_opts_create(&qemu_device_opts, NULL, 0);
        }
        qemu_opt_set(opts, "driver", "virtio-balloon-pci");
        return 0;
    }

    return -1;
}

#ifdef _WIN32
static BOOL WINAPI qemu_ctrl_handler(DWORD type)
{
    exit(STATUS_CONTROL_C_EXIT);
    return TRUE;
}
#endif

#ifndef _WIN32

static void termsig_handler(int signal)
{
    qemu_system_shutdown_request();
}

static void sigchld_handler(int signal)
{
    waitpid(-1, NULL, WNOHANG);
}

static void sighandler_setup(void)
{
    struct sigaction act;

    memset(&act, 0, sizeof(act));
    act.sa_handler = termsig_handler;
    sigaction(SIGINT,  &act, NULL);
    sigaction(SIGHUP,  &act, NULL);
    sigaction(SIGTERM, &act, NULL);

    act.sa_handler = sigchld_handler;
    act.sa_flags = SA_NOCLDSTOP;
    sigaction(SIGCHLD, &act, NULL);
}

#endif

#ifdef _WIN32
/* Look for support files in the same directory as the executable.  */
static char *find_datadir(const char *argv0)
{
    char *p;
    char buf[MAX_PATH];
    DWORD len;

    len = GetModuleFileName(NULL, buf, sizeof(buf) - 1);
    if (len == 0) {
        return NULL;
    }

    buf[len] = 0;
    p = buf + len - 1;
    while (p != buf && *p != '\\')
        p--;
    *p = 0;
    if (access(buf, R_OK) == 0) {
        return qemu_strdup(buf);
    }
    return NULL;
}
#else /* !_WIN32 */

/* Find a likely location for support files using the location of the binary.
   For installed binaries this will be "$bindir/../share/qemu".  When
   running from the build tree this will be "$bindir/../pc-bios".  */
#define SHARE_SUFFIX "/share/qemu"
#define BUILD_SUFFIX "/pc-bios"
static char *find_datadir(const char *argv0)
{
    char *dir;
    char *p = NULL;
    char *res;
    char buf[PATH_MAX];
    size_t max_len;

#if defined(__linux__)
    {
        int len;
        len = readlink("/proc/self/exe", buf, sizeof(buf) - 1);
        if (len > 0) {
            buf[len] = 0;
            p = buf;
        }
    }
#elif defined(__FreeBSD__)
    {
        static int mib[4] = {CTL_KERN, KERN_PROC, KERN_PROC_PATHNAME, -1};
        size_t len = sizeof(buf) - 1;

        *buf = '\0';
        if (!sysctl(mib, sizeof(mib)/sizeof(*mib), buf, &len, NULL, 0) &&
            *buf) {
            buf[sizeof(buf) - 1] = '\0';
            p = buf;
        }
    }
#endif
    /* If we don't have any way of figuring out the actual executable
       location then try argv[0].  */
    if (!p) {
        p = realpath(argv0, buf);
        if (!p) {
            return NULL;
        }
    }
    dir = dirname(p);
    dir = dirname(dir);

    max_len = strlen(dir) +
        MAX(strlen(SHARE_SUFFIX), strlen(BUILD_SUFFIX)) + 1;
    res = qemu_mallocz(max_len);
    snprintf(res, max_len, "%s%s", dir, SHARE_SUFFIX);
    if (access(res, R_OK)) {
        snprintf(res, max_len, "%s%s", dir, BUILD_SUFFIX);
        if (access(res, R_OK)) {
            qemu_free(res);
            res = NULL;
        }
    }

    return res;
}
#undef SHARE_SUFFIX
#undef BUILD_SUFFIX
#endif

char *qemu_find_file(int type, const char *name)
{
    int len;
    const char *subdir;
    char *buf;

    /* If name contains path separators then try it as a straight path.  */
    if ((strchr(name, '/') || strchr(name, '\\'))
        && access(name, R_OK) == 0) {
        return qemu_strdup(name);
    }
    switch (type) {
    case QEMU_FILE_TYPE_BIOS:
        subdir = "";
        break;
    case QEMU_FILE_TYPE_KEYMAP:
        subdir = "keymaps/";
        break;
    default:
        abort();
    }
    len = strlen(data_dir) + strlen(name) + strlen(subdir) + 2;
    buf = qemu_mallocz(len);
    snprintf(buf, len, "%s/%s%s", data_dir, subdir, name);
    if (access(buf, R_OK)) {
        qemu_free(buf);
        return NULL;
    }
    return buf;
}

static int device_help_func(QemuOpts *opts, void *opaque)
{
    return qdev_device_help(opts);
}

static int device_init_func(QemuOpts *opts, void *opaque)
{
    DeviceState *dev;

    dev = qdev_device_add(opts);
    if (!dev)
        return -1;
    return 0;
}

static int chardev_init_func(QemuOpts *opts, void *opaque)
{
    CharDriverState *chr;

    chr = qemu_chr_open_opts(opts, NULL);
    if (!chr)
        return -1;
    return 0;
}

#ifdef CONFIG_LINUX
static int fsdev_init_func(QemuOpts *opts, void *opaque)
{
    int ret;
    ret = qemu_fsdev_add(opts);

    return ret;
}
#endif

static int mon_init_func(QemuOpts *opts, void *opaque)
{
    CharDriverState *chr;
    const char *chardev;
    const char *mode;
    int flags;

    mode = qemu_opt_get(opts, "mode");
    if (mode == NULL) {
        mode = "readline";
    }
    if (strcmp(mode, "readline") == 0) {
        flags = MONITOR_USE_READLINE;
    } else if (strcmp(mode, "control") == 0) {
        flags = MONITOR_USE_CONTROL;
    } else {
        fprintf(stderr, "unknown monitor mode \"%s\"\n", mode);
        exit(1);
    }

    if (qemu_opt_get_bool(opts, "default", 0))
        flags |= MONITOR_IS_DEFAULT;

    chardev = qemu_opt_get(opts, "chardev");
    chr = qemu_chr_find(chardev);
    if (chr == NULL) {
        fprintf(stderr, "chardev \"%s\" not found\n", chardev);
        exit(1);
    }

    monitor_init(chr, flags);
    return 0;
}

static void monitor_parse(const char *optarg, const char *mode)
{
    static int monitor_device_index = 0;
    QemuOpts *opts;
    const char *p;
    char label[32];
    int def = 0;

    if (strstart(optarg, "chardev:", &p)) {
        snprintf(label, sizeof(label), "%s", p);
    } else {
        snprintf(label, sizeof(label), "compat_monitor%d",
                 monitor_device_index);
        if (monitor_device_index == 0) {
            def = 1;
        }
        opts = qemu_chr_parse_compat(label, optarg);
        if (!opts) {
            fprintf(stderr, "parse error: %s\n", optarg);
            exit(1);
        }
    }

    opts = qemu_opts_create(&qemu_mon_opts, label, 1);
    if (!opts) {
        fprintf(stderr, "duplicate chardev: %s\n", label);
        exit(1);
    }
    qemu_opt_set(opts, "mode", mode);
    qemu_opt_set(opts, "chardev", label);
    if (def)
        qemu_opt_set(opts, "default", "on");
    monitor_device_index++;
}

struct device_config {
    enum {
        DEV_USB,       /* -usbdevice     */
        DEV_BT,        /* -bt            */
        DEV_SERIAL,    /* -serial        */
        DEV_PARALLEL,  /* -parallel      */
        DEV_VIRTCON,   /* -virtioconsole */
        DEV_DEBUGCON,  /* -debugcon */
    } type;
    const char *cmdline;
    QTAILQ_ENTRY(device_config) next;
};
QTAILQ_HEAD(, device_config) device_configs = QTAILQ_HEAD_INITIALIZER(device_configs);

static void add_device_config(int type, const char *cmdline)
{
    struct device_config *conf;

    conf = qemu_mallocz(sizeof(*conf));
    conf->type = type;
    conf->cmdline = cmdline;
    QTAILQ_INSERT_TAIL(&device_configs, conf, next);
}

static int foreach_device_config(int type, int (*func)(const char *cmdline))
{
    struct device_config *conf;
    int rc;

    QTAILQ_FOREACH(conf, &device_configs, next) {
        if (conf->type != type)
            continue;
        rc = func(conf->cmdline);
        if (0 != rc)
            return rc;
    }
    return 0;
}

static int serial_parse(const char *devname)
{
    static int index = 0;
    char label[32];

    if (strcmp(devname, "none") == 0)
        return 0;
    if (index == MAX_SERIAL_PORTS) {
        fprintf(stderr, "qemu: too many serial ports\n");
        exit(1);
    }
    snprintf(label, sizeof(label), "serial%d", index);
    serial_hds[index] = qemu_chr_open(label, devname, NULL);
    if (!serial_hds[index]) {
        fprintf(stderr, "qemu: could not open serial device '%s': %s\n",
                devname, strerror(errno));
        return -1;
    }
    index++;
    return 0;
}

static int parallel_parse(const char *devname)
{
    static int index = 0;
    char label[32];

    if (strcmp(devname, "none") == 0)
        return 0;
    if (index == MAX_PARALLEL_PORTS) {
        fprintf(stderr, "qemu: too many parallel ports\n");
        exit(1);
    }
    snprintf(label, sizeof(label), "parallel%d", index);
    parallel_hds[index] = qemu_chr_open(label, devname, NULL);
    if (!parallel_hds[index]) {
        fprintf(stderr, "qemu: could not open parallel device '%s': %s\n",
                devname, strerror(errno));
        return -1;
    }
    index++;
    return 0;
}

static int virtcon_parse(const char *devname)
{
    static int index = 0;
    char label[32];
    QemuOpts *bus_opts, *dev_opts;

    if (strcmp(devname, "none") == 0)
        return 0;
    if (index == MAX_VIRTIO_CONSOLES) {
        fprintf(stderr, "qemu: too many virtio consoles\n");
        exit(1);
    }

    bus_opts = qemu_opts_create(&qemu_device_opts, NULL, 0);
    qemu_opt_set(bus_opts, "driver", "virtio-serial");

    dev_opts = qemu_opts_create(&qemu_device_opts, NULL, 0);
    qemu_opt_set(dev_opts, "driver", "virtconsole");

    snprintf(label, sizeof(label), "virtcon%d", index);
    virtcon_hds[index] = qemu_chr_open(label, devname, NULL);
    if (!virtcon_hds[index]) {
        fprintf(stderr, "qemu: could not open virtio console '%s': %s\n",
                devname, strerror(errno));
        return -1;
    }
    qemu_opt_set(dev_opts, "chardev", label);

    index++;
    return 0;
}

static int debugcon_parse(const char *devname)
{   
    QemuOpts *opts;

    if (!qemu_chr_open("debugcon", devname, NULL)) {
        exit(1);
    }
    opts = qemu_opts_create(&qemu_device_opts, "debugcon", 1);
    if (!opts) {
        fprintf(stderr, "qemu: already have a debugcon device\n");
        exit(1);
    }
    qemu_opt_set(opts, "driver", "isa-debugcon");
    qemu_opt_set(opts, "chardev", "debugcon");
    return 0;
}

static const QEMUOption *lookup_opt(int argc, char **argv,
                                    const char **poptarg, int *poptind)
{
    const QEMUOption *popt;
    int optind = *poptind;
    char *r = argv[optind];
    const char *optarg;

    loc_set_cmdline(argv, optind, 1);
    optind++;
    /* Treat --foo the same as -foo.  */
    if (r[1] == '-')
        r++;
    popt = qemu_options;
    for(;;) {
        if (!popt->name) {
            error_report("invalid option");
            exit(1);
        }
        if (!strcmp(popt->name, r + 1))
            break;
        popt++;
    }
    if (popt->flags & HAS_ARG) {
        if (optind >= argc) {
            error_report("requires an argument");
            exit(1);
        }
        optarg = argv[optind++];
        loc_set_cmdline(argv, optind - 2, 2);
    } else {
        optarg = NULL;
    }

    *poptarg = optarg;
    *poptind = optind;

    return popt;
}

int main(int argc, char **argv, char **envp)
{
    const char *gdbstub_dev = NULL;
    int i;
    int snapshot, linux_boot;
    const char *icount_option = NULL;
    const char *initrd_filename;
    const char *kernel_filename, *kernel_cmdline;
    char boot_devices[33] = "cad"; /* default to HD->floppy->CD-ROM */
    DisplayState *ds;
    DisplayChangeListener *dcl;
    int cyls, heads, secs, translation;
    QemuOpts *hda_opts = NULL, *opts;
    int optind;
    const char *optarg;
    const char *loadvm = NULL;
    QEMUMachine *machine;
    const char *cpu_model;
#ifndef _WIN32
    int fds[2];
#endif
    int tb_size;
    const char *pid_file = NULL;
    const char *incoming = NULL;
#ifndef _WIN32
    int fd = 0;
    struct passwd *pwd = NULL;
    const char *chroot_dir = NULL;
    const char *run_as = NULL;
#endif
    int show_vnc_port = 0;
    int defconfig = 1;

    error_set_progname(argv[0]);

    init_clocks();

    qemu_cache_utils_init(envp);

    QLIST_INIT (&vm_change_state_head);
#ifndef _WIN32
    {
        struct sigaction act;
        sigfillset(&act.sa_mask);
        act.sa_flags = 0;
        act.sa_handler = SIG_IGN;
        sigaction(SIGPIPE, &act, NULL);
    }
#else
    SetConsoleCtrlHandler(qemu_ctrl_handler, TRUE);
    /* Note: cpu_interrupt() is currently not SMP safe, so we force
       QEMU to run on a single CPU */
    {
        HANDLE h;
        DWORD mask, smask;
        int i;
        h = GetCurrentProcess();
        if (GetProcessAffinityMask(h, &mask, &smask)) {
            for(i = 0; i < 32; i++) {
                if (mask & (1 << i))
                    break;
            }
            if (i != 32) {
                mask = 1 << i;
                SetProcessAffinityMask(h, mask);
            }
        }
    }
#endif

    module_call_init(MODULE_INIT_MACHINE);
    machine = find_default_machine();
    cpu_model = NULL;
    initrd_filename = NULL;
    ram_size = 0;
    snapshot = 0;
    kernel_filename = NULL;
    kernel_cmdline = "";
    cyls = heads = secs = 0;
    translation = BIOS_ATA_TRANSLATION_AUTO;

    for (i = 0; i < MAX_NODES; i++) {
        node_mem[i] = 0;
        node_cpumask[i] = 0;
    }

    nb_numa_nodes = 0;
    nb_nics = 0;

    tb_size = 0;
    autostart= 1;

    /* first pass of option parsing */
    optind = 1;
    while (optind < argc) {
        if (argv[optind][0] != '-') {
            /* disk image */
            optind++;
            continue;
        } else {
            const QEMUOption *popt;

            popt = lookup_opt(argc, argv, &optarg, &optind);
            switch (popt->index) {
            case QEMU_OPTION_nodefconfig:
                defconfig=0;
                break;
            }
        }
    }

    if (defconfig) {
        int ret;

        ret = qemu_read_config_file(CONFIG_QEMU_CONFDIR "/qemu.conf");
        if (ret == -EINVAL) {
            exit(1);
        }

        ret = qemu_read_config_file(arch_config_name);
        if (ret == -EINVAL) {
            exit(1);
        }
    }
    cpudef_init();

    /* second pass of option parsing */
    optind = 1;
    for(;;) {
        if (optind >= argc)
            break;
        if (argv[optind][0] != '-') {
	    hda_opts = drive_add(argv[optind++], HD_ALIAS, 0);
        } else {
            const QEMUOption *popt;

            popt = lookup_opt(argc, argv, &optarg, &optind);
            if (!(popt->arch_mask & arch_type)) {
                printf("Option %s not supported for this target\n", popt->name);
                exit(1);
            }
            switch(popt->index) {
            case QEMU_OPTION_M:
                machine = find_machine(optarg);
                if (!machine) {
                    QEMUMachine *m;
                    printf("Supported machines are:\n");
                    for(m = first_machine; m != NULL; m = m->next) {
                        if (m->alias)
                            printf("%-10s %s (alias of %s)\n",
                                   m->alias, m->desc, m->name);
                        printf("%-10s %s%s\n",
                               m->name, m->desc,
                               m->is_default ? " (default)" : "");
                    }
                    exit(*optarg != '?');
                }
                break;
            case QEMU_OPTION_cpu:
                /* hw initialization will check this */
                if (*optarg == '?') {
                    list_cpus(stdout, &fprintf, optarg);
                    exit(0);
                } else {
                    cpu_model = optarg;
                }
                break;
            case QEMU_OPTION_initrd:
                initrd_filename = optarg;
                break;
            case QEMU_OPTION_hda:
                if (cyls == 0)
                    hda_opts = drive_add(optarg, HD_ALIAS, 0);
                else
                    hda_opts = drive_add(optarg, HD_ALIAS
			     ",cyls=%d,heads=%d,secs=%d%s",
                             0, cyls, heads, secs,
                             translation == BIOS_ATA_TRANSLATION_LBA ?
                                 ",trans=lba" :
                             translation == BIOS_ATA_TRANSLATION_NONE ?
                                 ",trans=none" : "");
                 break;
            case QEMU_OPTION_hdb:
            case QEMU_OPTION_hdc:
            case QEMU_OPTION_hdd:
                drive_add(optarg, HD_ALIAS, popt->index - QEMU_OPTION_hda);
                break;
            case QEMU_OPTION_drive:
                drive_add(NULL, "%s", optarg);
	        break;
            case QEMU_OPTION_set:
                if (qemu_set_option(optarg) != 0)
                    exit(1);
	        break;
            case QEMU_OPTION_global:
                if (qemu_global_option(optarg) != 0)
                    exit(1);
	        break;
            case QEMU_OPTION_mtdblock:
                drive_add(optarg, MTD_ALIAS);
                break;
            case QEMU_OPTION_sd:
                drive_add(optarg, SD_ALIAS);
                break;
            case QEMU_OPTION_pflash:
                drive_add(optarg, PFLASH_ALIAS);
                break;
            case QEMU_OPTION_snapshot:
                snapshot = 1;
                break;
            case QEMU_OPTION_hdachs:
                {
                    const char *p;
                    p = optarg;
                    cyls = strtol(p, (char **)&p, 0);
                    if (cyls < 1 || cyls > 16383)
                        goto chs_fail;
                    if (*p != ',')
                        goto chs_fail;
                    p++;
                    heads = strtol(p, (char **)&p, 0);
                    if (heads < 1 || heads > 16)
                        goto chs_fail;
                    if (*p != ',')
                        goto chs_fail;
                    p++;
                    secs = strtol(p, (char **)&p, 0);
                    if (secs < 1 || secs > 63)
                        goto chs_fail;
                    if (*p == ',') {
                        p++;
                        if (!strcmp(p, "none"))
                            translation = BIOS_ATA_TRANSLATION_NONE;
                        else if (!strcmp(p, "lba"))
                            translation = BIOS_ATA_TRANSLATION_LBA;
                        else if (!strcmp(p, "auto"))
                            translation = BIOS_ATA_TRANSLATION_AUTO;
                        else
                            goto chs_fail;
                    } else if (*p != '\0') {
                    chs_fail:
                        fprintf(stderr, "qemu: invalid physical CHS format\n");
                        exit(1);
                    }
		    if (hda_opts != NULL) {
                        char num[16];
                        snprintf(num, sizeof(num), "%d", cyls);
                        qemu_opt_set(hda_opts, "cyls", num);
                        snprintf(num, sizeof(num), "%d", heads);
                        qemu_opt_set(hda_opts, "heads", num);
                        snprintf(num, sizeof(num), "%d", secs);
                        qemu_opt_set(hda_opts, "secs", num);
                        if (translation == BIOS_ATA_TRANSLATION_LBA)
                            qemu_opt_set(hda_opts, "trans", "lba");
                        if (translation == BIOS_ATA_TRANSLATION_NONE)
                            qemu_opt_set(hda_opts, "trans", "none");
                    }
                }
                break;
            case QEMU_OPTION_numa:
                if (nb_numa_nodes >= MAX_NODES) {
                    fprintf(stderr, "qemu: too many NUMA nodes\n");
                    exit(1);
                }
                numa_add(optarg);
                break;
            case QEMU_OPTION_nographic:
                display_type = DT_NOGRAPHIC;
                break;
#ifdef CONFIG_CURSES
            case QEMU_OPTION_curses:
                display_type = DT_CURSES;
                break;
#endif
            case QEMU_OPTION_portrait:
                graphic_rotate = 1;
                break;
            case QEMU_OPTION_kernel:
                kernel_filename = optarg;
                break;
            case QEMU_OPTION_append:
                kernel_cmdline = optarg;
                break;
            case QEMU_OPTION_cdrom:
                drive_add(optarg, CDROM_ALIAS);
                break;
            case QEMU_OPTION_boot:
                {
                    static const char * const params[] = {
                        "order", "once", "menu", NULL
                    };
                    char buf[sizeof(boot_devices)];
                    char *standard_boot_devices;
                    int legacy = 0;

                    if (!strchr(optarg, '=')) {
                        legacy = 1;
                        pstrcpy(buf, sizeof(buf), optarg);
                    } else if (check_params(buf, sizeof(buf), params, optarg) < 0) {
                        fprintf(stderr,
                                "qemu: unknown boot parameter '%s' in '%s'\n",
                                buf, optarg);
                        exit(1);
                    }

                    if (legacy ||
                        get_param_value(buf, sizeof(buf), "order", optarg)) {
                        validate_bootdevices(buf);
                        pstrcpy(boot_devices, sizeof(boot_devices), buf);
                    }
                    if (!legacy) {
                        if (get_param_value(buf, sizeof(buf),
                                            "once", optarg)) {
                            validate_bootdevices(buf);
                            standard_boot_devices = qemu_strdup(boot_devices);
                            pstrcpy(boot_devices, sizeof(boot_devices), buf);
                            qemu_register_reset(restore_boot_devices,
                                                standard_boot_devices);
                        }
                        if (get_param_value(buf, sizeof(buf),
                                            "menu", optarg)) {
                            if (!strcmp(buf, "on")) {
                                boot_menu = 1;
                            } else if (!strcmp(buf, "off")) {
                                boot_menu = 0;
                            } else {
                                fprintf(stderr,
                                        "qemu: invalid option value '%s'\n",
                                        buf);
                                exit(1);
                            }
                        }
                    }
                }
                break;
            case QEMU_OPTION_fda:
            case QEMU_OPTION_fdb:
                drive_add(optarg, FD_ALIAS, popt->index - QEMU_OPTION_fda);
                break;
            case QEMU_OPTION_no_fd_bootchk:
                fd_bootchk = 0;
                break;
            case QEMU_OPTION_netdev:
                if (net_client_parse(&qemu_netdev_opts, optarg) == -1) {
                    exit(1);
                }
                break;
            case QEMU_OPTION_net:
                if (net_client_parse(&qemu_net_opts, optarg) == -1) {
                    exit(1);
                }
                break;
#ifdef CONFIG_SLIRP
            case QEMU_OPTION_tftp:
                legacy_tftp_prefix = optarg;
                break;
            case QEMU_OPTION_bootp:
                legacy_bootp_filename = optarg;
                break;
#ifndef _WIN32
            case QEMU_OPTION_smb:
                if (net_slirp_smb(optarg) < 0)
                    exit(1);
                break;
#endif
            case QEMU_OPTION_redir:
                if (net_slirp_redir(optarg) < 0)
                    exit(1);
                break;
#endif
            case QEMU_OPTION_bt:
                add_device_config(DEV_BT, optarg);
                break;
            case QEMU_OPTION_audio_help:
                if (!(audio_available())) {
                    printf("Option %s not supported for this target\n", popt->name);
                    exit(1);
                }
                AUD_help ();
                exit (0);
                break;
            case QEMU_OPTION_soundhw:
                if (!(audio_available())) {
                    printf("Option %s not supported for this target\n", popt->name);
                    exit(1);
                }
                select_soundhw (optarg);
                break;
            case QEMU_OPTION_h:
                help(0);
                break;
            case QEMU_OPTION_version:
                version();
                exit(0);
                break;
            case QEMU_OPTION_m: {
                uint64_t value;
                char *ptr;

                value = strtoul(optarg, &ptr, 10);
                switch (*ptr) {
                case 0: case 'M': case 'm':
                    value <<= 20;
                    break;
                case 'G': case 'g':
                    value <<= 30;
                    break;
                default:
                    fprintf(stderr, "qemu: invalid ram size: %s\n", optarg);
                    exit(1);
                }

                /* On 32-bit hosts, QEMU is limited by virtual address space */
                if (value > (2047 << 20) && HOST_LONG_BITS == 32) {
                    fprintf(stderr, "qemu: at most 2047 MB RAM can be simulated\n");
                    exit(1);
                }
                if (value != (uint64_t)(ram_addr_t)value) {
                    fprintf(stderr, "qemu: ram size too large\n");
                    exit(1);
                }
                ram_size = value;
                break;
            }
            case QEMU_OPTION_mempath:
                mem_path = optarg;
                break;
#ifdef MAP_POPULATE
            case QEMU_OPTION_mem_prealloc:
                mem_prealloc = 1;
                break;
#endif
            case QEMU_OPTION_d:
                set_cpu_log(optarg);
                break;
            case QEMU_OPTION_s:
                gdbstub_dev = "tcp::" DEFAULT_GDBSTUB_PORT;
                break;
            case QEMU_OPTION_gdb:
                gdbstub_dev = optarg;
                break;
            case QEMU_OPTION_L:
                data_dir = optarg;
                break;
            case QEMU_OPTION_bios:
                bios_name = optarg;
                break;
            case QEMU_OPTION_singlestep:
                singlestep = 1;
                break;
            case QEMU_OPTION_S:
                autostart = 0;
                break;
	    case QEMU_OPTION_k:
		keyboard_layout = optarg;
		break;
            case QEMU_OPTION_localtime:
                rtc_utc = 0;
                break;
            case QEMU_OPTION_vga:
                select_vgahw (optarg);
                break;
            case QEMU_OPTION_g:
                {
                    const char *p;
                    int w, h, depth;
                    p = optarg;
                    w = strtol(p, (char **)&p, 10);
                    if (w <= 0) {
                    graphic_error:
                        fprintf(stderr, "qemu: invalid resolution or depth\n");
                        exit(1);
                    }
                    if (*p != 'x')
                        goto graphic_error;
                    p++;
                    h = strtol(p, (char **)&p, 10);
                    if (h <= 0)
                        goto graphic_error;
                    if (*p == 'x') {
                        p++;
                        depth = strtol(p, (char **)&p, 10);
                        if (depth != 8 && depth != 15 && depth != 16 &&
                            depth != 24 && depth != 32)
                            goto graphic_error;
                    } else if (*p == '\0') {
                        depth = graphic_depth;
                    } else {
                        goto graphic_error;
                    }

                    graphic_width = w;
                    graphic_height = h;
                    graphic_depth = depth;
                }
                break;
            case QEMU_OPTION_echr:
                {
                    char *r;
                    term_escape_char = strtol(optarg, &r, 0);
                    if (r == optarg)
                        printf("Bad argument to echr\n");
                    break;
                }
            case QEMU_OPTION_monitor:
                monitor_parse(optarg, "readline");
                default_monitor = 0;
                break;
            case QEMU_OPTION_qmp:
                monitor_parse(optarg, "control");
                default_monitor = 0;
                break;
            case QEMU_OPTION_mon:
                opts = qemu_opts_parse(&qemu_mon_opts, optarg, 1);
                if (!opts) {
                    exit(1);
                }
                default_monitor = 0;
                break;
            case QEMU_OPTION_chardev:
                opts = qemu_opts_parse(&qemu_chardev_opts, optarg, 1);
                if (!opts) {
                    exit(1);
                }
                break;
#ifdef CONFIG_LINUX
            case QEMU_OPTION_fsdev:
                opts = qemu_opts_parse(&qemu_fsdev_opts, optarg, 1);
                if (!opts) {
                    fprintf(stderr, "parse error: %s\n", optarg);
                    exit(1);
                }
                break;
            case QEMU_OPTION_virtfs: {
                char *arg_fsdev = NULL;
                char *arg_9p = NULL;
                int len = 0;

                opts = qemu_opts_parse(&qemu_virtfs_opts, optarg, 1);
                if (!opts) {
                    fprintf(stderr, "parse error: %s\n", optarg);
                    exit(1);
                }

                len = strlen(",id=,path=");
                len += strlen(qemu_opt_get(opts, "fstype"));
                len += strlen(qemu_opt_get(opts, "mount_tag"));
                len += strlen(qemu_opt_get(opts, "path"));
                arg_fsdev = qemu_malloc((len + 1) * sizeof(*arg_fsdev));

                if (!arg_fsdev) {
                    fprintf(stderr, "No memory to parse -fsdev for %s\n",
                            optarg);
                    exit(1);
                }

                sprintf(arg_fsdev, "%s,id=%s,path=%s",
                                qemu_opt_get(opts, "fstype"),
                                qemu_opt_get(opts, "mount_tag"),
                                qemu_opt_get(opts, "path"));

                len = strlen("virtio-9p-pci,fsdev=,mount_tag=");
                len += 2*strlen(qemu_opt_get(opts, "mount_tag"));
                arg_9p = qemu_malloc((len + 1) * sizeof(*arg_9p));

                if (!arg_9p) {
                    fprintf(stderr, "No memory to parse -device for %s\n",
                            optarg);
                    exit(1);
                }

                sprintf(arg_9p, "virtio-9p-pci,fsdev=%s,mount_tag=%s",
                                qemu_opt_get(opts, "mount_tag"),
                                qemu_opt_get(opts, "mount_tag"));

                if (!qemu_opts_parse(&qemu_fsdev_opts, arg_fsdev, 1)) {
                    fprintf(stderr, "parse error [fsdev]: %s\n", optarg);
                    exit(1);
                }

                if (!qemu_opts_parse(&qemu_device_opts, arg_9p, 1)) {
                    fprintf(stderr, "parse error [device]: %s\n", optarg);
                    exit(1);
                }

                qemu_free(arg_fsdev);
                qemu_free(arg_9p);
                break;
            }
#endif
            case QEMU_OPTION_serial:
                add_device_config(DEV_SERIAL, optarg);
                default_serial = 0;
                if (strncmp(optarg, "mon:", 4) == 0) {
                    default_monitor = 0;
                }
                break;
            case QEMU_OPTION_watchdog:
                if (watchdog) {
                    fprintf(stderr,
                            "qemu: only one watchdog option may be given\n");
                    return 1;
                }
                watchdog = optarg;
                break;
            case QEMU_OPTION_watchdog_action:
                if (select_watchdog_action(optarg) == -1) {
                    fprintf(stderr, "Unknown -watchdog-action parameter\n");
                    exit(1);
                }
                break;
            case QEMU_OPTION_virtiocon:
                add_device_config(DEV_VIRTCON, optarg);
                default_virtcon = 0;
                if (strncmp(optarg, "mon:", 4) == 0) {
                    default_monitor = 0;
                }
                break;
            case QEMU_OPTION_parallel:
                add_device_config(DEV_PARALLEL, optarg);
                default_parallel = 0;
                if (strncmp(optarg, "mon:", 4) == 0) {
                    default_monitor = 0;
                }
                break;
            case QEMU_OPTION_debugcon:
                add_device_config(DEV_DEBUGCON, optarg);
                break;
	    case QEMU_OPTION_loadvm:
		loadvm = optarg;
		break;
            case QEMU_OPTION_full_screen:
                full_screen = 1;
                break;
#ifdef CONFIG_SDL
            case QEMU_OPTION_no_frame:
                no_frame = 1;
                break;
            case QEMU_OPTION_alt_grab:
                alt_grab = 1;
                break;
            case QEMU_OPTION_ctrl_grab:
                ctrl_grab = 1;
                break;
            case QEMU_OPTION_no_quit:
                no_quit = 1;
                break;
            case QEMU_OPTION_sdl:
                display_type = DT_SDL;
                break;
#endif
            case QEMU_OPTION_pidfile:
                pid_file = optarg;
                break;
            case QEMU_OPTION_win2k_hack:
                win2k_install_hack = 1;
                break;
            case QEMU_OPTION_rtc_td_hack:
                rtc_td_hack = 1;
                break;
            case QEMU_OPTION_acpitable:
                do_acpitable_option(optarg);
                break;
            case QEMU_OPTION_smbios:
                do_smbios_option(optarg);
                break;
            case QEMU_OPTION_enable_kvm:
                kvm_allowed = 1;
                break;
            case QEMU_OPTION_usb:
                usb_enabled = 1;
                break;
            case QEMU_OPTION_usbdevice:
                usb_enabled = 1;
                add_device_config(DEV_USB, optarg);
                break;
            case QEMU_OPTION_device:
                if (!qemu_opts_parse(&qemu_device_opts, optarg, 1)) {
                    exit(1);
                }
                break;
            case QEMU_OPTION_smp:
                smp_parse(optarg);
                if (smp_cpus < 1) {
                    fprintf(stderr, "Invalid number of CPUs\n");
                    exit(1);
                }
                if (max_cpus < smp_cpus) {
                    fprintf(stderr, "maxcpus must be equal to or greater than "
                            "smp\n");
                    exit(1);
                }
                if (max_cpus > 255) {
                    fprintf(stderr, "Unsupported number of maxcpus\n");
                    exit(1);
                }
                break;
	    case QEMU_OPTION_vnc:
                display_type = DT_VNC;
		vnc_display = optarg;
		break;
            case QEMU_OPTION_no_acpi:
                acpi_enabled = 0;
                break;
            case QEMU_OPTION_no_hpet:
                no_hpet = 1;
                break;
            case QEMU_OPTION_balloon:
                if (balloon_parse(optarg) < 0) {
                    fprintf(stderr, "Unknown -balloon argument %s\n", optarg);
                    exit(1);
                }
                break;
            case QEMU_OPTION_no_reboot:
                no_reboot = 1;
                break;
            case QEMU_OPTION_no_shutdown:
                no_shutdown = 1;
                break;
            case QEMU_OPTION_show_cursor:
                cursor_hide = 0;
                break;
            case QEMU_OPTION_uuid:
                if(qemu_uuid_parse(optarg, qemu_uuid) < 0) {
                    fprintf(stderr, "Fail to parse UUID string."
                            " Wrong format.\n");
                    exit(1);
                }
                break;
#ifndef _WIN32
	    case QEMU_OPTION_daemonize:
		daemonize = 1;
		break;
#endif
	    case QEMU_OPTION_option_rom:
		if (nb_option_roms >= MAX_OPTION_ROMS) {
		    fprintf(stderr, "Too many option ROMs\n");
		    exit(1);
		}
		option_rom[nb_option_roms] = optarg;
		nb_option_roms++;
		break;
            case QEMU_OPTION_semihosting:
                semihosting_enabled = 1;
                break;
            case QEMU_OPTION_name:
                qemu_name = qemu_strdup(optarg);
		 {
		     char *p = strchr(qemu_name, ',');
		     if (p != NULL) {
		        *p++ = 0;
			if (strncmp(p, "process=", 8)) {
			    fprintf(stderr, "Unknown subargument %s to -name", p);
			    exit(1);
			}
			p += 8;
			set_proc_name(p);
		     }	
		 }	
                break;
            case QEMU_OPTION_prom_env:
                if (nb_prom_envs >= MAX_PROM_ENVS) {
                    fprintf(stderr, "Too many prom variables\n");
                    exit(1);
                }
                prom_envs[nb_prom_envs] = optarg;
                nb_prom_envs++;
                break;
            case QEMU_OPTION_old_param:
                old_param = 1;
                break;
            case QEMU_OPTION_clock:
                configure_alarms(optarg);
                break;
            case QEMU_OPTION_startdate:
                configure_rtc_date_offset(optarg, 1);
                break;
            case QEMU_OPTION_rtc:
                opts = qemu_opts_parse(&qemu_rtc_opts, optarg, 0);
                if (!opts) {
                    exit(1);
                }
                configure_rtc(opts);
                break;
            case QEMU_OPTION_tb_size:
                tb_size = strtol(optarg, NULL, 0);
                if (tb_size < 0)
                    tb_size = 0;
                break;
            case QEMU_OPTION_icount:
                icount_option = optarg;
                break;
            case QEMU_OPTION_incoming:
                incoming = optarg;
                break;
            case QEMU_OPTION_nodefaults:
                default_serial = 0;
                default_parallel = 0;
                default_virtcon = 0;
                default_monitor = 0;
                default_vga = 0;
                default_net = 0;
                default_floppy = 0;
                default_cdrom = 0;
                default_sdcard = 0;
                break;
#ifndef _WIN32
            case QEMU_OPTION_chroot:
                chroot_dir = optarg;
                break;
            case QEMU_OPTION_runas:
                run_as = optarg;
                break;
#endif
            case QEMU_OPTION_xen_domid:
                if (!(xen_available())) {
                    printf("Option %s not supported for this target\n", popt->name);
                    exit(1);
                }
                xen_domid = atoi(optarg);
                break;
            case QEMU_OPTION_xen_create:
                if (!(xen_available())) {
                    printf("Option %s not supported for this target\n", popt->name);
                    exit(1);
                }
                xen_mode = XEN_CREATE;
                break;
            case QEMU_OPTION_xen_attach:
                if (!(xen_available())) {
                    printf("Option %s not supported for this target\n", popt->name);
                    exit(1);
                }
                xen_mode = XEN_ATTACH;
                break;
            case QEMU_OPTION_readconfig:
                {
                    int ret = qemu_read_config_file(optarg);
                    if (ret < 0) {
                        fprintf(stderr, "read config %s: %s\n", optarg,
                            strerror(-ret));
                        exit(1);
                    }
                    break;
                }
            case QEMU_OPTION_writeconfig:
                {
                    FILE *fp;
                    if (strcmp(optarg, "-") == 0) {
                        fp = stdout;
                    } else {
                        fp = fopen(optarg, "w");
                        if (fp == NULL) {
                            fprintf(stderr, "open %s: %s\n", optarg, strerror(errno));
                            exit(1);
                        }
                    }
                    qemu_config_write(fp);
                    fclose(fp);
                    break;
                }
            }
        }
    }
    loc_set_none();

    /* If no data_dir is specified then try to find it relative to the
       executable path.  */
    if (!data_dir) {
        data_dir = find_datadir(argv[0]);
    }
    /* If all else fails use the install patch specified when building.  */
    if (!data_dir) {
        data_dir = CONFIG_QEMU_SHAREDIR;
    }

    /*
     * Default to max_cpus = smp_cpus, in case the user doesn't
     * specify a max_cpus value.
     */
    if (!max_cpus)
        max_cpus = smp_cpus;

    machine->max_cpus = machine->max_cpus ?: 1; /* Default to UP */
    if (smp_cpus > machine->max_cpus) {
        fprintf(stderr, "Number of SMP cpus requested (%d), exceeds max cpus "
                "supported by machine `%s' (%d)\n", smp_cpus,  machine->name,
                machine->max_cpus);
        exit(1);
    }

#ifdef CONFIG_COREMU
    cm_print("\n%s\n%s\n%s",
             "------------------------------------",
             "|     [COREMU Parallel Emulator]   |",
             "------------------------------------");
    coremu_init(smp_cpus);
    /* Initialize qemu variable for coremu */
    cm_init_pit_freq();
#endif

    qemu_opts_foreach(&qemu_device_opts, default_driver_check, NULL, 0);
    qemu_opts_foreach(&qemu_global_opts, default_driver_check, NULL, 0);

    if (machine->no_serial) {
        default_serial = 0;
    }
    if (machine->no_parallel) {
        default_parallel = 0;
    }
    if (!machine->use_virtcon) {
        default_virtcon = 0;
    }
    if (machine->no_vga) {
        default_vga = 0;
    }
    if (machine->no_floppy) {
        default_floppy = 0;
    }
    if (machine->no_cdrom) {
        default_cdrom = 0;
    }
    if (machine->no_sdcard) {
        default_sdcard = 0;
    }

    if (display_type == DT_NOGRAPHIC) {
        if (default_parallel)
            add_device_config(DEV_PARALLEL, "null");
        if (default_serial && default_monitor) {
            add_device_config(DEV_SERIAL, "mon:stdio");
        } else if (default_virtcon && default_monitor) {
            add_device_config(DEV_VIRTCON, "mon:stdio");
        } else {
            if (default_serial)
                add_device_config(DEV_SERIAL, "stdio");
            if (default_virtcon)
                add_device_config(DEV_VIRTCON, "stdio");
            if (default_monitor)
                monitor_parse("stdio", "readline");
        }
    } else {
        if (default_serial)
            add_device_config(DEV_SERIAL, "vc:80Cx24C");
        if (default_parallel)
            add_device_config(DEV_PARALLEL, "vc:80Cx24C");
        if (default_monitor)
            monitor_parse("vc:80Cx24C", "readline");
        if (default_virtcon)
            add_device_config(DEV_VIRTCON, "vc:80Cx24C");
    }
    if (default_vga)
        vga_interface_type = VGA_CIRRUS;

    if (qemu_opts_foreach(&qemu_chardev_opts, chardev_init_func, NULL, 1) != 0)
        exit(1);
#ifdef CONFIG_LINUX
    if (qemu_opts_foreach(&qemu_fsdev_opts, fsdev_init_func, NULL, 1) != 0) {
        exit(1);
    }
#endif

#ifndef _WIN32
    if (daemonize) {
	pid_t pid;

	if (pipe(fds) == -1)
	    exit(1);

	pid = fork();
	if (pid > 0) {
	    uint8_t status;
	    ssize_t len;

	    close(fds[1]);

	again:
            len = read(fds[0], &status, 1);
            if (len == -1 && (errno == EINTR))
                goto again;

            if (len != 1)
                exit(1);
            else if (status == 1) {
                fprintf(stderr, "Could not acquire pidfile: %s\n", strerror(errno));
                exit(1);
            } else
                exit(0);
	} else if (pid < 0)
            exit(1);

	close(fds[0]);
	qemu_set_cloexec(fds[1]);

	setsid();

	pid = fork();
	if (pid > 0)
	    exit(0);
	else if (pid < 0)
	    exit(1);

	umask(027);

        signal(SIGTSTP, SIG_IGN);
        signal(SIGTTOU, SIG_IGN);
        signal(SIGTTIN, SIG_IGN);
    }
#endif

    if (pid_file && qemu_create_pidfile(pid_file) != 0) {
#ifndef _WIN32
        if (daemonize) {
            uint8_t status = 1;
            if (write(fds[1], &status, 1) != 1) {
                perror("daemonize. Writing to pipe\n");
            }
        } else
#endif
            fprintf(stderr, "Could not acquire pid file: %s\n", strerror(errno));
        exit(1);
    }

    if (kvm_allowed) {
        int ret = kvm_init(smp_cpus);
        if (ret < 0) {
            if (!kvm_available()) {
                printf("KVM not supported for this target\n");
            } else {
                fprintf(stderr, "failed to initialize KVM: %s\n", strerror(-ret));
            }
            exit(1);
        }
    }

    if (qemu_init_main_loop()) {
        fprintf(stderr, "qemu_init_main_loop failed\n");
        exit(1);
    }
    linux_boot = (kernel_filename != NULL);

    if (!linux_boot && *kernel_cmdline != '\0') {
        fprintf(stderr, "-append only allowed with -kernel option\n");
        exit(1);
    }

    if (!linux_boot && initrd_filename != NULL) {
        fprintf(stderr, "-initrd only allowed with -kernel option\n");
        exit(1);
    }

#ifndef _WIN32
    /* Win32 doesn't support line-buffering and requires size >= 2 */
    setvbuf(stdout, NULL, _IOLBF, 0);
#endif

    if (init_timer_alarm() < 0) {
        fprintf(stderr, "could not initialize alarm timer\n");
        exit(1);
    }
    configure_icount(icount_option);

    socket_init();

    if (net_init_clients() < 0) {
        exit(1);
    }

    /* init the bluetooth world */
    if (foreach_device_config(DEV_BT, bt_parse))
        exit(1);

    /* init the memory */
    if (ram_size == 0)
        ram_size = DEFAULT_RAM_SIZE * 1024 * 1024;

    /* init the dynamic translator */
#ifdef CONFIG_COREMU
    cm_cpu_exec_init();
#else
    cpu_exec_init_all(tb_size * 1024 * 1024);
#endif

    bdrv_init_with_whitelist();

    blk_mig_init();

    if (default_cdrom) {
        /* we always create the cdrom drive, even if no disk is there */
        drive_add(NULL, CDROM_ALIAS);
    }

    if (default_floppy) {
        /* we always create at least one floppy */
        drive_add(NULL, FD_ALIAS, 0);
    }

    if (default_sdcard) {
        /* we always create one sd slot, even if no card is in it */
        drive_add(NULL, SD_ALIAS);
    }

    /* open the virtual block devices */
    if (snapshot)
        qemu_opts_foreach(&qemu_drive_opts, drive_enable_snapshot, NULL, 0);
    if (qemu_opts_foreach(&qemu_drive_opts, drive_init_func, machine, 1) != 0)
        exit(1);

    register_savevm_live("ram", 0, 3, NULL, ram_save_live, NULL, 
                         ram_load, NULL);

    if (nb_numa_nodes > 0) {
        int i;

        if (nb_numa_nodes > smp_cpus) {
            nb_numa_nodes = smp_cpus;
        }

        /* If no memory size if given for any node, assume the default case
         * and distribute the available memory equally across all nodes
         */
        for (i = 0; i < nb_numa_nodes; i++) {
            if (node_mem[i] != 0)
                break;
        }
        if (i == nb_numa_nodes) {
            uint64_t usedmem = 0;

            /* On Linux, the each node's border has to be 8MB aligned,
             * the final node gets the rest.
             */
            for (i = 0; i < nb_numa_nodes - 1; i++) {
                node_mem[i] = (ram_size / nb_numa_nodes) & ~((1 << 23UL) - 1);
                usedmem += node_mem[i];
            }
            node_mem[i] = ram_size - usedmem;
        }

        for (i = 0; i < nb_numa_nodes; i++) {
            if (node_cpumask[i] != 0)
                break;
        }
        /* assigning the VCPUs round-robin is easier to implement, guest OSes
         * must cope with this anyway, because there are BIOSes out there in
         * real machines which also use this scheme.
         */
        if (i == nb_numa_nodes) {
            for (i = 0; i < smp_cpus; i++) {
                node_cpumask[i % nb_numa_nodes] |= 1 << i;
            }
        }
    }

    if (qemu_opts_foreach(&qemu_mon_opts, mon_init_func, NULL, 1) != 0) {
        exit(1);
    }

    if (foreach_device_config(DEV_SERIAL, serial_parse) < 0)
        exit(1);
    if (foreach_device_config(DEV_PARALLEL, parallel_parse) < 0)
        exit(1);
    if (foreach_device_config(DEV_VIRTCON, virtcon_parse) < 0)
        exit(1);
    if (foreach_device_config(DEV_DEBUGCON, debugcon_parse) < 0)
        exit(1);

    module_call_init(MODULE_INIT_DEVICE);

    if (qemu_opts_foreach(&qemu_device_opts, device_help_func, NULL, 0) != 0)
        exit(0);

    if (watchdog) {
        i = select_watchdog(watchdog);
        if (i > 0)
            exit (i == 1 ? 1 : 0);
    }

    if (machine->compat_props) {
        qdev_prop_register_global_list(machine->compat_props);
    }
    qemu_add_globals();

    machine->init(ram_size, boot_devices,
                  kernel_filename, kernel_cmdline, initrd_filename, cpu_model);

    cpu_synchronize_all_post_init();

#ifndef _WIN32
    /* must be after terminal init, SDL library changes signal handlers */
    sighandler_setup();
#endif

    set_numa_modes();

    current_machine = machine;

    /* init USB devices */
    if (usb_enabled) {
        if (foreach_device_config(DEV_USB, usb_parse) < 0)
            exit(1);
    }

    /* init generic devices */
    if (qemu_opts_foreach(&qemu_device_opts, device_init_func, NULL, 1) != 0)
        exit(1);

    net_check_clients();

    /* just use the first displaystate for the moment */
    ds = get_displaystate();

    if (display_type == DT_DEFAULT) {
#if defined(CONFIG_SDL) || defined(CONFIG_COCOA)
        display_type = DT_SDL;
#else
        display_type = DT_VNC;
        vnc_display = "localhost:0,to=99";
        show_vnc_port = 1;
#endif
    }
        

    switch (display_type) {
    case DT_NOGRAPHIC:
        break;
#if defined(CONFIG_CURSES)
    case DT_CURSES:
        curses_display_init(ds, full_screen);
        break;
#endif
#if defined(CONFIG_SDL)
    case DT_SDL:
        sdl_display_init(ds, full_screen, no_frame);
        break;
#elif defined(CONFIG_COCOA)
    case DT_SDL:
        cocoa_display_init(ds, full_screen);
        break;
#endif
    case DT_VNC:
        vnc_display_init(ds);
        if (vnc_display_open(ds, vnc_display) < 0)
            exit(1);

        if (show_vnc_port) {
            printf("VNC server running on `%s'\n", vnc_display_local_addr(ds));
        }
        break;
    default:
        break;
    }
    dpy_resize(ds);

    dcl = ds->listeners;
    while (dcl != NULL) {
        if (dcl->dpy_refresh != NULL) {
            ds->gui_timer = qemu_new_timer(rt_clock, gui_update, ds);
            qemu_mod_timer(ds->gui_timer, qemu_get_clock(rt_clock));
        }
        dcl = dcl->next;
    }

    if (display_type == DT_NOGRAPHIC || display_type == DT_VNC) {
        nographic_timer = qemu_new_timer(rt_clock, nographic_update, NULL);
        qemu_mod_timer(nographic_timer, qemu_get_clock(rt_clock));
    }

    text_consoles_set_display(ds);

    if (gdbstub_dev && gdbserver_start(gdbstub_dev) < 0) {
        fprintf(stderr, "qemu: could not open gdbserver on device '%s'\n",
                gdbstub_dev);
        exit(1);
    }

    qdev_machine_creation_done();

    if (rom_load_all() != 0) {
        fprintf(stderr, "rom loading failed\n");
        exit(1);
    }

    qemu_system_reset();
    if (loadvm) {
        if (load_vmstate(loadvm) < 0) {
            autostart = 0;
        }
    }

    if (incoming) {
        qemu_start_incoming_migration(incoming);
    } else if (autostart) {
        vm_start();
    }

#ifndef _WIN32
    if (daemonize) {
	uint8_t status = 0;
	ssize_t len;

    again1:
	len = write(fds[1], &status, 1);
	if (len == -1 && (errno == EINTR))
	    goto again1;

	if (len != 1)
	    exit(1);

        if (chdir("/")) {
            perror("not able to chdir to /");
            exit(1);
        }
	TFR(fd = qemu_open("/dev/null", O_RDWR));
	if (fd == -1)
	    exit(1);
    }

    if (run_as) {
        pwd = getpwnam(run_as);
        if (!pwd) {
            fprintf(stderr, "User \"%s\" doesn't exist\n", run_as);
            exit(1);
        }
    }

    if (chroot_dir) {
        if (chroot(chroot_dir) < 0) {
            fprintf(stderr, "chroot failed\n");
            exit(1);
        }
        if (chdir("/")) {
            perror("not able to chdir to /");
            exit(1);
        }
    }

    if (run_as) {
        if (setgid(pwd->pw_gid) < 0) {
            fprintf(stderr, "Failed to setgid(%d)\n", pwd->pw_gid);
            exit(1);
        }
        if (setuid(pwd->pw_uid) < 0) {
            fprintf(stderr, "Failed to setuid(%d)\n", pwd->pw_uid);
            exit(1);
        }
        if (setuid(0) != -1) {
            fprintf(stderr, "Dropping privileges failed\n");
            exit(1);
        }
    }

    if (daemonize) {
        dup2(fd, 0);
        dup2(fd, 1);
        dup2(fd, 2);

        close(fd);
    }
#endif

    main_loop();
    quit_timers();
    net_cleanup();

    return 0;
}

#ifdef CONFIG_COREMU
int cm_vm_can_run(void)
{
    return vm_can_run();
}
#endif
