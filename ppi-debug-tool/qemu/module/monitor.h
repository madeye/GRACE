#ifndef MONITOR_H
#define MONITOR_H

struct monitor_syn_info {
    uint32_t mutex_init_addr;
    uint32_t mutex_destroy_addr;
    uint32_t mutex_lock_addr;
    uint32_t mutex_trylock_addr;
    uint32_t mutex_timedlock_addr;
    uint32_t mutex_unlock_addr;
    uint32_t rwlock_init_addr;
    uint32_t rwlock_destroy_addr;
    uint32_t rwlock_rdlock_addr;
    uint32_t rwlock_tryrdlock_addr;
    uint32_t rwlock_timedrdlock_addr;
    uint32_t rwlock_wrlock_addr;
    uint32_t rwlock_trywrlock_addr;
    uint32_t rwlock_timedwrlock_addr;
    uint32_t rwlock_unlock_addr;
    uint32_t barrier_init_addr;
    uint32_t barrier_destroy_addr;
    uint32_t barrier_wait_addr;
    uint32_t cond_init_addr;
    uint32_t cond_destroy_addr;
    uint32_t cond_wait_addr;
    uint32_t cond_timedwait_addr;
    uint32_t cond_signal_addr;
    uint32_t cond_broadcast_addr;
    uint32_t create_addr;
    uint32_t join_addr;
    uint32_t exit_addr;
#if 1
    uint32_t mutex_init_count;
    uint32_t mutex_destroy_count;
    uint32_t mutex_lock_count;
    uint32_t mutex_trylock_count;
    uint32_t mutex_timedlock_count;
    uint32_t mutex_unlock_count;
    uint32_t rwlock_init_count;
    uint32_t rwlock_destroy_count;
    uint32_t rwlock_rdlock_count;
    uint32_t rwlock_tryrdlock_count;
    uint32_t rwlock_timedrdlock_count;
    uint32_t rwlock_wrlock_count;
    uint32_t rwlock_trywrlock_count;
    uint32_t rwlock_timedwrlock_count;
    uint32_t rwlock_unlock_count;
    uint32_t barrier_init_count;
    uint32_t barrier_destroy_count;
    uint32_t barrier_wait_count;
    uint32_t cond_init_count;
    uint32_t cond_destroy_count;
    uint32_t cond_wait_count;
    uint32_t cond_timedwait_count;
    uint32_t cond_signal_count;
    uint32_t cond_broadcast_count;
    uint32_t create_count;
    uint32_t join_count;
    uint32_t exit_count;
#endif
};

#ifdef PPI_MONITOR_INIT
//#define PPI_SPLASH2_BARNES
//#define PPI_SPLASH2_FMM
//#define PPI_SPLASH2_OCEAN
//#define PPI_SPLASH2_RADIOSITY
//#define PPI_SPLASH2_RAYTRACE
//#define PPI_SPLASH2_VOLREND
//#define PPI_SPLASH2_WATER_NSQUARED
//#define PPI_SPLASH2_WATER_SPATIAL
//#define PPI_SPLASH2_CHOLESKY
//#define PPI_SPLASH2_FFT
//#define PPI_SPLASH2_LU
//#define PPI_SPLASH2_RADIX

//#define PPI_APP_AGET
//#define PPI_APP_PFSCAN
//#define PPI_APP_PBZIP2
//#define PPI_APP_HTTPD
//#define PPI_APP_MYSQLD

//#define PPI_PARSEC_BLACKSCHOLES
//#define PPI_PARSEC_BODYTRACK
//#define PPI_PARSEC_FACESIM
//#define PPI_PARSEC_FERRET
//#define PPI_PARSEC_FREQMINE
//#define PPI_PARSEC_RAYTRACE
//#define PPI_PARSEC_SWAPTIONS
//#define PPI_PARSEC_FLUIDANIMATE
//#define PPI_PARSEC_VIPS
//#define PPI_PARSEC_X264
//#define PPI_PARSEC_CANNEAL
//#define PPI_PARSEC_DEDUP
//#define PPI_PARSEC_STREAMCLUSTER

static inline void monitor_syn_info_init(struct monitor_syn_info *syn_info)
{
    memset(syn_info, 0, sizeof(struct monitor_syn_info));

#ifdef PPI_SPLASH2_BARNES
#ifdef PPI_SYN_INFO
    printf("splash2 : barnes :\n");
#endif
    syn_info->mutex_init_addr = 0x08048948;
    syn_info->mutex_lock_addr = 0x08048998;
    syn_info->mutex_unlock_addr = 0x080488b8;
    syn_info->barrier_init_addr = 0x08048868;
    syn_info->barrier_wait_addr = 0x080488f8;
    syn_info->create_addr = 0x080489a8;
    syn_info->join_addr = 0x080487f8;
#endif

#ifdef PPI_SPLASH2_FMM
#ifdef PPI_SYN_INFO
    printf("splash2 : fmm :\n");
#endif
    syn_info->mutex_init_addr = 0x08048908;
    syn_info->mutex_lock_addr = 0x08048968;
    syn_info->mutex_unlock_addr = 0x08048898;
    syn_info->barrier_init_addr = 0x08048848;
    syn_info->barrier_wait_addr = 0x080488d8;
    syn_info->create_addr = 0x08048978;
    syn_info->join_addr = 0x080487e8;
#endif

#ifdef PPI_SPLASH2_OCEAN
#ifdef PPI_SYN_INFO
    printf("splash2 : ocean :\n");
#endif
    syn_info->mutex_init_addr = 0x0804871c;
    syn_info->mutex_lock_addr = 0x0804874c;
    syn_info->mutex_unlock_addr = 0x080486cc;
    syn_info->barrier_init_addr = 0x0804869c;
    syn_info->barrier_wait_addr = 0x080486ec;
    syn_info->create_addr = 0x0804875c;
    syn_info->join_addr = 0x0804864c;
#endif

#ifdef PPI_SPLASH2_RADIOSITY
#ifdef PPI_SYN_INFO
    printf("splash2 : radiosity :\n");
#endif
    syn_info->mutex_init_addr = 0x08048770;
    syn_info->mutex_lock_addr = 0x080487a0;
    syn_info->mutex_unlock_addr = 0x08048710;
    syn_info->barrier_init_addr = 0x080486d0;
    syn_info->barrier_wait_addr = 0x08048750;
    syn_info->create_addr = 0x080487c0;
    syn_info->join_addr = 0x080486a0;
#endif

#ifdef PPI_SPLASH2_RAYTRACE
#ifdef PPI_SYN_INFO
    printf("splash2 : raytrace :\n");
#endif
    syn_info->mutex_init_addr = 0x08048930;
    syn_info->mutex_lock_addr = 0x08048960;
    syn_info->mutex_unlock_addr = 0x080488b0;
    syn_info->barrier_init_addr = 0x08048850;
    syn_info->barrier_wait_addr = 0x080488f0;
    syn_info->create_addr = 0x08048980;
    syn_info->join_addr = 0x080487f0;
#endif

#ifdef PPI_SPLASH2_VOLREND
#ifdef PPI_SYN_INFO
    printf("splash2 : volrend :\n");
#endif
    syn_info->mutex_init_addr = 0x080489f4;
    syn_info->mutex_lock_addr = 0x08048a34;
    syn_info->mutex_unlock_addr = 0x08048984;
    syn_info->barrier_init_addr = 0x08048934;
    syn_info->barrier_wait_addr = 0x080489b4;
    syn_info->create_addr = 0x08048a54;
    syn_info->join_addr = 0x080488c4;
#endif

#ifdef PPI_SPLASH2_WATER_NSQUARED
#ifdef PPI_SYN_INFO
    printf("splash2 : water-nsquared :\n");
#endif
    syn_info->mutex_init_addr = 0x08048820;
    syn_info->mutex_lock_addr = 0x08048850;
    syn_info->mutex_unlock_addr = 0x080487b0;
    syn_info->barrier_init_addr = 0x08048750;
    syn_info->barrier_wait_addr = 0x08048800;
    syn_info->create_addr = 0x08048860;
    syn_info->join_addr = 0x08048710;
#endif

#ifdef PPI_SPLASH2_WATER_SPATIAL
#ifdef PPI_SYN_INFO
    printf("splash2 : water-spatial :\n");
#endif
    syn_info->mutex_init_addr = 0x08048820;
    syn_info->mutex_lock_addr = 0x08048850;
    syn_info->mutex_unlock_addr = 0x080487b0;
    syn_info->barrier_init_addr = 0x08048750;
    syn_info->barrier_wait_addr = 0x08048800;
    syn_info->create_addr = 0x08048860;
    syn_info->join_addr = 0x08048710;
#endif

#ifdef PPI_SPLASH2_CHOLESKY
#ifdef PPI_SYN_INFO
    printf("splash2 : cholesky :\n");
#endif
    syn_info->mutex_init_addr = 0x08048910;
    syn_info->mutex_lock_addr = 0x08048940;
    syn_info->mutex_unlock_addr = 0x08048880;
    syn_info->barrier_init_addr = 0x08048820;
    syn_info->barrier_wait_addr = 0x080488c0;
    syn_info->create_addr = 0x08048960;
    syn_info->join_addr = 0x080487d0;
#endif

#ifdef PPI_SPLASH2_FFT
#ifdef PPI_SYN_INFO
    printf("splash2 : fft :\n");
#endif
    syn_info->mutex_init_addr = 0x08048754;
    syn_info->mutex_lock_addr = 0x08048784;
    syn_info->mutex_unlock_addr = 0x080486f4;
    syn_info->barrier_init_addr = 0x080486d4;
    syn_info->barrier_wait_addr = 0x08048724;
    syn_info->create_addr = 0x08048794;
    syn_info->join_addr = 0x08048674;
#endif

#ifdef PPI_SPLASH2_LU
#ifdef PPI_SYN_INFO
    printf("splash2 : lu :\n");
#endif
    syn_info->mutex_init_addr = 0x080487dc;
    syn_info->mutex_lock_addr = 0x0804881c;
    syn_info->mutex_unlock_addr = 0x0804877c;
    syn_info->barrier_init_addr = 0x0804872c;
    syn_info->barrier_wait_addr = 0x0804879c;
    syn_info->create_addr = 0x0804882c;
    syn_info->join_addr = 0x080486dc;
#endif

#ifdef PPI_SPLASH2_RADIX
#ifdef PPI_SYN_INFO
    printf("splash2 : radix :\n");
#endif
    syn_info->mutex_init_addr = 0x08048738;
    syn_info->mutex_lock_addr = 0x08048768;
    syn_info->mutex_unlock_addr = 0x080486e8;
    syn_info->barrier_init_addr = 0x080486b8;
    syn_info->barrier_wait_addr = 0x08048708;
    syn_info->cond_init_addr = 0x080486d8;
    syn_info->cond_wait_addr = 0x08048788;
    syn_info->cond_broadcast_addr = 0x080487b8;
    syn_info->create_addr = 0x08048778;
    syn_info->join_addr = 0x08048678;
#endif

#ifdef PPI_APP_AGET
#ifdef PPI_SYN_INFO
    printf("app : aget :\n");
#endif
    syn_info->mutex_lock_addr = 0x08048e38;
    syn_info->mutex_unlock_addr = 0x08048d18;
    syn_info->create_addr = 0x08048e68;
    syn_info->join_addr = 0x08048be8;
    syn_info->exit_addr = 0x08048c18;
    //syn_info->cancel_addr = 0x08048f38;
    //syn_info->self_addr = 0x08048f28;
    //syn_info->sigmask_addr = 0x08048d98;
    //syn_info->setcanceltype_addr = 0x08048f48;
#endif

#ifdef PPI_APP_PFSCAN
#ifdef PPI_SYN_INFO
    printf("app : pfscan :\n");
#endif
    syn_info->mutex_init_addr = 0x08048a88;
    syn_info->mutex_destroy_addr = 0x08048a58;
    syn_info->mutex_lock_addr = 0x08048ad8;
    syn_info->mutex_unlock_addr = 0x08048a38;
    syn_info->cond_init_addr = 0x080489f8;
    syn_info->cond_destroy_addr = 0x08048938;
    syn_info->cond_wait_addr = 0x08048b08;
    syn_info->cond_signal_addr = 0x08048988;
    syn_info->cond_broadcast_addr = 0x08048b68;
    syn_info->create_addr = 0x08048af8;
    //syn_info->attr_init_addr = 0x08048a48;
    //syn_info->attr_setscope_addr = 0x08048a18;
#endif

#ifdef PPI_APP_PBZIP2
#ifdef PPI_SYN_INFO
    printf("app : pbzip2 :\n");
#endif
    syn_info->mutex_init_addr = 0x08048e00;
    syn_info->mutex_destroy_addr = 0x08048de0;
    syn_info->mutex_lock_addr = 0x08048e80;
    syn_info->mutex_unlock_addr = 0x08048d90;
    syn_info->cond_init_addr = 0x08048d70;
    syn_info->cond_destroy_addr = 0x08048be0;
    syn_info->cond_wait_addr = 0x08048ec0;
    syn_info->cond_timedwait_addr = 0x08048cd0;
    syn_info->cond_signal_addr = 0x08048c40;
    syn_info->create_addr = 0x08048eb0;
    syn_info->join_addr = 0x08048bf0;
#endif

#ifdef PPI_APP_HTTPD
#ifdef PPI_SYN_INFO
    printf("app : httpd :\n");
#endif
    syn_info->apr_thread_mutex_lock_addr = 0x0805f9d8;
    syn_info->apr_thread_mutex_trylock_addr = 0x080603e8;
    syn_info->apr_thread_mutex_unlock_addr = 0x0805f2f8;
    syn_info->apr_thread_rwlock_rdlock_addr = 0x08060f48;
    syn_info->apr_thread_rwlock_wrlock_addr = 0x08060118;
    syn_info->apr_thread_rwlock_tryrdlock_addr = 0x08060c08;
    syn_info->apr_thread_rwlock_trywrlock_addr = 0x0805fef8;
    syn_info->apr_thread_rwlock_unlock_addr = 0x0805ef38;
    syn_info->apr_proc_mutex_lock_addr = 0x08061208;
    syn_info->apr_proc_mutex_trylock_addr = 0x0805f6f8;
    syn_info->apr_proc_mutex_unlock_addr = 0x0805fca8;
    syn_info->apr_proc_wait_addr = 0x0805ff58;
    syn_info->apr_proc_wait_all_procs_addr = 0x0805efe8;
#endif

#ifdef PPI_APP_MYSQLD
#ifdef PPI_SYN_INFO
    printf("app : mysqld :\n");
#endif
    syn_info->mutex_init_addr = 0x08139680;
    syn_info->mutex_destroy_addr = 0x081396a0;
    syn_info->mutex_lock_addr = 0x08139800;
    syn_info->mutex_trylock_addr = 0x08139b50;
    syn_info->mutex_unlock_addr = 0x08139e60;
    //syn_info->mutexattr_init_addr = 0x081397f0;
    //syn_info->mutexattr_destroy_addr = 0x08139e70;
    //syn_info->mutexattr_settype_addr = 0x08139360;
    syn_info->rwlock_init_addr = 0x081398e0;
    syn_info->rwlock_destroy_addr = 0x081398a0;
    syn_info->rwlock_rdlock_addr = 0x08139740;
    syn_info->rwlock_wrlock_addr = 0x08139c10;
    syn_info->rwlock_trywrlock_addr = 0x08139850;
    syn_info->rwlock_unlock_addr = 0x08139e90;
    syn_info->cond_init_addr = 0x081399e0;
    syn_info->cond_destroy_addr = 0x08139dd0;
    syn_info->cond_wait_addr = 0x081391c0;
    syn_info->cond_timedwait_addr = 0x081391d0;
    syn_info->cond_signal_addr = 0x08139910;
    syn_info->cond_broadcast_addr = 0x08139a10;
    syn_info->create_addr = 0x08139470;
    syn_info->exit_addr = 0x08139c90;
    //syn_info->self_addr = 0x081399d0;
    //syn_info->equal_addr = 0x08139eb0;
    //syn_info->kill_addr = 0x08139550;
    //syn_info->attr_init_addr = 0x081391f0;
    //syn_info->attr_destroy_addr = 0x08139aa0;
    //syn_info->attr_setdetachstate_addr = 0x08139240;
    //syn_info->attr_setschedparam_addr = 0x08139260;
    //syn_info->attr_getstacksize_addr = 0x081395d0;
    //syn_info->attr_setstacksize_addr = 0x08139340;
    //syn_info->attr_setscope_addr = 0x081393f0;
    //syn_info->getspecific_addr = 0x08139220;
    //syn_info->setspecific_addr = 0x081398f0;
    //syn_info->getschedparam_addr = 0x08139690;
    //syn_info->setschedparam_addr = 0x081398c0;
    //syn_info->sigmask_addr = 0x08139ed0;
    //syn_info->key_create_addr = 0x08139900;
    //syn_info->key_delete_addr = 0x08139a60;
#endif

#ifdef PPI_PARSEC_BLACKSCHOLES
#ifdef PPI_SYN_INFO
    printf("parsec : blackscholes :\n");
#endif
    //syn_info->mutexattr_init_addr = 0x08048740;
    syn_info->create_addr = 0x08048710;
    syn_info->join_addr = 0x08048640;
#endif

#ifdef PPI_PARSEC_BODYTRACK
#ifdef PPI_SYN_INFO
    printf("parsec : bodytrack :\n");
#endif
    syn_info->mutex_init_addr = 0x0804b9a8;
    syn_info->mutex_destroy_addr = 0x0804b8e8;
    syn_info->mutex_lock_addr = 0x0804ba18;
    syn_info->mutex_trylock_addr = 0x0804b818;
    syn_info->mutex_unlock_addr = 0x0804b878;
    syn_info->barrier_init_addr = 0x0804b7b8 ;
    syn_info->barrier_destroy_addr = 0x0804b8b8;
    syn_info->barrier_wait_addr = 0x0804b8f8;
    syn_info->cond_init_addr = 0x0804b858;
    syn_info->cond_destroy_addr = 0x0804b6c8;
    syn_info->cond_wait_addr = 0x0804bac8;
    syn_info->cond_signal_addr = 0x0804b738;
    syn_info->cond_broadcast_addr = 0x0804bc38;
    syn_info->create_addr = 0x0804ba88;
    syn_info->join_addr = 0x0804b6e8;
    //syn_info->cancel_addr = 0x0804bce8;
    //syn_info->once_addr = 0x0804b6a8;
#endif

#ifdef PPI_PARSEC_FACESIM
#ifdef PPI_SYN_INFO
    printf("parsec : facesim :\n");
#endif
    syn_info->mutex_init_addr = 0x0804afc0;
    syn_info->mutex_lock_addr = 0x0804b080;
    syn_info->mutex_unlock_addr = 0x0804ae50;
    //syn_info->mutexattr_init_addr = 0x0804b330;
    //syn_info->mutexattr_settype_addr = 0x0804b340;
    syn_info->cond_init_addr = 0x0804ae20;
    syn_info->cond_wait_addr = 0x0804b170;
    syn_info->cond_broadcast_addr = 0x0804b360;
    syn_info->create_addr = 0x0804b130;
    //syn_info->cancel_addr = 0x0804b420;
#endif

#ifdef PPI_PARSEC_FERRET
#ifdef PPI_SYN_INFO
    printf("parsec : ferret :\n");
#endif
    syn_info->mutex_init_addr = 0x0804a810;
    syn_info->mutex_destroy_addr = 0x0804a740;
    syn_info->mutex_lock_addr = 0x0804a8f0;
    syn_info->mutex_unlock_addr = 0x0804a640;
    //syn_info->mutexattr_init_addr = 0x0804ab40;
    //syn_info->mutexattr_destroy_addr = 0x0804a650;
    syn_info->cond_init_addr = 0x0804a5f0;
    syn_info->cond_wait_addr = 0x0804a970;
    syn_info->cond_signal_addr = 0x0804a300;
    syn_info->create_addr = 0x0804a930;
    syn_info->join_addr = 0x0804a230;
    //syn_info->cancel_addr = 0x0804ac10;
    //syn_info->self_addr = 0x0804ac00;
#endif

#ifdef PPI_PARSEC_FREQMINE
#ifdef PPI_SYN_INFO
    printf("parsec : freqmine :\n");
#endif
#endif

#ifdef PPI_PARSEC_RAYTRACE
#ifdef PPI_SYN_INFO
    printf("parsec : raytrace :\n");
#endif
    syn_info->mutex_init_addr = 0x080755ec;
    syn_info->mutex_destroy_addr = 0x080754ec;
    syn_info->mutex_lock_addr = 0x0807572c;
    syn_info->mutex_unlock_addr = 0x0807539c;
    syn_info->cond_init_addr = 0x0807537c;
    syn_info->cond_wait_addr = 0x0807582c;
    syn_info->cond_broadcast_addr = 0x08075abc;
    syn_info->create_addr = 0x080757fc;
    //syn_info->cancel_addr = 0x08075bac;
    //syn_info->self_addr = 0x08075b8c;
    //syn_info->once_addr = 0x08074e2c;
    //syn_info->key_create_addr = 0x08075bec;
    //syn_info->getspecific_addr = 0x080751bc;
    //syn_info->setspecific_addr = 0x0807564c;
#endif

#ifdef PPI_PARSEC_SWAPTIONS
#ifdef PPI_SYN_INFO
    printf("parsec : swaptions :\n");
#endif
    syn_info->create_addr = 0x08048800;
    syn_info->join_addr = 0x080486f0;
    //syn_info->attr_init_addr = 0x080487b0;
#endif

#ifdef PPI_PARSEC_FLUIDANIMATE
#ifdef PPI_SYN_INFO
    printf("parsec : fluidanimate :\n");
#endif
    syn_info->mutex_init_addr = 0x08049278;
    syn_info->mutex_destroy_addr = 0x08049258;
    syn_info->mutex_lock_addr = 0x080492b8;
    syn_info->mutex_trylock_addr = 0x080491f8;
    syn_info->mutex_unlock_addr = 0x08049218;
    syn_info->cond_init_addr = 0x08049208;
    syn_info->cond_destroy_addr = 0x080490c8;
    syn_info->cond_wait_addr = 0x08049308;
    syn_info->cond_broadcast_addr = 0x08049368;
    syn_info->create_addr = 0x080492f8;
    syn_info->join_addr = 0x080490e8;
    //syn_info->attr_init_addr = 0x08049228;
    //syn_info->attr_destroy_addr = 0x08049348;
    //syn_info->attr_setdetachstate_addr = 0x08049118;
#endif

#ifdef PPI_PARSEC_VIPS
#ifdef PPI_SYN_INFO
    printf("parsec : vips :\n");
#endif
    syn_info->mutex_init_addr = 0x08075b18;
    syn_info->mutex_destroy_addr = 0x08075998;
    syn_info->mutex_lock_addr = 0x08075c38;
    syn_info->mutex_trylock_addr = 0x08075728;
    syn_info->mutex_unlock_addr = 0x080758a8;
    syn_info->cond_init_addr = 0x08075828;
    syn_info->cond_destroy_addr = 0x08075318;
    syn_info->cond_wait_addr = 0x08075d08;
    syn_info->cond_timedwait_addr = 0x08075658;
    syn_info->cond_signal_addr = 0x08075478;
    syn_info->cond_broadcast_addr = 0x08075f58;
    syn_info->create_addr = 0x08075ce8;
    syn_info->join_addr = 0x08075378;
    syn_info->exit_addr = 0x08075438;
    //syn_info->self_addr = 0x08075fb8;
    //syn_info->equal_addr = 0x08075a78;
    //syn_info->once_addr = 0x080752d8;
    //syn_info->attr_init_addr = 0x080758b8;
    //syn_info->attr_destroy_addr = 0x08075de8;
    //syn_info->attr_setdetachstate_addr = 0x080753e8;
    //syn_info->attr_setstacksize_addr = 0x080756e8;
    //syn_info->attr_setscope_addr = 0x08075878;
    //syn_info->attr_getschedparam_addr = 0x08075418;
    //syn_info->attr_setschedparam_addr = 0x08075a28;
    //syn_info->key_create_addr = 0x08076008;
    //syn_info->getspecific_addr = 0x080756a8;
    //syn_info->setspecific_addr = 0x08075b68;
    //syn_info->getschedparam_addr = 0x08075c68;
    //syn_info->setschedparam_addr = 0x080759e8;
#endif

#ifdef PPI_PARSEC_X264
#ifdef PPI_SYN_INFO
    printf("parsec : x264 :\n");
#endif
    syn_info->mutex_init_addr = 0x08049100;
    syn_info->mutex_destroy_addr = 0x08049080;
    syn_info->mutex_lock_addr = 0x08049160;
    syn_info->mutex_unlock_addr = 0x08049010;
    syn_info->cond_init_addr = 0x08048fd0;
    syn_info->cond_destroy_addr = 0x08048eb0;
    syn_info->cond_wait_addr = 0x080491a0;
    syn_info->cond_broadcast_addr = 0x08049240;
    syn_info->create_addr = 0x08049190;
    syn_info->join_addr = 0x08048ec0;
#endif

#ifdef PPI_PARSEC_CANNEAL
#ifdef PPI_SYN_INFO
    printf("parsec : canneal :\n");
#endif
    syn_info->mutex_lock_addr = 0x0804961c;
    syn_info->mutex_unlock_addr = 0x0804956c;
    syn_info->barrier_init_addr = 0x080494cc;
    syn_info->barrier_destroy_addr = 0x0804957c;
    syn_info->barrier_wait_addr = 0x0804959c;
    syn_info->create_addr = 0x0804965c;
    syn_info->join_addr = 0x0804940c;
    //syn_info->cancel_addr = 0x0804975c;
#endif

#ifdef PPI_PARSEC_DEDUP
#ifdef PPI_SYN_INFO
    printf("parsec : dedup :\n");
#endif
    syn_info->mutex_init_addr = 0x08048b08;
    syn_info->mutex_destroy_addr = 0x08048ad8;
    syn_info->mutex_lock_addr = 0x08048b48;
    syn_info->mutex_unlock_addr = 0x08048aa8;
    syn_info->cond_init_addr = 0x08048a98;
    syn_info->cond_wait_addr = 0x08048b68;
    syn_info->cond_signal_addr = 0x08048a08;
    syn_info->cond_broadcast_addr = 0x08048b88;
    syn_info->create_addr = 0x08048b58;
    syn_info->join_addr = 0x080489c8;
#endif

#ifdef PPI_PARSEC_STREAMCLUSTER
#ifdef PPI_SYN_INFO
    printf("parsec : streamcluster :\n");
#endif
    syn_info->mutex_init_addr = 0x08048d40;
    syn_info->mutex_destroy_addr = 0x08048d00;
    syn_info->mutex_lock_addr = 0x08048db0;
    syn_info->mutex_trylock_addr = 0x08048c80;
    syn_info->mutex_unlock_addr = 0x08048cc0;
    syn_info->cond_init_addr = 0x08048cb0;
    syn_info->cond_destroy_addr = 0x08048bb0;
    syn_info->cond_wait_addr = 0x08048de0;
    syn_info->cond_broadcast_addr = 0x08048e20;
    syn_info->create_addr = 0x08048dd0;
    syn_info->join_addr = 0x08048bc0;
#endif

#ifdef PPI_SYN_INFO
    /* pthread */
    printf("\npthread\n");
    printf("mutex init addr : 0x%x\n", syn_info->mutex_init_addr);
    printf("mutex lock addr : 0x%x\n", syn_info->mutex_lock_addr);
    printf("mutex unlock addr : 0x%x\n", syn_info->mutex_unlock_addr);
    printf("barrier init addr : 0x%x\n", syn_info->barrier_init_addr);
    printf("barrier wait addr : 0x%x\n", syn_info->barrier_wait_addr);
    printf("create addr : 0x%x\n", syn_info->create_addr);
    printf("join addr : 0x%x\n", syn_info->join_addr);
    printf("cond init addr : 0x%x\n", syn_info->cond_init_addr);
    printf("cond wait addr : 0x%x\n", syn_info->cond_wait_addr);
#if 0
    //printf("cond timedwait addr : 0x%x\n", syn_info->cond_timedwait_addr);
    //printf("cond signal addr : 0x%x\n", syn_info->cond_signal_addr);
#endif
    printf("cond broadcast addr : 0x%x\n", syn_info->cond_broadcast_addr);
    printf("pthread\n");
#if 0
    /* apr */
    printf("\napr\n");
    printf("apr thread mutex lock addr : 0x%x\n", syn_info->apr_thread_mutex_lock_addr);
    printf("apr thread mutex trylock addr : 0x%x\n", syn_info->apr_thread_mutex_trylock_addr);
    printf("apr thread mutex unlock addr : 0x%x\n", syn_info->apr_thread_mutex_unlock_addr);
    printf("apr thread rwlock rdlock addr : 0x%x\n", syn_info->apr_thread_rwlock_rdlock_addr);
    printf("apr thread rwlock wrlock addr : 0x%x\n", syn_info->apr_thread_rwlock_wrlock_addr);
    printf("apr thread rwlock tryrdlock addr : 0x%x\n", syn_info->apr_thread_rwlock_tryrdlock_addr);
    printf("apr thread rwlock trywrlock addr : 0x%x\n", syn_info->apr_thread_rwlock_trywrlock_addr);	
    printf("apr thread rwlock unlock addr : 0x%x\n", syn_info->apr_thread_rwlock_unlock_addr);
    printf("apr proc mutex lock addr : 0x%x\n", syn_info->apr_proc_mutex_lock_addr);
    printf("apr proc mutex trylock addr : 0x%x\n", syn_info->apr_proc_mutex_trylock_addr);
    printf("apr proc mutex unlock addr : 0x%x\n", syn_info->apr_proc_mutex_unlock_addr);
    printf("apr proc wait addr : 0x%x\n", syn_info->apr_proc_wait_addr);
    printf("apr proc wait all procs addr : 0x%x\n", syn_info->apr_proc_wait_all_procs_addr);
    printf("apr\n");
#endif
#endif
}
#else
//#define PPI_SYN_MUTEX_INIT
//#define PPI_SYN_MUTEX_DESTROY
#define PPI_SYN_MUTEX_LOCK
//#define PPI_SYN_MUTEX_TRYLOCK
#define PPI_SYN_MUTEX_UNLOCK

//#define PPI_SYN_BARRIER_INIT
//#define PPI_SYN_BARRIER_DESTROY
#define PPI_SYN_BARRIER_WAIT

//#define PPI_SYN_COND_INIT
//#define PPI_SYN_COND_DESTORY
#define PPI_SYN_COND_WAIT
//#define PPI_SYN_COND_TIMEDWAIT
//#define PPI_SYN_COND_SIGNAL
#define PPI_SYN_COND_BROADCAST

//#define PPI_SYN_CREATE
//#define PPI_SYN_JOIN
//#define PPI_SYN_EXIT

static inline void monitor_syn_info_trace(struct monitor_syn_info *syn_info) 
{
    uint32_t pc;

    pc = EIP;

#ifdef PPI_SYN_MUTEX_INIT
    if (pc == syn_info->mutex_init_addr) {
#ifdef PPI_SYN_INFO
        syn_info->mutex_init_count++;
#endif
    }
#endif

#ifdef PPI_SYN_MUTEX_LOCK
    if (pc == syn_info->mutex_lock_addr) {
        trace_syn_collection(TRACE_SYN_LOCK, 1, ldl(ESP + 4), 0, pc);
#ifdef PPI_SYN_INFO
        syn_info->mutex_lock_count++;
#endif
    }
#endif

#ifdef PPI_SYN_MUTEX_UNLOCK
    if (pc == syn_info->mutex_unlock_addr) {
        trace_syn_collection(TRACE_SYN_UNLOCK, 1, ldl(ESP + 4), 0, pc);
#ifdef PPI_SYN_INFO
        syn_info->mutex_unlock_count++;
#endif
    }
#endif

#ifdef PPI_SYN_BARRIER_INIT
    if (pc == syn_info->barrier_init_addr) {
#ifdef PPI_SYN_INFO
        syn_info->barrier_init_count++;
#endif
    }
#endif

#ifdef PPI_SYN_BARRIER_WAIT
    if (pc == syn_info->barrier_wait_addr) {
        trace_syn_collection(TRACE_SYN_BARRIER, 1, ldl(ESP + 4), 0, pc);
#ifdef PPI_SYN_INFO
        syn_info->barrier_wait_count++;
#endif
    }
#endif

#ifdef PPI_SYN_COND_INIT
    if (pc == syn_info->cond_init_addr) {
#ifdef PPI_SYN_INFO
        syn_info->cond_init_count++;
#endif
    }
#endif

#ifdef PPI_SYN_COND_WAIT
    if (pc == syn_info->cond_wait_addr) {
        trace_syn_collection(TRACE_SYN_COND_WAIT, 2, ldl(ESP + 4), ldl(ESP + 8), pc);
#ifdef PPI_SYN_INFO
        syn_info->cond_wait_count++;
#endif
    }
#endif

#ifdef PPI_SYN_COND_BROADCAST
    if (pc == syn_info->cond_broadcast_addr) {
        trace_syn_collection(TRACE_SYN_COND_BROADCAST, 1, ldl(ESP + 4), 0, pc);
#ifdef PPI_SYN_INFO
        syn_info->cond_broadcast_count++;
#endif
    }
#endif

#ifdef PPI_SYN_CREATE
    if (pc == syn_info->create_addr) {
        trace_syn_collection(TRACE_SYN_CREATE, 1, ldl(ESP + 4), 0, pc);
#ifdef PPI_SYN_INFO
        //printf("create : %d\n", currentID);
        syn_info->create_count++;
#endif
    }
#endif

#ifdef PPI_SYN_JOIN
    if (pc == syn_info->join_addr) {
        trace_syn_collection(TRACE_SYN_JOIN, 1, ldl(ESP + 4), 0, pc);
#ifdef PPI_SYN_INFO
        //printf("join : %d\n", currentID);
        syn_info->join_count++;
#endif
    }
#endif
}

static inline void monitor_syn_info_print(struct monitor_syn_info *syn_info) 
{
#if 0
    printf("mutex init count : %d\n", syn_info->mutex_init_count);
#endif
    printf("mutex lock count : %d\n", syn_info->mutex_lock_count);
    printf("mutex unlock count : %d\n", syn_info->mutex_unlock_count);
#if 0
    printf("barrier init count : %d\n", syn_info->barrier_init_count);
#endif
    printf("barrier wait count : %d\n", syn_info->barrier_wait_count);
#if 0
    printf("create count : %d\n", syn_info->create_count);
    printf("join count : %d\n", syn_info->join_count);
    printf("cond init count : %d\n", syn_info->cond_init_count);
#endif
    printf("cond wait count : %d\n", syn_info->cond_wait_count);
#if 0
    printf("cond timedwait count : %d\n", syn_info->cond_timedwait_count);
    printf("cond signal count : %d\n", syn_info->cond_signal_count);
#endif
    printf("cond broadcast count : %d\n", syn_info->cond_broadcast_count);
}
#endif

#endif /* MONITOR_H */
