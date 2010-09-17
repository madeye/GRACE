





OUTPUT_FORMAT("elf32-i386", "elf32-i386", "elf32-i386")
OUTPUT_ARCH("i386")
PHDRS
{
}
SECTIONS
{
        .text32seg code32seg_start : {
                *(.text32seg)
        }
        /DISCARD/ : { *(.discard*) }
}
