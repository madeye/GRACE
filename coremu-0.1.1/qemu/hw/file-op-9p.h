/*
 * Virtio 9p
 *
 * Copyright IBM, Corp. 2010
 *
 * Authors:
 *  Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 *
 */
#ifndef _FILEOP_H
#define _FILEOP_H
#include <sys/types.h>
#include <dirent.h>
#include <sys/time.h>
#include <utime.h>
#include <sys/stat.h>
#include <sys/uio.h>

typedef struct FsContext
{
    char *fs_root;
    uid_t uid;
} FsContext;

typedef struct FileOperations
{
    int (*lstat)(FsContext *, const char *, struct stat *);
    ssize_t (*readlink)(FsContext *, const char *, char *, size_t);
    int (*chmod)(FsContext *, const char *, mode_t);
    int (*chown)(FsContext *, const char *, uid_t, gid_t);
    int (*mknod)(FsContext *, const char *, mode_t, dev_t);
    int (*mksock)(FsContext *, const char *);
    int (*utime)(FsContext *, const char *, const struct utimbuf *);
    int (*remove)(FsContext *, const char *);
    int (*symlink)(FsContext *, const char *, const char *);
    int (*link)(FsContext *, const char *, const char *);
    int (*setuid)(FsContext *, uid_t);
    int (*close)(FsContext *, int);
    int (*closedir)(FsContext *, DIR *);
    DIR *(*opendir)(FsContext *, const char *);
    int (*open)(FsContext *, const char *, int);
    int (*open2)(FsContext *, const char *, int, mode_t);
    void (*rewinddir)(FsContext *, DIR *);
    off_t (*telldir)(FsContext *, DIR *);
    struct dirent *(*readdir)(FsContext *, DIR *);
    void (*seekdir)(FsContext *, DIR *, off_t);
    ssize_t (*readv)(FsContext *, int, const struct iovec *, int);
    ssize_t (*writev)(FsContext *, int, const struct iovec *, int);
    off_t (*lseek)(FsContext *, int, off_t, int);
    int (*mkdir)(FsContext *, const char *, mode_t);
    int (*fstat)(FsContext *, int, struct stat *);
    int (*rename)(FsContext *, const char *, const char *);
    int (*truncate)(FsContext *, const char *, off_t);
    int (*fsync)(FsContext *, int);
    void *opaque;
} FileOperations;
#endif
