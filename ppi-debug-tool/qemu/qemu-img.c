/*
 * QEMU disk image utility
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
#include "qemu-common.h"
#include "qemu-option.h"
#include "osdep.h"
#include "block_int.h"
#include <stdio.h>

#ifdef _WIN32
#include <windows.h>
#endif

typedef struct img_cmd_t {
    const char *name;
    int (*handler)(int argc, char **argv);
} img_cmd_t;

/* Default to cache=writeback as data integrity is not important for qemu-tcg. */
#define BDRV_O_FLAGS BDRV_O_CACHE_WB

static void QEMU_NORETURN error(const char *fmt, ...)
{
    va_list ap;
    va_start(ap, fmt);
    fprintf(stderr, "qemu-img: ");
    vfprintf(stderr, fmt, ap);
    fprintf(stderr, "\n");
    exit(1);
    va_end(ap);
}

static void format_print(void *opaque, const char *name)
{
    printf(" %s", name);
}

/* Please keep in synch with qemu-img.texi */
static void help(void)
{
    const char *help_msg =
           "qemu-img version " QEMU_VERSION ", Copyright (c) 2004-2008 Fabrice Bellard\n"
           "usage: qemu-img command [command options]\n"
           "QEMU disk image utility\n"
           "\n"
           "Command syntax:\n"
#define DEF(option, callback, arg_string)        \
           "  " arg_string "\n"
#include "qemu-img-cmds.h"
#undef DEF
#undef GEN_DOCS
           "\n"
           "Command parameters:\n"
           "  'filename' is a disk image filename\n"
           "  'fmt' is the disk image format. It is guessed automatically in most cases\n"
           "  'size' is the disk image size in bytes. Optional suffixes\n"
           "    'k' or 'K' (kilobyte, 1024), 'M' (megabyte, 1024k), 'G' (gigabyte, 1024M)\n"
           "    and T (terabyte, 1024G) are supported. 'b' is ignored.\n"
           "  'output_filename' is the destination disk image filename\n"
           "  'output_fmt' is the destination format\n"
           "  'options' is a comma separated list of format specific options in a\n"
           "    name=value format. Use -o ? for an overview of the options supported by the\n"
           "    used format\n"
           "  '-c' indicates that target image must be compressed (qcow format only)\n"
           "  '-u' enables unsafe rebasing. It is assumed that old and new backing file\n"
           "       match exactly. The image doesn't need a working backing file before\n"
           "       rebasing in this case (useful for renaming the backing file)\n"
           "  '-h' with or without a command shows this help and lists the supported formats\n"
           "\n"
           "Parameters to snapshot subcommand:\n"
           "  'snapshot' is the name of the snapshot to create, apply or delete\n"
           "  '-a' applies a snapshot (revert disk to saved state)\n"
           "  '-c' creates a snapshot\n"
           "  '-d' deletes a snapshot\n"
           "  '-l' lists all snapshots in the given image\n";

    printf("%s\nSupported formats:", help_msg);
    bdrv_iterate_format(format_print, NULL);
    printf("\n");
    exit(1);
}

#if defined(WIN32)
/* XXX: put correct support for win32 */
static int read_password(char *buf, int buf_size)
{
    int c, i;
    printf("Password: ");
    fflush(stdout);
    i = 0;
    for(;;) {
        c = getchar();
        if (c == '\n')
            break;
        if (i < (buf_size - 1))
            buf[i++] = c;
    }
    buf[i] = '\0';
    return 0;
}

#else

#include <termios.h>

static struct termios oldtty;

static void term_exit(void)
{
    tcsetattr (0, TCSANOW, &oldtty);
}

static void term_init(void)
{
    struct termios tty;

    tcgetattr (0, &tty);
    oldtty = tty;

    tty.c_iflag &= ~(IGNBRK|BRKINT|PARMRK|ISTRIP
                          |INLCR|IGNCR|ICRNL|IXON);
    tty.c_oflag |= OPOST;
    tty.c_lflag &= ~(ECHO|ECHONL|ICANON|IEXTEN);
    tty.c_cflag &= ~(CSIZE|PARENB);
    tty.c_cflag |= CS8;
    tty.c_cc[VMIN] = 1;
    tty.c_cc[VTIME] = 0;

    tcsetattr (0, TCSANOW, &tty);

    atexit(term_exit);
}

static int read_password(char *buf, int buf_size)
{
    uint8_t ch;
    int i, ret;

    printf("password: ");
    fflush(stdout);
    term_init();
    i = 0;
    for(;;) {
        ret = read(0, &ch, 1);
        if (ret == -1) {
            if (errno == EAGAIN || errno == EINTR) {
                continue;
            } else {
                ret = -1;
                break;
            }
        } else if (ret == 0) {
            ret = -1;
            break;
        } else {
            if (ch == '\r') {
                ret = 0;
                break;
            }
            if (i < (buf_size - 1))
                buf[i++] = ch;
        }
    }
    term_exit();
    buf[i] = '\0';
    printf("\n");
    return ret;
}
#endif

static BlockDriverState *bdrv_new_open(const char *filename,
                                       const char *fmt,
                                       int flags)
{
    BlockDriverState *bs;
    BlockDriver *drv;
    char password[256];

    bs = bdrv_new("");
    if (!bs)
        error("Not enough memory");
    if (fmt) {
        drv = bdrv_find_format(fmt);
        if (!drv)
            error("Unknown file format '%s'", fmt);
    } else {
        drv = NULL;
    }
    if (bdrv_open(bs, filename, flags, drv) < 0) {
        error("Could not open '%s'", filename);
    }
    if (bdrv_is_encrypted(bs)) {
        printf("Disk image '%s' is encrypted.\n", filename);
        if (read_password(password, sizeof(password)) < 0)
            error("No password given");
        if (bdrv_set_key(bs, password) < 0)
            error("invalid password");
    }
    return bs;
}

static void add_old_style_options(const char *fmt, QEMUOptionParameter *list,
    int flags, const char *base_filename, const char *base_fmt)
{
    if (flags & BLOCK_FLAG_ENCRYPT) {
        if (set_option_parameter(list, BLOCK_OPT_ENCRYPT, "on")) {
            error("Encryption not supported for file format '%s'", fmt);
        }
    }
    if (flags & BLOCK_FLAG_COMPAT6) {
        if (set_option_parameter(list, BLOCK_OPT_COMPAT6, "on")) {
            error("VMDK version 6 not supported for file format '%s'", fmt);
        }
    }

    if (base_filename) {
        if (set_option_parameter(list, BLOCK_OPT_BACKING_FILE, base_filename)) {
            error("Backing file not supported for file format '%s'", fmt);
        }
    }
    if (base_fmt) {
        if (set_option_parameter(list, BLOCK_OPT_BACKING_FMT, base_fmt)) {
            error("Backing file format not supported for file format '%s'", fmt);
        }
    }
}

static int img_create(int argc, char **argv)
{
    int c, ret, flags;
    const char *fmt = "raw";
    const char *base_fmt = NULL;
    const char *filename;
    const char *base_filename = NULL;
    BlockDriver *drv;
    QEMUOptionParameter *param = NULL;
    char *options = NULL;

    flags = 0;
    for(;;) {
        c = getopt(argc, argv, "F:b:f:he6o:");
        if (c == -1)
            break;
        switch(c) {
        case 'h':
            help();
            break;
        case 'F':
            base_fmt = optarg;
            break;
        case 'b':
            base_filename = optarg;
            break;
        case 'f':
            fmt = optarg;
            break;
        case 'e':
            flags |= BLOCK_FLAG_ENCRYPT;
            break;
        case '6':
            flags |= BLOCK_FLAG_COMPAT6;
            break;
        case 'o':
            options = optarg;
            break;
        }
    }

    /* Find driver and parse its options */
    drv = bdrv_find_format(fmt);
    if (!drv)
        error("Unknown file format '%s'", fmt);

    if (options && !strcmp(options, "?")) {
        print_option_help(drv->create_options);
        return 0;
    }

    /* Create parameter list with default values */
    param = parse_option_parameters("", drv->create_options, param);
    set_option_parameter_int(param, BLOCK_OPT_SIZE, -1);

    /* Parse -o options */
    if (options) {
        param = parse_option_parameters(options, drv->create_options, param);
        if (param == NULL) {
            error("Invalid options for file format '%s'.", fmt);
        }
    }

    /* Get the filename */
    if (optind >= argc)
        help();
    filename = argv[optind++];

    /* Add size to parameters */
    if (optind < argc) {
        set_option_parameter(param, BLOCK_OPT_SIZE, argv[optind++]);
    }

    /* Add old-style options to parameters */
    add_old_style_options(fmt, param, flags, base_filename, base_fmt);

    // The size for the image must always be specified, with one exception:
    // If we are using a backing file, we can obtain the size from there
    if (get_option_parameter(param, BLOCK_OPT_SIZE)->value.n == -1) {

        QEMUOptionParameter *backing_file =
            get_option_parameter(param, BLOCK_OPT_BACKING_FILE);
        QEMUOptionParameter *backing_fmt =
            get_option_parameter(param, BLOCK_OPT_BACKING_FMT);

        if (backing_file && backing_file->value.s) {
            BlockDriverState *bs;
            uint64_t size;
            const char *fmt = NULL;
            char buf[32];

            if (backing_fmt && backing_fmt->value.s) {
                 if (bdrv_find_format(backing_fmt->value.s)) {
                     fmt = backing_fmt->value.s;
                } else {
                     error("Unknown backing file format '%s'",
                        backing_fmt->value.s);
                }
            }

            bs = bdrv_new_open(backing_file->value.s, fmt, BDRV_O_FLAGS);
            bdrv_get_geometry(bs, &size);
            size *= 512;
            bdrv_delete(bs);

            snprintf(buf, sizeof(buf), "%" PRId64, size);
            set_option_parameter(param, BLOCK_OPT_SIZE, buf);
        } else {
            error("Image creation needs a size parameter");
        }
    }

    printf("Formatting '%s', fmt=%s ", filename, fmt);
    print_option_parameters(param);
    puts("");

    ret = bdrv_create(drv, filename, param);
    free_option_parameters(param);

    if (ret < 0) {
        if (ret == -ENOTSUP) {
            error("Formatting or formatting option not supported for file format '%s'", fmt);
        } else if (ret == -EFBIG) {
            error("The image size is too large for file format '%s'", fmt);
        } else {
            error("%s: error while creating %s: %s", filename, fmt, strerror(-ret));
        }
    }
    return 0;
}

static int img_check(int argc, char **argv)
{
    int c, ret;
    const char *filename, *fmt;
    BlockDriverState *bs;

    fmt = NULL;
    for(;;) {
        c = getopt(argc, argv, "f:h");
        if (c == -1)
            break;
        switch(c) {
        case 'h':
            help();
            break;
        case 'f':
            fmt = optarg;
            break;
        }
    }
    if (optind >= argc)
        help();
    filename = argv[optind++];

    bs = bdrv_new_open(filename, fmt, BDRV_O_FLAGS);
    ret = bdrv_check(bs);
    switch(ret) {
    case 0:
        printf("No errors were found on the image.\n");
        break;
    case -ENOTSUP:
        error("This image format does not support checks");
        break;
    default:
        if (ret < 0) {
            error("An error occurred during the check");
        } else {
            printf("%d errors were found on the image.\n", ret);
        }
        break;
    }

    bdrv_delete(bs);
    return 0;
}

static int img_commit(int argc, char **argv)
{
    int c, ret;
    const char *filename, *fmt;
    BlockDriverState *bs;

    fmt = NULL;
    for(;;) {
        c = getopt(argc, argv, "f:h");
        if (c == -1)
            break;
        switch(c) {
        case 'h':
            help();
            break;
        case 'f':
            fmt = optarg;
            break;
        }
    }
    if (optind >= argc)
        help();
    filename = argv[optind++];

    bs = bdrv_new_open(filename, fmt, BDRV_O_FLAGS | BDRV_O_RDWR);
    ret = bdrv_commit(bs);
    switch(ret) {
    case 0:
        printf("Image committed.\n");
        break;
    case -ENOENT:
        error("No disk inserted");
        break;
    case -EACCES:
        error("Image is read-only");
        break;
    case -ENOTSUP:
        error("Image is already committed");
        break;
    default:
        error("Error while committing image");
        break;
    }

    bdrv_delete(bs);
    return 0;
}

static int is_not_zero(const uint8_t *sector, int len)
{
    int i;
    len >>= 2;
    for(i = 0;i < len; i++) {
        if (((uint32_t *)sector)[i] != 0)
            return 1;
    }
    return 0;
}

/*
 * Returns true iff the first sector pointed to by 'buf' contains at least
 * a non-NUL byte.
 *
 * 'pnum' is set to the number of sectors (including and immediately following
 * the first one) that are known to be in the same allocated/unallocated state.
 */
static int is_allocated_sectors(const uint8_t *buf, int n, int *pnum)
{
    int v, i;

    if (n <= 0) {
        *pnum = 0;
        return 0;
    }
    v = is_not_zero(buf, 512);
    for(i = 1; i < n; i++) {
        buf += 512;
        if (v != is_not_zero(buf, 512))
            break;
    }
    *pnum = i;
    return v;
}

/*
 * Compares two buffers sector by sector. Returns 0 if the first sector of both
 * buffers matches, non-zero otherwise.
 *
 * pnum is set to the number of sectors (including and immediately following
 * the first one) that are known to have the same comparison result
 */
static int compare_sectors(const uint8_t *buf1, const uint8_t *buf2, int n,
    int *pnum)
{
    int res, i;

    if (n <= 0) {
        *pnum = 0;
        return 0;
    }

    res = !!memcmp(buf1, buf2, 512);
    for(i = 1; i < n; i++) {
        buf1 += 512;
        buf2 += 512;

        if (!!memcmp(buf1, buf2, 512) != res) {
            break;
        }
    }

    *pnum = i;
    return res;
}

#define IO_BUF_SIZE (2 * 1024 * 1024)

static int img_convert(int argc, char **argv)
{
    int c, ret, n, n1, bs_n, bs_i, flags, cluster_size, cluster_sectors;
    const char *fmt, *out_fmt, *out_baseimg, *out_filename;
    BlockDriver *drv;
    BlockDriverState **bs, *out_bs;
    int64_t total_sectors, nb_sectors, sector_num, bs_offset;
    uint64_t bs_sectors;
    uint8_t * buf;
    const uint8_t *buf1;
    BlockDriverInfo bdi;
    QEMUOptionParameter *param = NULL;
    char *options = NULL;

    fmt = NULL;
    out_fmt = "raw";
    out_baseimg = NULL;
    flags = 0;
    for(;;) {
        c = getopt(argc, argv, "f:O:B:hce6o:");
        if (c == -1)
            break;
        switch(c) {
        case 'h':
            help();
            break;
        case 'f':
            fmt = optarg;
            break;
        case 'O':
            out_fmt = optarg;
            break;
        case 'B':
            out_baseimg = optarg;
            break;
        case 'c':
            flags |= BLOCK_FLAG_COMPRESS;
            break;
        case 'e':
            flags |= BLOCK_FLAG_ENCRYPT;
            break;
        case '6':
            flags |= BLOCK_FLAG_COMPAT6;
            break;
        case 'o':
            options = optarg;
            break;
        }
    }

    bs_n = argc - optind - 1;
    if (bs_n < 1) help();

    out_filename = argv[argc - 1];

    if (bs_n > 1 && out_baseimg)
        error("-B makes no sense when concatenating multiple input images");
        
    bs = calloc(bs_n, sizeof(BlockDriverState *));
    if (!bs)
        error("Out of memory");

    total_sectors = 0;
    for (bs_i = 0; bs_i < bs_n; bs_i++) {
        bs[bs_i] = bdrv_new_open(argv[optind + bs_i], fmt, BDRV_O_FLAGS);
        if (!bs[bs_i])
            error("Could not open '%s'", argv[optind + bs_i]);
        bdrv_get_geometry(bs[bs_i], &bs_sectors);
        total_sectors += bs_sectors;
    }

    /* Find driver and parse its options */
    drv = bdrv_find_format(out_fmt);
    if (!drv)
        error("Unknown file format '%s'", out_fmt);

    if (options && !strcmp(options, "?")) {
        print_option_help(drv->create_options);
        free(bs);
        return 0;
    }

    if (options) {
        param = parse_option_parameters(options, drv->create_options, param);
        if (param == NULL) {
            error("Invalid options for file format '%s'.", out_fmt);
        }
    } else {
        param = parse_option_parameters("", drv->create_options, param);
    }

    set_option_parameter_int(param, BLOCK_OPT_SIZE, total_sectors * 512);
    add_old_style_options(out_fmt, param, flags, out_baseimg, NULL);

    /* Check if compression is supported */
    if (flags & BLOCK_FLAG_COMPRESS) {
        QEMUOptionParameter *encryption =
            get_option_parameter(param, BLOCK_OPT_ENCRYPT);

        if (!drv->bdrv_write_compressed) {
            error("Compression not supported for this file format");
        }

        if (encryption && encryption->value.n) {
            error("Compression and encryption not supported at the same time");
        }
    }

    /* Create the new image */
    ret = bdrv_create(drv, out_filename, param);
    free_option_parameters(param);

    if (ret < 0) {
        if (ret == -ENOTSUP) {
            error("Formatting not supported for file format '%s'", out_fmt);
        } else if (ret == -EFBIG) {
            error("The image size is too large for file format '%s'", out_fmt);
        } else {
            error("%s: error while converting %s: %s", out_filename, out_fmt, strerror(-ret));
        }
    }

    out_bs = bdrv_new_open(out_filename, out_fmt, BDRV_O_FLAGS | BDRV_O_RDWR);

    bs_i = 0;
    bs_offset = 0;
    bdrv_get_geometry(bs[0], &bs_sectors);
    buf = qemu_malloc(IO_BUF_SIZE);

    if (flags & BLOCK_FLAG_COMPRESS) {
        if (bdrv_get_info(out_bs, &bdi) < 0)
            error("could not get block driver info");
        cluster_size = bdi.cluster_size;
        if (cluster_size <= 0 || cluster_size > IO_BUF_SIZE)
            error("invalid cluster size");
        cluster_sectors = cluster_size >> 9;
        sector_num = 0;
        for(;;) {
            int64_t bs_num;
            int remainder;
            uint8_t *buf2;

            nb_sectors = total_sectors - sector_num;
            if (nb_sectors <= 0)
                break;
            if (nb_sectors >= cluster_sectors)
                n = cluster_sectors;
            else
                n = nb_sectors;

            bs_num = sector_num - bs_offset;
            assert (bs_num >= 0);
            remainder = n;
            buf2 = buf;
            while (remainder > 0) {
                int nlow;
                while (bs_num == bs_sectors) {
                    bs_i++;
                    assert (bs_i < bs_n);
                    bs_offset += bs_sectors;
                    bdrv_get_geometry(bs[bs_i], &bs_sectors);
                    bs_num = 0;
                    /* printf("changing part: sector_num=%lld, "
                       "bs_i=%d, bs_offset=%lld, bs_sectors=%lld\n",
                       sector_num, bs_i, bs_offset, bs_sectors); */
                }
                assert (bs_num < bs_sectors);

                nlow = (remainder > bs_sectors - bs_num) ? bs_sectors - bs_num : remainder;

                if (bdrv_read(bs[bs_i], bs_num, buf2, nlow) < 0) 
                    error("error while reading");

                buf2 += nlow * 512;
                bs_num += nlow;

                remainder -= nlow;
            }
            assert (remainder == 0);

            if (n < cluster_sectors)
                memset(buf + n * 512, 0, cluster_size - n * 512);
            if (is_not_zero(buf, cluster_size)) {
                if (bdrv_write_compressed(out_bs, sector_num, buf,
                                          cluster_sectors) != 0)
                    error("error while compressing sector %" PRId64,
                          sector_num);
            }
            sector_num += n;
        }
        /* signal EOF to align */
        bdrv_write_compressed(out_bs, 0, NULL, 0);
    } else {
        int has_zero_init = bdrv_has_zero_init(out_bs);

        sector_num = 0; // total number of sectors converted so far
        for(;;) {
            nb_sectors = total_sectors - sector_num;
            if (nb_sectors <= 0)
                break;
            if (nb_sectors >= (IO_BUF_SIZE / 512))
                n = (IO_BUF_SIZE / 512);
            else
                n = nb_sectors;

            while (sector_num - bs_offset >= bs_sectors) {
                bs_i ++;
                assert (bs_i < bs_n);
                bs_offset += bs_sectors;
                bdrv_get_geometry(bs[bs_i], &bs_sectors);
                /* printf("changing part: sector_num=%lld, bs_i=%d, "
                  "bs_offset=%lld, bs_sectors=%lld\n",
                   sector_num, bs_i, bs_offset, bs_sectors); */
            }

            if (n > bs_offset + bs_sectors - sector_num)
                n = bs_offset + bs_sectors - sector_num;

            if (has_zero_init) {
                /* If the output image is being created as a copy on write image,
                   assume that sectors which are unallocated in the input image
                   are present in both the output's and input's base images (no
                   need to copy them). */
                if (out_baseimg) {
                    if (!bdrv_is_allocated(bs[bs_i], sector_num - bs_offset,
                                           n, &n1)) {
                        sector_num += n1;
                        continue;
                    }
                    /* The next 'n1' sectors are allocated in the input image. Copy
                       only those as they may be followed by unallocated sectors. */
                    n = n1;
                }
            } else {
                n1 = n;
            }

            if (bdrv_read(bs[bs_i], sector_num - bs_offset, buf, n) < 0) 
                error("error while reading");
            /* NOTE: at the same time we convert, we do not write zero
               sectors to have a chance to compress the image. Ideally, we
               should add a specific call to have the info to go faster */
            buf1 = buf;
            while (n > 0) {
                /* If the output image is being created as a copy on write image,
                   copy all sectors even the ones containing only NUL bytes,
                   because they may differ from the sectors in the base image.

                   If the output is to a host device, we also write out
                   sectors that are entirely 0, since whatever data was
                   already there is garbage, not 0s. */
                if (!has_zero_init || out_baseimg ||
                    is_allocated_sectors(buf1, n, &n1)) {
                    if (bdrv_write(out_bs, sector_num, buf1, n1) < 0)
                        error("error while writing");
                }
                sector_num += n1;
                n -= n1;
                buf1 += n1 * 512;
            }
        }
    }
    qemu_free(buf);
    bdrv_delete(out_bs);
    for (bs_i = 0; bs_i < bs_n; bs_i++)
        bdrv_delete(bs[bs_i]);
    free(bs);
    return 0;
}

#ifdef _WIN32
static int64_t get_allocated_file_size(const char *filename)
{
    typedef DWORD (WINAPI * get_compressed_t)(const char *filename, DWORD *high);
    get_compressed_t get_compressed;
    struct _stati64 st;

    /* WinNT support GetCompressedFileSize to determine allocate size */
    get_compressed = (get_compressed_t) GetProcAddress(GetModuleHandle("kernel32"), "GetCompressedFileSizeA");
    if (get_compressed) {
    	DWORD high, low;
    	low = get_compressed(filename, &high);
    	if (low != 0xFFFFFFFFlu || GetLastError() == NO_ERROR)
	    return (((int64_t) high) << 32) + low;
    }

    if (_stati64(filename, &st) < 0)
        return -1;
    return st.st_size;
}
#else
static int64_t get_allocated_file_size(const char *filename)
{
    struct stat st;
    if (stat(filename, &st) < 0)
        return -1;
    return (int64_t)st.st_blocks * 512;
}
#endif

static void dump_snapshots(BlockDriverState *bs)
{
    QEMUSnapshotInfo *sn_tab, *sn;
    int nb_sns, i;
    char buf[256];

    nb_sns = bdrv_snapshot_list(bs, &sn_tab);
    if (nb_sns <= 0)
        return;
    printf("Snapshot list:\n");
    printf("%s\n", bdrv_snapshot_dump(buf, sizeof(buf), NULL));
    for(i = 0; i < nb_sns; i++) {
        sn = &sn_tab[i];
        printf("%s\n", bdrv_snapshot_dump(buf, sizeof(buf), sn));
    }
    qemu_free(sn_tab);
}

static int img_info(int argc, char **argv)
{
    int c;
    const char *filename, *fmt;
    BlockDriverState *bs;
    char fmt_name[128], size_buf[128], dsize_buf[128];
    uint64_t total_sectors;
    int64_t allocated_size;
    char backing_filename[1024];
    char backing_filename2[1024];
    BlockDriverInfo bdi;

    fmt = NULL;
    for(;;) {
        c = getopt(argc, argv, "f:h");
        if (c == -1)
            break;
        switch(c) {
        case 'h':
            help();
            break;
        case 'f':
            fmt = optarg;
            break;
        }
    }
    if (optind >= argc)
        help();
    filename = argv[optind++];

    bs = bdrv_new_open(filename, fmt, BDRV_O_FLAGS | BDRV_O_NO_BACKING);
    bdrv_get_format(bs, fmt_name, sizeof(fmt_name));
    bdrv_get_geometry(bs, &total_sectors);
    get_human_readable_size(size_buf, sizeof(size_buf), total_sectors * 512);
    allocated_size = get_allocated_file_size(filename);
    if (allocated_size < 0)
        snprintf(dsize_buf, sizeof(dsize_buf), "unavailable");
    else
        get_human_readable_size(dsize_buf, sizeof(dsize_buf),
                                allocated_size);
    printf("image: %s\n"
           "file format: %s\n"
           "virtual size: %s (%" PRId64 " bytes)\n"
           "disk size: %s\n",
           filename, fmt_name, size_buf,
           (total_sectors * 512),
           dsize_buf);
    if (bdrv_is_encrypted(bs))
        printf("encrypted: yes\n");
    if (bdrv_get_info(bs, &bdi) >= 0) {
        if (bdi.cluster_size != 0)
            printf("cluster_size: %d\n", bdi.cluster_size);
    }
    bdrv_get_backing_filename(bs, backing_filename, sizeof(backing_filename));
    if (backing_filename[0] != '\0') {
        path_combine(backing_filename2, sizeof(backing_filename2),
                     filename, backing_filename);
        printf("backing file: %s (actual path: %s)\n",
               backing_filename,
               backing_filename2);
    }
    dump_snapshots(bs);
    bdrv_delete(bs);
    return 0;
}

#define SNAPSHOT_LIST   1
#define SNAPSHOT_CREATE 2
#define SNAPSHOT_APPLY  3
#define SNAPSHOT_DELETE 4

static int img_snapshot(int argc, char **argv)
{
    BlockDriverState *bs;
    QEMUSnapshotInfo sn;
    char *filename, *snapshot_name = NULL;
    int c, ret, bdrv_oflags;
    int action = 0;
    qemu_timeval tv;

    bdrv_oflags = BDRV_O_RDWR;
    /* Parse commandline parameters */
    for(;;) {
        c = getopt(argc, argv, "la:c:d:h");
        if (c == -1)
            break;
        switch(c) {
        case 'h':
            help();
            return 0;
        case 'l':
            if (action) {
                help();
                return 0;
            }
            action = SNAPSHOT_LIST;
            bdrv_oflags &= ~BDRV_O_RDWR; /* no need for RW */
            break;
        case 'a':
            if (action) {
                help();
                return 0;
            }
            action = SNAPSHOT_APPLY;
            snapshot_name = optarg;
            break;
        case 'c':
            if (action) {
                help();
                return 0;
            }
            action = SNAPSHOT_CREATE;
            snapshot_name = optarg;
            break;
        case 'd':
            if (action) {
                help();
                return 0;
            }
            action = SNAPSHOT_DELETE;
            snapshot_name = optarg;
            break;
        }
    }

    if (optind >= argc)
        help();
    filename = argv[optind++];

    /* Open the image */
    bs = bdrv_new_open(filename, NULL, bdrv_oflags);

    /* Perform the requested action */
    switch(action) {
    case SNAPSHOT_LIST:
        dump_snapshots(bs);
        break;

    case SNAPSHOT_CREATE:
        memset(&sn, 0, sizeof(sn));
        pstrcpy(sn.name, sizeof(sn.name), snapshot_name);

        qemu_gettimeofday(&tv);
        sn.date_sec = tv.tv_sec;
        sn.date_nsec = tv.tv_usec * 1000;

        ret = bdrv_snapshot_create(bs, &sn);
        if (ret)
            error("Could not create snapshot '%s': %d (%s)",
                snapshot_name, ret, strerror(-ret));
        break;

    case SNAPSHOT_APPLY:
        ret = bdrv_snapshot_goto(bs, snapshot_name);
        if (ret)
            error("Could not apply snapshot '%s': %d (%s)",
                snapshot_name, ret, strerror(-ret));
        break;

    case SNAPSHOT_DELETE:
        ret = bdrv_snapshot_delete(bs, snapshot_name);
        if (ret)
            error("Could not delete snapshot '%s': %d (%s)",
                snapshot_name, ret, strerror(-ret));
        break;
    }

    /* Cleanup */
    bdrv_delete(bs);

    return 0;
}

static int img_rebase(int argc, char **argv)
{
    BlockDriverState *bs, *bs_old_backing, *bs_new_backing;
    BlockDriver *old_backing_drv, *new_backing_drv;
    char *filename;
    const char *fmt, *out_basefmt, *out_baseimg;
    int c, flags, ret;
    int unsafe = 0;

    /* Parse commandline parameters */
    fmt = NULL;
    out_baseimg = NULL;
    out_basefmt = NULL;

    for(;;) {
        c = getopt(argc, argv, "uhf:F:b:");
        if (c == -1)
            break;
        switch(c) {
        case 'h':
            help();
            return 0;
        case 'f':
            fmt = optarg;
            break;
        case 'F':
            out_basefmt = optarg;
            break;
        case 'b':
            out_baseimg = optarg;
            break;
        case 'u':
            unsafe = 1;
            break;
        }
    }

    if ((optind >= argc) || !out_baseimg)
        help();
    filename = argv[optind++];

    /*
     * Open the images.
     *
     * Ignore the old backing file for unsafe rebase in case we want to correct
     * the reference to a renamed or moved backing file.
     */
    flags = BDRV_O_FLAGS | BDRV_O_RDWR | (unsafe ? BDRV_O_NO_BACKING : 0);
    bs = bdrv_new_open(filename, fmt, flags);

    /* Find the right drivers for the backing files */
    old_backing_drv = NULL;
    new_backing_drv = NULL;

    if (!unsafe && bs->backing_format[0] != '\0') {
        old_backing_drv = bdrv_find_format(bs->backing_format);
        if (old_backing_drv == NULL) {
            error("Invalid format name: '%s'", bs->backing_format);
        }
    }

    if (out_basefmt != NULL) {
        new_backing_drv = bdrv_find_format(out_basefmt);
        if (new_backing_drv == NULL) {
            error("Invalid format name: '%s'", out_basefmt);
        }
    }

    /* For safe rebasing we need to compare old and new backing file */
    if (unsafe) {
        /* Make the compiler happy */
        bs_old_backing = NULL;
        bs_new_backing = NULL;
    } else {
        char backing_name[1024];

        bs_old_backing = bdrv_new("old_backing");
        bdrv_get_backing_filename(bs, backing_name, sizeof(backing_name));
        if (bdrv_open(bs_old_backing, backing_name, BDRV_O_FLAGS,
            old_backing_drv))
        {
            error("Could not open old backing file '%s'", backing_name);
            return -1;
        }

        bs_new_backing = bdrv_new("new_backing");
        if (bdrv_open(bs_new_backing, out_baseimg, BDRV_O_FLAGS | BDRV_O_RDWR,
            new_backing_drv))
        {
            error("Could not open new backing file '%s'", out_baseimg);
            return -1;
        }
    }

    /*
     * Check each unallocated cluster in the COW file. If it is unallocated,
     * accesses go to the backing file. We must therefore compare this cluster
     * in the old and new backing file, and if they differ we need to copy it
     * from the old backing file into the COW file.
     *
     * If qemu-img crashes during this step, no harm is done. The content of
     * the image is the same as the original one at any time.
     */
    if (!unsafe) {
        uint64_t num_sectors;
        uint64_t sector;
        int n;
        uint8_t * buf_old;
        uint8_t * buf_new;

        buf_old = qemu_malloc(IO_BUF_SIZE);
        buf_new = qemu_malloc(IO_BUF_SIZE);

        bdrv_get_geometry(bs, &num_sectors);

        for (sector = 0; sector < num_sectors; sector += n) {

            /* How many sectors can we handle with the next read? */
            if (sector + (IO_BUF_SIZE / 512) <= num_sectors) {
                n = (IO_BUF_SIZE / 512);
            } else {
                n = num_sectors - sector;
            }

            /* If the cluster is allocated, we don't need to take action */
            ret = bdrv_is_allocated(bs, sector, n, &n);
            if (ret) {
                continue;
            }

            /* Read old and new backing file */
            if (bdrv_read(bs_old_backing, sector, buf_old, n) < 0) {
                error("error while reading from old backing file");
            }
            if (bdrv_read(bs_new_backing, sector, buf_new, n) < 0) {
                error("error while reading from new backing file");
            }

            /* If they differ, we need to write to the COW file */
            uint64_t written = 0;

            while (written < n) {
                int pnum;

                if (compare_sectors(buf_old + written * 512,
                    buf_new + written * 512, n - written, &pnum))
                {
                    ret = bdrv_write(bs, sector + written,
                        buf_old + written * 512, pnum);
                    if (ret < 0) {
                        error("Error while writing to COW image: %s",
                            strerror(-ret));
                    }
                }

                written += pnum;
            }
        }

        qemu_free(buf_old);
        qemu_free(buf_new);
    }

    /*
     * Change the backing file. All clusters that are different from the old
     * backing file are overwritten in the COW file now, so the visible content
     * doesn't change when we switch the backing file.
     */
    ret = bdrv_change_backing_file(bs, out_baseimg, out_basefmt);
    if (ret == -ENOSPC) {
        error("Could not change the backing file to '%s': No space left in "
            "the file header", out_baseimg);
    } else if (ret < 0) {
        error("Could not change the backing file to '%s': %s",
            out_baseimg, strerror(-ret));
    }

    /*
     * TODO At this point it is possible to check if any clusters that are
     * allocated in the COW file are the same in the backing file. If so, they
     * could be dropped from the COW file. Don't do this before switching the
     * backing file, in case of a crash this would lead to corruption.
     */

    /* Cleanup */
    if (!unsafe) {
        bdrv_delete(bs_old_backing);
        bdrv_delete(bs_new_backing);
    }

    bdrv_delete(bs);

    return 0;
}

static int img_resize(int argc, char **argv)
{
    int c, ret, relative;
    const char *filename, *fmt, *size;
    int64_t n, total_size;
    BlockDriverState *bs;
    QEMUOptionParameter *param;
    QEMUOptionParameter resize_options[] = {
        {
            .name = BLOCK_OPT_SIZE,
            .type = OPT_SIZE,
            .help = "Virtual disk size"
        },
        { NULL }
    };

    fmt = NULL;
    for(;;) {
        c = getopt(argc, argv, "f:h");
        if (c == -1) {
            break;
        }
        switch(c) {
        case 'h':
            help();
            break;
        case 'f':
            fmt = optarg;
            break;
        }
    }
    if (optind + 1 >= argc) {
        help();
    }
    filename = argv[optind++];
    size = argv[optind++];

    /* Choose grow, shrink, or absolute resize mode */
    switch (size[0]) {
    case '+':
        relative = 1;
        size++;
        break;
    case '-':
        relative = -1;
        size++;
        break;
    default:
        relative = 0;
        break;
    }

    /* Parse size */
    param = parse_option_parameters("", resize_options, NULL);
    if (set_option_parameter(param, BLOCK_OPT_SIZE, size)) {
        /* Error message already printed when size parsing fails */
        exit(1);
    }
    n = get_option_parameter(param, BLOCK_OPT_SIZE)->value.n;
    free_option_parameters(param);

    bs = bdrv_new_open(filename, fmt, BDRV_O_FLAGS | BDRV_O_RDWR);

    if (relative) {
        total_size = bdrv_getlength(bs) + n * relative;
    } else {
        total_size = n;
    }
    if (total_size <= 0) {
        error("New image size must be positive");
    }

    ret = bdrv_truncate(bs, total_size);
    switch (ret) {
    case 0:
        printf("Image resized.\n");
        break;
    case -ENOTSUP:
        error("This image format does not support resize");
        break;
    case -EACCES:
        error("Image is read-only");
        break;
    default:
        error("Error resizing image (%d)", -ret);
        break;
    }

    bdrv_delete(bs);
    return 0;
}

static const img_cmd_t img_cmds[] = {
#define DEF(option, callback, arg_string)        \
    { option, callback },
#include "qemu-img-cmds.h"
#undef DEF
#undef GEN_DOCS
    { NULL, NULL, },
};

int main(int argc, char **argv)
{
    const img_cmd_t *cmd;
    const char *cmdname;

    bdrv_init();
    if (argc < 2)
        help();
    cmdname = argv[1];
    argc--; argv++;

    /* find the command */
    for(cmd = img_cmds; cmd->name != NULL; cmd++) {
        if (!strcmp(cmdname, cmd->name)) {
            return cmd->handler(argc, argv);
        }
    }

    /* not found */
    help();
    return 0;
}
