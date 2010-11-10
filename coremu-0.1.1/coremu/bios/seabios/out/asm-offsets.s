	.file	"asm-offsets.c"
	.section	.text.foo,"ax",@progbits
.globl foo
	.type	foo, @function
foo:
#APP
# 12 "src/asm-offsets.c" 1
	
->#BREGS
# 0 "" 2
# 13 "src/asm-offsets.c" 1
	
->BREGS_es $2 offsetof(struct bregs, es)
# 0 "" 2
# 14 "src/asm-offsets.c" 1
	
->BREGS_ds $0 offsetof(struct bregs, ds)
# 0 "" 2
# 15 "src/asm-offsets.c" 1
	
->BREGS_eax $28 offsetof(struct bregs, eax)
# 0 "" 2
# 16 "src/asm-offsets.c" 1
	
->BREGS_ebx $16 offsetof(struct bregs, ebx)
# 0 "" 2
# 17 "src/asm-offsets.c" 1
	
->BREGS_ecx $24 offsetof(struct bregs, ecx)
# 0 "" 2
# 18 "src/asm-offsets.c" 1
	
->BREGS_edx $20 offsetof(struct bregs, edx)
# 0 "" 2
# 19 "src/asm-offsets.c" 1
	
->BREGS_ebp $12 offsetof(struct bregs, ebp)
# 0 "" 2
# 20 "src/asm-offsets.c" 1
	
->BREGS_esi $8 offsetof(struct bregs, esi)
# 0 "" 2
# 21 "src/asm-offsets.c" 1
	
->BREGS_edi $4 offsetof(struct bregs, edi)
# 0 "" 2
# 22 "src/asm-offsets.c" 1
	
->BREGS_flags $36 offsetof(struct bregs, flags)
# 0 "" 2
# 23 "src/asm-offsets.c" 1
	
->BREGS_code $32 offsetof(struct bregs, code)
# 0 "" 2
# 25 "src/asm-offsets.c" 1
	
->#BDA
# 0 "" 2
# 26 "src/asm-offsets.c" 1
	
->BDA_ebda_seg $14 offsetof(struct bios_data_area_s, ebda_seg)
# 0 "" 2
# 28 "src/asm-offsets.c" 1
	
->#EBDA
# 0 "" 2
# 29 "src/asm-offsets.c" 1
	
->EBDA_OFFSET_TOP_STACK $872 EBDA_OFFSET_TOP_STACK
# 0 "" 2
# 30 "src/asm-offsets.c" 1
	
->EBDA_SEGMENT_START $40768 EBDA_SEGMENT_START
# 0 "" 2
#NO_APP
	ret
	.size	foo, .-foo
	.ident	"GCC: (GNU) 4.4.0 20090506 (Red Hat 4.4.0-4)"
	.section	.note.GNU-stack,"",@progbits
