
/* DO NOT EDIT!  This is an autogenerated file.  See tools/layoutrom.py. */
OUTPUT_FORMAT("elf32-i386")
OUTPUT_ARCH("i386")
SECTIONS
{

        code32flat_start = 0xe8800 ;
        .text32flat code32flat_start : {
*(.text.asm.src/smm.c.70)
*(.text.pmm_free.1747)
*(.text.__end_thread.6189)
*(.text.putc_debug.8231)
*(.text.putc.8265)
*(.text.putuint.8299)
*(.text.putsinglehex.8312)
*(.text.bvprintf.8363)
*(.text.putc_str.8459)
*(.text.snprintf.1565)
*(.text.printf.1561)
*(.text.__dprintf.1567)
*(.text.panic.1559)
*(.text.yield.1535)
*(.text.mutex_lock.1545)
*(.text.__call16_int.1465)
*(.text.putc_screen.8255)
*(.text.get_keystroke.1523)
*(.text.memmove.1515)
*(.text.setup_translation.1134)
*(.text.add_ordered_drive.12456)
*(.text.powerup_await_non_bsy.18026)
*(.text.pci_next.17027)
*(.text.udelay.1643)
*(.text.msleep.1651)
*(.text.add_bcv_internal.17076)
*(.text.i8042_wait_write.35187)
*(.text.i8042_command.20244)
*(.text.uhci_hub_detect.55265)
*(.text.uhci_hub_reset.55285)
*(.text.uhci_hub_disconnect.55306)
*(.text.uhci_waittick.55438)
*(.text.wait_td.55663)
*(.text.ohci_hub_detect.57672)
*(.text.ohci_hub_disconnect.57690)
*(.text.ohci_hub_reset.57701)
*(.text.ohci_waittick.57864)
*(.text.ehci_hub_disconnect.60121)
*(.text.ehci_waittick.60287)
*(.text.free_pipe.52657)
*(.text.ehci_wait_td.60519)
*(.text.usb_send_bulk.52655)
*(.text.__make_bios_writable.69411)
*(.text.insert_e820.71271)
*(.text.add_e820.3341)
*(.text.call_boot_entry.76584)
*(.text.boot_disk.76595)
*(.text.qemu_cfg_smbios_load_external.37103)
*(.text.qemu_cfg_smbios_load_field.37097)
*(.text.pci_set_io_region_addr.86851)
*(.text.__callrom.88873)
*(.text.run_bcv.76540)
*(.text.init_optionrom.88987)
*(.text.init_pcirom.89154)
*(.text.qemu_cfg_next_file.37124)
*(.text.run_qemu_roms.89044)
*(.text.build_header.78904.clone.0)
*(.text.__debug_enter.1570.clone.1)
*(.text.pmm_malloc.1745.clone.2)
*(.text.mptable_init.67317)
*(.text.smbios_init.67460)
*(.text.malloc_high.78108)
*(.text.alloc_default_control_pipe.53082)
*(.text.alloc_bulk_pipe.52660)
*(.text.init_atadrive.17912)
*(.text.run_thread.1539)
*(.text.usb_enumerate.52646)
*(.text.configure_uhci.55335)
*(.text.configure_ohci.57795)
*(.text.configure_ehci.60144)
*(.text.uhci_init.52375)
*(.text.ohci_init.52413)
*(.text.ehci_note_port.60037)
*(.text.ehci_hub_detect.60065)
*(.text.ehci_hub_reset.60095)
*(.text.addFloppy.1153.clone.3)
*(.text.await_ide.17162.clone.4)
*(.text.ndelay_await_not_bsy.17202)
*(.text.send_cmd.17310)
*(.text.ata_pio_transfer.17453.clone.5)
*(.text.cdb_cmd_data.50829)
*(.text.cdb_read.17157)
*(.text.cdrom_boot.1168)
*(.text.do_boot.76670)
*(.text.handle_18)
*(.text.handle_19)
*(.text.send_ata_identity.17859)
*(.text.ata_detect.18052)
*(.text.init_controller.18137.clone.6)
*(.text.ata_init.18152)
*(.text.pci_find_device.17022.clone.7)
*(.text.acpi_bios_init.39152)
*(.text.smm_init.1677)
*(.text.post.67846)
*(.text.make_bios_readonly.1673)
*(.text.s3_resume)
*(.text._start)
*(.text.ps2_recvbyte.35292.clone.8)
*(.text.ps2_sendbyte.35334.clone.9)
*(.text.ps2_command.35356.clone.10)
*(.text.keyboard_init.35531)
*(.text.send_default_control.52650)
*(.text.usb_init_hub_port.53379)
*(.text.set_port_feature.93796)
*(.text.get_port_status.93824)
*(.text.usb_hub_detect.93836)
*(.text.usb_hub_disconnect.93864)
*(.text.usb_hub_reset.93875)
code32_rodata = . ;
*(.rodata)
*(.rodata.bvprintf.8363)
*(.rodata.str1.1)
*(.rodata.__func__.12458)
*(.rodata.__func__.12445)
*(.rodata.__func__.14568)
*(.rodata.__func__.18140)
*(.rodata.__func__.18031)
*(.rodata.__func__.17218)
*(.rodata.__func__.17166)
*(.rodata.__func__.17916)
*(.rodata.__func__.32961)
*(.rodata.__func__.35194)
*(.rodata.__func__.35297)
*(.rodata.__func__.35176)
*(.rodata.__func__.35212)
*(.rodata.__func__.55784)
*(.rodata.__func__.55668)
*(.rodata.__func__.55443)
*(.rodata.__func__.55645)
*(.rodata.__func__.55543)
*(.rodata.__func__.55411)
*(.rodata.__func__.55504)
*(.rodata.__func__.55471)
*(.rodata.__func__.55342)
*(.rodata.__func__.57956)
*(.rodata.__func__.57852)
*(.rodata.__func__.57870)
*(.rodata.__func__.57933)
*(.rodata.__func__.57911)
*(.rodata.__func__.57800)
*(.rodata.__func__.57754)
*(.rodata.__func__.57709)
*(.rodata.__func__.60643)
*(.rodata.__func__.60524)
*(.rodata.__func__.60293)
*(.rodata.__func__.60501)
*(.rodata.__func__.60412)
*(.rodata.__func__.60273)
*(.rodata.__func__.60359)
*(.rodata.__func__.60337)
*(.rodata.__func__.60150)
*(.rodata.__func__.65058)
*(.rodata.__func__.71273)
*(.rodata.__func__.76727)
*(.rodata.__func__.76712)
*(.rodata.__func__.79178)
*(.rodata.__func__.78924)
*(.rodata.__func__.79015)
*(.rodata.__func__.78961)
*(.rodata.__func__.79072)
*(.rodata.__func__.79103)
*(.rodata.__func__.82490)
*(.rodata.__func__.84832)
*(.rodata.__func__.84635)
*(.rodata.pci_irqs.86847)
*(.rodata.__func__.88971)
*(.rodata.__func__.93882)
*(.rodata.__func__.95700)
*(.rodata.VERSION)
*(.data.Zones)
*(.data.debuginfo.8242)
*(.data.screeninfo.8262)
*(.data.uhci_HubOp.55317)
*(.data.ohci_HubOp.57728)
*(.data.ehci_HubOp.60133)
*(.data.AmlCode.78891)
*(.data.HubOp.93904)
*(.bss.used_bitmap.95693)
*(.bss.pci_bios_io_addr.86845)
*(.bss.pci_bios_mem_addr.86846)
*(.bss.SpinupEnd.18024)
*(.bss.RamSizeOver4G.1624)
*(.bss.RomEnd.1724)
*(.bss.ZoneLow)
*(.bss.ZoneHigh)
*(.bss.ZoneFSeg)
*(.bss.ZoneTmpLow)
*(.bss.ZoneTmpHigh)
*(.bss.PMMAllocs)
*(.bss.IPL.17064)
*(.bss.qemu_cfg_present.37076)
*(.bss.RsdpAddr.39165)

                freespace_start = . ;
                code32flat_end = ABSOLUTE(.) ;
        }

}
