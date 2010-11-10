OUTPUT_FORMAT("elf32-i386")
OUTPUT_ARCH("i386")
ENTRY(post32)
PHDRS
{
        text PT_LOAD AT ( code32flat_start ) ;
}
SECTIONS
{
        .text code32flat_start : {
                *(.text32flat)
                . = code32seg_start + 0xf0000 - code32flat_start ;
                *(.text32seg)
                . = data16_start + 0xf0000 - code32flat_start ;
                *(.data16)
                . = text16_start + 0xf0000 - code32flat_start ;
                *(.text16)
                final_text16_end = . ;
                } :text
        /DISCARD/ : {
                *(.text*) *(.data*) *(.bss*) *(.rodata*)
                *(COMMON) *(.discard*) *(.eh_frame)
                }
}
