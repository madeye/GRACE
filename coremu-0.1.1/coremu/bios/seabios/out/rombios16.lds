





OUTPUT_FORMAT("elf32-i386", "elf32-i386", "elf32-i386")
OUTPUT_ARCH("i386")
PHDRS
{
}
SECTIONS
{
        .data16 data16_start : {
                *(.data16)
                }
        .text16 text16_start : {
                *(.text16)
                }
        /DISCARD/ : { *(.discard*) }
}
