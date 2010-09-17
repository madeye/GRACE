// 32bit code to Power On Self Test (POST) a machine.
//
// Copyright (C) 2008,2009  Kevin O'Connor <kevin@koconnor.net>
// Copyright (C) 2002  MandrakeSoft S.A.
//
// This file may be distributed under the terms of the GNU LGPLv3 license.

#include "ioport.h" // PORT_*
#include "config.h" // CONFIG_*
#include "cmos.h" // CMOS_*
#include "util.h" // memset
#include "biosvar.h" // struct bios_data_area_s
#include "disk.h" // floppy_drive_setup
#include "ata.h" // ata_setup
#include "memmap.h" // add_e820
#include "pic.h" // pic_setup
#include "pci.h" // create_pirtable
#include "acpi.h" // acpi_bios_init
#include "bregs.h" // struct bregs
#include "mptable.h" // mptable_init
#include "boot.h" // IPL
#include "usb.h" // usb_setup
#include "smbios.h" // smbios_init
#include "paravirt.h" // qemu_cfg_port_probe
#include "ps2port.h" // ps2port_setup

void
__set_irq(int vector, void *loc)
{
    SET_IVT(vector, SEGOFF(SEG_BIOS, (u32)loc - BUILD_BIOS_ADDR));
}

#define set_irq(vector, func) do {              \
        extern void func (void);                \
        __set_irq(vector, func);                \
    } while (0)

static void
init_ivt(void)
{
    dprintf(3, "init ivt\n");

    // Initialize all vectors to the default handler.
    int i;
    for (i=0; i<256; i++)
        set_irq(i, entry_iret_official);

    // Initialize all hw vectors to a default hw handler.
    for (i=0x08; i<=0x0f; i++)
        set_irq(i, entry_hwpic1);
    for (i=0x70; i<=0x77; i++)
        set_irq(i, entry_hwpic2);

    // Initialize software handlers.
    set_irq(0x02, entry_02);
    set_irq(0x10, entry_10);
    set_irq(0x11, entry_11);
    set_irq(0x12, entry_12);
    set_irq(0x13, entry_13_official);
    set_irq(0x14, entry_14);
    set_irq(0x15, entry_15);
    set_irq(0x16, entry_16);
    set_irq(0x17, entry_17);
    set_irq(0x18, entry_18);
    set_irq(0x19, entry_19_official);
    set_irq(0x1a, entry_1a);
    set_irq(0x40, entry_40);

    // INT 60h-66h reserved for user interrupt
    for (i=0x60; i<=0x66; i++)
        SET_IVT(i, SEGOFF(0, 0));

    // set vector 0x79 to zero
    // this is used by 'gardian angel' protection system
    SET_IVT(0x79, SEGOFF(0, 0));

    __set_irq(0x1E, &diskette_param_table2);
}

static void
init_bda(void)
{
    dprintf(3, "init bda\n");

    struct bios_data_area_s *bda = MAKE_FLATPTR(SEG_BDA, 0);
    memset(bda, 0, sizeof(*bda));

    int esize = EBDA_SIZE_START;
    SET_BDA(mem_size_kb, BUILD_LOWRAM_END/1024 - esize);
    u16 eseg = EBDA_SEGMENT_START;
    SET_BDA(ebda_seg, eseg);

    // Init ebda
    struct extended_bios_data_area_s *ebda = get_ebda_ptr();
    memset(ebda, 0, sizeof(*ebda));
    ebda->size = esize;
}

static void
ram_probe(void)
{
    dprintf(3, "Find memory size\n");
    if (CONFIG_COREBOOT) {
        coreboot_setup();
    } else {
        // On emulators, get memory size from nvram.
        u32 rs = ((inb_cmos(CMOS_MEM_EXTMEM2_LOW) << 16)
                  | (inb_cmos(CMOS_MEM_EXTMEM2_HIGH) << 24));
        if (rs)
            rs += 16 * 1024 * 1024;
        else
            rs = (((inb_cmos(CMOS_MEM_EXTMEM_LOW) << 10)
                   | (inb_cmos(CMOS_MEM_EXTMEM_HIGH) << 18))
                  + 1 * 1024 * 1024);
        RamSize = rs;
        add_e820(0, rs, E820_RAM);

        // Check for memory over 4Gig
        u64 high = ((inb_cmos(CMOS_MEM_HIGHMEM_LOW) << 16)
                    | ((u32)inb_cmos(CMOS_MEM_HIGHMEM_MID) << 24)
                    | ((u64)inb_cmos(CMOS_MEM_HIGHMEM_HIGH) << 32));
        RamSizeOver4G = high;
        add_e820(0x100000000ull, high, E820_RAM);

        /* reserve 256KB BIOS area at the end of 4 GB */
        add_e820(0xfffc0000, 256*1024, E820_RESERVED);
    }

    // Don't declare any memory between 0xa0000 and 0x100000
    add_e820(BUILD_LOWRAM_END, BUILD_BIOS_ADDR-BUILD_LOWRAM_END, E820_HOLE);

    // Mark known areas as reserved.
    u16 ebda_seg = get_ebda_seg();
    add_e820((u32)MAKE_FLATPTR(ebda_seg, 0), GET_EBDA2(ebda_seg, size) * 1024
             , E820_RESERVED);
    add_e820(BUILD_BIOS_ADDR, BUILD_BIOS_SIZE, E820_RESERVED);

    u32 count = qemu_cfg_e820_entries();
    if (count) {
        struct e820_reservation entry;
        int i;

        for (i = 0; i < count; i++) {
            qemu_cfg_e820_load_next(&entry);
            add_e820(entry.address, entry.length, entry.type);
        }
    } else if (kvm_para_available()) {
        // Backwards compatibility - provide hard coded range.
        // 4 pages before the bios, 3 pages for vmx tss pages, the
        // other page for EPT real mode pagetable
        add_e820(0xfffbc000, 4*4096, E820_RESERVED);
    }

    dprintf(1, "Ram Size=0x%08x (0x%08x%08x high)\n"
            , RamSize, (u32)(RamSizeOver4G >> 32), (u32)RamSizeOver4G);
}

static void
init_bios_tables(void)
{
    if (CONFIG_COREBOOT) {
        coreboot_copy_biostable();
        return;
    }

    create_pirtable();

    mptable_init();

    smbios_init();

    acpi_bios_init();
}

// Main setup code.
static void
post(void)
{
    // Detect and init ram.
    init_ivt();
    init_bda();
    memmap_setup();
    ram_probe();
    malloc_setup();
    thread_setup();

    // Init base pc hardware.
    pic_setup();
    timer_setup();
    mathcp_setup();

    // Initialize smp
    qemu_cfg_port_probe();
    smp_probe_setup();
    mtrr_setup();
    smp_probe();

    // Initialize pci
    pci_setup();
    smm_init();

    // Setup interfaces that option roms may need
    bios32_setup();
    pmm_setup();
    pnp_setup();
    kbd_setup();
    mouse_setup();
    init_bios_tables();

    // Run vga option rom (if running synchronously)
    if (!CONFIG_THREADS || !CONFIG_THREAD_OPTIONROMS)
        vga_setup();

    // Initialize hardware devices
    usb_setup();
    ps2port_setup();
    lpt_setup();
    serial_setup();

    boot_setup();
    drive_setup();
    cdemu_setup();
    floppy_setup();
    ata_setup();
    ramdisk_setup();

    // Run option roms
    if (CONFIG_THREADS && CONFIG_THREAD_OPTIONROMS) {
        // Run option roms while hw init still in progress.
        vga_setup();
        optionrom_setup();
        wait_threads();
    } else {
        // Wait for hw init to finish and run non-vga option roms.
        wait_threads();
        optionrom_setup();
    }

    // Run BCVs and show optional boot menu
    boot_prep();

    // Finalize data structures before boot
    pmm_finalize();
    malloc_finalize();
    memmap_finalize();
}

// 32-bit entry point.
void VISIBLE32FLAT
_start(void)
{
    init_dma();

    debug_serial_setup();
    dprintf(1, "Start bios (version %s)\n", VERSION);

    // Allow writes to modify bios area (0xf0000)
    make_bios_writable();

    // Perform main setup code.
    post();

    // Setup bios checksum.
    BiosChecksum -= checksum((u8*)BUILD_BIOS_ADDR, BUILD_BIOS_SIZE);

    // Write protect bios memory.
    make_bios_readonly();

    // Invoke int 19 to start boot process.
    dprintf(3, "Jump to int19\n");
    struct bregs br;
    memset(&br, 0, sizeof(br));
    br.flags = F_IF;
    call16_int(0x19, &br);
}
