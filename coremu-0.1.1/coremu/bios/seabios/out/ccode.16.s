	.file	"misc.c"
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.text
.Ltext0:
#APP
	.section .text.asm.src/util.c.66
	  .global trampoline_checkirqs
trampoline_checkirqs:
  rep ; nop
  lretw
	.section .text.asm.src/smp.c.66
	  .global smp_ap_boot_code
smp_ap_boot_code:
  movw $0xf000, %ax
  movw %ax, %ds
  movl $smp_mtrr, %esi
  movl smp_mtrr_count, %ebx
1:testl %ebx, %ebx
  jz 2f
  movl 0(%esi), %ecx
  movl 4(%esi), %eax
  movl 8(%esi), %edx
  wrmsr
  addl $12, %esi
  decl %ebx
  jmp 1b
2:
  lock incl CountCPUs
1:hlt
  jmp 1b

#NO_APP
	.section	.text.handle_12,"ax",@progbits
.globl handle_12
	.type	handle_12, @function
handle_12:
.LFB73:
	.file 1 "src/misc.c"
	.loc 1 28 0
	.cfi_startproc
.LVL0:
	.loc 1 30 0
	movl	$64, %edx
#APP
# 30 "src/misc.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB6974:
#APP
# 30 "src/misc.c" 1
	movw %ES:19, %dx
# 0 "" 2
.LVL1:
#NO_APP
.LBE6974:
	movw	%dx, 28(%eax)
	.loc 1 31 0
	ret
	.cfi_endproc
.LFE73:
	.size	handle_12, .-handle_12
	.section	.text.handle_11,"ax",@progbits
.globl handle_11
	.type	handle_11, @function
handle_11:
.LFB74:
	.loc 1 36 0
	.cfi_startproc
.LVL2:
	.loc 1 38 0
	movl	$64, %edx
#APP
# 38 "src/misc.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB6975:
#APP
# 38 "src/misc.c" 1
	movw %ES:16, %dx
# 0 "" 2
.LVL3:
#NO_APP
.LBE6975:
	movw	%dx, 28(%eax)
	.loc 1 39 0
	ret
	.cfi_endproc
.LFE74:
	.size	handle_11, .-handle_11
	.section	.text.handle_10,"ax",@progbits
.globl handle_10
	.type	handle_10, @function
handle_10:
.LFB76:
	.loc 1 51 0
	.cfi_startproc
.LVL4:
	.loc 1 54 0
	ret
	.cfi_endproc
.LFE76:
	.size	handle_10, .-handle_10
	.section	.text.handle_02,"ax",@progbits
.globl handle_02
	.type	handle_02, @function
handle_02:
.LFB77:
	.loc 1 59 0
	.cfi_startproc
	.loc 1 59 0
	movl	$__func__.2037, %ecx
.LVL5:
.LBB6976:
.LBB6977:
.LBB6978:
.LBB6979:
.LBB6980:
.LBB6981:
.LBB6982:
.LBB6983:
.LBB6984:
	.file 2 "src/ioport.h"
	.loc 2 82 0
	movl	$1026, %edx
.LVL6:
.L9:
.LBE6984:
.LBE6983:
.LBE6982:
.LBE6981:
.LBE6980:
.LBB6989:
	.file 3 "src/output.c"
	.loc 3 161 0
#APP
# 161 "src/output.c" 1
	movb %CS:(%ecx), %al
# 0 "" 2
#NO_APP
.LBE6989:
	.loc 3 162 0
	testb	%al, %al
	je	.L8
.LBB6990:
.LBB6988:
.LBB6987:
.LBB6986:
.LBB6985:
	.loc 2 82 0
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE6985:
.LBE6986:
.LBE6987:
.LBE6988:
.LBE6990:
.LBE6979:
	.loc 3 160 0
	incl	%ecx
	jmp	.L9
.L8:
.LBE6978:
.LBE6977:
.LBB6991:
.LBB6992:
.LBB6993:
.LBB6994:
.LBB6995:
	.loc 2 82 0
	movl	$1026, %edx
	movb	$10, %al
.LVL7:
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE6995:
.LBE6994:
.LBE6993:
.LBE6992:
.LBE6991:
.LBE6976:
	.loc 1 61 0
	ret
	.cfi_endproc
.LFE77:
	.size	handle_02, .-handle_02
	.section	.text.handle_75,"ax",@progbits
.globl handle_75
	.type	handle_75, @function
handle_75:
.LFB79:
	.loc 1 75 0
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	pushl	%esi
	.cfi_def_cfa_offset 12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.loc 1 75 0
	movl	$__func__.2092, %ecx
.LVL8:
.LBB6996:
.LBB6997:
.LBB6998:
.LBB6999:
.LBB7000:
.LBB7001:
.LBB7002:
.LBB7003:
.LBB7004:
	.loc 2 82 0
	movl	$1026, %edx
.LVL9:
.L14:
.LBE7004:
.LBE7003:
.LBE7002:
.LBE7001:
.LBE7000:
.LBB7009:
	.loc 3 161 0
#APP
# 161 "src/output.c" 1
	movb %CS:(%ecx), %al
# 0 "" 2
#NO_APP
.LBE7009:
	.loc 3 162 0
	testb	%al, %al
	je	.L13
	.cfi_offset 3, -16
	.cfi_offset 6, -12
	.cfi_offset 7, -8
.LBB7010:
.LBB7008:
.LBB7007:
.LBB7006:
.LBB7005:
	.loc 2 82 0
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE7005:
.LBE7006:
.LBE7007:
.LBE7008:
.LBE7010:
.LBE6999:
	.loc 3 160 0
	incl	%ecx
	jmp	.L14
.L13:
.LBE6998:
.LBE6997:
.LBB7011:
.LBB7012:
.LBB7013:
.LBB7014:
.LBB7015:
	.loc 2 82 0
	movl	$1026, %edx
	movb	$10, %al
.LVL10:
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE7015:
.LBE7014:
.LBE7013:
.LBE7012:
.LBE7011:
.LBE6996:
.LBB7016:
.LBB7017:
	.loc 2 82 0
	xorl	%eax, %eax
#APP
# 82 "src/ioport.h" 1
	outb %al, $240
# 0 "" 2
#NO_APP
.LBE7017:
.LBE7016:
.LBB7018:
.LBB7019:
.LBB7020:
	movb	$32, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $160
# 0 "" 2
#NO_APP
.LBE7020:
.LBE7019:
.LBB7021:
.LBB7022:
.LBB7023:
#APP
# 82 "src/ioport.h" 1
	outb %al, $32
# 0 "" 2
#NO_APP
.LBE7023:
.LBE7022:
.LBE7021:
.LBE7018:
	.loc 1 84 0
	xorl	%eax, %eax
.LVL11:
#APP
# 84 "src/misc.c" 1
	pushl %ebp
sti
stc
int $2
pushfl
popl %ecx
cli
cld
popl %ebp
# 0 "" 2
.LVL12:
	.loc 1 85 0
#NO_APP
	popl	%ebx
	popl	%esi
	popl	%edi
	ret
	.cfi_endproc
.LFE79:
	.size	handle_75, .-handle_75
	.section	.text.pmm_free_data.4745,"ax",@progbits
	.type	pmm_free_data.4745, @function
pmm_free_data.4745:
.LFB146:
	.file 4 "src/pmm.c"
	.loc 4 225 0
	.cfi_startproc
.LVL13:
	pushl	%edi
	.cfi_def_cfa_offset 8
	pushl	%esi
	.cfi_def_cfa_offset 12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.loc 4 225 0
	xorl	%ebx, %ebx
	.cfi_offset 3, -16
	.cfi_offset 6, -12
	.cfi_offset 7, -8
.LVL14:
.LBB7024:
.LBB7025:
.LBB7026:
.LBB7027:
.LBB7028:
	.loc 4 138 0
	xorl	%esi, %esi
.LVL15:
.L19:
#APP
# 138 "src/pmm.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB7029:
#APP
# 138 "src/pmm.c" 1
	addr32 movl %ES:Zones(,%ebx,4), %ecx
# 0 "" 2
#NO_APP
.LBE7029:
	.loc 4 139 0
#APP
# 139 "src/pmm.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB7030:
#APP
# 139 "src/pmm.c" 1
	addr32 movl %ES:8(%ecx), %edi
# 0 "" 2
.LVL16:
#NO_APP
.LBE7030:
	cmpl	%edi, %eax
	jb	.L17
	.loc 4 140 0
#APP
# 140 "src/pmm.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB7031:
#APP
# 140 "src/pmm.c" 1
	addr32 movl %ES:(%ecx), %edi
# 0 "" 2
.LVL17:
#NO_APP
.LBE7031:
	.loc 4 139 0
	cmpl	%edi, %eax
	jb	.L18
.LVL18:
.L17:
.LBE7028:
	.loc 4 137 0
	incl	%ebx
	cmpl	$5, %ebx
	jne	.L19
	jmp	.L20
.LVL19:
.L18:
.LBE7027:
.LBE7026:
	.loc 4 151 0
	testl	%ecx, %ecx
	je	.L20
	testl	%eax, %eax
	je	.L20
	xorl	%ebx, %ebx
.LVL20:
#APP
# 151 "src/pmm.c" 1
	movw %bx, %ES
# 0 "" 2
#NO_APP
.LBB7032:
#APP
# 151 "src/pmm.c" 1
	addr32 movl %ES:8(%ecx), %esi
# 0 "" 2
.LVL21:
#NO_APP
.LBE7032:
	cmpl	%eax, %esi
	jne	.L20
	.loc 4 153 0
#APP
# 153 "src/pmm.c" 1
	movw %bx, %ES
# 0 "" 2
# 153 "src/pmm.c" 1
	addr32 movl %edx, %ES:8(%ecx)
# 0 "" 2
#NO_APP
	jmp	.L26
.LVL22:
.L20:
.LBE7025:
.LBE7024:
	.loc 4 231 0
	xorl	%ecx, %ecx
.LVL23:
#APP
# 231 "src/pmm.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB7033:
#APP
# 231 "src/pmm.c" 1
	addr32 movl %ES:PMMAllocs, %ecx
# 0 "" 2
.LVL24:
#NO_APP
.LBE7033:
	.loc 4 232 0
	xorl	%ebx, %ebx
.LVL25:
	.loc 4 231 0
	jmp	.L22
.LVL26:
.L25:
	.loc 4 232 0
	xorl	%esi, %esi
.LVL27:
#APP
# 232 "src/pmm.c" 1
	movw %bx, %ES
# 0 "" 2
#NO_APP
.LBB7034:
#APP
# 232 "src/pmm.c" 1
	addr32 movl %ES:4(%ecx), %edi
# 0 "" 2
.LVL28:
#NO_APP
.LBE7034:
	cmpl	%eax, %edi
	jne	.L23
	.loc 4 233 0
#APP
# 233 "src/pmm.c" 1
	movw %si, %ES
# 0 "" 2
# 233 "src/pmm.c" 1
	addr32 movl %edx, %ES:4(%ecx)
# 0 "" 2
	.loc 4 234 0
#NO_APP
	jmp	.L26
.L23:
	.loc 4 235 0
#APP
# 235 "src/pmm.c" 1
	movw %bx, %ES
# 0 "" 2
#NO_APP
.LBB7035:
#APP
# 235 "src/pmm.c" 1
	addr32 movl %ES:12(%ecx), %edi
# 0 "" 2
.LVL29:
#NO_APP
.LBE7035:
	cmpl	%eax, %edi
	jne	.L24
	.loc 4 236 0
#APP
# 236 "src/pmm.c" 1
	movw %si, %ES
# 0 "" 2
# 236 "src/pmm.c" 1
	addr32 movl %edx, %ES:12(%ecx)
# 0 "" 2
	.loc 4 237 0
#NO_APP
	jmp	.L26
.L24:
	.loc 4 231 0
#APP
# 231 "src/pmm.c" 1
	movw %bx, %ES
# 0 "" 2
#NO_APP
.LBB7036:
#APP
# 231 "src/pmm.c" 1
	addr32 movl %ES:16(%ecx), %ecx
# 0 "" 2
.LVL30:
#NO_APP
.L22:
.LBE7036:
	testl	%ecx, %ecx
	jne	.L25
.LVL31:
.L26:
	.loc 4 239 0
	popl	%ebx
	popl	%esi
.LVL32:
	popl	%edi
.LVL33:
	ret
	.cfi_endproc
.LFE146:
	.size	pmm_free_data.4745, .-pmm_free_data.4745
	.section	.text.pmm_free.1834,"ax",@progbits
	.type	pmm_free.1834, @function
pmm_free.1834:
.LFB147:
	.loc 4 244 0
	.cfi_startproc
.LVL34:
	pushl	%edi
	.cfi_def_cfa_offset 8
	pushl	%esi
	.cfi_def_cfa_offset 12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.loc 4 244 0
	movl	$PMMAllocs, %ecx
.LVL35:
.LBB7037:
	.loc 4 247 0
	xorl	%esi, %esi
	.cfi_offset 3, -16
	.cfi_offset 6, -12
	.cfi_offset 7, -8
.LVL36:
.L32:
	xorl	%edx, %edx
#APP
# 247 "src/pmm.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB7038:
#APP
# 247 "src/pmm.c" 1
	addr32 movl %ES:(%ecx), %ebx
# 0 "" 2
#NO_APP
.LBE7038:
	.loc 4 248 0
	testl	%ebx, %ebx
	je	.L29
	.loc 4 250 0
#APP
# 250 "src/pmm.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB7039:
#APP
# 250 "src/pmm.c" 1
	addr32 movl %ES:(%ebx), %edi
# 0 "" 2
#NO_APP
.LBE7039:
	cmpl	%eax, %edi
	jne	.L30
.LBB7040:
	.loc 4 251 0
#APP
# 251 "src/pmm.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB7041:
#APP
# 251 "src/pmm.c" 1
	addr32 movl %ES:16(%ebx), %esi
# 0 "" 2
.LVL37:
#NO_APP
.LBE7041:
#APP
# 251 "src/pmm.c" 1
	addr32 movl %esi, %ES:(%ecx)
# 0 "" 2
	.loc 4 252 0
# 252 "src/pmm.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB7042:
#APP
# 252 "src/pmm.c" 1
	addr32 movl %ES:12(%ebx), %esi
# 0 "" 2
.LVL38:
#NO_APP
.LBE7042:
	.loc 4 253 0
#APP
# 253 "src/pmm.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB7043:
#APP
# 253 "src/pmm.c" 1
	addr32 movl %ES:4(%ebx), %edx
# 0 "" 2
.LVL39:
#NO_APP
.LBE7043:
	.loc 4 254 0
	call	pmm_free_data.4745
.LVL40:
	.loc 4 255 0
	movl	%esi, %edx
	movl	%ebx, %eax
	call	pmm_free_data.4745
	xorl	%eax, %eax
	.loc 4 258 0
	jmp	.L31
.LVL41:
.L30:
.LBE7040:
	.loc 4 260 0
	leal	16(%ebx), %ecx
.LBE7037:
	.loc 4 261 0
	jmp	.L32
.L29:
	orl	$-1, %eax
.LVL42:
.L31:
	.loc 4 262 0
	popl	%ebx
.LVL43:
	popl	%esi
.LVL44:
	popl	%edi
.LVL45:
	ret
	.cfi_endproc
.LFE147:
	.size	pmm_free.1834, .-pmm_free.1834
	.section	.text.floppy_pio.17134,"ax",@progbits
	.type	floppy_pio.17134, @function
floppy_pio.17134:
.LFB573:
	.file 5 "src/floppy.c"
	.loc 5 224 0
	.cfi_startproc
.LVL46:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	pushl	%edi
	.cfi_def_cfa_offset 12
	pushl	%esi
	.cfi_def_cfa_offset 16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	subl	$4, %esp
	.cfi_def_cfa_offset 24
	movl	%eax, %ebx
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 5, -8
	movb	%dl, 3(%esp)
	.loc 5 224 0
	movzbl	1(%eax), %esi
	andl	$1, %esi
.LVL47:
.LBB7044:
.LBB7045:
.LBB7046:
	.loc 5 200 0
	movl	$64, %ecx
#APP
# 200 "src/floppy.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB7047:
#APP
# 200 "src/floppy.c" 1
	movb %ES:62, %al
# 0 "" 2
.LVL48:
#NO_APP
.LBE7047:
.LBB7048:
	andl	$127, %eax
.LVL49:
#APP
# 200 "src/floppy.c" 1
	movb %al, %ES:62
# 0 "" 2
#NO_APP
.LBE7048:
.LBE7046:
.LBB7049:
.LBB7050:
	.loc 2 92 0
	movl	$1010, %edx
.LVL50:
#APP
# 92 "src/ioport.h" 1
	inb %dx, %al
# 0 "" 2
.LVL51:
#NO_APP
	movl	%eax, %edi
.LVL52:
.LBE7050:
.LBE7049:
	.loc 5 205 0
	movl	%esi, %eax
	cmpb	$1, %al
	sbbl	%eax, %eax
	movl	%eax, %ebp
	andl	$-16, %ebp
.LVL53:
	addl	$32, %ebp
.LVL54:
	.loc 5 207 0
	movl	%esi, %eax
	orl	$12, %eax
.LBB7051:
.LBB7052:
	.loc 2 82 0
	orl	%ebp, %eax
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE7052:
.LBE7051:
.LBB7053:
	.loc 5 212 0
#APP
# 212 "src/floppy.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
	movb	$37, %al
#APP
# 212 "src/floppy.c" 1
	movb %al, %ES:64
# 0 "" 2
#NO_APP
.LBE7053:
.LBB7054:
.LBB7055:
	.loc 2 92 0
	movb	$-12, %dl
.L37:
#APP
# 92 "src/ioport.h" 1
	inb %dx, %al
# 0 "" 2
.LVL55:
#NO_APP
.LBE7055:
.LBE7054:
	.loc 5 215 0
	andl	$192, %eax
.LVL56:
	addl	$-128, %eax
	jne	.L37
	.loc 5 218 0
	andl	$4, %edi
	jne	.L38
.LBB7056:
.LBB7057:
	.loc 5 182 0
	movl	$64, %ecx
.LBB7058:
	xorl	%edx, %edx
.LVL57:
.L51:
.LBE7058:
#APP
# 182 "src/floppy.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB7059:
#APP
# 182 "src/floppy.c" 1
	movb %ES:64(%edx), %al
# 0 "" 2
.LVL58:
#NO_APP
.LBE7059:
	testb	%al, %al
	je	.L38
	.loc 5 184 0
#APP
# 184 "src/floppy.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB7060:
#APP
# 184 "src/floppy.c" 1
	movb %ES:62(%edx), %al
# 0 "" 2
.LVL59:
#NO_APP
.LBE7060:
	.loc 5 185 0
	testb	%al, %al
	js	.L39
.LBB7061:
.LBB7062:
.LBB7063:
.LBB7064:
	.file 6 "src/util.c"
	.loc 6 72 0
#APP
# 72 "src/util.c" 1
	sti
nop
rep ; nop
cli
cld

# 0 "" 2
#NO_APP
	jmp	.L51
.L39:
.LBE7064:
.LBE7063:
.LBE7062:
.LBE7061:
	.loc 5 192 0
	andl	$127, %eax
.LVL60:
.LBB7065:
	.loc 5 193 0
	movl	$64, %edx
#APP
# 193 "src/floppy.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	xorb	%dl, %dl
#APP
# 193 "src/floppy.c" 1
	movb %al, %ES:62(%edx)
# 0 "" 2
.LVL61:
#NO_APP
.L38:
	xorl	%ecx, %ecx
.LVL62:
.LBE7065:
.LBE7057:
.LBE7056:
.LBE7045:
.LBE7044:
.LBB7066:
.LBB7067:
	.loc 2 82 0
	movl	$1013, %edx
	jmp	.L41
.L42:
	movb	(%ebx), %al
.LVL63:
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE7067:
.LBE7066:
	.loc 5 229 0
	incl	%ecx
.LVL64:
	incl	%ebx
.LVL65:
.L41:
	cmpb	3(%esp), %cl
	jb	.L42
.LBB7068:
.LBB7069:
	.loc 5 182 0
	movl	$64, %ecx
.LVL66:
.LBB7070:
	xorl	%edx, %edx
.LVL67:
.L52:
.LBE7070:
#APP
# 182 "src/floppy.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB7071:
#APP
# 182 "src/floppy.c" 1
	movb %ES:64(%edx), %al
# 0 "" 2
.LVL68:
#NO_APP
.LBE7071:
	testb	%al, %al
	je	.L43
	.loc 5 184 0
#APP
# 184 "src/floppy.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB7072:
#APP
# 184 "src/floppy.c" 1
	movb %ES:62(%edx), %al
# 0 "" 2
.LVL69:
#NO_APP
.LBE7072:
	.loc 5 185 0
	testb	%al, %al
	js	.L44
.LBB7073:
.LBB7074:
.LBB7075:
.LBB7076:
	.loc 6 72 0
#APP
# 72 "src/util.c" 1
	sti
nop
rep ; nop
cli
cld

# 0 "" 2
#NO_APP
	jmp	.L52
.L44:
.LBE7076:
.LBE7075:
.LBE7074:
.LBE7073:
	.loc 5 192 0
	andl	$127, %eax
.LVL70:
.LBB7077:
	.loc 5 193 0
	movl	$64, %edx
#APP
# 193 "src/floppy.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	xorb	%dl, %dl
#APP
# 193 "src/floppy.c" 1
	movb %al, %ES:62(%edx)
# 0 "" 2
#NO_APP
	xorl	%eax, %eax
.LVL71:
	jmp	.L46
.LVL72:
.L43:
.LBE7077:
.LBE7069:
.LBE7068:
.LBB7078:
.LBB7079:
.LBB7080:
.LBB7081:
	.loc 2 92 0
	movl	$1010, %edx
#APP
# 92 "src/ioport.h" 1
	inb %dx, %al
# 0 "" 2
.LVL73:
#NO_APP
	movb	%al, %cl
.LVL74:
.LBE7081:
.LBE7080:
.LBB7082:
.LBB7083:
	.loc 2 82 0
	movl	%ecx, %eax
.LVL75:
	andl	$251, %eax
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE7083:
.LBE7082:
.LBB7084:
.LBB7085:
	movb	%cl, %al
.LVL76:
	orl	$4, %eax
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE7085:
.LBE7084:
.LBB7086:
.LBB7087:
	.loc 2 92 0
	movb	$-12, %dl
.L47:
#APP
# 92 "src/ioport.h" 1
	inb %dx, %al
# 0 "" 2
.LVL77:
#NO_APP
.LBE7087:
.LBE7086:
	.loc 5 172 0
	andl	$192, %eax
.LVL78:
	addl	$-128, %eax
	jne	.L47
	orl	$-1, %eax
.L46:
.LBE7079:
.LBE7078:
	.loc 5 239 0
	popl	%edx
	.cfi_def_cfa_offset 20
	popl	%ebx
.LVL79:
	popl	%esi
.LVL80:
	popl	%edi
.LVL81:
	popl	%ebp
.LVL82:
	ret
	.cfi_endproc
.LFE573:
	.size	floppy_pio.17134, .-floppy_pio.17134
	.section	.text.floppy_cmd.17157,"ax",@progbits
	.type	floppy_cmd.17157, @function
floppy_cmd.17157:
.LFB574:
	.loc 5 243 0
	.cfi_startproc
.LVL83:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	pushl	%edi
	.cfi_def_cfa_offset 12
	pushl	%esi
	.cfi_def_cfa_offset 16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	subl	$4, %esp
	.cfi_def_cfa_offset 24
	movl	%ecx, %ebx
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 5, -8
	movb	24(%esp), %cl
.LVL84:
	movb	%cl, 3(%esp)
	.loc 5 245 0
	movl	8(%eax), %ecx
.LVL85:
	.loc 5 248 0
	leal	-1(%edx), %esi
.LVL86:
	.loc 5 250 0
	movl	%ecx, %ebp
	shrl	$16, %ebp
	movzwl	%si, %edx
.LVL87:
	addl	%ecx, %edx
.LVL88:
	shrl	$16, %edx
	movl	$9, %eax
.LVL89:
	cmpl	%edx, %ebp
	jne	.L55
	.loc 5 254 0
	cmpb	$-26, (%ebx)
	setne	%dl
	leal	70(,%edx,4), %edx
.LBB7088:
.LBB7089:
	.loc 2 82 0
	movb	$6, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $10
# 0 "" 2
#NO_APP
.LBE7089:
.LBE7088:
.LBB7090:
.LBB7091:
	xorl	%edi, %edi
	movl	%edi, %eax
#APP
# 82 "src/ioport.h" 1
	outb %al, $12
# 0 "" 2
#NO_APP
.LBE7091:
.LBE7090:
.LBB7092:
.LBB7093:
	movb	%cl, %al
.LVL90:
#APP
# 82 "src/ioport.h" 1
	outb %al, $4
# 0 "" 2
#NO_APP
.LBE7093:
.LBE7092:
.LBB7094:
.LBB7095:
	movl	%ecx, %eax
.LVL91:
	shrl	$8, %eax
#APP
# 82 "src/ioport.h" 1
	outb %al, $4
# 0 "" 2
#NO_APP
.LBE7095:
.LBE7094:
.LBB7096:
.LBB7097:
	movl	%edi, %eax
#APP
# 82 "src/ioport.h" 1
	outb %al, $12
# 0 "" 2
#NO_APP
.LBE7097:
.LBE7096:
.LBB7098:
.LBB7099:
	movl	%esi, %eax
#APP
# 82 "src/ioport.h" 1
	outb %al, $5
# 0 "" 2
#NO_APP
.LBE7099:
.LBE7098:
.LBB7100:
.LBB7101:
	movl	%esi, %eax
.LVL92:
	shrw	$8, %ax
#APP
# 82 "src/ioport.h" 1
	outb %al, $5
# 0 "" 2
#NO_APP
.LBE7101:
.LBE7100:
.LBB7102:
.LBB7103:
	movb	%dl, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $11
# 0 "" 2
#NO_APP
.LBE7103:
.LBE7102:
.LBB7104:
.LBB7105:
	movl	%ebp, %eax
#APP
# 82 "src/ioport.h" 1
	outb %al, $129
# 0 "" 2
#NO_APP
.LBE7105:
.LBE7104:
.LBB7106:
.LBB7107:
	movb	$2, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $10
# 0 "" 2
#NO_APP
.LBE7107:
.LBE7106:
	.loc 5 276 0
	movzbl	3(%esp), %edx
.LVL93:
	movl	%ebx, %eax
	call	floppy_pio.17134
.LVL94:
	movl	%eax, %edx
.LVL95:
	.loc 5 277 0
	movl	$128, %eax
	testl	%edx, %edx
	jne	.L55
.LBB7108:
.LBB7109:
	.loc 2 92 0
	movl	$1012, %edx
.LVL96:
#APP
# 92 "src/ioport.h" 1
	inb %dx, %al
# 0 "" 2
.LVL97:
#NO_APP
.LBE7109:
.LBE7108:
	.loc 5 281 0
	movl	%eax, %edx
.LVL98:
	andl	$192, %edx
	movl	$32, %eax
	cmpl	$192, %edx
	jne	.L55
	xorl	%ecx, %ecx
.LBB7110:
.LBB7111:
.LBB7112:
	.loc 2 92 0
	movl	$1013, %edx
.LBE7112:
.LBE7111:
.LBB7114:
	.loc 5 289 0
	movl	$64, %esi
.LVL99:
.L60:
.LBE7114:
.LBB7115:
.LBB7113:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb %dx, %al
# 0 "" 2
.LVL100:
#NO_APP
.LBE7113:
.LBE7115:
	.loc 5 288 0
	movb	%al, (%ebx,%ecx)
.LBB7116:
	.loc 5 289 0
#APP
# 289 "src/floppy.c" 1
	movw %si, %ES
# 0 "" 2
# 289 "src/floppy.c" 1
	movb %al, %ES:66(%ecx)
# 0 "" 2
#NO_APP
	incl	%ecx
.LBE7116:
.LBE7110:
	.loc 5 286 0
	cmpl	$7, %ecx
	jne	.L60
	xorl	%eax, %eax
.LVL101:
.L55:
	.loc 5 293 0
	popl	%ecx
	.cfi_def_cfa_offset 20
.LVL102:
	popl	%ebx
.LVL103:
	popl	%esi
.LVL104:
	popl	%edi
	popl	%ebp
	ret	$4
	.cfi_endproc
.LFE574:
	.size	floppy_cmd.17157, .-floppy_cmd.17157
	.section	.text.check_recal_drive.17439,"ax",@progbits
	.type	check_recal_drive.17439, @function
check_recal_drive.17439:
.LFB578:
	.loc 5 363 0
	.cfi_startproc
.LVL105:
	pushl	%edi
	.cfi_def_cfa_offset 8
	pushl	%esi
	.cfi_def_cfa_offset 12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	movl	%eax, %ebx
	.cfi_offset 3, -16
	.cfi_offset 6, -12
	.cfi_offset 7, -8
.LBB7117:
	.loc 5 364 0
#APP
# 364 "src/floppy.c" 1
	movl %CS:20(%eax), %eax
# 0 "" 2
.LVL106:
#NO_APP
.LBE7117:
	.loc 5 365 0
	movl	$64, %edx
#APP
# 365 "src/floppy.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB7118:
#APP
# 365 "src/floppy.c" 1
	movb %ES:62, %cl
# 0 "" 2
.LVL107:
#NO_APP
.LBE7118:
	movzbl	%al, %esi
.LVL108:
	movzbl	%cl, %ecx
.LVL109:
	btl	%esi, %ecx
	jnc	.L64
	.loc 5 366 0
#APP
# 366 "src/floppy.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB7119:
#APP
# 366 "src/floppy.c" 1
	movb %ES:144(%esi), %dl
# 0 "" 2
.LVL110:
#NO_APP
.LBE7119:
	.loc 5 365 0
	andb	$16, %dl
	jne	.L65
.L64:
.LBB7120:
.LBB7121:
	.loc 5 311 0
	movb	$7, (%esp)
	.loc 5 312 0
	movb	%al, 1(%esp)
	.loc 5 313 0
	movl	%esp, %eax
.LVL111:
	movl	$2, %edx
.LVL112:
	call	floppy_pio.17134
.LVL113:
.LBB7122:
	.loc 5 315 0
	movl	$64, %eax
#APP
# 315 "src/floppy.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB7123:
#APP
# 315 "src/floppy.c" 1
	movb %ES:62, %dl
# 0 "" 2
.LVL114:
#NO_APP
.LBE7123:
.LBB7124:
	movl	$1, %edi
	movl	%esi, %ecx
	sall	%cl, %edi
	orl	%edi, %edx
.LVL115:
#APP
# 315 "src/floppy.c" 1
	movb %dl, %ES:62
# 0 "" 2
#NO_APP
.LBE7124:
.LBE7122:
.LBB7125:
.LBB7126:
	.loc 5 303 0
#APP
# 303 "src/floppy.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
	xorl	%edx, %edx
.LVL116:
#APP
# 303 "src/floppy.c" 1
	movb %dl, %ES:148(%esi)
# 0 "" 2
#NO_APP
.LBE7126:
.LBE7125:
.LBE7121:
.LBE7120:
.LBB7127:
.LBB7128:
.LBB7129:
	.loc 5 353 0
#APP
# 353 "src/floppy.c" 1
	movb %CS:1(%ebx), %dl
# 0 "" 2
.LVL117:
#NO_APP
.LBE7129:
.LBB7130:
.LBB7131:
	.loc 5 354 0
	movzbl	%dl, %edx
.LVL118:
#APP
# 354 "src/floppy.c" 1
	movb %CS:FloppyInfo+6(,%edx,8), %cl
# 0 "" 2
.LVL119:
#NO_APP
.LBE7131:
#APP
# 354 "src/floppy.c" 1
	movw %ax, %ES
# 0 "" 2
# 354 "src/floppy.c" 1
	movb %cl, %ES:139
# 0 "" 2
#NO_APP
.LBE7130:
.LBB7132:
	.loc 5 355 0
#APP
# 355 "src/floppy.c" 1
	movl %CS:20(%ebx), %ecx
# 0 "" 2
.LVL120:
#NO_APP
.LBE7132:
.LBB7133:
.LBB7134:
	.loc 5 356 0
#APP
# 356 "src/floppy.c" 1
	movb %CS:FloppyInfo+7(,%edx,8), %dl
# 0 "" 2
.LVL121:
#NO_APP
.LBE7134:
#APP
# 356 "src/floppy.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
	movzbl	%cl, %eax
#APP
# 356 "src/floppy.c" 1
	movb %dl, %ES:144(%eax)
# 0 "" 2
.LVL122:
#NO_APP
.L65:
.LBE7133:
.LBE7128:
.LBE7127:
	.loc 5 375 0
	xorl	%eax, %eax
.LVL123:
	addl	$12, %esp
	popl	%ebx
.LVL124:
	popl	%esi
	popl	%edi
	ret
	.cfi_endproc
.LFE578:
	.size	check_recal_drive.17439, .-check_recal_drive.17439
	.section	.text.lba2chs.17521,"ax",@progbits
	.type	lba2chs.17521, @function
lba2chs.17521:
.LFB579:
	.loc 5 384 0
	.cfi_startproc
.LVL125:
	pushl	%edi
	.cfi_def_cfa_offset 8
	pushl	%esi
	.cfi_def_cfa_offset 12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	movl	%eax, %ebx
	.cfi_offset 3, -16
	.cfi_offset 6, -12
	.cfi_offset 7, -8
	movl	%edx, %esi
	.loc 5 387 0
	movl	(%eax), %eax
.LVL126:
	incl	%eax
.LVL127:
.LBB7135:
	.loc 5 388 0
	movl	12(%ebx), %edx
.LVL128:
#APP
# 388 "src/floppy.c" 1
	movw %CS:6(%edx), %di
# 0 "" 2
.LVL129:
#NO_APP
.LBE7135:
	.loc 5 389 0
	movzwl	%di, %edi
.LVL130:
	xorl	%edx, %edx
	divl	%edi
.LVL131:
	movb	%dl, (%ecx)
.LBB7136:
	.loc 5 392 0
	movl	12(%ebx), %edx
#APP
# 392 "src/floppy.c" 1
	movw %CS:2(%edx), %dx
# 0 "" 2
.LVL132:
#NO_APP
.LBE7136:
	.loc 5 393 0
	movzwl	%dx, %edx
.LVL133:
	movl	%edx, %ecx
.LVL134:
	xorl	%edx, %edx
	divl	%ecx
	movl	16(%esp), %ecx
	movb	%dl, (%ecx)
	.loc 5 396 0
	movb	%al, (%esi)
	.loc 5 397 0
	popl	%ebx
.LVL135:
	popl	%esi
.LVL136:
	popl	%edi
	ret	$4
	.cfi_endproc
.LFE579:
	.size	lba2chs.17521, .-lba2chs.17521
	.section	.text.process_floppy_op.1223,"ax",@progbits
	.type	process_floppy_op.1223, @function
process_floppy_op.1223:
.LFB585:
	.loc 5 549 0
	.cfi_startproc
.LVL137:
	pushl	%edi
	.cfi_def_cfa_offset 8
	pushl	%esi
	.cfi_def_cfa_offset 12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	subl	$16, %esp
	.cfi_def_cfa_offset 32
	movl	%eax, %esi
	.cfi_offset 3, -16
	.cfi_offset 6, -12
	.cfi_offset 7, -8
	.loc 5 553 0
	movb	18(%eax), %al
.LVL138:
	cmpb	$3, %al
	je	.L73
	ja	.L76
	testb	%al, %al
	je	.L71
	cmpb	$2, %al
	jne	.L70
	jmp	.L90
.L76:
	cmpb	$4, %al
	je	.L74
	cmpb	$5, %al
	jne	.L70
	jmp	.L91
.L71:
.LBB7162:
.LBB7163:
.LBB7164:
	.loc 5 403 0
	movl	12(%esi), %edx
#APP
# 403 "src/floppy.c" 1
	movl %CS:20(%edx), %edx
# 0 "" 2
.LVL139:
#NO_APP
.LBE7164:
	.loc 5 404 0
	movzbl	%dl, %edx
.LVL140:
.LBB7165:
.LBB7166:
	.loc 5 303 0
	movl	$64, %ecx
#APP
# 303 "src/floppy.c" 1
	movw %cx, %ES
# 0 "" 2
# 303 "src/floppy.c" 1
	movb %al, %ES:148(%edx)
# 0 "" 2
#NO_APP
	xorl	%ebx, %ebx
.LVL141:
.LBE7166:
.LBE7165:
.LBE7163:
.LBE7162:
	.loc 5 555 0
	jmp	.L77
.LVL142:
.L90:
.LBB7167:
.LBB7168:
	.loc 5 412 0
	movl	12(%esi), %eax
	call	check_recal_drive.17439
	movl	%eax, %ebx
.LVL143:
	.loc 5 413 0
	testl	%eax, %eax
	jne	.L83
.LVL144:
	.loc 5 417 0
	leal	14(%esp), %ecx
	leal	13(%esp), %edx
	leal	15(%esp), %eax
.LVL145:
	pushl	%eax
	.cfi_def_cfa_offset 36
	movl	%esi, %eax
	.cfi_escape 0x2e,0x4
	call	lba2chs.17521
	.cfi_def_cfa_offset 32
.LBB7169:
	.loc 5 420 0
	movl	12(%esi), %eax
#APP
# 420 "src/floppy.c" 1
	movl %CS:20(%eax), %edi
# 0 "" 2
.LVL146:
#NO_APP
.LBE7169:
	.loc 5 422 0
	movb	$-26, 1(%esp)
	.loc 5 423 0
	movb	15(%esp), %dl
.LVL147:
	leal	0(,%edx,4), %eax
	orl	%edi, %eax
.LVL148:
	movb	%al, 2(%esp)
	.loc 5 424 0
	movb	13(%esp), %al
.LVL149:
	movb	%al, 3(%esp)
	.loc 5 425 0
	movb	%dl, 4(%esp)
	.loc 5 426 0
	movb	14(%esp), %al
.LVL150:
	movb	%al, 5(%esp)
	.loc 5 427 0
	movb	$2, 6(%esp)
	.loc 5 428 0
	movl	16(%esi), %edx
	leal	-1(%eax,%edx), %eax
	movb	%al, 7(%esp)
	.loc 5 429 0
	movb	$27, 8(%esp)
	.loc 5 430 0
	movb	$-1, 9(%esp)
	.loc 5 432 0
	leal	1(%esp), %ecx
	sall	$9, %edx
	movzwl	%dx, %edx
	pushl	$9
	.cfi_def_cfa_offset 36
	movl	%esi, %eax
	call	floppy_cmd.17157
	.cfi_def_cfa_offset 32
	movl	%eax, %ebx
	.loc 5 433 0
	testl	%eax, %eax
	jne	.L83
.LVL151:
	.loc 5 436 0
	testb	$-64, 1(%esp)
	jne	.L79
	.loc 5 442 0
	andl	$255, %edi
.LVL152:
.LBB7170:
.LBB7171:
	.loc 5 303 0
	movl	$64, %eax
.LVL153:
#APP
# 303 "src/floppy.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
	movb	13(%esp), %al
	jmp	.L87
.LVL154:
.L79:
	movl	$32, %ebx
.LVL155:
.L78:
	jmp	.L83
.LVL156:
.L73:
.LBE7171:
.LBE7170:
.LBE7168:
.LBE7167:
.LBB7172:
.LBB7173:
	.loc 5 453 0
	movl	12(%esi), %eax
	.cfi_escape 0x2e,0x0
	call	check_recal_drive.17439
	movl	%eax, %ebx
.LVL157:
	.loc 5 454 0
	testl	%eax, %eax
	jne	.L83
.LVL158:
	.loc 5 458 0
	leal	14(%esp), %ecx
	leal	15(%esp), %edx
	leal	13(%esp), %eax
.LVL159:
	pushl	%eax
	.cfi_def_cfa_offset 36
	movl	%esi, %eax
	.cfi_escape 0x2e,0x4
	call	lba2chs.17521
	.cfi_def_cfa_offset 32
.LBB7174:
	.loc 5 461 0
	movl	12(%esi), %eax
#APP
# 461 "src/floppy.c" 1
	movl %CS:20(%eax), %edi
# 0 "" 2
.LVL160:
#NO_APP
.LBE7174:
	.loc 5 463 0
	movb	$-59, 1(%esp)
	.loc 5 464 0
	movb	13(%esp), %dl
.LVL161:
	leal	0(,%edx,4), %eax
	orl	%edi, %eax
.LVL162:
	movb	%al, 2(%esp)
	.loc 5 465 0
	movb	15(%esp), %al
.LVL163:
	movb	%al, 3(%esp)
	.loc 5 466 0
	movb	%dl, 4(%esp)
	.loc 5 467 0
	movb	14(%esp), %al
.LVL164:
	movb	%al, 5(%esp)
	.loc 5 468 0
	movb	$2, 6(%esp)
	.loc 5 469 0
	movl	16(%esi), %edx
	leal	-1(%eax,%edx), %eax
	movb	%al, 7(%esp)
	.loc 5 470 0
	movb	$27, 8(%esp)
	.loc 5 471 0
	movb	$-1, 9(%esp)
	.loc 5 473 0
	leal	1(%esp), %ecx
	sall	$9, %edx
	movzwl	%dx, %edx
	pushl	$9
	.cfi_def_cfa_offset 36
	movl	%esi, %eax
	call	floppy_cmd.17157
	.cfi_def_cfa_offset 32
	movl	%eax, %ebx
	.loc 5 474 0
	testl	%eax, %eax
	jne	.L83
.LVL165:
	.loc 5 477 0
	testb	$-64, 1(%esp)
	je	.L81
	.loc 5 478 0
	movzbl	2(%esp), %eax
.LVL166:
	andl	$2, %eax
	cmpl	$1, %eax
	sbbl	%ebx, %ebx
	andl	$29, %ebx
	addl	$3, %ebx
	jmp	.L83
.LVL167:
.L81:
	.loc 5 486 0
	andl	$255, %edi
.LVL168:
.LBB7175:
.LBB7176:
	.loc 5 303 0
	movl	$64, %eax
.LVL169:
#APP
# 303 "src/floppy.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
	movb	15(%esp), %al
.LVL170:
.L87:
#APP
# 303 "src/floppy.c" 1
	movb %al, %ES:148(%edi)
# 0 "" 2
#NO_APP
	jmp	.L77
.L80:
.LVL171:
.L74:
.LBE7176:
.LBE7175:
.LBE7173:
.LBE7172:
.LBB7177:
.LBB7178:
	.loc 5 497 0
	movl	12(%esi), %eax
	.cfi_escape 0x2e,0x0
	call	check_recal_drive.17439
	movl	%eax, %ebx
.LVL172:
	.loc 5 498 0
	testl	%eax, %eax
	jne	.L83
.LVL173:
	.loc 5 502 0
	leal	14(%esp), %ecx
	leal	15(%esp), %edx
	leal	13(%esp), %eax
.LVL174:
	pushl	%eax
	.cfi_def_cfa_offset 36
	movl	%esi, %eax
	.cfi_escape 0x2e,0x4
	call	lba2chs.17521
	.cfi_def_cfa_offset 32
.LBB7179:
	.loc 5 505 0
	movl	12(%esi), %eax
#APP
# 505 "src/floppy.c" 1
	movl %CS:20(%eax), %eax
# 0 "" 2
.LVL175:
#NO_APP
.LBE7179:
	.loc 5 506 0
	movzbl	%al, %eax
.LVL176:
.LBB7180:
.LBB7181:
	.loc 5 303 0
	movl	$64, %edx
#APP
# 303 "src/floppy.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	movb	15(%esp), %dl
.LVL177:
#APP
# 303 "src/floppy.c" 1
	movb %dl, %ES:148(%ebx,%eax)
# 0 "" 2
#NO_APP
	jmp	.L77
.LVL178:
.L83:
.LBE7181:
.LBE7180:
	.loc 5 509 0
	movw	$0, 16(%esi)
	jmp	.L77
.LVL179:
.L91:
.LBE7178:
.LBE7177:
.LBB7182:
.LBB7183:
	.loc 5 517 0
	movl	12(%esi), %eax
	.cfi_escape 0x2e,0x0
	call	check_recal_drive.17439
	movl	%eax, %ebx
.LVL180:
	.loc 5 518 0
	testl	%eax, %eax
	jne	.L77
.LVL181:
	.loc 5 521 0
	movb	(%esi), %al
.LVL182:
.LBB7184:
	.loc 5 524 0
	movl	12(%esi), %edx
#APP
# 524 "src/floppy.c" 1
	movl %CS:20(%edx), %edi
# 0 "" 2
.LVL183:
#NO_APP
.LBE7184:
	.loc 5 526 0
	movb	$77, 1(%esp)
	.loc 5 527 0
	sall	$2, %eax
.LVL184:
	orl	%edi, %eax
.LVL185:
	movb	%al, 2(%esp)
	.loc 5 528 0
	movb	$2, 3(%esp)
	.loc 5 529 0
	movl	16(%esi), %edx
	movb	%dl, 4(%esp)
	.loc 5 530 0
	movb	$108, 5(%esp)
	.loc 5 531 0
	movb	$-10, 6(%esp)
	.loc 5 533 0
	leal	1(%esp), %ecx
	sall	$2, %edx
	movzwl	%dx, %edx
	pushl	$6
	.cfi_def_cfa_offset 36
	movl	%esi, %eax
	.cfi_escape 0x2e,0x4
	call	floppy_cmd.17157
	.cfi_def_cfa_offset 32
	movl	%eax, %ebx
	.loc 5 534 0
	testl	%eax, %eax
	jne	.L77
.LVL186:
	.loc 5 537 0
	movb	1(%esp), %al
.LVL187:
	andb	$-64, %al
	je	.L84
	.loc 5 538 0
	movzbl	2(%esp), %eax
	andl	$2, %eax
	cmpl	$1, %eax
	sbbl	%ebx, %ebx
	andl	$29, %ebx
	addl	$3, %ebx
	jmp	.L77
.L84:
	.loc 5 543 0
	andl	$255, %edi
.LVL188:
.LBB7185:
.LBB7186:
	.loc 5 303 0
	movl	$64, %edx
#APP
# 303 "src/floppy.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	jmp	.L87
.LVL189:
.L70:
.LBE7186:
.LBE7185:
.LBE7183:
.LBE7182:
	.loc 5 565 0
	movw	$0, 16(%esi)
	movl	$1, %ebx
.LVL190:
.L77:
	.loc 5 568 0
	movl	%ebx, %eax
	addl	$16, %esp
	popl	%ebx
.LVL191:
	popl	%esi
.LVL192:
	popl	%edi
.LVL193:
	ret
	.cfi_endproc
.LFE585:
	.size	process_floppy_op.1223, .-process_floppy_op.1223
	.section	.text.handle_0e,"ax",@progbits
.globl handle_0e
	.type	handle_0e, @function
handle_0e:
.LFB586:
	.loc 5 578 0
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
.LBB7187:
.LBB7188:
	.loc 2 92 0
	movl	$1012, %edx
#APP
# 92 "src/ioport.h" 1
	inb %dx, %al
# 0 "" 2
.LVL194:
#NO_APP
.LBE7188:
.LBE7187:
	.loc 5 583 0
	andl	$192, %eax
.LVL195:
	cmpl	$192, %eax
	je	.L93
	.cfi_offset 3, -8
.LBB7189:
.LBB7190:
	.loc 2 82 0
	movb	$-11, %dl
	movb	$8, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE7190:
.LBE7189:
.LBB7191:
.LBB7192:
	.loc 2 92 0
	movb	$-12, %dl
.L94:
#APP
# 92 "src/ioport.h" 1
	inb %dx, %al
# 0 "" 2
.LVL196:
#NO_APP
.LBE7192:
.LBE7191:
	.loc 5 585 0
	andl	$192, %eax
.LVL197:
	cmpl	$192, %eax
	jne	.L94
.LBB7193:
.LBB7194:
	.loc 2 92 0
	movl	$1013, %ebx
.LBE7194:
.LBE7193:
.LBB7196:
.LBB7197:
	movl	$1012, %ecx
.L97:
.LBE7197:
.LBE7196:
.LBB7199:
.LBB7195:
	movl	%ebx, %edx
#APP
# 92 "src/ioport.h" 1
	inb %dx, %al
# 0 "" 2
.LVL198:
#NO_APP
.LBE7195:
.LBE7199:
.LBB7200:
.LBB7198:
	movl	%ecx, %edx
#APP
# 92 "src/ioport.h" 1
	inb %dx, %al
# 0 "" 2
.LVL199:
#NO_APP
.LBE7198:
.LBE7200:
	.loc 5 589 0
	andl	$192, %eax
.LVL200:
	cmpl	$192, %eax
	je	.L97
.L93:
.LBB7201:
	.loc 5 592 0
	movl	$64, %edx
#APP
# 592 "src/floppy.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB7202:
#APP
# 592 "src/floppy.c" 1
	movb %ES:62, %al
# 0 "" 2
.LVL201:
#NO_APP
.LBE7202:
.LBB7203:
	orl	$-128, %eax
.LVL202:
#APP
# 592 "src/floppy.c" 1
	movb %al, %ES:62
# 0 "" 2
#NO_APP
.LBE7203:
.LBE7201:
.LBB7204:
.LBB7205:
.LBB7206:
	.loc 2 82 0
	movb	$32, %al
.LVL203:
#APP
# 82 "src/ioport.h" 1
	outb %al, $32
# 0 "" 2
#NO_APP
.LBE7206:
.LBE7205:
.LBE7204:
	.loc 5 596 0
	popl	%ebx
	ret
	.cfi_endproc
.LFE586:
	.size	handle_0e, .-handle_0e
	.section	.text.udelay.1730,"ax",@progbits
	.type	udelay.1730, @function
udelay.1730:
.LFB1098:
	.file 7 "src/clock.c"
	.loc 7 114 0
	.cfi_startproc
.LVL204:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	movl	%esp, %ebp
	.cfi_offset 5, -8
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$8, %esp
	movl	%eax, %ecx
.LBB7207:
	.loc 7 115 0
#APP
# 115 "src/clock.c" 1
	movl %CS:cpu_khz, %ebx
# 0 "" 2
#NO_APP
.LBE7207:
.LBB7208:
.LBB7209:
.LBB7210:
.LBB7211:
	.file 8 "src/util.h"
	.loc 8 85 0
#APP
# 85 "src/util.h" 1
	rdtsc
# 0 "" 2
.LVL205:
#NO_APP
	movl	%eax, -20(%ebp)
	movl	%edx, -16(%ebp)
.LBE7211:
.LBE7210:
	.loc 7 97 0
	imull	%ecx, %ebx
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	movl	$1000, %edx
	movl	%ebx, %eax
	movl	%edx, %ecx
.LVL206:
	xorl	%edx, %edx
	divl	%ecx
	movl	%eax, %ebx
.LVL207:
	xorl	%esi, %esi
.LVL208:
	addl	-20(%ebp), %ebx
.LVL209:
	adcl	-16(%ebp), %esi
.LVL210:
	jmp	.L101
.L102:
.LBB7212:
.LBB7213:
	.loc 8 36 0
#APP
# 36 "src/util.h" 1
	rep ; nop
# 0 "" 2
#NO_APP
.L101:
.LBE7213:
.LBE7212:
.LBB7214:
.LBB7215:
.LBB7216:
	.loc 8 85 0
#APP
# 85 "src/util.h" 1
	rdtsc
# 0 "" 2
#NO_APP
	movl	%eax, -20(%ebp)
	movl	%edx, -16(%ebp)
.LBE7216:
.LBE7215:
.LBE7214:
	.loc 7 98 0
	subl	%ebx, -20(%ebp)
	sbbl	%esi, -16(%ebp)
	cmpl	$0, -16(%ebp)
	jl	.L102
	jg	.L104
	cmpl	$0, -20(%ebp)
	jbe	.L102
.L104:
.LBE7209:
.LBE7208:
	.loc 7 116 0
	popl	%ebx
.LVL211:
	popl	%esi
.LVL212:
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
	.cfi_endproc
.LFE1098:
	.size	udelay.1730, .-udelay.1730
	.section	.text.process_mouse.1709,"ax",@progbits
	.type	process_mouse.1709, @function
process_mouse.1709:
.LFB787:
	.file 9 "src/mouse.c"
	.loc 9 286 0
	.cfi_startproc
.LVL213:
	pushl	%edi
	.cfi_def_cfa_offset 8
	pushl	%esi
	.cfi_def_cfa_offset 12
	pushl	%ebx
	.cfi_def_cfa_offset 16
.LBB7217:
.LBB7218:
	.file 10 "src/biosvar.h"
	.loc 10 249 0
	movl	$64, %edx
#APP
# 249 "src/biosvar.h" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB7219:
#APP
# 249 "src/biosvar.h" 1
	movw %ES:14, %si
# 0 "" 2
.LVL214:
#NO_APP
.LBE7219:
.LBE7218:
.LBE7217:
	.loc 9 291 0
#APP
# 291 "src/mouse.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB7220:
#APP
# 291 "src/mouse.c" 1
	movb %ES:38, %dl
# 0 "" 2
.LVL215:
#NO_APP
.LBE7220:
	.loc 9 292 0
#APP
# 292 "src/mouse.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB7221:
#APP
# 292 "src/mouse.c" 1
	movb %ES:39, %cl
# 0 "" 2
.LVL216:
#NO_APP
.LBE7221:
	.loc 9 294 0
	testb	%cl, %cl
	jns	.L108
	.cfi_offset 3, -16
	.cfi_offset 6, -12
	.cfi_offset 7, -8
.LBB7222:
	.loc 9 300 0
#APP
# 300 "src/mouse.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
	movl	%edx, %ebx
.LVL217:
	andl	$7, %ebx
#APP
# 300 "src/mouse.c" 1
	movb %al, %ES:40(%ebx)
# 0 "" 2
#NO_APP
.LBE7222:
	.loc 9 302 0
	incl	%ebx
	andl	$7, %ecx
.LVL218:
	cmpl	%ecx, %ebx
	jge	.L107
	.loc 9 303 0
	incl	%edx
.LVL219:
.LBB7223:
	.loc 9 304 0
#APP
# 304 "src/mouse.c" 1
	movw %si, %ES
# 0 "" 2
# 304 "src/mouse.c" 1
	movb %dl, %ES:38
# 0 "" 2
#NO_APP
	jmp	.L108
.LVL220:
.L107:
.LBE7223:
	.loc 9 308 0
#APP
# 308 "src/mouse.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB7224:
#APP
# 308 "src/mouse.c" 1
	movb %ES:40, %cl
# 0 "" 2
.LVL221:
#NO_APP
.LBE7224:
	movzbl	%cl, %ecx
.LVL222:
	.loc 9 309 0
#APP
# 309 "src/mouse.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB7225:
#APP
# 309 "src/mouse.c" 1
	movb %ES:41, %dl
# 0 "" 2
.LVL223:
#NO_APP
.LBE7225:
	movzbl	%dl, %edx
.LVL224:
	.loc 9 310 0
#APP
# 310 "src/mouse.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB7226:
#APP
# 310 "src/mouse.c" 1
	movb %ES:42, %bl
# 0 "" 2
.LVL225:
#NO_APP
.LBE7226:
	movzbl	%bl, %ebx
.LVL226:
.LBB7227:
	.loc 9 311 0
#APP
# 311 "src/mouse.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
	xorl	%eax, %eax
.LVL227:
#APP
# 311 "src/mouse.c" 1
	movb %al, %ES:38
# 0 "" 2
#NO_APP
.LBE7227:
	.loc 9 313 0
#APP
# 313 "src/mouse.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB7228:
#APP
# 313 "src/mouse.c" 1
	movl %ES:34, %eax
# 0 "" 2
.LVL228:
#NO_APP
.LBE7228:
	.loc 9 317 0
#APP
# 317 "src/mouse.c" 1
	pushl %ebp
sti
pushl %eax
pushw %cx
pushw %dx
pushw %bx
pushw $0
lcallw *8(%esp)
addl $12, %esp
cli
cld
popl %ebp
# 0 "" 2
.LVL229:
#NO_APP
.L108:
	.loc 9 335 0
	popl	%ebx
.LVL230:
	popl	%esi
.LVL231:
	popl	%edi
	ret
	.cfi_endproc
.LFE787:
	.size	process_mouse.1709, .-process_mouse.1709
	.section	.text.dequeue_key.26840,"ax",@progbits
	.type	dequeue_key.26840, @function
dequeue_key.26840:
.LFB854:
	.file 11 "src/kbd.c"
	.loc 11 75 0
	.cfi_startproc
.LVL232:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	pushl	%edi
	.cfi_def_cfa_offset 12
	pushl	%esi
	.cfi_def_cfa_offset 16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	subl	$8, %esp
	.cfi_def_cfa_offset 28
.LBB7229:
.LBB7230:
.LBB7231:
.LBB7232:
	.loc 6 72 0
#APP
# 72 "src/util.c" 1
	sti
nop
rep ; nop
cli
cld

# 0 "" 2
#NO_APP
.LBE7232:
.LBE7231:
.LBE7230:
.LBE7229:
	.loc 11 80 0
	movl	$64, %edi
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 5, -8
.LBB7233:
	xorl	%esi, %esi
.LVL233:
.L113:
.LBE7233:
#APP
# 80 "src/kbd.c" 1
	movw %di, %ES
# 0 "" 2
#NO_APP
.LBB7234:
#APP
# 80 "src/kbd.c" 1
	movw %ES:26(%esi), %bx
# 0 "" 2
#NO_APP
.LBE7234:
	.loc 11 81 0
#APP
# 81 "src/kbd.c" 1
	movw %di, %ES
# 0 "" 2
#NO_APP
.LBB7235:
#APP
# 81 "src/kbd.c" 1
	movw %ES:28(%esi), %bp
# 0 "" 2
#NO_APP
.LBE7235:
	.loc 11 83 0
	cmpw	%bp, %bx
	jne	.L110
	.loc 11 85 0
	testl	%edx, %edx
	jne	.L111
	.loc 11 86 0
	orw	$64, 36(%eax)
	.loc 11 87 0
	jmp	.L120
.L111:
.LBB7236:
.LBB7237:
	.loc 8 42 0
#APP
# 42 "src/util.h" 1
	sti ; hlt ; cli ; cld
# 0 "" 2
#NO_APP
.LBE7237:
.LBE7236:
	.loc 11 90 0
	jmp	.L113
.L110:
	movw	%bx, 2(%esp)
	.loc 11 92 0
	movl	$64, %ebx
.LVL234:
#APP
# 92 "src/kbd.c" 1
	movw %bx, %ES
# 0 "" 2
#NO_APP
.LBB7238:
	movzwl	2(%esp), %esi
#APP
# 92 "src/kbd.c" 1
	movb %ES:(%esi), %bl
# 0 "" 2
#NO_APP
	movb	%bl, 7(%esp)
.LBE7238:
	.loc 11 93 0
	movl	$64, %ebx
#APP
# 93 "src/kbd.c" 1
	movw %bx, %ES
# 0 "" 2
#NO_APP
.LBB7239:
#APP
# 93 "src/kbd.c" 1
	movb %ES:1(%esi), %bl
# 0 "" 2
#NO_APP
	movl	%ebx, %esi
.LVL235:
.LBE7239:
	.loc 11 94 0
	testb	%bl, %bl
	je	.L121
	cmpb	$-16, 7(%esp)
	je	.L114
.L121:
	cmpb	$-32, 7(%esp)
	jne	.L122
	testl	%ecx, %ecx
	je	.L114
.L122:
	movb	7(%esp), %cl
.LVL236:
	jmp	.L117
.LVL237:
.L114:
	xorl	%ecx, %ecx
.LVL238:
.L117:
	.loc 11 97 0
	movzbl	%cl, %edi
.LVL239:
	movl	%esi, %ecx
.LVL240:
	sall	$8, %ecx
	orl	%edi, %ecx
	movw	%cx, 28(%eax)
	.loc 11 99 0
	testl	%edx, %edx
	jne	.L118
	.loc 11 100 0
	andw	$-65, 36(%eax)
	.loc 11 101 0
	jmp	.L120
.L118:
	.loc 11 103 0
	movl	$64, %eax
.LVL241:
#APP
# 103 "src/kbd.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB7240:
#APP
# 103 "src/kbd.c" 1
	movw %ES:128, %dx
# 0 "" 2
.LVL242:
#NO_APP
.LBE7240:
	.loc 11 104 0
#APP
# 104 "src/kbd.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB7241:
#APP
# 104 "src/kbd.c" 1
	movw %ES:130, %ax
# 0 "" 2
.LVL243:
#NO_APP
.LBE7241:
	.loc 11 106 0
	movw	2(%esp), %bx
.LVL244:
	addl	$2, %ebx
.LVL245:
	.loc 11 107 0
	cmpw	%ax, %bx
	jb	.L119
	movl	%edx, %ebx
.LVL246:
.L119:
.LBB7242:
	.loc 11 109 0
	movl	$64, %eax
.LVL247:
#APP
# 109 "src/kbd.c" 1
	movw %ax, %ES
# 0 "" 2
# 109 "src/kbd.c" 1
	movw %bx, %ES:26
# 0 "" 2
.LVL248:
#NO_APP
.L120:
.LBE7242:
	.loc 11 110 0
	popl	%edi
	.cfi_def_cfa_offset 24
.LVL249:
	popl	%ebp
	.cfi_def_cfa_offset 20
.LVL250:
	popl	%ebx
.LVL251:
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.cfi_endproc
.LFE854:
	.size	dequeue_key.26840, .-dequeue_key.26840
	.section	.text.pci_next.19998,"ax",@progbits
	.type	pci_next.19998, @function
pci_next.19998:
.LFB932:
	.file 12 "src/pci.c"
	.loc 12 62 0
	.cfi_startproc
.LVL252:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	pushl	%edi
	.cfi_def_cfa_offset 12
	pushl	%esi
	.cfi_def_cfa_offset 16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	subl	$4, %esp
	.cfi_def_cfa_offset 24
	movl	%eax, %ecx
	movl	%edx, %esi
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 5, -8
	.loc 12 63 0
	movb	%al, %dl
.LVL253:
	andl	$7, %edx
	decb	%dl
	jne	.L124
.LBB7243:
.LBB7244:
.LBB7245:
	.loc 2 88 0
	decl	%eax
	movzwl	%ax, %eax
	sall	$8, %eax
	orl	$-2147483636, %eax
	movl	$3320, %edx
#APP
# 88 "src/ioport.h" 1
	outl %eax, %dx
# 0 "" 2
#NO_APP
.LBE7245:
.LBE7244:
.LBB7246:
.LBB7247:
	.loc 2 92 0
	movb	$-2, %dl
#APP
# 92 "src/ioport.h" 1
	inb %dx, %al
# 0 "" 2
.LVL254:
#NO_APP
.LBE7247:
.LBE7246:
.LBE7243:
	.loc 12 63 0
	testb	%al, %al
	js	.L124
	.loc 12 67 0
	addl	$7, %ecx
.L124:
	.loc 12 69 0
	movl	(%esi), %eax
.LVL255:
	movl	%eax, (%esp)
.LBB7248:
.LBB7249:
.LBB7250:
.LBB7251:
.LBB7252:
	.loc 2 88 0
	movl	$3320, %ebp
.L131:
.LBE7252:
.LBE7251:
.LBE7250:
.LBE7249:
	.loc 12 71 0
	cmpl	(%esp), %ecx
	jl	.L125
	orl	$-1, %ecx
	jmp	.L126
.L125:
.LBB7258:
.LBB7257:
	.loc 12 41 0
	movzwl	%cx, %ebx
.LVL256:
	sall	$8, %ebx
.LBB7254:
.LBB7253:
	.loc 2 88 0
	movl	%ebx, %eax
	orl	$-2147483648, %eax
	movl	%ebp, %edx
#APP
# 88 "src/ioport.h" 1
	outl %eax, %dx
# 0 "" 2
#NO_APP
.LBE7253:
.LBE7254:
.LBB7255:
.LBB7256:
	.loc 2 97 0
	movl	$3324, %edx
#APP
# 97 "src/ioport.h" 1
	inw %dx, %ax
# 0 "" 2
.LVL257:
#NO_APP
.LBE7256:
.LBE7255:
.LBE7257:
.LBE7258:
	.loc 12 82 0
	decl	%eax
.LVL258:
	cmpw	$-3, %ax
	jbe	.L127
	.loc 12 86 0
	testb	$7, %cl
	jne	.L128
	.loc 12 87 0
	addl	$8, %ecx
.LVL259:
	jmp	.L131
.LVL260:
.L128:
	.loc 12 89 0
	incl	%ecx
.LVL261:
	jmp	.L131
.LVL262:
.L127:
.LBE7248:
.LBB7259:
.LBB7260:
.LBB7261:
	.loc 2 88 0
	movl	%ebx, %eax
	orl	$-2147483636, %eax
	movl	$3320, %edx
#APP
# 88 "src/ioport.h" 1
	outl %eax, %dx
# 0 "" 2
#NO_APP
.LBE7261:
.LBE7260:
.LBB7262:
.LBB7263:
	.loc 2 92 0
	movb	$-2, %dl
#APP
# 92 "src/ioport.h" 1
	inb %dx, %al
# 0 "" 2
.LVL263:
#NO_APP
.LBE7263:
.LBE7262:
.LBE7259:
	.loc 12 95 0
	andl	$127, %eax
.LVL264:
	decl	%eax
	cmpl	$1, %eax
	ja	.L126
.LBB7264:
.LBB7265:
.LBB7266:
.LBB7267:
	.loc 2 88 0
	movl	%ebx, %eax
	orl	$-2147483624, %eax
	movb	$-8, %dl
#APP
# 88 "src/ioport.h" 1
	outl %eax, %dx
# 0 "" 2
#NO_APP
.LBE7267:
.LBE7266:
.LBB7268:
.LBB7269:
	.loc 2 102 0
	movb	$-4, %dl
#APP
# 102 "src/ioport.h" 1
	inl %dx, %eax
# 0 "" 2
#NO_APP
.LBE7269:
.LBE7268:
.LBE7265:
	.loc 12 97 0
	andl	$65280, %eax
	addl	$256, %eax
.LVL265:
	.loc 12 98 0
	cmpl	(%esp), %eax
	jle	.L126
	.loc 12 99 0
	movl	%eax, (%esi)
.LVL266:
.L126:
.LBE7264:
	.loc 12 103 0
	movl	%ecx, %eax
.LVL267:
	popl	%edx
	.cfi_def_cfa_offset 20
	popl	%ebx
	popl	%esi
.LVL268:
	popl	%edi
	popl	%ebp
	ret
	.cfi_endproc
.LFE932:
	.size	pci_next.19998, .-pci_next.19998
	.section	.text.handle_14,"ax",@progbits
.globl handle_14
	.type	handle_14, @function
handle_14:
.LFB1010:
	.file 13 "src/serial.c"
	.loc 13 187 0
	.cfi_startproc
.LVL269:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	pushl	%edi
	.cfi_def_cfa_offset 12
	pushl	%esi
	.cfi_def_cfa_offset 16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	movl	%eax, %ebx
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 5, -8
	.loc 13 194 0
	movb	29(%eax), %al
.LVL270:
	cmpb	$1, %al
	je	.L135
	jb	.L134
	cmpb	$2, %al
	je	.L136
	cmpb	$3, %al
	jne	.L161
	jmp	.L170
.L134:
.LBB7270:
.LBB7271:
.LBB7287:
.LBB7288:
	.loc 13 81 0
	movw	20(%ebx), %ax
	cmpw	$3, %ax
	ja	.L161
	.loc 13 85 0
	movl	$64, %edx
#APP
# 85 "src/serial.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB7289:
	movzwl	%ax, %eax
#APP
# 85 "src/serial.c" 1
	movw %ES:(%eax,%eax), %si
# 0 "" 2
.LVL271:
#NO_APP
.LBE7289:
	.loc 13 86 0
	testw	%si, %si
	jne	.L140
	jmp	.L161
.L158:
.LBE7288:
.LBE7287:
.LBB7285:
.LBB7286:
	.loc 2 82 0
	movb	$23, %al
	movl	%esi, %edx
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE7286:
.LBE7285:
.LBB7283:
.LBB7284:
	leal	1(%esi), %edx
	movb	$4, %al
	jmp	.L163
.L171:
.LBE7284:
.LBE7283:
.LBB7278:
	.loc 13 103 0
	movb	%al, %cl
	shrb	$5, %cl
	movl	$1536, %eax
	sarl	%cl, %eax
.LVL272:
.LBB7279:
.LBB7280:
	.loc 2 82 0
	movl	%esi, %edx
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE7280:
.LBE7279:
.LBB7281:
.LBB7282:
	shrw	$8, %ax
.LVL273:
	leal	1(%esi), %edx
.L163:
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE7282:
.LBE7281:
.LBE7278:
.LBB7276:
.LBB7277:
	movl	%ebp, %eax
	andl	$31, %eax
	movl	%edi, %edx
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE7277:
.LBE7276:
.LBB7274:
.LBB7275:
	.loc 2 92 0
	leal	5(%esi), %edx
#APP
# 92 "src/ioport.h" 1
	inb %dx, %al
# 0 "" 2
.LVL274:
#NO_APP
.LBE7275:
.LBE7274:
	.loc 13 108 0
	movb	%al, 29(%ebx)
.LBB7272:
.LBB7273:
	.loc 2 92 0
	leal	6(%esi), %edx
	jmp	.L167
.LVL275:
.L135:
.LBE7273:
.LBE7272:
.LBE7271:
.LBE7270:
.LBB7295:
.LBB7296:
.LBB7314:
.LBB7315:
	.loc 13 81 0
	movw	20(%ebx), %dx
	cmpw	$3, %dx
	ja	.L161
	.loc 13 85 0
	movl	$64, %eax
#APP
# 85 "src/serial.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB7316:
	movzwl	%dx, %edx
#APP
# 85 "src/serial.c" 1
	movw %ES:(%edx,%edx), %cx
# 0 "" 2
.LVL276:
#NO_APP
.LBE7316:
	.loc 13 86 0
	testw	%cx, %cx
	jne	.L143
	jmp	.L161
.LVL277:
.L148:
.LBE7315:
.LBE7314:
.LBB7297:
.LBB7309:
.LBB7310:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb %dx, %al
# 0 "" 2
.LVL278:
#NO_APP
	movl	%eax, %esi
.LVL279:
.LBE7310:
.LBE7309:
	.loc 13 123 0
	movl	%esi, %eax
.LVL280:
	andl	$96, %eax
	cmpl	$96, %eax
	jne	.L144
.LBB7307:
.LBB7308:
	.loc 2 82 0
	movb	28(%ebx), %al
	movl	%ecx, %edx
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE7308:
.LBE7307:
	.loc 13 127 0
	movl	%esi, %eax
.LVL281:
	jmp	.L164
.LVL282:
.L144:
.LBB7302:
.LBB7303:
	.loc 13 27 0
	movl	$64, %eax
#APP
# 27 "src/serial.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB7304:
#APP
# 27 "src/serial.c" 1
	movl %ES:108(%ebp), %eax
# 0 "" 2
.LVL283:
#NO_APP
.LBE7304:
	.loc 13 28 0
	cmpw	%ax, %di
.LVL284:
	je	.L146
	.loc 13 31 0
	movl	%eax, %edi
.LVL285:
	decw	%di
	je	.L147
.LVL286:
.L146:
.LBE7303:
.LBE7302:
.LBB7298:
.LBB7299:
.LBB7300:
.LBB7301:
	.loc 6 72 0
#APP
# 72 "src/util.c" 1
	sti
nop
rep ; nop
cli
cld

# 0 "" 2
#NO_APP
	jmp	.L148
.LVL287:
.L147:
.LBE7301:
.LBE7300:
.LBE7299:
.LBE7298:
	.loc 13 132 0
	movl	%esi, %eax
.LVL288:
	orl	$-128, %eax
.LVL289:
.L164:
	movb	%al, 29(%ebx)
	jmp	.L166
.LVL290:
.L136:
.LBE7297:
.LBE7296:
.LBE7295:
.LBB7322:
.LBB7323:
.LBB7340:
.LBB7341:
	.loc 13 81 0
	movw	20(%ebx), %dx
	cmpw	$3, %dx
	ja	.L161
	.loc 13 85 0
	movl	$64, %eax
#APP
# 85 "src/serial.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB7342:
	movzwl	%dx, %edx
#APP
# 85 "src/serial.c" 1
	movw %ES:(%edx,%edx), %si
# 0 "" 2
.LVL291:
#NO_APP
.LBE7342:
	.loc 13 86 0
	testw	%si, %si
	jne	.L150
	jmp	.L161
.LVL292:
.L155:
.LBE7341:
.LBE7340:
.LBB7324:
.LBB7335:
.LBB7336:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb %dx, %al
# 0 "" 2
.LVL293:
#NO_APP
	movb	%al, %cl
.LVL294:
.LBE7336:
.LBE7335:
	.loc 13 150 0
	movl	%ecx, %eax
.LVL295:
	andl	$1, %eax
	je	.L151
.LBB7333:
.LBB7334:
	.loc 2 92 0
	movl	%esi, %edx
#APP
# 92 "src/ioport.h" 1
	inb %dx, %al
# 0 "" 2
.LVL296:
#NO_APP
.LBE7334:
.LBE7333:
	.loc 13 152 0
	movb	%al, 28(%ebx)
	jmp	.L165
.LVL297:
.L151:
.LBB7329:
.LBB7330:
	.loc 13 27 0
#APP
# 27 "src/serial.c" 1
	movw %bp, %ES
# 0 "" 2
#NO_APP
.LBB7331:
#APP
# 27 "src/serial.c" 1
	movl %ES:108(%eax), %eax
# 0 "" 2
.LVL298:
#NO_APP
.LBE7331:
	.loc 13 28 0
	cmpw	%ax, %di
.LVL299:
	je	.L153
	.loc 13 31 0
	movl	%eax, %edi
.LVL300:
	decw	%di
	je	.L154
.LVL301:
.L153:
.LBE7330:
.LBE7329:
.LBB7325:
.LBB7326:
.LBB7327:
.LBB7328:
	.loc 6 72 0
#APP
# 72 "src/util.c" 1
	sti
nop
rep ; nop
cli
cld

# 0 "" 2
#NO_APP
	jmp	.L155
.LVL302:
.L154:
.LBE7328:
.LBE7327:
.LBE7326:
.LBE7325:
	.loc 13 158 0
	orl	$-128, %ecx
.LVL303:
.L165:
	movb	%cl, 29(%ebx)
	jmp	.L166
.LVL304:
.L170:
.LBE7324:
.LBE7323:
.LBE7322:
.LBB7348:
.LBB7349:
.LBB7350:
.LBB7351:
	.loc 13 81 0
	movw	20(%ebx), %ax
	cmpw	$3, %ax
	ja	.L161
	.loc 13 85 0
	movl	$64, %edx
#APP
# 85 "src/serial.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB7352:
	movzwl	%ax, %eax
#APP
# 85 "src/serial.c" 1
	movw %ES:(%eax,%eax), %cx
# 0 "" 2
.LVL305:
#NO_APP
.LBE7352:
	.loc 13 86 0
	testw	%cx, %cx
	jne	.L157
.LVL306:
.L161:
.LBE7351:
.LBE7350:
.LBE7349:
.LBE7348:
.LBB7361:
.LBB7362:
.LBB7363:
.LBB7364:
.LBB7365:
.LBB7366:
	.file 14 "src/bregs.h"
	.loc 14 60 0
	orw	$1, 36(%ebx)
	jmp	.L160
.LVL307:
.L140:
.LBE7366:
.LBE7365:
.LBE7364:
.LBE7363:
.LBE7362:
.LBE7361:
.LBB7367:
.LBB7294:
	.loc 13 98 0
	leal	3(%esi), %edi
.LBB7290:
.LBB7291:
	.loc 2 92 0
	movl	%edi, %edx
#APP
# 92 "src/ioport.h" 1
	inb %dx, %al
# 0 "" 2
#NO_APP
.LBE7291:
.LBE7290:
.LBB7292:
.LBB7293:
	.loc 2 82 0
	orl	$-128, %eax
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE7293:
.LBE7292:
	.loc 13 99 0
	movb	28(%ebx), %al
	movzbl	%al, %ebp
	movl	%ebp, %edx
	andb	$-32, %dl
	je	.L158
	jmp	.L171
.LVL308:
.L143:
.LBE7294:
.LBE7367:
.LBB7368:
.LBB7321:
.LBB7317:
.LBB7318:
	.loc 13 20 0
#APP
# 20 "src/serial.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB7319:
#APP
# 20 "src/serial.c" 1
	movl %ES:108, %edi
# 0 "" 2
.LVL309:
#NO_APP
.LBE7319:
.LBE7318:
.LBE7317:
.LBB7320:
.LBB7312:
.LBB7311:
	.loc 2 92 0
	leal	5(%ecx), %edx
.LBE7311:
.LBE7312:
.LBB7313:
.LBB7306:
.LBB7305:
	.loc 13 27 0
	xorl	%ebp, %ebp
	jmp	.L148
.LVL310:
.L150:
.LBE7305:
.LBE7306:
.LBE7313:
.LBE7320:
.LBE7321:
.LBE7368:
.LBB7369:
.LBB7347:
.LBB7343:
.LBB7344:
	.loc 13 20 0
#APP
# 20 "src/serial.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB7345:
#APP
# 20 "src/serial.c" 1
	movl %ES:108, %edi
# 0 "" 2
.LVL311:
#NO_APP
.LBE7345:
.LBE7344:
.LBE7343:
.LBB7346:
.LBB7338:
.LBB7337:
	.loc 2 92 0
	leal	5(%esi), %edx
.LBE7337:
.LBE7338:
.LBB7339:
.LBB7332:
	.loc 13 27 0
	movl	$64, %ebp
	jmp	.L155
.LVL312:
.L157:
.LBE7332:
.LBE7339:
.LBE7346:
.LBE7347:
.LBE7369:
.LBB7370:
.LBB7360:
.LBB7353:
.LBB7354:
	.loc 2 92 0
	leal	5(%ecx), %edx
#APP
# 92 "src/ioport.h" 1
	inb %dx, %al
# 0 "" 2
.LVL313:
#NO_APP
.LBE7354:
.LBE7353:
	.loc 13 173 0
	movb	%al, 29(%ebx)
.LBB7355:
.LBB7356:
	.loc 2 92 0
	leal	6(%ecx), %edx
.LVL314:
.L167:
#APP
# 92 "src/ioport.h" 1
	inb %dx, %al
# 0 "" 2
.LVL315:
#NO_APP
.LBE7356:
.LBE7355:
	.loc 13 174 0
	movb	%al, 28(%ebx)
.LVL316:
.L166:
.LBB7357:
.LBB7358:
.LBB7359:
	.loc 14 62 0
	andw	$-2, 36(%ebx)
.L160:
.LBE7359:
.LBE7358:
.LBE7357:
.LBE7360:
.LBE7370:
	.loc 13 201 0
	popl	%ebx
.LVL317:
	popl	%esi
.LVL318:
	popl	%edi
.LVL319:
	popl	%ebp
	ret
	.cfi_endproc
.LFE1010:
	.size	handle_14, .-handle_14
	.section	.text.handle_17,"ax",@progbits
.globl handle_17
	.type	handle_17, @function
handle_17:
.LFB1018:
	.loc 13 327 0
	.cfi_startproc
.LVL320:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	pushl	%edi
	.cfi_def_cfa_offset 12
	pushl	%esi
	.cfi_def_cfa_offset 16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	subl	$4, %esp
	.cfi_def_cfa_offset 24
	movl	%eax, %ebx
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 5, -8
	.loc 13 334 0
	movb	29(%eax), %al
.LVL321:
	cmpb	$1, %al
	je	.L175
	jb	.L174
	cmpb	$2, %al
	jne	.L190
	jmp	.L197
.L174:
.LBB7371:
.LBB7372:
.LBB7388:
.LBB7389:
	.loc 13 246 0
	movw	20(%ebx), %dx
	cmpw	$2, %dx
	ja	.L190
	.loc 13 250 0
	movl	$64, %eax
#APP
# 250 "src/serial.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB7390:
	movzwl	%dx, %edx
#APP
# 250 "src/serial.c" 1
	movw %ES:8(%edx,%edx), %di
# 0 "" 2
.LVL322:
#NO_APP
.LBE7390:
	.loc 13 251 0
	testw	%di, %di
	jne	.L179
	jmp	.L190
.LVL323:
.L184:
.LBE7389:
.LBE7388:
.LBB7373:
.LBB7383:
.LBB7384:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb %dx, %al
# 0 "" 2
#NO_APP
.LBE7384:
.LBE7383:
	.loc 13 274 0
	testb	$64, %al
	je	.L195
.LBB7378:
.LBB7379:
	.loc 13 27 0
#APP
# 27 "src/serial.c" 1
	movw %di, %ES
# 0 "" 2
#NO_APP
.LBB7380:
#APP
# 27 "src/serial.c" 1
	movl %ES:108(%ecx), %ebp
# 0 "" 2
.LVL324:
#NO_APP
.LBE7380:
	.loc 13 28 0
	cmpw	%bp, %si
.LVL325:
	je	.L182
	.loc 13 31 0
	movl	%ebp, %esi
.LVL326:
	decw	%si
	je	.L183
.LVL327:
.L182:
.LBE7379:
.LBE7378:
.LBB7374:
.LBB7375:
.LBB7376:
.LBB7377:
	.loc 6 72 0
#APP
# 72 "src/util.c" 1
	sti
nop
rep ; nop
cli
cld

# 0 "" 2
#NO_APP
	jmp	.L184
.LVL328:
.L183:
.LBE7377:
.LBE7376:
.LBE7375:
.LBE7374:
	.loc 13 281 0
	xorl	$72, %eax
.LVL329:
	orl	$1, %eax
	jmp	.L194
.LVL330:
.L175:
.LBE7373:
.LBE7372:
.LBE7371:
.LBB7404:
.LBB7405:
.LBB7406:
.LBB7407:
	.loc 13 246 0
	movw	20(%ebx), %ax
	cmpw	$2, %ax
	ja	.L190
	.loc 13 250 0
	movl	$64, %edx
#APP
# 250 "src/serial.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB7408:
	movzwl	%ax, %eax
#APP
# 250 "src/serial.c" 1
	movw %ES:8(%eax,%eax), %si
# 0 "" 2
.LVL331:
#NO_APP
.LBE7408:
	.loc 13 251 0
	testw	%si, %si
	jne	.L186
	jmp	.L190
.LVL332:
.L197:
.LBE7407:
.LBE7406:
.LBE7405:
.LBE7404:
.LBB7418:
.LBB7419:
.LBB7424:
.LBB7425:
	.loc 13 246 0
	movw	20(%ebx), %ax
	cmpw	$2, %ax
	ja	.L190
	.loc 13 250 0
	movl	$64, %edx
#APP
# 250 "src/serial.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB7426:
	movzwl	%ax, %eax
#APP
# 250 "src/serial.c" 1
	movw %ES:8(%eax,%eax), %ax
# 0 "" 2
.LVL333:
#NO_APP
.LBE7426:
.LBE7425:
.LBE7424:
.LBB7421:
.LBB7422:
	.loc 2 92 0
	leal	1(%eax), %edx
.LBE7422:
.LBE7421:
.LBB7420:
.LBB7427:
	.loc 13 251 0
	testw	%ax, %ax
	jne	.L192
.LVL334:
.L190:
.LBE7427:
.LBE7420:
.LBE7419:
.LBE7418:
.LBB7433:
.LBB7434:
.LBB7435:
.LBB7436:
.LBB7437:
.LBB7438:
	.loc 14 60 0
	orw	$1, 36(%ebx)
	jmp	.L189
.LVL335:
.L179:
.LBE7438:
.LBE7437:
.LBE7436:
.LBE7435:
.LBE7434:
.LBE7433:
.LBB7439:
.LBB7403:
.LBB7391:
.LBB7392:
	.loc 13 20 0
#APP
# 20 "src/serial.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB7393:
#APP
# 20 "src/serial.c" 1
	movl %ES:108, %esi
# 0 "" 2
.LVL336:
#NO_APP
.LBE7393:
.LBE7392:
.LBE7391:
.LBB7394:
.LBB7395:
	.loc 2 82 0
	movb	28(%ebx), %al
	movl	%edi, %edx
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE7395:
.LBE7394:
	.loc 13 267 0
	leal	2(%edi), %edx
.LBB7396:
.LBB7397:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb %dx, %al
# 0 "" 2
#NO_APP
	movl	%eax, %ebp
.LVL337:
.LBE7397:
.LBE7396:
.LBB7398:
.LBB7399:
	.loc 2 82 0
	orl	$1, %eax
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE7399:
.LBE7398:
	.loc 13 269 0
	movl	$5, %eax
	movl	%edx, (%esp)
	call	udelay.1730
.LBB7400:
.LBB7401:
	.loc 2 82 0
	movl	%ebp, %eax
.LVL338:
	andl	$254, %eax
	movl	(%esp), %edx
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE7401:
.LBE7400:
.LBB7402:
.LBB7386:
.LBB7385:
	.loc 2 92 0
	leal	1(%edi), %edx
.LBE7385:
.LBE7386:
.LBB7387:
.LBB7382:
	.loc 13 27 0
	movl	$64, %edi
.LVL339:
.LBB7381:
	xorl	%ecx, %ecx
	jmp	.L184
.LVL340:
.L186:
.LBE7381:
.LBE7382:
.LBE7387:
.LBE7402:
.LBE7403:
.LBE7439:
.LBB7440:
.LBB7417:
	.loc 13 298 0
	leal	2(%esi), %edx
.LBB7409:
.LBB7410:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb %dx, %al
# 0 "" 2
#NO_APP
	movl	%eax, %edi
.LVL341:
.LBE7410:
.LBE7409:
.LBB7411:
.LBB7412:
	.loc 2 82 0
	movl	%edi, %eax
.LVL342:
	andl	$251, %eax
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE7412:
.LBE7411:
	.loc 13 300 0
	movl	$5, %eax
	movl	%edx, (%esp)
	call	udelay.1730
.LBB7413:
.LBB7414:
	.loc 2 82 0
	movl	%edi, %eax
.LVL343:
	orl	$4, %eax
	movl	(%esp), %edx
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE7414:
.LBE7413:
.LBB7415:
.LBB7416:
	.loc 2 92 0
	leal	1(%esi), %edx
.LVL344:
.L192:
.LBE7416:
.LBE7415:
.LBE7417:
.LBE7440:
.LBB7441:
.LBB7432:
.LBB7428:
.LBB7423:
#APP
# 92 "src/ioport.h" 1
	inb %dx, %al
# 0 "" 2
.LVL345:
#NO_APP
.L195:
.LBE7423:
.LBE7428:
	.loc 13 314 0
	xorl	$72, %eax
.LVL346:
.L194:
	movb	%al, 29(%ebx)
.LBB7429:
.LBB7430:
.LBB7431:
	.loc 14 62 0
	andw	$-2, 36(%ebx)
.LVL347:
.L189:
.LBE7431:
.LBE7430:
.LBE7429:
.LBE7432:
.LBE7441:
	.loc 13 340 0
	popl	%ecx
	.cfi_def_cfa_offset 20
	popl	%ebx
.LVL348:
	popl	%esi
.LVL349:
	popl	%edi
.LVL350:
	popl	%ebp
.LVL351:
	ret
	.cfi_endproc
.LFE1018:
	.size	handle_17, .-handle_17
	.section	.text.rtc_updating.34605,"ax",@progbits
	.type	rtc_updating.34605, @function
rtc_updating.34605:
.LFB1105:
	.loc 7 152 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	movl	%esp, %ebp
	.cfi_offset 5, -8
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%ebx
	subl	$16, %esp
.LBB7442:
.LBB7443:
.LBB7444:
	.loc 2 82 0
	movb	$-118, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7444:
.LBE7443:
.LBB7445:
.LBB7446:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $113, %al
# 0 "" 2
.LVL352:
#NO_APP
.LBE7446:
.LBE7445:
.LBE7442:
	.loc 7 161 0
	testb	%al, %al
	jns	.L199
	.cfi_offset 3, -16
	.cfi_offset 7, -12
.LBB7447:
.LBB7448:
.LBB7449:
	.loc 7 135 0
#APP
# 135 "src/clock.c" 1
	movl %CS:cpu_khz, %ecx
# 0 "" 2
.LVL353:
#NO_APP
.LBE7449:
.LBB7450:
.LBB7451:
	.loc 8 85 0
#APP
# 85 "src/util.h" 1
	rdtsc
# 0 "" 2
.LVL354:
#NO_APP
	movl	%eax, -16(%ebp)
	movl	%edx, -12(%ebp)
.LBE7451:
.LBE7450:
	.loc 7 136 0
	movl	$15, %ebx
	movl	%ecx, %eax
	mull	%ebx
	movl	%eax, -24(%ebp)
	movl	%edx, -20(%ebp)
	movl	-16(%ebp), %eax
	movl	-12(%ebp), %edx
	addl	%eax, -24(%ebp)
	adcl	%edx, -20(%ebp)
.LBE7448:
.LBE7447:
.LBB7452:
.LBB7453:
.LBB7454:
	.loc 2 82 0
	movb	$-118, %bl
.L203:
	movb	%bl, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7454:
.LBE7453:
.LBB7455:
.LBB7456:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $113, %al
# 0 "" 2
.LVL355:
#NO_APP
.LBE7456:
.LBE7455:
.LBE7452:
	.loc 7 165 0
	testb	%al, %al
	jns	.L199
.LBB7457:
.LBB7458:
.LBB7459:
	.loc 8 85 0
#APP
# 85 "src/util.h" 1
	rdtsc
# 0 "" 2
.LVL356:
#NO_APP
	movl	%eax, -16(%ebp)
	movl	%edx, -12(%ebp)
.LBE7459:
.LBE7458:
.LBE7457:
	.loc 7 167 0
	movl	-24(%ebp), %eax
	movl	-20(%ebp), %edx
	subl	%eax, -16(%ebp)
	sbbl	%edx, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jl	.L200
	jg	.L205
	cmpl	$0, -16(%ebp)
	jbe	.L200
.L205:
	orl	$-1, %eax
	jmp	.L202
.L200:
.LBB7460:
.LBB7461:
.LBB7462:
.LBB7463:
	.loc 6 72 0
#APP
# 72 "src/util.c" 1
	sti
nop
rep ; nop
cli
cld

# 0 "" 2
#NO_APP
.LBE7463:
.LBE7462:
.LBE7461:
.LBE7460:
	.loc 7 171 0
	jmp	.L203
.LVL357:
.L199:
	xorl	%eax, %eax
.LVL358:
.L202:
	.loc 7 172 0
	addl	$16, %esp
	popl	%ebx
	popl	%edi
	leave
	ret
	.cfi_endproc
.LFE1105:
	.size	rtc_updating.34605, .-rtc_updating.34605
	.section	.text.handle_70,"ax",@progbits
.globl handle_70
	.type	handle_70, @function
handle_70:
.LFB1130:
	.loc 7 580 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	pushl	%edi
	.cfi_def_cfa_offset 12
	pushl	%esi
	.cfi_def_cfa_offset 16
	pushl	%ebx
	.cfi_def_cfa_offset 20
.LBB7464:
.LBB7465:
.LBB7466:
	.loc 2 82 0
	movb	$-117, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7466:
.LBE7465:
.LBB7467:
.LBB7468:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $113, %al
# 0 "" 2
#NO_APP
	movb	%al, %dl
.LVL359:
.LBE7468:
.LBE7467:
.LBE7464:
.LBB7469:
.LBB7470:
.LBB7471:
	.loc 2 82 0
	movb	$-116, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7471:
.LBE7470:
.LBB7472:
.LBB7473:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $113, %al
# 0 "" 2
.LVL360:
#NO_APP
.LBE7473:
.LBE7472:
.LBE7469:
	.loc 7 587 0
	andb	$96, %dl
.LVL361:
	je	.L207
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 5, -8
	.loc 7 589 0
	movzbl	%al, %ebp
	testl	$32, %ebp
	je	.L208
.LBB7474:
	.loc 7 592 0
	xorl	%eax, %eax
.LVL362:
#APP
# 592 "src/clock.c" 1
	pushl %ebp
sti
stc
int $74
pushfl
popl %ecx
cli
cld
popl %ebp
# 0 "" 2
.LVL363:
#NO_APP
.L208:
.LBE7474:
	.loc 7 594 0
	andl	$64, %ebp
	je	.L207
	.loc 7 601 0
	movl	$64, %eax
.LVL364:
#APP
# 601 "src/clock.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB7475:
#APP
# 601 "src/clock.c" 1
	movb %ES:160, %dl
# 0 "" 2
.LVL365:
#NO_APP
.LBE7475:
	testb	%dl, %dl
	je	.L207
	.loc 7 605 0
#APP
# 605 "src/clock.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB7476:
#APP
# 605 "src/clock.c" 1
	movl %ES:156, %edx
# 0 "" 2
.LVL366:
#NO_APP
.LBE7476:
	.loc 7 606 0
	cmpl	$976, %edx
	ja	.L209
.LBB7477:
	.loc 7 608 0
#APP
# 608 "src/clock.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB7478:
#APP
# 608 "src/clock.c" 1
	movl %ES:152, %ecx
# 0 "" 2
.LVL367:
#NO_APP
.LBE7478:
	.loc 7 609 0
	movl	%ecx, %ebp
	shrl	$16, %ebp
	.loc 7 610 0
	movzwl	%cx, %ecx
.LVL368:
	.loc 7 611 0
#APP
# 611 "src/clock.c" 1
	movw %bp, %ES
# 0 "" 2
.LVL369:
#NO_APP
.LBB7479:
#APP
# 611 "src/clock.c" 1
	movb %ES:(%ecx), %dl
# 0 "" 2
.LVL370:
#NO_APP
.LBE7479:
.LBB7480:
	.loc 7 612 0
#APP
# 612 "src/clock.c" 1
	movw %bp, %ES
# 0 "" 2
#NO_APP
	orl	$-128, %edx
#APP
# 612 "src/clock.c" 1
	movb %dl, %ES:(%ecx)
# 0 "" 2
#NO_APP
.LBE7480:
.LBB7481:
.LBB7482:
	.loc 7 512 0
#APP
# 512 "src/clock.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB7483:
#APP
# 512 "src/clock.c" 1
	movb %ES:160, %dl
# 0 "" 2
.LVL371:
#NO_APP
.LBE7483:
	andb	$1, %dl
	je	.L207
.LBB7484:
	.loc 7 515 0
#APP
# 515 "src/clock.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
	xorl	%edx, %edx
.LVL372:
#APP
# 515 "src/clock.c" 1
	movb %dl, %ES:160
# 0 "" 2
#NO_APP
.LBE7484:
.LBB7485:
.LBB7486:
.LBB7487:
.LBB7488:
	.loc 10 249 0
#APP
# 249 "src/biosvar.h" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB7489:
#APP
# 249 "src/biosvar.h" 1
	movw %ES:14, %dx
# 0 "" 2
.LVL373:
#NO_APP
.LBE7489:
.LBE7488:
.LBE7487:
	.loc 7 486 0
#APP
# 486 "src/clock.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB7490:
#APP
# 486 "src/clock.c" 1
	movl %ES:298, %eax
# 0 "" 2
.LVL374:
#NO_APP
.LBE7490:
.LBB7491:
	.loc 7 487 0
	leal	-1(%eax), %ecx
.LVL375:
#APP
# 487 "src/clock.c" 1
	movw %dx, %ES
# 0 "" 2
# 487 "src/clock.c" 1
	movl %ecx, %ES:298
# 0 "" 2
#NO_APP
.LBE7491:
	.loc 7 488 0
	decl	%eax
.LVL376:
	jne	.L207
.LBB7492:
.LBB7493:
.LBB7494:
	.loc 2 82 0
	movb	$-117, %dl
.LVL377:
	movb	%dl, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7494:
.LBE7493:
.LBB7495:
.LBB7496:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $113, %al
# 0 "" 2
#NO_APP
	movb	%al, %cl
.LVL378:
.LBE7496:
.LBE7495:
.LBE7492:
.LBB7497:
.LBB7498:
.LBB7499:
	.loc 2 82 0
	movb	%dl, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7499:
.LBE7498:
.LBB7500:
.LBB7501:
	movl	%ecx, %eax
.LVL379:
	andl	$191, %eax
#APP
# 82 "src/ioport.h" 1
	outb %al, $113
# 0 "" 2
#NO_APP
	jmp	.L207
.LVL380:
.L209:
.LBE7501:
.LBE7500:
.LBE7497:
.LBE7486:
.LBE7485:
.LBE7482:
.LBE7481:
.LBE7477:
	.loc 7 617 0
	subl	$977, %edx
.LVL381:
.LBB7502:
	.loc 7 618 0
#APP
# 618 "src/clock.c" 1
	movw %ax, %ES
# 0 "" 2
# 618 "src/clock.c" 1
	movl %edx, %ES:156
# 0 "" 2
.LVL382:
#NO_APP
.L207:
.LBE7502:
.LBB7503:
.LBB7504:
.LBB7505:
	.loc 2 82 0
	movb	$32, %al
.LVL383:
#APP
# 82 "src/ioport.h" 1
	outb %al, $160
# 0 "" 2
#NO_APP
.LBE7505:
.LBE7504:
.LBB7506:
.LBB7507:
.LBB7508:
#APP
# 82 "src/ioport.h" 1
	outb %al, $32
# 0 "" 2
#NO_APP
.LBE7508:
.LBE7507:
.LBE7506:
.LBE7503:
	.loc 7 623 0
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
.LVL384:
	ret
	.cfi_endproc
.LFE1130:
	.size	handle_70, .-handle_70
	.section	.text.handle_1ab1.1754,"ax",@progbits
	.type	handle_1ab1.1754, @function
handle_1ab1.1754:
.LFB1829:
	.file 15 "src/pcibios.c"
	.loc 15 177 0
	.cfi_startproc
.LVL385:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	pushl	%edi
	.cfi_def_cfa_offset 12
	pushl	%esi
	.cfi_def_cfa_offset 16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	subl	$4, %esp
	.cfi_def_cfa_offset 24
	movl	%eax, %ebx
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 5, -8
	.loc 15 185 0
	movb	28(%eax), %al
.LVL386:
	cmpb	$9, %al
	je	.L217
	ja	.L223
	cmpb	$2, %al
	je	.L214
	ja	.L224
	decb	%al
	jne	.L212
	jmp	.L250
.L224:
	cmpb	$3, %al
	je	.L215
	cmpb	$8, %al
	jne	.L212
	jmp	.L251
.L223:
	cmpb	$12, %al
	je	.L220
	ja	.L225
	cmpb	$10, %al
	je	.L218
	cmpb	$11, %al
	jne	.L212
	jmp	.L252
.L225:
	cmpb	$13, %al
	je	.L221
	cmpb	$14, %al
	jne	.L212
	jmp	.L253
.L250:
.LBB7509:
.LBB7510:
	.loc 15 30 0
	movl	$256, (%esp)
.LVL387:
	movl	%esp, %edx
	xorl	%eax, %eax
	jmp	.L243
.LVL388:
.L227:
	incl	%eax
.LVL389:
	movl	%esp, %edx
.L243:
	call	pci_next.19998
	testl	%eax, %eax
.LVL390:
	jns	.L227
	.loc 15 33 0
	movb	$1, 28(%ebx)
	.loc 15 34 0
	movw	$528, 16(%ebx)
	.loc 15 35 0
	movl	(%esp), %eax
.LVL391:
	decl	%eax
	shrw	$8, %ax
	movb	%al, 24(%ebx)
	.loc 15 36 0
	movl	$541672272, 20(%ebx)
	.loc 15 37 0
	movl	$pcibios32_entry+983040, 4(%ebx)
	jmp	.L241
.LVL392:
.L214:
.LBE7510:
.LBE7509:
.LBB7511:
.LBB7512:
	.loc 15 45 0
	movzwl	24(%ebx), %edi
.LVL393:
	sall	$16, %edi
	movzwl	20(%ebx), %eax
	orl	%eax, %edi
	.loc 15 46 0
	movzwl	8(%ebx), %esi
.LVL394:
	.loc 15 48 0
	movl	$256, (%esp)
.LVL395:
	movl	%esp, %edx
	xorl	%eax, %eax
	jmp	.L244
.LVL396:
.L232:
.LBB7513:
.LBB7514:
.LBB7515:
.LBB7516:
	.loc 2 88 0
	movzwl	%cx, %eax
.LVL397:
	sall	$8, %eax
	orl	$-2147483648, %eax
	movl	$3320, %edx
#APP
# 88 "src/ioport.h" 1
	outl %eax, %dx
# 0 "" 2
#NO_APP
.LBE7516:
.LBE7515:
.LBB7517:
.LBB7518:
	.loc 2 102 0
	movb	$-4, %dl
#APP
# 102 "src/ioport.h" 1
	inl %dx, %eax
# 0 "" 2
.LVL398:
#NO_APP
.LBE7518:
.LBE7517:
.LBE7514:
	.loc 15 50 0
	cmpl	%edi, %eax
	jne	.L230
	.loc 15 52 0
	testl	%esi, %esi
	je	.L235
	decl	%esi
.L230:
.LBE7513:
	.loc 15 48 0
	leal	1(%ecx), %eax
.LVL399:
	movl	%esp, %edx
.L244:
	call	pci_next.19998
.LVL400:
	movl	%eax, %ecx
.LVL401:
	testl	%eax, %eax
	jns	.L232
.LVL402:
	jmp	.L242
.LVL403:
.L215:
.LBE7512:
.LBE7511:
.LBB7519:
.LBB7520:
	.loc 15 65 0
	movzwl	8(%ebx), %esi
.LVL404:
	.loc 15 66 0
	movl	24(%ebx), %ebp
.LVL405:
	.loc 15 68 0
	movl	$256, (%esp)
.LVL406:
	movl	%esp, %edx
	xorl	%eax, %eax
	jmp	.L245
.LVL407:
.L236:
.LBB7521:
.LBB7522:
.LBB7523:
.LBB7524:
	.loc 2 88 0
	movzwl	%cx, %eax
.LVL408:
	sall	$8, %eax
	orl	$-2147483640, %eax
	movl	$3320, %edx
#APP
# 88 "src/ioport.h" 1
	outl %eax, %dx
# 0 "" 2
#NO_APP
.LBE7524:
.LBE7523:
.LBB7525:
.LBB7526:
	.loc 2 102 0
	movb	$-4, %dl
#APP
# 102 "src/ioport.h" 1
	inl %dx, %eax
# 0 "" 2
#NO_APP
.LBE7526:
.LBE7525:
.LBE7522:
	.loc 15 70 0
	shrl	$8, %eax
	cmpl	%ebp, %eax
	jne	.L234
	.loc 15 72 0
	testl	%esi, %esi
	je	.L235
	decl	%esi
	jmp	.L234
.LVL409:
.L235:
	.loc 15 74 0
	movw	%cx, 16(%ebx)
	jmp	.L241
.LVL410:
.L234:
.LBE7521:
	.loc 15 68 0
	leal	1(%ecx), %eax
	movl	%esp, %edx
.L245:
	call	pci_next.19998
.LVL411:
	movl	%eax, %ecx
.LVL412:
	testl	%eax, %eax
	jns	.L236
.LVL413:
.L242:
.LBB7527:
.LBB7528:
.LBB7529:
.LBB7530:
	.loc 14 90 0
	movb	$-122, 29(%ebx)
	jmp	.L240
.LVL414:
.L251:
.LBE7530:
.LBE7529:
.LBE7528:
.LBE7527:
.LBE7520:
.LBE7519:
.LBB7531:
.LBB7532:
	.loc 15 85 0
	movw	4(%ebx), %cx
.LBB7533:
.LBB7534:
.LBB7535:
	.loc 2 88 0
	movl	%ecx, %eax
	andl	$252, %eax
	orl	$-2147483648, %eax
	movzwl	16(%ebx), %edx
	sall	$8, %edx
	orl	%edx, %eax
	movl	$3320, %edx
#APP
# 88 "src/ioport.h" 1
	outl %eax, %dx
# 0 "" 2
#NO_APP
.LBE7535:
.LBE7534:
.LBB7536:
.LBB7537:
	.loc 2 92 0
	andl	$3, %ecx
	leal	3324(%ecx), %edx
#APP
# 92 "src/ioport.h" 1
	inb %dx, %al
# 0 "" 2
.LVL415:
#NO_APP
.LBE7537:
.LBE7536:
.LBE7533:
	.loc 15 85 0
	movb	%al, 24(%ebx)
	jmp	.L241
.LVL416:
.L217:
.LBE7532:
.LBE7531:
.LBB7538:
.LBB7539:
	.loc 15 93 0
	movw	4(%ebx), %cx
.LBB7540:
.LBB7541:
.LBB7542:
	.loc 2 88 0
	movl	%ecx, %eax
	andl	$252, %eax
	orl	$-2147483648, %eax
	movzwl	16(%ebx), %edx
	sall	$8, %edx
	orl	%edx, %eax
	movl	$3320, %edx
#APP
# 88 "src/ioport.h" 1
	outl %eax, %dx
# 0 "" 2
#NO_APP
.LBE7542:
.LBE7541:
.LBB7543:
.LBB7544:
	.loc 2 97 0
	andl	$2, %ecx
	leal	3324(%ecx), %edx
#APP
# 97 "src/ioport.h" 1
	inw %dx, %ax
# 0 "" 2
.LVL417:
#NO_APP
.LBE7544:
.LBE7543:
.LBE7540:
	.loc 15 93 0
	movw	%ax, 24(%ebx)
	jmp	.L241
.LVL418:
.L218:
.LBE7539:
.LBE7538:
.LBB7545:
.LBB7546:
.LBB7547:
.LBB7548:
.LBB7549:
	.loc 2 88 0
	movzwl	4(%ebx), %eax
	andl	$252, %eax
	orl	$-2147483648, %eax
	movzwl	16(%ebx), %edx
	sall	$8, %edx
	orl	%edx, %eax
	movl	$3320, %edx
#APP
# 88 "src/ioport.h" 1
	outl %eax, %dx
# 0 "" 2
#NO_APP
.LBE7549:
.LBE7548:
.LBB7550:
.LBB7551:
	.loc 2 102 0
	movb	$-4, %dl
#APP
# 102 "src/ioport.h" 1
	inl %dx, %eax
# 0 "" 2
.LVL419:
#NO_APP
.LBE7551:
.LBE7550:
.LBE7547:
	.loc 15 101 0
	movl	%eax, 24(%ebx)
	jmp	.L241
.LVL420:
.L252:
.LBE7546:
.LBE7545:
.LBB7552:
.LBB7553:
	.loc 15 109 0
	movw	4(%ebx), %cx
.LBB7554:
.LBB7555:
.LBB7556:
	.loc 2 88 0
	movl	%ecx, %eax
	andl	$252, %eax
	orl	$-2147483648, %eax
	movzwl	16(%ebx), %edx
	sall	$8, %edx
	orl	%edx, %eax
	movl	$3320, %edx
#APP
# 88 "src/ioport.h" 1
	outl %eax, %dx
# 0 "" 2
#NO_APP
.LBE7556:
.LBE7555:
.LBB7557:
.LBB7558:
	.loc 2 82 0
	movb	24(%ebx), %al
	andl	$3, %ecx
	leal	3324(%ecx), %edx
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
	jmp	.L241
.L220:
.LBE7558:
.LBE7557:
.LBE7554:
.LBE7553:
.LBE7552:
.LBB7559:
.LBB7560:
	.loc 15 117 0
	movw	4(%ebx), %cx
.LBB7561:
.LBB7562:
.LBB7563:
	.loc 2 88 0
	movl	%ecx, %eax
	andl	$252, %eax
	orl	$-2147483648, %eax
	movzwl	16(%ebx), %edx
	sall	$8, %edx
	orl	%edx, %eax
	movl	$3320, %edx
#APP
# 88 "src/ioport.h" 1
	outl %eax, %dx
# 0 "" 2
#NO_APP
.LBE7563:
.LBE7562:
.LBB7564:
.LBB7565:
	.loc 2 85 0
	movw	24(%ebx), %ax
	andl	$2, %ecx
	leal	3324(%ecx), %edx
#APP
# 85 "src/ioport.h" 1
	outw %ax, %dx
# 0 "" 2
#NO_APP
	jmp	.L241
.L221:
.LBE7565:
.LBE7564:
.LBE7561:
.LBE7560:
.LBE7559:
.LBB7566:
.LBB7567:
.LBB7568:
.LBB7569:
	.loc 2 88 0
	movzwl	4(%ebx), %eax
	andl	$252, %eax
	orl	$-2147483648, %eax
	movzwl	16(%ebx), %edx
	sall	$8, %edx
	orl	%edx, %eax
	movl	$3320, %edx
#APP
# 88 "src/ioport.h" 1
	outl %eax, %dx
# 0 "" 2
#NO_APP
.LBE7569:
.LBE7568:
.LBB7570:
.LBB7571:
	movl	24(%ebx), %eax
	movb	$-4, %dl
#APP
# 88 "src/ioport.h" 1
	outl %eax, %dx
# 0 "" 2
#NO_APP
	jmp	.L241
.L253:
.LBE7571:
.LBE7570:
.LBE7567:
.LBE7566:
.LBB7572:
.LBB7573:
.LBB7574:
	.loc 15 133 0
#APP
# 133 "src/pcibios.c" 1
	movw %CS:PirOffset, %dx
# 0 "" 2
.LVL421:
#NO_APP
.LBE7574:
	movzwl	%dx, %edx
.LVL422:
	.loc 15 134 0
	testl	%edx, %edx
	je	.L212
	.loc 15 143 0
	movzwl	4(%ebx), %eax
.LVL423:
	.loc 15 146 0
	movw	2(%ebx), %si
#APP
# 146 "src/pcibios.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB7575:
#APP
# 146 "src/pcibios.c" 1
	movw %ES:(%eax), %di
# 0 "" 2
.LVL424:
#NO_APP
.LBE7575:
.LBB7576:
	.loc 15 147 0
#APP
# 147 "src/pcibios.c" 1
	movw %CS:6(%edx), %cx
# 0 "" 2
.LVL425:
#NO_APP
.LBE7576:
	subl	$32, %ecx
.LVL426:
.LBB7577:
	.loc 15 148 0
#APP
# 148 "src/pcibios.c" 1
	movw %si, %ES
# 0 "" 2
# 148 "src/pcibios.c" 1
	movw %cx, %ES:(%eax)
# 0 "" 2
#NO_APP
.LBE7577:
	.loc 15 149 0
	cmpw	%cx, %di
	jae	.L238
.LBB7578:
.LBB7579:
.LBB7580:
.LBB7581:
	.loc 14 90 0
	movb	$-119, 29(%ebx)
	jmp	.L240
.L238:
.LBE7581:
.LBE7580:
.LBE7579:
.LBE7578:
	.loc 15 155 0
#APP
# 155 "src/pcibios.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB7582:
#APP
# 155 "src/pcibios.c" 1
	movw %ES:2(%eax), %di
# 0 "" 2
.LVL427:
#NO_APP
.LBE7582:
	.loc 15 156 0
#APP
# 156 "src/pcibios.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB7583:
#APP
# 156 "src/pcibios.c" 1
	movw %ES:4(%eax), %si
# 0 "" 2
.LVL428:
#NO_APP
.LBE7583:
.LBB7584:
.LBB7585:
	.loc 10 296 0
#APP
# 296 "src/biosvar.h" 1
	movw %CS, %ax
# 0 "" 2
.LVL429:
#NO_APP
.LBE7585:
.LBE7584:
.LBB7586:
.LBB7587:
	.loc 6 185 0
#APP
# 185 "src/util.c" 1
	movw %si, %ES
# 0 "" 2
	.loc 6 187 0
#NO_APP
	movzwl	%cx, %ecx
.LVL430:
	leal	32(%edx), %esi
.LVL431:
	movzwl	%di, %edi
.LVL432:
#APP
# 187 "src/util.c" 1
	movw %ds, %bp
movw %ax, %ds
rep movsb (%si),%es:(%di)
movw %bp, %ds
# 0 "" 2
.LVL433:
#NO_APP
.LBE7587:
.LBE7586:
.LBB7588:
	.loc 15 165 0
#APP
# 165 "src/pcibios.c" 1
	movw %CS:10(%edx), %ax
# 0 "" 2
.LVL434:
#NO_APP
.LBE7588:
	movw	%ax, 16(%ebx)
.LVL435:
.L241:
.LBB7589:
.LBB7590:
	.loc 14 77 0
	movb	$0, 29(%ebx)
.LBB7591:
.LBB7592:
	.loc 14 62 0
	andw	$-2, 36(%ebx)
	jmp	.L239
.LVL436:
.L212:
.LBE7592:
.LBE7591:
.LBE7590:
.LBE7589:
.LBE7573:
.LBE7572:
.LBB7593:
.LBB7594:
.LBB7595:
.LBB7596:
.LBB7597:
.LBB7598:
	.loc 14 90 0
	movb	$-127, 29(%ebx)
.LVL437:
.L240:
.LBB7599:
.LBB7600:
	.loc 14 60 0
	orw	$1, 36(%ebx)
.LVL438:
.L239:
.LBE7600:
.LBE7599:
.LBE7598:
.LBE7597:
.LBE7596:
.LBE7595:
.LBE7594:
.LBE7593:
	.loc 15 198 0
	popl	%ebx
	.cfi_def_cfa_offset 20
.LVL439:
	popl	%ebx
	popl	%esi
.LVL440:
	popl	%edi
.LVL441:
	popl	%ebp
.LVL442:
	ret
	.cfi_endproc
.LFE1829:
	.size	handle_1ab1.1754, .-handle_1ab1.1754
	.section	.text.handle_1a,"ax",@progbits
.globl handle_1a
	.type	handle_1a, @function
handle_1a:
.LFB1119:
	.loc 7 420 0
	.cfi_startproc
.LVL443:
	pushl	%esi
	.cfi_def_cfa_offset 8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	movl	%eax, %ebx
	.cfi_offset 3, -12
	.cfi_offset 6, -8
	.loc 7 422 0
	movb	29(%eax), %al
.LVL444:
	cmpb	$4, %al
	je	.L260
	ja	.L265
	cmpb	$1, %al
	je	.L257
	jb	.L256
	cmpb	$2, %al
	je	.L258
	cmpb	$3, %al
	jne	.L255
	jmp	.L280
.L265:
	cmpb	$6, %al
	je	.L262
	jb	.L261
	cmpb	$7, %al
	je	.L263
	cmpb	$-79, %al
	jne	.L255
	jmp	.L281
.L256:
.LBB7601:
.LBB7602:
.LBB7603:
.LBB7604:
.LBB7605:
.LBB7606:
	.loc 6 72 0
#APP
# 72 "src/util.c" 1
	sti
nop
rep ; nop
cli
cld

# 0 "" 2
#NO_APP
.LBE7606:
.LBE7605:
.LBE7604:
.LBE7603:
	.loc 7 231 0
	movl	$64, %eax
#APP
# 231 "src/clock.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB7607:
#APP
# 231 "src/clock.c" 1
	movl %ES:108, %edx
# 0 "" 2
.LVL445:
#NO_APP
.LBE7607:
	.loc 7 232 0
	movl	%edx, %ecx
	shrl	$16, %ecx
	movw	%cx, 24(%ebx)
	.loc 7 233 0
	movw	%dx, 20(%ebx)
	.loc 7 234 0
#APP
# 234 "src/clock.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB7608:
#APP
# 234 "src/clock.c" 1
	movb %ES:112, %dl
# 0 "" 2
.LVL446:
#NO_APP
.LBE7608:
	movb	%dl, 28(%ebx)
.LBB7609:
	.loc 7 235 0
#APP
# 235 "src/clock.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
	xorl	%eax, %eax
#APP
# 235 "src/clock.c" 1
	movb %al, %ES:112
# 0 "" 2
#NO_APP
	jmp	.L274
.LVL447:
.L257:
.LBE7609:
.LBE7602:
.LBE7601:
.LBB7610:
.LBB7611:
	.loc 7 243 0
	movzwl	24(%ebx), %eax
.LVL448:
	sall	$16, %eax
	movzwl	20(%ebx), %edx
	orl	%edx, %eax
.LBB7612:
	.loc 7 244 0
	movl	$64, %edx
#APP
# 244 "src/clock.c" 1
	movw %dx, %ES
# 0 "" 2
# 244 "src/clock.c" 1
	movl %eax, %ES:108
# 0 "" 2
#NO_APP
.LBE7612:
.LBB7613:
	.loc 7 245 0
#APP
# 245 "src/clock.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	xorl	%eax, %eax
.LVL449:
#APP
# 245 "src/clock.c" 1
	movb %al, %ES:112
# 0 "" 2
#NO_APP
.LBE7613:
	.loc 7 247 0
	movb	$0, 29(%ebx)
	jmp	.L274
.L258:
.LBE7611:
.LBE7610:
.LBB7614:
.LBB7615:
	.loc 7 255 0
	call	rtc_updating.34605
	testl	%eax, %eax
	jne	.L255
.LBB7616:
.LBB7617:
.LBB7618:
	.loc 2 82 0
	movb	$-128, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7618:
.LBE7617:
.LBB7619:
.LBB7620:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $113, %al
# 0 "" 2
.LVL450:
#NO_APP
.LBE7620:
.LBE7619:
.LBE7616:
	.loc 7 260 0
	movb	%al, 21(%ebx)
.LBB7621:
.LBB7622:
.LBB7623:
	.loc 2 82 0
	movb	$-126, %al
.LVL451:
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7623:
.LBE7622:
.LBB7624:
.LBB7625:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $113, %al
# 0 "" 2
.LVL452:
#NO_APP
.LBE7625:
.LBE7624:
.LBE7621:
	.loc 7 261 0
	movb	%al, 24(%ebx)
.LBB7626:
.LBB7627:
.LBB7628:
	.loc 2 82 0
	movb	$-124, %al
.LVL453:
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7628:
.LBE7627:
.LBB7629:
.LBB7630:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $113, %al
# 0 "" 2
#NO_APP
	movb	%al, %dl
.LVL454:
.LBE7630:
.LBE7629:
.LBE7626:
	.loc 7 262 0
	movb	%al, 25(%ebx)
.LBB7631:
.LBB7632:
.LBB7633:
	.loc 2 82 0
	movb	$-117, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7633:
.LBE7632:
.LBB7634:
.LBB7635:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $113, %al
# 0 "" 2
#NO_APP
.LBE7635:
.LBE7634:
.LBE7631:
	.loc 7 263 0
	andl	$1, %eax
	movb	%al, 20(%ebx)
	jmp	.L276
.LVL455:
.L280:
.LBE7615:
.LBE7614:
.LBB7636:
.LBB7637:
	.loc 7 283 0
	call	rtc_updating.34605
	testl	%eax, %eax
	je	.L268
.LBB7638:
.LBB7639:
.LBB7640:
.LBB7641:
.LBB7642:
	.loc 2 82 0
	movb	$-118, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7642:
.LBE7641:
.LBB7643:
.LBB7644:
	movb	$38, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $113
# 0 "" 2
#NO_APP
.LBE7644:
.LBE7643:
.LBE7640:
.LBB7645:
.LBB7646:
.LBB7647:
	movb	$-117, %cl
	movb	%cl, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7647:
.LBE7646:
.LBB7648:
.LBB7649:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $113, %al
# 0 "" 2
#NO_APP
	movb	%al, %dl
.LBE7649:
.LBE7648:
.LBE7645:
.LBB7650:
.LBB7651:
.LBB7652:
	.loc 2 82 0
	movb	%cl, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7652:
.LBE7651:
.LBB7653:
.LBB7654:
	andl	$1, %edx
	orl	$2, %edx
	movb	%dl, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $113
# 0 "" 2
#NO_APP
.LBE7654:
.LBE7653:
.LBE7650:
.LBB7655:
.LBB7656:
.LBB7657:
	movb	$-116, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7657:
.LBE7656:
.LBB7658:
.LBB7659:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $113, %al
# 0 "" 2
.LVL456:
#NO_APP
.LBE7659:
.LBE7658:
.LBE7655:
.LBB7660:
.LBB7661:
.LBB7662:
	.loc 2 82 0
	movb	$-115, %al
.LVL457:
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7662:
.LBE7661:
.LBB7663:
.LBB7664:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $113, %al
# 0 "" 2
.LVL458:
#NO_APP
.L268:
.LBE7664:
.LBE7663:
.LBE7660:
.LBE7639:
.LBE7638:
.LBB7665:
.LBB7666:
.LBB7667:
	.loc 2 82 0
	movb	$-128, %al
.LVL459:
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7667:
.LBE7666:
.LBB7668:
.LBB7669:
	movb	21(%ebx), %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $113
# 0 "" 2
#NO_APP
.LBE7669:
.LBE7668:
.LBE7665:
.LBB7670:
.LBB7671:
.LBB7672:
	movb	$-126, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7672:
.LBE7671:
.LBB7673:
.LBB7674:
	movb	24(%ebx), %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $113
# 0 "" 2
#NO_APP
.LBE7674:
.LBE7673:
.LBE7670:
.LBB7675:
.LBB7676:
.LBB7677:
	movb	$-124, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7677:
.LBE7676:
.LBB7678:
.LBB7679:
	movb	25(%ebx), %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $113
# 0 "" 2
#NO_APP
.LBE7679:
.LBE7678:
.LBE7675:
.LBB7680:
.LBB7681:
.LBB7682:
	movb	$-117, %cl
	movb	%cl, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7682:
.LBE7681:
.LBB7683:
.LBB7684:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $113, %al
# 0 "" 2
#NO_APP
.LBE7684:
.LBE7683:
.LBE7680:
	.loc 7 292 0
	movb	20(%ebx), %dl
.LVL460:
	andl	$1, %edx
.LVL461:
	orl	$2, %edx
.LVL462:
	andl	$96, %eax
	orl	%eax, %edx
.LVL463:
	jmp	.L277
.LVL464:
.L260:
.LBE7637:
.LBE7636:
.LBB7685:
.LBB7686:
	.loc 7 303 0
	movb	$0, 29(%ebx)
	.loc 7 304 0
	call	rtc_updating.34605
	testl	%eax, %eax
	jne	.L255
.LBB7687:
.LBB7688:
.LBB7689:
	.loc 2 82 0
	movb	$-119, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7689:
.LBE7688:
.LBB7690:
.LBB7691:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $113, %al
# 0 "" 2
.LVL465:
#NO_APP
.LBE7691:
.LBE7690:
.LBE7687:
	.loc 7 308 0
	movb	%al, 24(%ebx)
.LBB7692:
.LBB7693:
.LBB7694:
	.loc 2 82 0
	movb	$-120, %al
.LVL466:
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7694:
.LBE7693:
.LBB7695:
.LBB7696:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $113, %al
# 0 "" 2
.LVL467:
#NO_APP
.LBE7696:
.LBE7695:
.LBE7692:
	.loc 7 309 0
	movb	%al, 21(%ebx)
.LBB7697:
.LBB7698:
.LBB7699:
	.loc 2 82 0
	movb	$-121, %al
.LVL468:
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7699:
.LBE7698:
.LBB7700:
.LBB7701:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $113, %al
# 0 "" 2
.LVL469:
#NO_APP
.LBE7701:
.LBE7700:
.LBE7697:
	.loc 7 310 0
	movb	%al, 20(%ebx)
.LBB7702:
.LBB7703:
.LBB7704:
	.loc 2 82 0
	movb	$-78, %al
.LVL470:
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7704:
.LBE7703:
.LBB7705:
.LBB7706:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $113, %al
# 0 "" 2
.LVL471:
#NO_APP
.LBE7706:
.LBE7705:
.LBE7702:
	.loc 7 317 0
	movb	%al, 25(%ebx)
	.loc 7 319 0
	movb	%al, 28(%ebx)
	jmp	.L274
.LVL472:
.L261:
.LBE7686:
.LBE7685:
.LBB7707:
.LBB7708:
	.loc 7 337 0
	call	rtc_updating.34605
	testl	%eax, %eax
	je	.L270
.LBB7709:
.LBB7710:
.LBB7711:
.LBB7712:
.LBB7713:
	.loc 2 82 0
	movb	$-118, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7713:
.LBE7712:
.LBB7714:
.LBB7715:
	movb	$38, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $113
# 0 "" 2
#NO_APP
.LBE7715:
.LBE7714:
.LBE7711:
.LBB7716:
.LBB7717:
.LBB7718:
	movb	$-117, %cl
	movb	%cl, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7718:
.LBE7717:
.LBB7719:
.LBB7720:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $113, %al
# 0 "" 2
#NO_APP
	movb	%al, %dl
.LBE7720:
.LBE7719:
.LBE7716:
.LBB7721:
.LBB7722:
.LBB7723:
	.loc 2 82 0
	movb	%cl, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7723:
.LBE7722:
.LBB7724:
.LBB7725:
	andl	$1, %edx
	orl	$2, %edx
	movb	%dl, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $113
# 0 "" 2
#NO_APP
.LBE7725:
.LBE7724:
.LBE7721:
.LBB7726:
.LBB7727:
.LBB7728:
	movb	$-116, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7728:
.LBE7727:
.LBB7729:
.LBB7730:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $113, %al
# 0 "" 2
.LVL473:
#NO_APP
.LBE7730:
.LBE7729:
.LBE7726:
.LBB7731:
.LBB7732:
.LBB7733:
	.loc 2 82 0
	movb	$-115, %al
.LVL474:
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7733:
.LBE7732:
.LBB7734:
.LBB7735:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $113, %al
# 0 "" 2
.LVL475:
#NO_APP
	jmp	.L255
.LVL476:
.L270:
.LBE7735:
.LBE7734:
.LBE7731:
.LBE7710:
.LBE7709:
.LBB7736:
.LBB7737:
.LBB7738:
	.loc 2 82 0
	movb	$-119, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7738:
.LBE7737:
.LBB7739:
.LBB7740:
	movb	24(%ebx), %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $113
# 0 "" 2
#NO_APP
.LBE7740:
.LBE7739:
.LBE7736:
.LBB7741:
.LBB7742:
.LBB7743:
	movb	$-120, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7743:
.LBE7742:
.LBB7744:
.LBB7745:
	movb	21(%ebx), %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $113
# 0 "" 2
#NO_APP
.LBE7745:
.LBE7744:
.LBE7741:
.LBB7746:
.LBB7747:
.LBB7748:
	movb	$-121, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7748:
.LBE7747:
.LBB7749:
.LBB7750:
	movb	20(%ebx), %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $113
# 0 "" 2
#NO_APP
.LBE7750:
.LBE7749:
.LBE7746:
.LBB7751:
.LBB7752:
.LBB7753:
	movb	$-78, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7753:
.LBE7752:
.LBB7754:
.LBB7755:
	movb	25(%ebx), %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $113
# 0 "" 2
#NO_APP
.LBE7755:
.LBE7754:
.LBE7751:
.LBB7756:
.LBB7757:
.LBB7758:
	movb	$-117, %cl
	movb	%cl, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7758:
.LBE7757:
.LBB7759:
.LBB7760:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $113, %al
# 0 "" 2
#NO_APP
	movb	%al, %dl
.LVL477:
.LBE7760:
.LBE7759:
.LBE7756:
	.loc 7 348 0
	andl	$127, %edx
.LVL478:
.L277:
.LBB7761:
.LBB7762:
.LBB7763:
	.loc 2 82 0
	movb	%cl, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7763:
.LBE7762:
.LBB7764:
.LBB7765:
	movb	%dl, %al
	jmp	.L275
.LVL479:
.L262:
.LBE7765:
.LBE7764:
.LBE7761:
.LBE7708:
.LBE7707:
.LBB7766:
.LBB7767:
.LBB7768:
.LBB7769:
.LBB7770:
	movb	$-117, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7770:
.LBE7769:
.LBB7771:
.LBB7772:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $113, %al
# 0 "" 2
#NO_APP
	movl	%eax, %esi
.LVL480:
.LBE7772:
.LBE7771:
.LBE7768:
	.loc 7 370 0
	movw	$0, 28(%ebx)
	.loc 7 371 0
	testb	$32, %al
	jne	.L255
.LVL481:
	.loc 7 376 0
	call	rtc_updating.34605
.LVL482:
	testl	%eax, %eax
	je	.L272
.LBB7773:
.LBB7774:
.LBB7775:
.LBB7776:
.LBB7777:
	.loc 2 82 0
	movb	$-118, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7777:
.LBE7776:
.LBB7778:
.LBB7779:
	movb	$38, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $113
# 0 "" 2
#NO_APP
.LBE7779:
.LBE7778:
.LBE7775:
.LBB7780:
.LBB7781:
.LBB7782:
	movb	$-117, %cl
	movb	%cl, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7782:
.LBE7781:
.LBB7783:
.LBB7784:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $113, %al
# 0 "" 2
#NO_APP
	movb	%al, %dl
.LBE7784:
.LBE7783:
.LBE7780:
.LBB7785:
.LBB7786:
.LBB7787:
	.loc 2 82 0
	movb	%cl, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7787:
.LBE7786:
.LBB7788:
.LBB7789:
	andl	$1, %edx
	orl	$2, %edx
	movb	%dl, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $113
# 0 "" 2
#NO_APP
.LBE7789:
.LBE7788:
.LBE7785:
.LBB7790:
.LBB7791:
.LBB7792:
	movb	$-116, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7792:
.LBE7791:
.LBB7793:
.LBB7794:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $113, %al
# 0 "" 2
.LVL483:
#NO_APP
.LBE7794:
.LBE7793:
.LBE7790:
.LBB7795:
.LBB7796:
.LBB7797:
	.loc 2 82 0
	movb	$-115, %al
.LVL484:
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7797:
.LBE7796:
.LBB7798:
.LBB7799:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $113, %al
# 0 "" 2
.LVL485:
#NO_APP
.L272:
.LBE7799:
.LBE7798:
.LBE7795:
.LBE7774:
.LBE7773:
.LBB7800:
.LBB7801:
.LBB7802:
	.loc 2 82 0
	movb	$-127, %al
.LVL486:
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7802:
.LBE7801:
.LBB7803:
.LBB7804:
	movb	21(%ebx), %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $113
# 0 "" 2
#NO_APP
.LBE7804:
.LBE7803:
.LBE7800:
.LBB7805:
.LBB7806:
.LBB7807:
	movb	$-125, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7807:
.LBE7806:
.LBB7808:
.LBB7809:
	movb	24(%ebx), %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $113
# 0 "" 2
#NO_APP
.LBE7809:
.LBE7808:
.LBE7805:
.LBB7810:
.LBB7811:
.LBB7812:
	movb	$-123, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7812:
.LBE7811:
.LBB7813:
.LBB7814:
	movb	25(%ebx), %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $113
# 0 "" 2
#NO_APP
.LBE7814:
.LBE7813:
.LBE7810:
.LBB7815:
.LBB7816:
.LBB7817:
	movb	$-117, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7817:
.LBE7816:
.LBB7818:
.LBB7819:
	movl	%esi, %eax
	andl	$95, %eax
	orl	$32, %eax
#APP
# 82 "src/ioport.h" 1
	outb %al, $113
# 0 "" 2
#NO_APP
	jmp	.L274
.LVL487:
.L263:
.LBE7819:
.LBE7818:
.LBE7815:
.LBE7767:
.LBE7766:
.LBB7820:
.LBB7821:
.LBB7822:
.LBB7823:
.LBB7824:
	movb	$-117, %cl
	movb	%cl, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7824:
.LBE7823:
.LBB7825:
.LBB7826:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $113, %al
# 0 "" 2
#NO_APP
	movb	%al, %dl
.LVL488:
.LBE7826:
.LBE7825:
.LBE7822:
.LBB7827:
.LBB7828:
.LBB7829:
	.loc 2 82 0
	movb	%cl, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE7829:
.LBE7828:
.LBB7830:
.LBB7831:
	movl	%edx, %eax
.LVL489:
	andl	$95, %eax
.LVL490:
.L275:
#APP
# 82 "src/ioport.h" 1
	outb %al, $113
# 0 "" 2
.LVL491:
#NO_APP
.L276:
.LBE7831:
.LBE7830:
.LBE7827:
	.loc 7 405 0
	movb	$0, 29(%ebx)
	.loc 7 406 0
	movb	%dl, 28(%ebx)
.LVL492:
.L274:
.LBB7832:
.LBB7833:
.LBB7834:
	.loc 14 62 0
	andw	$-2, 36(%ebx)
.LBE7834:
.LBE7833:
.LBE7832:
.LBE7821:
.LBE7820:
	.loc 7 430 0
	jmp	.L273
.LVL493:
.L281:
	.loc 7 431 0
	movl	%ebx, %eax
	.loc 7 434 0
	popl	%ebx
.LVL494:
	popl	%esi
	.loc 7 431 0
	jmp	handle_1ab1.1754
.LVL495:
.L255:
.LBB7835:
.LBB7836:
.LBB7837:
.LBB7838:
.LBB7839:
.LBB7840:
	.loc 14 60 0
	orw	$1, 36(%ebx)
.LVL496:
.L273:
.LBE7840:
.LBE7839:
.LBE7838:
.LBE7837:
.LBE7836:
.LBE7835:
	.loc 7 434 0
	popl	%ebx
.LVL497:
	popl	%esi
.LVL498:
	ret
	.cfi_endproc
.LFE1119:
	.size	handle_1a, .-handle_1a
	.section	.text.handle_hwpic1,"ax",@progbits
.globl handle_hwpic1
	.type	handle_hwpic1, @function
handle_hwpic1:
.LFB1189:
	.file 16 "src/pic.c"
	.loc 16 42 0
	.cfi_startproc
.LVL499:
.LBB7841:
.LBB7842:
.LBB7843:
	.loc 2 82 0
	movb	$32, %al
.LVL500:
#APP
# 82 "src/ioport.h" 1
	outb %al, $32
# 0 "" 2
#NO_APP
.LBE7843:
.LBE7842:
.LBE7841:
	.loc 16 45 0
	ret
	.cfi_endproc
.LFE1189:
	.size	handle_hwpic1, .-handle_hwpic1
	.section	.text.handle_hwpic2,"ax",@progbits
.globl handle_hwpic2
	.type	handle_hwpic2, @function
handle_hwpic2:
.LFB1190:
	.loc 16 49 0
	.cfi_startproc
.LVL501:
.LBB7844:
.LBB7845:
.LBB7846:
	.loc 2 82 0
	movb	$32, %al
.LVL502:
#APP
# 82 "src/ioport.h" 1
	outb %al, $160
# 0 "" 2
#NO_APP
.LBE7846:
.LBE7845:
.LBB7847:
.LBB7848:
.LBB7849:
#APP
# 82 "src/ioport.h" 1
	outb %al, $32
# 0 "" 2
#NO_APP
.LBE7849:
.LBE7848:
.LBE7847:
.LBE7844:
	.loc 16 52 0
	ret
	.cfi_endproc
.LFE1190:
	.size	handle_hwpic2, .-handle_hwpic2
	.section	.text.usb_init_hub_port.61715,"ax",@progbits
	.type	usb_init_hub_port.61715, @function
usb_init_hub_port.61715:
.LFB1976:
	.file 17 "src/usb.c"
	.loc 17 361 0
	.cfi_startproc
.LVL503:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	movl	%eax, %ebx
	.cfi_offset 3, -8
	.loc 17 366 0
	movl	(%eax), %ecx
	movl	20(%eax), %edx
	call	*(%ecx)
.LVL504:
	.loc 17 367 0
	testl	%eax, %eax
.LVL505:
	jne	.L287
.LBB7850:
.LBB7851:
	.file 18 "src/stacks.c"
	.loc 18 257 0
	call	__force_link_error__only_in_32bit_flat
.LVL506:
.L287:
.LBE7851:
.LBE7850:
	.loc 17 393 0
	decl	24(%ebx)
	.loc 17 399 0
	popl	%ebx
.LVL507:
	ret
	.cfi_endproc
.LFE1976:
	.size	usb_init_hub_port.61715, .-usb_init_hub_port.61715
	.section	.text.usb_poll_intr.60867,"ax",@progbits
	.type	usb_poll_intr.60867, @function
usb_poll_intr.60867:
.LFB1968:
	.loc 17 142 0
	.cfi_startproc
.LVL508:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	pushl	%edi
	.cfi_def_cfa_offset 12
	pushl	%esi
	.cfi_def_cfa_offset 16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	%eax, %ecx
	movl	%edx, 20(%esp)
.LBB7926:
	.loc 17 143 0
	leal	4(%eax), %eax
.LVL509:
	movl	%eax, %edx
.LVL510:
	shrl	$4, %edx
#APP
# 143 "src/usb.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB7927:
	andl	$15, %eax
#APP
# 143 "src/usb.c" 1
	movb %ES:(%eax), %al
# 0 "" 2
.LVL511:
#NO_APP
.LBE7927:
.LBE7926:
	cmpb	$2, %al
	je	.L291
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 5, -8
	cmpb	$3, %al
	je	.L292
.LBB7928:
.LBB7929:
.LBB7930:
	.file 19 "src/usb-uhci.c"
	.loc 19 581 0
	subl	$4, %ecx
.LVL512:
	movl	%ecx, %eax
.LVL513:
	shrl	$4, %eax
	movl	%eax, 4(%esp)
#APP
# 581 "src/usb-uhci.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB7931:
	andl	$15, %ecx
	movl	%ecx, 24(%esp)
#APP
# 581 "src/usb-uhci.c" 1
	movl %ES:(%ecx), %edx
# 0 "" 2
.LVL514:
#NO_APP
.LBE7931:
.LBE7930:
.LBB7932:
	.loc 19 582 0
	leal	4(%edx), %ebp
	movl	%ebp, %ecx
	shrl	$4, %ecx
	movl	%ecx, 8(%esp)
#APP
# 582 "src/usb-uhci.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB7933:
	andl	$15, %ebp
#APP
# 582 "src/usb-uhci.c" 1
	movl %ES:(%ebp), %ebx
# 0 "" 2
#NO_APP
	movl	%ebx, 12(%esp)
.LBE7933:
.LBE7932:
.LBB7934:
	.loc 19 583 0
	leal	8(%edx), %eax
	movl	%eax, %ecx
	shrl	$4, %ecx
#APP
# 583 "src/usb-uhci.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB7935:
	andl	$15, %eax
#APP
# 583 "src/usb-uhci.c" 1
	movl %ES:(%eax), %ecx
# 0 "" 2
.LVL515:
#NO_APP
.LBE7935:
.LBE7934:
	.loc 19 584 0
	andl	$8388608, %ebx
	jne	.L293
.LBB7936:
	.loc 19 590 0
	leal	12(%edx), %eax
	movl	%eax, %esi
	shrl	$4, %esi
#APP
# 590 "src/usb-uhci.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB7937:
	andl	$15, %eax
#APP
# 590 "src/usb-uhci.c" 1
	movl %ES:(%eax), %esi
# 0 "" 2
.LVL516:
#NO_APP
.LBE7937:
.LBE7936:
.LBB7938:
	.loc 19 591 0
#APP
# 591 "src/usb-uhci.c" 1
	movw %SS, %ax
# 0 "" 2
.LVL517:
#NO_APP
.LBE7938:
.LBB7939:
.LBB7940:
	.loc 6 185 0
#APP
# 185 "src/util.c" 1
	movw %ax, %ES
# 0 "" 2
	.loc 6 187 0
#NO_APP
	movl	%esi, %eax
.LVL518:
	shrl	$4, %eax
	movl	%eax, 16(%esp)
	shrl	$21, %ecx
.LVL519:
	incl	%ecx
	andl	$2047, %ecx
	andl	$15, %esi
.LVL520:
	movl	20(%esp), %edi
.LVL521:
#APP
# 187 "src/util.c" 1
	movw %ds, %bx
movw %ax, %ds
rep movsb (%si),%es:(%di)
movw %bx, %ds
# 0 "" 2
.LVL522:
#NO_APP
.LBE7940:
.LBE7939:
.LBB7941:
	.loc 19 596 0
	movl	%edx, %eax
	shrl	$4, %eax
#APP
# 596 "src/usb-uhci.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB7942:
	andl	$15, %edx
.LVL523:
#APP
# 596 "src/usb-uhci.c" 1
	movl %ES:(%edx), %eax
# 0 "" 2
#NO_APP
.LBE7942:
.LBE7941:
.LBB7943:
.LBB7944:
	.loc 19 597 0
#APP
# 597 "src/usb-uhci.c" 1
	movw 4(%esp), %ES
# 0 "" 2
#NO_APP
	andl	$-16, %eax
	movl	24(%esp), %edx
#APP
# 597 "src/usb-uhci.c" 1
	movl %eax, %ES:(%edx)
# 0 "" 2
#NO_APP
.LBE7944:
.LBE7943:
	.loc 19 598 0
.LBB7945:
.LBB7946:
	.loc 19 599 0
#APP
# 599 "src/usb-uhci.c" 1
	movw 8(%esp), %ES
# 0 "" 2
#NO_APP
	movl	12(%esp), %eax
	andl	$67108864, %eax
	orl	$8388608, %eax
#APP
# 599 "src/usb-uhci.c" 1
	movl %eax, %ES:(%ebp)
# 0 "" 2
#NO_APP
	jmp	.L297
.LVL524:
.L291:
.LBE7946:
.LBE7945:
.LBE7929:
.LBE7928:
.LBB7947:
.LBB7948:
.LBB7949:
	.file 20 "src/usb-ohci.c"
	.loc 20 487 0
	leal	20(%ecx), %eax
.LVL525:
	movl	%eax, %edx
	shrl	$4, %edx
#APP
# 487 "src/usb-ohci.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB7950:
	andl	$15, %eax
#APP
# 487 "src/usb-ohci.c" 1
	movl %ES:(%eax), %edi
# 0 "" 2
.LVL526:
#NO_APP
.LBE7950:
.LBE7949:
.LBB7951:
	.loc 20 488 0
	leal	-8(%ecx), %eax
	movl	%eax, %edx
	shrl	$4, %edx
#APP
# 488 "src/usb-ohci.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB7952:
	andl	$15, %eax
#APP
# 488 "src/usb-ohci.c" 1
	movl %ES:(%eax), %esi
# 0 "" 2
.LVL527:
#NO_APP
.LBE7952:
.LBE7951:
.LBB7953:
	.loc 20 489 0
	leal	-12(%ecx), %eax
	movl	%eax, %ebx
	shrl	$4, %ebx
	movl	%ebx, 12(%esp)
#APP
# 489 "src/usb-ohci.c" 1
	movw %bx, %ES
# 0 "" 2
#NO_APP
.LBB7954:
	andl	$15, %eax
	movl	%eax, 16(%esp)
#APP
# 489 "src/usb-ohci.c" 1
	movl %ES:(%eax), %ebx
# 0 "" 2
.LVL528:
#NO_APP
.LBE7954:
.LBE7953:
.LBB7955:
	.loc 20 490 0
	leal	16(%ecx), %eax
	movl	%eax, %edx
	shrl	$4, %edx
#APP
# 490 "src/usb-ohci.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB7956:
	andl	$15, %eax
#APP
# 490 "src/usb-ohci.c" 1
	movl %ES:(%eax), %edx
# 0 "" 2
.LVL529:
#NO_APP
.LBE7956:
.LBE7955:
	.loc 20 491 0
	movl	%ebx, %ebp
	subl	%edi, %ebp
	sarl	$4, %ebp
	movl	%ebp, 4(%esp)
	movl	%ebp, %eax
	incl	%eax
	movl	%edx, %ebp
	cltd
.LVL530:
	idivl	%ebp
	.loc 20 492 0
	movl	%edx, %eax
	sall	$4, %eax
	leal	(%edi,%eax), %eax
	movl	%eax, 8(%esp)
	.loc 20 493 0
	orl	$-1, %eax
	cmpl	%esi, 8(%esp)
	je	.L294
.LBB7957:
	.loc 20 499 0
	leal	8(%ecx), %eax
	movl	%eax, %esi
.LVL531:
	shrl	$4, %esi
#APP
# 499 "src/usb-ohci.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB7958:
	andl	$15, %eax
#APP
# 499 "src/usb-ohci.c" 1
	movw %ES:(%eax), %bp
# 0 "" 2
.LVL532:
#NO_APP
.LBE7958:
.LBE7957:
	movzwl	%bp, %ebp
.LVL533:
.LBB7959:
	.loc 20 500 0
	addl	$12, %ecx
.LVL534:
	movl	%ecx, %eax
	shrl	$4, %eax
#APP
# 500 "src/usb-ohci.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB7960:
	andl	$15, %ecx
#APP
# 500 "src/usb-ohci.c" 1
	movl %ES:(%ecx), %eax
# 0 "" 2
#NO_APP
	movl	%eax, 24(%esp)
.LBE7960:
.LBE7959:
	.loc 20 503 0
	movl	%ebp, %esi
	imull	%edx, %esi
	addl	%eax, %esi
.LBB7961:
	.loc 20 502 0
#APP
# 502 "src/usb-ohci.c" 1
	movw %SS, %ax
# 0 "" 2
.LVL535:
#NO_APP
.LBE7961:
.LBB7962:
.LBB7963:
	.loc 6 185 0
#APP
# 185 "src/util.c" 1
	movw %ax, %ES
# 0 "" 2
	.loc 6 187 0
#NO_APP
	movl	%esi, %eax
.LVL536:
	shrl	$4, %eax
	andl	$15, %esi
	movl	%ebp, %ecx
.LVL537:
	movl	20(%esp), %edi
.LVL538:
#APP
# 187 "src/util.c" 1
	movw %ds, %dx
movw %ax, %ds
rep movsb (%si),%es:(%di)
movw %dx, %ds
# 0 "" 2
.LVL539:
#NO_APP
.LBE7963:
.LBE7962:
.LBB7964:
.LBB7965:
	.loc 20 507 0
	movl	%ebx, %eax
	shrl	$4, %eax
#APP
# 507 "src/usb-ohci.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
	movl	%ebx, %eax
	andl	$15, %eax
	movl	$-267386880, %edx
#APP
# 507 "src/usb-ohci.c" 1
	movl %edx, %ES:(%eax)
# 0 "" 2
#NO_APP
.LBE7965:
.LBE7964:
.LBB7966:
.LBB7967:
	.loc 20 509 0
	movl	4(%esp), %eax
	imull	%ebp, %eax
	addl	24(%esp), %eax
.LVL540:
	leal	4(%ebx), %edx
	movl	%edx, %ecx
.LVL541:
	shrl	$4, %ecx
#APP
# 509 "src/usb-ohci.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
	andl	$15, %edx
#APP
# 509 "src/usb-ohci.c" 1
	movl %eax, %ES:(%edx)
# 0 "" 2
#NO_APP
.LBE7967:
.LBE7966:
.LBB7968:
.LBB7969:
	.loc 20 510 0
	leal	8(%ebx), %edx
	movl	%edx, %ecx
	shrl	$4, %ecx
#APP
# 510 "src/usb-ohci.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
	andl	$15, %edx
	movl	8(%esp), %ecx
#APP
# 510 "src/usb-ohci.c" 1
	movl %ecx, %ES:(%edx)
# 0 "" 2
#NO_APP
.LBE7969:
.LBE7968:
.LBB7970:
.LBB7971:
	.loc 20 511 0
	addl	$12, %ebx
.LVL542:
	movl	%ebx, %edx
	shrl	$4, %edx
#APP
# 511 "src/usb-ohci.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	andl	$15, %ebx
	leal	-1(%ebp,%eax), %eax
.LVL543:
#APP
# 511 "src/usb-ohci.c" 1
	movl %eax, %ES:(%ebx)
# 0 "" 2
#NO_APP
.LBE7971:
.LBE7970:
	.loc 20 512 0
.LBB7972:
.LBB7973:
	.loc 20 513 0
#APP
# 513 "src/usb-ohci.c" 1
	movw 12(%esp), %ES
# 0 "" 2
#NO_APP
	movl	16(%esp), %ebx
#APP
# 513 "src/usb-ohci.c" 1
	movl %ecx, %ES:(%ebx)
# 0 "" 2
.LVL544:
#NO_APP
.L297:
	xorl	%eax, %eax
	jmp	.L294
.LVL545:
.L292:
.LBE7973:
.LBE7972:
.LBE7948:
.LBE7947:
.LBB7974:
.LBB7975:
.LBB7976:
	.file 21 "src/usb-ehci.c"
	.loc 21 735 0
	leal	-12(%ecx), %ebp
	movl	%ebp, %eax
.LVL546:
	shrl	$4, %eax
	movl	%eax, 8(%esp)
#APP
# 735 "src/usb-ehci.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB7977:
	andl	$15, %ebp
	movl	%ebp, (%esp)
#APP
# 735 "src/usb-ehci.c" 1
	movl %ES:(%ebp), %edx
# 0 "" 2
.LVL547:
#NO_APP
.LBE7977:
.LBE7976:
.LBB7978:
	.loc 21 736 0
	leal	8(%edx), %eax
	movl	%eax, %ebx
	shrl	$4, %ebx
	movl	%ebx, 12(%esp)
#APP
# 736 "src/usb-ehci.c" 1
	movw %bx, %ES
# 0 "" 2
#NO_APP
.LBB7979:
	andl	$15, %eax
	movl	%eax, 16(%esp)
#APP
# 736 "src/usb-ehci.c" 1
	movl %ES:(%eax), %eax
# 0 "" 2
.LVL548:
#NO_APP
.LBE7979:
.LBE7978:
	.loc 21 737 0
	testb	%al, %al
	js	.L293
.LBB7980:
	.loc 21 743 0
	leal	8(%ecx), %eax
.LVL549:
	movl	%eax, %ebx
	shrl	$4, %ebx
#APP
# 743 "src/usb-ehci.c" 1
	movw %bx, %ES
# 0 "" 2
#NO_APP
.LBB7981:
	andl	$15, %eax
#APP
# 743 "src/usb-ehci.c" 1
	movw %ES:(%eax), %ax
# 0 "" 2
.LVL550:
#NO_APP
.LBE7981:
.LBE7980:
	movzwl	%ax, %eax
.LVL551:
	movl	%eax, 4(%esp)
.LBB7982:
	.loc 21 744 0
	leal	-8(%ecx), %eax
	movl	%eax, %ebx
	shrl	$4, %ebx
#APP
# 744 "src/usb-ehci.c" 1
	movw %bx, %ES
# 0 "" 2
#NO_APP
.LBB7983:
	andl	$15, %eax
#APP
# 744 "src/usb-ehci.c" 1
	movl %ES:(%eax), %eax
# 0 "" 2
.LVL552:
#NO_APP
.LBE7983:
.LBE7982:
.LBB7984:
	.loc 21 745 0
	subl	$4, %ecx
.LVL553:
	movl	%ecx, %ebx
	shrl	$4, %ebx
#APP
# 745 "src/usb-ehci.c" 1
	movw %bx, %ES
# 0 "" 2
#NO_APP
.LBB7985:
	andl	$15, %ecx
#APP
# 745 "src/usb-ehci.c" 1
	movl %ES:(%ecx), %ecx
# 0 "" 2
.LVL554:
#NO_APP
.LBE7985:
.LBE7984:
	.loc 21 747 0
	movl	%edx, %ebx
	subl	%eax, %ebx
	sarl	$5, %ebx
	imull	4(%esp), %ebx
	leal	(%ecx,%ebx), %ebx
.LBB7986:
	.loc 21 746 0
#APP
# 746 "src/usb-ehci.c" 1
	movw %SS, %ax
# 0 "" 2
.LVL555:
#NO_APP
.LBE7986:
.LBB7987:
.LBB7988:
	.loc 6 185 0
#APP
# 185 "src/util.c" 1
	movw %ax, %ES
# 0 "" 2
	.loc 6 187 0
#NO_APP
	movl	%ebx, %ebp
	shrl	$4, %ebp
	movl	%ebp, 24(%esp)
	movl	%ebx, %esi
	andl	$15, %esi
	movl	4(%esp), %ecx
.LVL556:
	movl	20(%esp), %edi
.LVL557:
#APP
# 187 "src/util.c" 1
	movw %ds, %ax
movw %bp, %ds
rep movsb (%si),%es:(%di)
movw %ax, %ds
# 0 "" 2
.LVL558:
#NO_APP
.LBE7988:
.LBE7987:
.LBB7989:
	.loc 21 751 0
	movl	%edx, %eax
	shrl	$4, %eax
#APP
# 751 "src/usb-ehci.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB7990:
	movl	%edx, %eax
	andl	$15, %eax
#APP
# 751 "src/usb-ehci.c" 1
	movl %ES:(%eax), %eax
# 0 "" 2
#NO_APP
.LBE7990:
.LBE7989:
.LBB7991:
.LBB7992:
	.loc 21 752 0
#APP
# 752 "src/usb-ehci.c" 1
	movw 8(%esp), %ES
# 0 "" 2
#NO_APP
	andl	$-32, %eax
	movl	(%esp), %ecx
.LVL559:
#APP
# 752 "src/usb-ehci.c" 1
	movl %eax, %ES:(%ecx)
# 0 "" 2
#NO_APP
.LBE7992:
.LBE7991:
.LBB7993:
.LBB7994:
	.loc 21 753 0
	addl	$12, %edx
.LVL560:
	movl	%edx, %eax
	shrl	$4, %eax
#APP
# 753 "src/usb-ehci.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
	andl	$15, %edx
#APP
# 753 "src/usb-ehci.c" 1
	movl %ebx, %ES:(%edx)
# 0 "" 2
#NO_APP
.LBE7994:
.LBE7993:
	.loc 21 754 0
.LBB7995:
.LBB7996:
	.loc 21 755 0
#APP
# 755 "src/usb-ehci.c" 1
	movw 12(%esp), %ES
# 0 "" 2
#NO_APP
	movl	4(%esp), %eax
	sall	$16, %eax
	andl	$2147418112, %eax
	orl	$3456, %eax
	movl	16(%esp), %ebx
#APP
# 755 "src/usb-ehci.c" 1
	movl %eax, %ES:(%ebx)
# 0 "" 2
#NO_APP
	jmp	.L297
.LVL561:
.L293:
	orl	$-1, %eax
.LVL562:
.L294:
.LBE7996:
.LBE7995:
.LBE7975:
.LBE7974:
	.loc 17 152 0
	addl	$28, %esp
	popl	%ebx
.LVL563:
	popl	%esi
.LVL564:
	popl	%edi
.LVL565:
	popl	%ebp
.LVL566:
	ret
	.cfi_endproc
.LFE1968:
	.size	usb_poll_intr.60867, .-usb_poll_intr.60867
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Standby"
.LC1:
	.string	"Suspend"
.LC2:
	.string	"Shutdown"
	.section	.text.handle_1553.1752,"ax",@progbits
	.type	handle_1553.1752, @function
handle_1553.1752:
.LFB2646:
	.file 22 "src/apm.c"
	.loc 22 194 0
	.cfi_startproc
.LVL567:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	movl	%eax, %ecx
	.loc 22 201 0
	movb	28(%eax), %al
.LVL568:
	cmpb	$6, %al
	je	.L330
	.cfi_offset 3, -8
	ja	.L314
	cmpb	$2, %al
	je	.L302
	ja	.L315
	testb	%al, %al
	je	.L300
	decb	%al
	jne	.L299
	jmp	.L330
.L315:
	cmpb	$4, %al
	je	.L330
	ja	.L305
	jmp	.L335
.L314:
	cmpb	$11, %al
	je	.L310
	ja	.L316
	cmpb	$8, %al
	je	.L330
	jb	.L307
	cmpb	$10, %al
	jne	.L299
	jmp	.L336
.L316:
	cmpb	$15, %al
	je	.L330
	cmpb	$16, %al
	je	.L313
	cmpb	$14, %al
	jne	.L299
	jmp	.L337
.L300:
.LBB7997:
.LBB7998:
	.loc 22 38 0
	movb	$1, 29(%ecx)
	.loc 22 39 0
	movb	$2, 28(%ecx)
	.loc 22 40 0
	movb	$80, 17(%ecx)
	.loc 22 41 0
	movb	$77, 16(%ecx)
	.loc 22 44 0
	movw	$3, 24(%ecx)
	jmp	.L330
.L302:
.LBE7998:
.LBE7997:
.LBB7999:
.LBB8000:
	.loc 22 63 0
	movl	$apm16protected_entry, %eax
	movw	%ax, 16(%ecx)
	.loc 22 64 0
	movw	$-4096, 28(%ecx)
	.loc 22 65 0
	movw	$-16, 8(%ecx)
	.loc 22 66 0
	movw	$-4096, 24(%ecx)
	jmp	.L331
.L335:
.LBE8000:
.LBE7999:
.LBB8001:
.LBB8002:
	.loc 22 75 0
	movw	$-4096, 28(%ecx)
	.loc 22 76 0
	movl	$apm32protected_entry, 16(%ecx)
	.loc 22 77 0
	movw	$-4096, 24(%ecx)
	.loc 22 80 0
	movl	$-983056, 8(%ecx)
	.loc 22 81 0
	movw	$-4096, 20(%ecx)
.L331:
	.loc 22 82 0
	movw	$-16, 4(%ecx)
	jmp	.L330
.L305:
.LBE8002:
.LBE8001:
.LBB8003:
.LBB8004:
.LBB8005:
	.loc 8 42 0
#APP
# 42 "src/util.h" 1
	sti ; hlt ; cli ; cld
# 0 "" 2
#NO_APP
	jmp	.L330
.L307:
.LBE8005:
.LBE8004:
.LBE8003:
.LBB8006:
.LBB8007:
	.loc 22 112 0
	cmpw	$1, 16(%ecx)
	jne	.L330
	.loc 22 116 0
	movw	24(%ecx), %ax
	cmpw	$2, %ax
	je	.L321
	cmpw	$3, %ax
	je	.L322
	decw	%ax
	jne	.L330
.LBB8008:
.LBB8009:
	.loc 22 24 0
	movl	$.LC0, %ebx
.LVL569:
.LBB8010:
.LBB8011:
.LBB8012:
	.loc 2 82 0
	movl	$-30464, %edx
.LVL570:
.L323:
.LBE8012:
.LBE8011:
.LBB8014:
	.loc 22 26 0
#APP
# 26 "src/apm.c" 1
	movb %CS:(%ebx), %al
# 0 "" 2
#NO_APP
.LBE8014:
	.loc 22 27 0
	testb	%al, %al
	je	.L330
.LBB8015:
.LBB8013:
	.loc 2 82 0
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE8013:
.LBE8015:
	.loc 22 30 0
	incl	%ebx
	jmp	.L323
.LVL571:
.L321:
.LBE8010:
.LBE8009:
.LBE8008:
.LBB8016:
.LBB8017:
	.loc 22 24 0
	movl	$.LC1, %ebx
.LVL572:
.LBB8018:
.LBB8019:
.LBB8020:
	.loc 2 82 0
	movl	$-30464, %edx
.LVL573:
.L324:
.LBE8020:
.LBE8019:
.LBB8022:
	.loc 22 26 0
#APP
# 26 "src/apm.c" 1
	movb %CS:(%ebx), %al
# 0 "" 2
#NO_APP
.LBE8022:
	.loc 22 27 0
	testb	%al, %al
	je	.L330
.LBB8023:
.LBB8021:
	.loc 2 82 0
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE8021:
.LBE8023:
	.loc 22 30 0
	incl	%ebx
	jmp	.L324
.LVL574:
.L322:
.LBE8018:
.LBE8017:
.LBE8016:
.LBB8024:
.LBB8025:
	.loc 8 13 0
#APP
# 13 "src/util.h" 1
	cli
# 0 "" 2
#NO_APP
.LBE8025:
.LBE8024:
.LBB8026:
.LBB8027:
	.loc 22 24 0
	movl	$.LC2, %ecx
.LVL575:
.LBB8028:
.LBB8029:
.LBB8030:
	.loc 2 82 0
	movl	$-30464, %edx
.LVL576:
.L326:
.LBE8030:
.LBE8029:
.LBB8032:
	.loc 22 26 0
#APP
# 26 "src/apm.c" 1
	movb %CS:(%ecx), %al
# 0 "" 2
#NO_APP
.LBE8032:
	.loc 22 27 0
	testb	%al, %al
	je	.L328
.LBB8033:
.LBB8031:
	.loc 2 82 0
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE8031:
.LBE8033:
	.loc 22 30 0
	incl	%ecx
	jmp	.L326
.L328:
.LBE8028:
.LBE8027:
.LBE8026:
.LBB8034:
.LBB8035:
	.loc 8 52 0
#APP
# 52 "src/util.h" 1
	hlt
# 0 "" 2
#NO_APP
	jmp	.L328
.LVL577:
.L336:
.LBE8035:
.LBE8034:
.LBE8007:
.LBE8006:
.LBB8036:
.LBB8037:
	.loc 22 143 0
	movb	$1, 17(%ecx)
	.loc 22 144 0
	movb	$-1, 16(%ecx)
	.loc 22 145 0
	movb	$-128, 25(%ecx)
	.loc 22 146 0
	movb	$-1, 24(%ecx)
	.loc 22 147 0
	movw	$-1, 20(%ecx)
	.loc 22 148 0
	movw	$0, 8(%ecx)
	jmp	.L330
.L310:
.LBE8037:
.LBE8036:
.LBB8038:
.LBB8039:
.LBB8040:
	.loc 14 90 0
	movb	$-128, 29(%ecx)
	jmp	.L299
.L337:
.LBE8040:
.LBE8039:
.LBE8038:
.LBB8041:
.LBB8042:
	.loc 22 165 0
	movb	$1, 29(%ecx)
	.loc 22 166 0
	movb	$2, 28(%ecx)
	jmp	.L330
.L313:
.LBE8042:
.LBE8041:
.LBB8043:
.LBB8044:
	.loc 22 181 0
	movb	$0, 16(%ecx)
	.loc 22 182 0
	movw	$0, 24(%ecx)
.LVL578:
.L330:
.LBB8045:
.LBB8046:
.LBB8047:
	.loc 14 62 0
	andw	$-2, 36(%ecx)
.LBE8047:
.LBE8046:
.LBE8045:
.LBE8044:
.LBE8043:
	.loc 22 215 0
	jmp	.L327
.LVL579:
.L299:
.LBB8048:
.LBB8049:
.LBB8050:
.LBB8051:
.LBB8052:
.LBB8053:
	.loc 14 60 0
	orw	$1, 36(%ecx)
.LVL580:
.L327:
.LBE8053:
.LBE8052:
.LBE8051:
.LBE8050:
.LBE8049:
.LBE8048:
	.loc 22 218 0
	popl	%ebx
.LVL581:
	ret
	.cfi_endproc
.LFE2646:
	.size	handle_1553.1752, .-handle_1553.1752
	.section	.text.basic_access.80083,"ax",@progbits
	.type	basic_access.80083, @function
basic_access.80083:
.LFB2523:
	.file 23 "src/disk.c"
	.loc 23 81 0
	.cfi_startproc
.LVL582:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	movl	%esp, %ebp
	.cfi_offset 5, -8
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$44, %esp
	movl	%eax, -56(%ebp)
	.loc 23 86 0
	movl	%eax, %ebx
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	movb	28(%eax), %al
.LVL583:
	.loc 23 87 0
	movzbl	25(%ebx), %esi
	movzbl	24(%ebx), %edi
	.loc 23 89 0
	movb	21(%ebx), %bl
	movb	%bl, -35(%ebp)
	.loc 23 91 0
	movl	%edi, %ebx
	andw	$63, %bx
	movw	%bx, -34(%ebp)
	je	.L354
	movb	%al, %bl
	decb	%bl
	jns	.L339
.L354:
.LBB8054:
.LBB8055:
	.loc 23 26 0
	movl	-56(%ebp), %esi
	cmpb	$0, 20(%esi)
	js	.L341
.LBB8056:
	.loc 23 27 0
	movl	$64, %eax
.LVL584:
#APP
# 27 "src/disk.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
	movb	$1, %al
#APP
# 27 "src/disk.c" 1
	movb %al, %ES:65
# 0 "" 2
#NO_APP
	jmp	.L342
.LVL585:
.L341:
.LBE8056:
.LBB8057:
	.loc 23 29 0
	movl	$64, %eax
.LVL586:
#APP
# 29 "src/disk.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
	movb	$1, %al
#APP
# 29 "src/disk.c" 1
	movb %al, %ES:116
# 0 "" 2
#NO_APP
.L342:
.LBE8057:
.LBB8058:
.LBB8059:
.LBB8060:
.LBB8061:
	.loc 14 90 0
	movl	-56(%ebp), %edi
	movb	$1, 29(%edi)
.LBB8062:
.LBB8063:
	.loc 14 60 0
	orw	$1, 36(%edi)
	jmp	.L353
.LVL587:
.L339:
.LBE8063:
.LBE8062:
.LBE8061:
.LBE8060:
.LBE8059:
.LBE8058:
.LBE8055:
.LBE8054:
	.loc 23 83 0
	movl	%edx, -20(%ebp)
	.loc 23 84 0
	movb	%cl, -14(%ebp)
	.loc 23 96 0
	movzbl	%al, %eax
.LVL588:
	movw	%ax, -16(%ebp)
.LBB8064:
.LBB8065:
.LBB8066:
	.loc 23 62 0
#APP
# 62 "src/disk.c" 1
	movl %CS:cdemu_drive_gf, %eax
# 0 "" 2
.LVL589:
#NO_APP
.LBE8066:
	.loc 23 61 0
	subl	$983040, %eax
.LVL590:
	cmpl	%eax, %edx
	jne	.L344
.LBB8067:
.LBB8068:
.LBB8069:
	.loc 10 249 0
	movl	$64, %eax
#APP
# 249 "src/biosvar.h" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB8070:
#APP
# 249 "src/biosvar.h" 1
	movw %ES:14, %dx
# 0 "" 2
.LVL591:
#NO_APP
.LBE8070:
.LBE8069:
.LBE8068:
	.loc 23 68 0
#APP
# 68 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB8071:
#APP
# 68 "src/disk.c" 1
	movw %ES:322, %cx
# 0 "" 2
.LVL592:
#NO_APP
.LBE8071:
	.loc 23 69 0
#APP
# 69 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB8072:
#APP
# 69 "src/disk.c" 1
	movw %ES:320, %ax
# 0 "" 2
.LVL593:
#NO_APP
.LBE8072:
	.loc 23 70 0
#APP
# 70 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB8073:
#APP
# 70 "src/disk.c" 1
	movw %ES:324, %dx
# 0 "" 2
.LVL594:
#NO_APP
	jmp	.L345
.LVL595:
.L344:
.LBE8073:
.LBE8067:
.LBB8074:
	.loc 23 73 0
#APP
# 73 "src/disk.c" 1
	movw %CS:4(%edx), %cx
# 0 "" 2
.LVL596:
#NO_APP
.LBE8074:
.LBB8075:
	.loc 23 74 0
#APP
# 74 "src/disk.c" 1
	movw %CS:2(%edx), %ax
# 0 "" 2
.LVL597:
#NO_APP
.LBE8075:
.LBB8076:
	.loc 23 75 0
#APP
# 75 "src/disk.c" 1
	movw %CS:6(%edx), %dx
# 0 "" 2
.LVL598:
#NO_APP
.L345:
.LBE8076:
.LBE8065:
.LBE8064:
	.loc 23 87 0
	leal	0(,%edi,4), %ebx
.LVL599:
	andw	$768, %bx
.LVL600:
	andw	$255, %si
	orl	%esi, %ebx
.LVL601:
	.loc 23 102 0
	cmpw	%cx, %bx
	jae	.L346
	.loc 23 89 0
	movzbl	-35(%ebp), %ecx
.LVL602:
	.loc 23 102 0
	cmpw	%ax, %cx
	jae	.L346
	cmpw	%dx, -34(%ebp)
	jbe	.L347
.LVL603:
.L346:
.LBB8077:
.LBB8078:
	.loc 23 26 0
	movl	-56(%ebp), %eax
.LVL604:
	cmpb	$0, 20(%eax)
	js	.L348
.LBB8079:
	.loc 23 27 0
	movl	$64, %eax
#APP
# 27 "src/disk.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
	movb	$1, %al
#APP
# 27 "src/disk.c" 1
	movb %al, %ES:65
# 0 "" 2
#NO_APP
	jmp	.L349
.L348:
.LBE8079:
.LBB8080:
	.loc 23 29 0
	movl	$64, %eax
#APP
# 29 "src/disk.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
	movb	$1, %al
#APP
# 29 "src/disk.c" 1
	movb %al, %ES:116
# 0 "" 2
#NO_APP
.L349:
.LBE8080:
.LBB8081:
.LBB8082:
.LBB8083:
.LBB8084:
	.loc 14 90 0
	movl	-56(%ebp), %edx
.LVL605:
	movb	$1, 29(%edx)
.LBB8085:
.LBB8086:
	.loc 14 60 0
	orw	$1, 36(%edx)
	jmp	.L353
.LVL606:
.L347:
.LBE8086:
.LBE8085:
.LBE8084:
.LBE8083:
.LBE8082:
.LBE8081:
.LBE8078:
.LBE8077:
	.loc 23 109 0
	movzwl	-34(%ebp), %esi
.LVL607:
	movzwl	%ax, %eax
.LVL608:
	movzwl	%bx, %ebx
.LVL609:
	imull	%ebx, %eax
	movzwl	%cx, %ecx
.LVL610:
	leal	(%eax,%ecx), %ecx
.LVL611:
	movzwl	%dx, %edx
.LVL612:
	imull	%edx, %ecx
	leal	-1(%esi,%ecx), %eax
	movl	%eax, -32(%ebp)
	movl	$0, -28(%ebp)
	.loc 23 112 0
	movl	-56(%ebp), %ecx
	movzwl	2(%ecx), %eax
	sall	$4, %eax
	movzwl	16(%ecx), %edx
.LVL613:
	addl	%edx, %eax
	movl	%eax, -24(%ebp)
.LBB8087:
.LBB8088:
	.file 24 "src/block.c"
	.loc 24 327 0
#APP
# 327 "src/block.c" 1
	movw %SS, %dx
# 0 "" 2
.LVL614:
#NO_APP
.LBE8088:
.LBB8089:
.LBB8090:
.LBB8091:
.LBB8092:
	.loc 10 249 0
	movl	$64, %ebx
.LVL615:
#APP
# 249 "src/biosvar.h" 1
	movw %bx, %ES
# 0 "" 2
#NO_APP
.LBB8093:
#APP
# 249 "src/biosvar.h" 1
	movw %ES:14, %si
# 0 "" 2
.LVL616:
#NO_APP
	movw	%si, -34(%ebp)
.LBE8093:
.LBE8092:
.LBE8091:
	.loc 18 92 0
	leal	-32(%ebp), %eax
	movzwl	%dx, %edx
.LVL617:
	movl	%eax, -52(%ebp)
	movl	%edx, -44(%ebp)
	movl	$__send_disk_op.14761, -48(%ebp)
	movl	$__send_disk_op.14761, %ecx
#APP
# 92 "src/stacks.c" 1
	movw %ss, %bx
movl %esp, %edi
movw %si, %ds
movw %si, %ss
movl $872, %esp
calll *%ecx
movw %bx, %ds
movw %bx, %ss
movl %edi, %esp
# 0 "" 2
.LVL618:
#NO_APP
	movl	%eax, -52(%ebp)
.LBE8090:
.LBE8089:
.LBE8087:
	.loc 23 116 0
	movl	-16(%ebp), %edx
.LVL619:
	movl	-56(%ebp), %eax
	movb	%dl, 28(%eax)
.LBB8094:
.LBB8095:
	.loc 23 25 0
	movb	-52(%ebp), %al
.LVL620:
	.loc 23 26 0
	movl	-56(%ebp), %edx
	cmpb	$0, 20(%edx)
	js	.L350
.LBB8096:
	.loc 23 27 0
	movl	$64, %ecx
#APP
# 27 "src/disk.c" 1
	movw %cx, %ES
# 0 "" 2
# 27 "src/disk.c" 1
	movb %al, %ES:65
# 0 "" 2
#NO_APP
	jmp	.L351
.L350:
.LBE8096:
.LBB8097:
	.loc 23 29 0
	movl	$64, %ebx
#APP
# 29 "src/disk.c" 1
	movw %bx, %ES
# 0 "" 2
# 29 "src/disk.c" 1
	movb %al, %ES:116
# 0 "" 2
#NO_APP
.L351:
.LBE8097:
	.loc 23 30 0
	testb	%al, %al
	je	.L352
.LBB8098:
.LBB8099:
.LBB8100:
.LBB8101:
	.loc 14 90 0
	movl	-56(%ebp), %esi
	movb	%al, 29(%esi)
.LBB8102:
.LBB8103:
	.loc 14 60 0
	orw	$1, 36(%esi)
	jmp	.L353
.L352:
.LBE8103:
.LBE8102:
.LBE8101:
.LBE8100:
.LBE8099:
.LBE8098:
.LBB8104:
.LBB8105:
	.loc 14 77 0
	movl	-56(%ebp), %edi
	movb	$0, 29(%edi)
.LBB8106:
.LBB8107:
	.loc 14 62 0
	andw	$-2, 36(%edi)
.LVL621:
.L353:
.LBE8107:
.LBE8106:
.LBE8105:
.LBE8104:
.LBE8095:
.LBE8094:
	.loc 23 119 0
	addl	$44, %esp
	popl	%ebx
.LVL622:
	popl	%esi
	popl	%edi
	leave
	ret
	.cfi_endproc
.LFE2523:
	.size	basic_access.80083, .-basic_access.80083
	.section	.text.extended_access.80147,"ax",@progbits
	.type	extended_access.80147, @function
extended_access.80147:
.LFB2524:
	.loc 23 124 0
	.cfi_startproc
.LVL623:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	movl	%esp, %ebp
	.cfi_offset 5, -8
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$44, %esp
	movl	%eax, -56(%ebp)
	movw	%cx, -40(%ebp)
	.loc 23 127 0
	movw	(%eax), %ax
.LVL624:
	movw	%ax, -38(%ebp)
#APP
# 127 "src/disk.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB8108:
.LBB8109:
	movl	-56(%ebp), %ecx
.LVL625:
	movzwl	8(%ecx), %eax
#APP
# 127 "src/disk.c" 1
	movl %ES:8(%eax), %ebx
# 0 "" 2
# 127 "src/disk.c" 1
	movl %ES:12(%eax), %ecx
# 0 "" 2
#NO_APP
.LBE8109:
.LBE8108:
.LBB8110:
.LBB8111:
	.loc 23 130 0
#APP
# 130 "src/disk.c" 1
	movl %CS:8(%edx), %edi
# 0 "" 2
# 130 "src/disk.c" 1
	movl %CS:12(%edx), %esi
# 0 "" 2
#NO_APP
.LBE8111:
.LBE8110:
	cmpl	%esi, %ecx
	jb	.L356
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	ja	.L365
	cmpl	%edi, %ebx
	jb	.L356
.L365:
.LBB8112:
.LBB8113:
	.loc 23 26 0
	movl	-56(%ebp), %ebx
	cmpb	$0, 20(%ebx)
	js	.L358
.LBB8114:
	.loc 23 27 0
	movl	$64, %eax
#APP
# 27 "src/disk.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
	movb	$1, %al
#APP
# 27 "src/disk.c" 1
	movb %al, %ES:65
# 0 "" 2
#NO_APP
	jmp	.L359
.L358:
.LBE8114:
.LBB8115:
	.loc 23 29 0
	movl	$64, %eax
#APP
# 29 "src/disk.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
	movb	$1, %al
#APP
# 29 "src/disk.c" 1
	movb %al, %ES:116
# 0 "" 2
#NO_APP
.L359:
.LBE8115:
.LBB8116:
.LBB8117:
.LBB8118:
.LBB8119:
	.loc 14 90 0
	movl	-56(%ebp), %esi
	movb	$1, 29(%esi)
	jmp	.L366
.L356:
.LBE8119:
.LBE8118:
.LBE8117:
.LBE8116:
.LBE8113:
.LBE8112:
	.loc 23 136 0
#APP
# 136 "src/disk.c" 1
	movw -38(%ebp), %ES
# 0 "" 2
#NO_APP
.LBB8120:
#APP
# 136 "src/disk.c" 1
	movl %ES:4(%eax), %edi
# 0 "" 2
.LVL626:
#NO_APP
.LBE8120:
.LBB8121:
.LBB8122:
	.file 25 "src/farptr.h"
	.loc 25 201 0
	movl	%edi, %esi
	shrl	$16, %esi
	sall	$4, %esi
	movl	%esi, -36(%ebp)
	movzwl	%di, %esi
.LVL627:
	addl	-36(%ebp), %esi
.LVL628:
.LBE8122:
.LBE8121:
	.loc 23 127 0
	movl	%ebx, -32(%ebp)
	movl	%ecx, -28(%ebp)
	.loc 23 128 0
	movb	-40(%ebp), %cl
	movb	%cl, -14(%ebp)
	.loc 23 129 0
	movl	%edx, -20(%ebp)
	.loc 23 136 0
	movl	%esi, -24(%ebp)
	.loc 23 137 0
#APP
# 137 "src/disk.c" 1
	movw -38(%ebp), %ES
# 0 "" 2
#NO_APP
.LBB8123:
#APP
# 137 "src/disk.c" 1
	movw %ES:2(%eax), %ax
# 0 "" 2
.LVL629:
#NO_APP
.LBE8123:
	movw	%ax, -16(%ebp)
.LBB8124:
.LBB8125:
	.loc 24 327 0
#APP
# 327 "src/block.c" 1
	movw %SS, %dx
# 0 "" 2
.LVL630:
#NO_APP
.LBE8125:
.LBB8126:
.LBB8127:
.LBB8128:
.LBB8129:
	.loc 10 249 0
	movl	$64, %ebx
#APP
# 249 "src/biosvar.h" 1
	movw %bx, %ES
# 0 "" 2
#NO_APP
.LBB8130:
#APP
# 249 "src/biosvar.h" 1
	movw %ES:14, %si
# 0 "" 2
#NO_APP
	movw	%si, -36(%ebp)
.LBE8130:
.LBE8129:
.LBE8128:
	.loc 18 92 0
	leal	-32(%ebp), %eax
.LVL631:
	movzwl	%dx, %edx
.LVL632:
	movl	%eax, -52(%ebp)
	movl	%edx, -44(%ebp)
	movl	$__send_disk_op.14761, -48(%ebp)
	movl	$__send_disk_op.14761, %ecx
#APP
# 92 "src/stacks.c" 1
	movw %ss, %bx
movl %esp, %edi
movw %si, %ds
movw %si, %ss
movl $872, %esp
calll *%ecx
movw %bx, %ds
movw %bx, %ss
movl %edi, %esp
# 0 "" 2
.LVL633:
#NO_APP
	movl	%eax, -52(%ebp)
.LBE8127:
.LBE8126:
.LBE8124:
.LBB8131:
	.loc 23 141 0
	movl	-56(%ebp), %eax
#APP
# 141 "src/disk.c" 1
	movw (%eax), %ES
# 0 "" 2
#NO_APP
	movzwl	8(%eax), %edx
.LVL634:
	movl	-16(%ebp), %ecx
.LVL635:
#APP
# 141 "src/disk.c" 1
	movw %cx, %ES:2(%edx)
# 0 "" 2
#NO_APP
.LBE8131:
.LBB8132:
.LBB8133:
	.loc 23 25 0
	movb	-52(%ebp), %al
.LVL636:
	.loc 23 26 0
	movl	-56(%ebp), %edx
	cmpb	$0, 20(%edx)
	js	.L361
.LBB8134:
	.loc 23 27 0
	movl	$64, %ecx
.LVL637:
#APP
# 27 "src/disk.c" 1
	movw %cx, %ES
# 0 "" 2
# 27 "src/disk.c" 1
	movb %al, %ES:65
# 0 "" 2
#NO_APP
	jmp	.L362
.LVL638:
.L361:
.LBE8134:
.LBB8135:
	.loc 23 29 0
	movl	$64, %ebx
#APP
# 29 "src/disk.c" 1
	movw %bx, %ES
# 0 "" 2
# 29 "src/disk.c" 1
	movb %al, %ES:116
# 0 "" 2
#NO_APP
.L362:
.LBE8135:
	.loc 23 30 0
	testb	%al, %al
	je	.L363
.LBB8136:
.LBB8137:
.LBB8138:
.LBB8139:
	.loc 14 90 0
	movl	-56(%ebp), %esi
	movb	%al, 29(%esi)
.LVL639:
.L366:
.LBB8140:
.LBB8141:
	.loc 14 60 0
	orw	$1, 36(%esi)
	jmp	.L364
.LVL640:
.L363:
.LBE8141:
.LBE8140:
.LBE8139:
.LBE8138:
.LBE8137:
.LBE8136:
.LBB8142:
.LBB8143:
	.loc 14 77 0
	movl	-56(%ebp), %edi
	movb	$0, 29(%edi)
.LBB8144:
.LBB8145:
	.loc 14 62 0
	andw	$-2, 36(%edi)
.LVL641:
.L364:
.LBE8145:
.LBE8144:
.LBE8143:
.LBE8142:
.LBE8133:
.LBE8132:
	.loc 23 144 0
	addl	$44, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
	.cfi_endproc
.LFE2524:
	.size	extended_access.80147, .-extended_access.80147
	.section	.text.disk_1300.80266,"ax",@progbits
	.type	disk_1300.80266, @function
disk_1300.80266:
.LFB2525:
	.loc 23 154 0
	.cfi_startproc
.LVL642:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	pushl	%edi
	.cfi_def_cfa_offset 12
	pushl	%esi
	.cfi_def_cfa_offset 16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	%eax, %edi
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 5, -8
	.loc 23 156 0
	movl	%edx, 20(%esp)
	.loc 23 157 0
	movb	$0, 26(%esp)
.LBB8146:
.LBB8147:
	.loc 24 327 0
#APP
# 327 "src/block.c" 1
	movw %SS, %dx
# 0 "" 2
.LVL643:
#NO_APP
.LBE8147:
.LBB8148:
.LBB8149:
.LBB8150:
.LBB8151:
	.loc 10 249 0
	movl	$64, %eax
.LVL644:
#APP
# 249 "src/biosvar.h" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB8152:
#APP
# 249 "src/biosvar.h" 1
	movw %ES:14, %bx
# 0 "" 2
#NO_APP
	movw	%bx, 4(%esp)
.LBE8152:
.LBE8151:
.LBE8150:
	.loc 18 92 0
	leal	8(%esp), %eax
	movzwl	%dx, %edx
.LVL645:
	movl	$__send_disk_op.14761, %ecx
.LVL646:
#APP
# 92 "src/stacks.c" 1
	movw %ss, %si
movl %esp, %ebp
movw %bx, %ds
movw %bx, %ss
movl $872, %esp
calll *%ecx
movw %si, %ds
movw %si, %ss
movl %ebp, %esp
# 0 "" 2
.LVL647:
#NO_APP
.LBE8149:
.LBE8148:
.LBE8146:
.LBB8153:
.LBB8154:
	.loc 23 26 0
	cmpb	$0, 20(%edi)
	js	.L368
.LBB8155:
	.loc 23 27 0
	movl	$64, %edx
.LVL648:
#APP
# 27 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
# 27 "src/disk.c" 1
	movb %al, %ES:65
# 0 "" 2
.LVL649:
#NO_APP
	jmp	.L369
.LVL650:
.L368:
.LBE8155:
.LBB8156:
	.loc 23 29 0
	movl	$64, %ebx
#APP
# 29 "src/disk.c" 1
	movw %bx, %ES
# 0 "" 2
# 29 "src/disk.c" 1
	movb %al, %ES:116
# 0 "" 2
.LVL651:
#NO_APP
.L369:
.LBE8156:
	.loc 23 30 0
	testb	%al, %al
	je	.L370
.LBB8157:
.LBB8158:
.LBB8159:
.LBB8160:
	.loc 14 90 0
	movb	%al, 29(%edi)
.LBB8161:
.LBB8162:
	.loc 14 60 0
	orw	$1, 36(%edi)
	jmp	.L372
.L370:
.LBE8162:
.LBE8161:
.LBE8160:
.LBE8159:
.LBE8158:
.LBE8157:
.LBB8163:
.LBB8164:
	.loc 14 77 0
	movb	$0, 29(%edi)
.LBB8165:
.LBB8166:
	.loc 14 62 0
	andw	$-2, 36(%edi)
.L372:
.LBE8166:
.LBE8165:
.LBE8164:
.LBE8163:
.LBE8154:
.LBE8153:
	.loc 23 160 0
	addl	$28, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
.LVL652:
	popl	%ebp
	ret
	.cfi_endproc
.LFE2525:
	.size	disk_1300.80266, .-disk_1300.80266
	.section	.text.disk_1310.80585,"ax",@progbits
	.type	disk_1310.80585, @function
disk_1310.80585:
.LFB2535:
	.loc 23 302 0
	.cfi_startproc
.LVL653:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	pushl	%edi
	.cfi_def_cfa_offset 12
	pushl	%esi
	.cfi_def_cfa_offset 16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	%eax, %edi
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 5, -8
	.loc 23 306 0
	movl	%edx, 20(%esp)
	.loc 23 307 0
	movb	$16, 26(%esp)
.LBB8167:
.LBB8168:
	.loc 24 327 0
#APP
# 327 "src/block.c" 1
	movw %SS, %dx
# 0 "" 2
.LVL654:
#NO_APP
.LBE8168:
.LBB8169:
.LBB8170:
.LBB8171:
.LBB8172:
	.loc 10 249 0
	movl	$64, %eax
.LVL655:
#APP
# 249 "src/biosvar.h" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB8173:
#APP
# 249 "src/biosvar.h" 1
	movw %ES:14, %bx
# 0 "" 2
#NO_APP
	movw	%bx, 4(%esp)
.LBE8173:
.LBE8172:
.LBE8171:
	.loc 18 92 0
	leal	8(%esp), %eax
	movzwl	%dx, %edx
.LVL656:
	movl	$__send_disk_op.14761, %ecx
.LVL657:
#APP
# 92 "src/stacks.c" 1
	movw %ss, %si
movl %esp, %ebp
movw %bx, %ds
movw %bx, %ss
movl $872, %esp
calll *%ecx
movw %si, %ds
movw %si, %ss
movl %ebp, %esp
# 0 "" 2
.LVL658:
#NO_APP
.LBE8170:
.LBE8169:
.LBE8167:
.LBB8174:
.LBB8175:
	.loc 23 26 0
	cmpb	$0, 20(%edi)
	js	.L374
.LBB8176:
	.loc 23 27 0
	movl	$64, %edx
.LVL659:
#APP
# 27 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
# 27 "src/disk.c" 1
	movb %al, %ES:65
# 0 "" 2
.LVL660:
#NO_APP
	jmp	.L375
.LVL661:
.L374:
.LBE8176:
.LBB8177:
	.loc 23 29 0
	movl	$64, %ebx
#APP
# 29 "src/disk.c" 1
	movw %bx, %ES
# 0 "" 2
# 29 "src/disk.c" 1
	movb %al, %ES:116
# 0 "" 2
.LVL662:
#NO_APP
.L375:
.LBE8177:
	.loc 23 30 0
	testb	%al, %al
	je	.L376
.LBB8178:
.LBB8179:
.LBB8180:
.LBB8181:
	.loc 14 90 0
	movb	%al, 29(%edi)
.LBB8182:
.LBB8183:
	.loc 14 60 0
	orw	$1, 36(%edi)
	jmp	.L378
.L376:
.LBE8183:
.LBE8182:
.LBE8181:
.LBE8180:
.LBE8179:
.LBE8178:
.LBB8184:
.LBB8185:
	.loc 14 77 0
	movb	$0, 29(%edi)
.LBB8186:
.LBB8187:
	.loc 14 62 0
	andw	$-2, 36(%edi)
.L378:
.LBE8187:
.LBE8186:
.LBE8185:
.LBE8184:
.LBE8175:
.LBE8174:
	.loc 23 310 0
	addl	$28, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
.LVL663:
	popl	%ebp
	ret
	.cfi_endproc
.LFE2535:
	.size	disk_1310.80585, .-disk_1310.80585
	.section	.text.disk_1346.80820,"ax",@progbits
	.type	disk_1346.80820, @function
disk_1346.80820:
.LFB2549:
	.loc 23 463 0
	.cfi_startproc
.LVL664:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	pushl	%edi
	.cfi_def_cfa_offset 12
	pushl	%esi
	.cfi_def_cfa_offset 16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	movl	%eax, %ebp
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 5, -8
	.loc 23 464 0
	movb	20(%eax), %al
.LVL665:
	cmpb	$-33, %al
	ja	.L380
.LBB8188:
.LBB8189:
	.loc 23 26 0
	testb	%al, %al
	js	.L381
.LBB8190:
	.loc 23 27 0
	movl	$64, %eax
#APP
# 27 "src/disk.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
	movb	$-78, %al
#APP
# 27 "src/disk.c" 1
	movb %al, %ES:65
# 0 "" 2
#NO_APP
	jmp	.L382
.L381:
.LBE8190:
.LBB8191:
	.loc 23 29 0
	movl	$64, %eax
#APP
# 29 "src/disk.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
	movb	$-78, %al
#APP
# 29 "src/disk.c" 1
	movb %al, %ES:116
# 0 "" 2
#NO_APP
.L382:
.LBE8191:
.LBB8192:
.LBB8193:
.LBB8194:
.LBB8195:
	.loc 14 90 0
	movb	$-78, 29(%ebp)
	jmp	.L395
.L380:
.LBE8195:
.LBE8194:
.LBE8193:
.LBE8192:
.LBE8189:
.LBE8188:
	.loc 23 470 0
	movzbl	%al, %eax
.LBB8196:
.LBB8197:
	.loc 10 249 0
	movl	$64, %edx
.LVL666:
#APP
# 249 "src/biosvar.h" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB8198:
#APP
# 249 "src/biosvar.h" 1
	movw %ES:14, %cx
# 0 "" 2
.LVL667:
#NO_APP
.LBE8198:
.LBE8197:
.LBE8196:
	.loc 23 471 0
#APP
# 471 "src/disk.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB8199:
#APP
# 471 "src/disk.c" 1
	movb %ES:118(%eax), %al
# 0 "" 2
.LVL668:
#NO_APP
.LBE8199:
.LBB8200:
.LBB8201:
.LBB8202:
.LBB8203:
.LBB8204:
.LBB8205:
.LBB8206:
.LBB8207:
	.loc 14 60 0
	movl	$38, (%esp)
.LBE8207:
.LBE8206:
.LBE8205:
.LBE8204:
.LBE8203:
.LBE8202:
.LBE8201:
.LBE8200:
	.loc 23 472 0
	testb	%al, %al
	je	.L385
.LBB8210:
.LBB8209:
.LBB8208:
	.loc 23 29 0
#APP
# 29 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	jmp	.L396
.L385:
.LBE8208:
.LBE8209:
.LBE8210:
.LBB8211:
.LBB8212:
	.loc 6 178 0
	leal	6(%esp), %eax
.LVL669:
	movl	(%esp), %edx
.LVL670:
.L393:
	decl	%edx
	movb	$0, (%eax,%edx)
	.loc 6 177 0
	testl	%edx, %edx
	jne	.L393
	movl	%edx, (%esp)
.LBE8212:
.LBE8211:
	.loc 23 483 0
	movb	$82, 35(%esp)
	.loc 23 484 0
	movb	20(%ebp), %dl
.LVL671:
	movb	%dl, 26(%esp)
.LBB8213:
.LBB8214:
.LBB8215:
	.loc 6 53 0
#APP
# 53 "src/util.c" 1
	movw %CS, 40(%esp)
# 0 "" 2
	.loc 6 56 0
#NO_APP
	movl	$irq_trampoline_0x15, %edx
	movw	%dx, 38(%esp)
.LBB8216:
.LBB8217:
	.loc 6 23 0
#APP
# 23 "src/util.c" 1
	calll __call16
cli
cld
# 0 "" 2
.LVL672:
#NO_APP
.LBE8217:
.LBE8216:
.LBE8215:
.LBE8214:
.LBE8213:
	.loc 23 487 0
	cmpb	$0, 35(%esp)
	jne	.L386
	testb	$1, 42(%esp)
	je	.L387
.L386:
.LBB8218:
.LBB8219:
	.loc 23 26 0
	cmpb	$0, 20(%ebp)
	js	.L388
.LBB8220:
	.loc 23 27 0
	movl	$64, %eax
.LVL673:
#APP
# 27 "src/disk.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
	movb	$-79, %al
#APP
# 27 "src/disk.c" 1
	movb %al, %ES:65
# 0 "" 2
#NO_APP
	jmp	.L389
.LVL674:
.L388:
.LBE8220:
.LBB8221:
	.loc 23 29 0
	movl	$64, %eax
.LVL675:
#APP
# 29 "src/disk.c" 1
	movw %ax, %ES
# 0 "" 2
.LVL676:
#NO_APP
.L396:
	movb	$-79, %al
.LVL677:
#APP
# 29 "src/disk.c" 1
	movb %al, %ES:116
# 0 "" 2
#NO_APP
.L389:
.LBE8221:
.LBB8222:
.LBB8223:
.LBB8224:
.LBB8225:
	.loc 14 90 0
	movb	$-79, 29(%ebp)
.LVL678:
.L395:
.LBB8226:
.LBB8227:
	.loc 14 60 0
	orw	$1, 36(%ebp)
	jmp	.L392
.LVL679:
.L387:
.LBE8227:
.LBE8226:
.LBE8225:
.LBE8224:
.LBE8223:
.LBE8222:
.LBE8219:
.LBE8218:
.LBB8228:
.LBB8229:
	.loc 23 26 0
	cmpb	$0, 20(%ebp)
	js	.L390
.LBB8230:
	.loc 23 27 0
	movl	$64, %eax
.LVL680:
#APP
# 27 "src/disk.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
	xorl	%eax, %eax
	movl	(%esp), %edx
#APP
# 27 "src/disk.c" 1
	movb %al, %ES:65(%edx)
# 0 "" 2
#NO_APP
	jmp	.L391
.LVL681:
.L390:
.LBE8230:
.LBB8231:
	.loc 23 29 0
	movl	$64, %eax
.LVL682:
#APP
# 29 "src/disk.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
	xorl	%eax, %eax
	movl	(%esp), %edx
#APP
# 29 "src/disk.c" 1
	movb %al, %ES:116(%edx)
# 0 "" 2
#NO_APP
.L391:
.LBE8231:
.LBB8232:
.LBB8233:
	.loc 14 77 0
	movb	$0, 29(%ebp)
.LBB8234:
.LBB8235:
	.loc 14 62 0
	andw	$-2, 36(%ebp)
.LVL683:
.L392:
.LBE8235:
.LBE8234:
.LBE8233:
.LBE8232:
.LBE8229:
.LBE8228:
	.loc 23 492 0
	addl	$44, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
.LVL684:
	ret
	.cfi_endproc
.LFE2549:
	.size	disk_1346.80820, .-disk_1346.80820
	.section	.text.handle_76,"ax",@progbits
.globl handle_76
	.type	handle_76, @function
handle_76:
.LFB2565:
	.loc 23 857 0
	.cfi_startproc
.LBB8236:
	.loc 23 859 0
	movl	$64, %eax
#APP
# 859 "src/disk.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
	movb	$-1, %al
#APP
# 859 "src/disk.c" 1
	movb %al, %ES:142
# 0 "" 2
#NO_APP
.LBE8236:
.LBB8237:
.LBB8238:
.LBB8239:
	.loc 2 82 0
	movb	$32, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $160
# 0 "" 2
#NO_APP
.LBE8239:
.LBE8238:
.LBB8240:
.LBB8241:
.LBB8242:
#APP
# 82 "src/ioport.h" 1
	outb %al, $32
# 0 "" 2
#NO_APP
.LBE8242:
.LBE8241:
.LBE8240:
.LBE8237:
	.loc 23 861 0
	ret
	.cfi_endproc
.LFE2565:
	.size	handle_76, .-handle_76
	.section	.text.handle_apm16,"ax",@progbits
.globl handle_apm16
	.type	handle_apm16, @function
handle_apm16:
.LFB2647:
	.loc 22 222 0
	.cfi_startproc
.LVL685:
	.loc 22 224 0
	jmp	handle_1553.1752
.LVL686:
	.cfi_endproc
.LFE2647:
	.size	handle_apm16, .-handle_apm16
	.section	.text.putuint.9742.clone.1,"ax",@progbits
	.type	putuint.9742.clone.1, @function
putuint.9742.clone.1:
.LFB2650:
	.loc 3 170 0
	.cfi_startproc
.LVL687:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	subl	$12, %esp
	.cfi_def_cfa_offset 20
	.loc 3 174 0
	movb	$0, 11(%esp)
	leal	10(%esp), %ecx
.LVL688:
	.loc 3 176 0
	movl	$10, %ebx
	.cfi_offset 3, -8
.L403:
	xorl	%edx, %edx
	divl	%ebx
.LVL689:
	addl	$48, %edx
	movb	%dl, (%ecx)
	.loc 3 178 0
	testl	%eax, %eax
.LVL690:
	je	.L402
	.loc 3 180 0
	decl	%ecx
	jmp	.L403
.LVL691:
.L404:
.LBB8243:
.LBB8244:
.LBB8245:
.LBB8246:
.LBB8247:
.LBB8248:
.LBB8249:
	.loc 2 82 0
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE8249:
.LBE8248:
.LBE8247:
.LBE8246:
.LBE8245:
	.loc 3 151 0
	incl	%ecx
	jmp	.L406
.LVL692:
.L402:
.LBB8254:
.LBB8253:
.LBB8252:
.LBB8251:
.LBB8250:
	.loc 2 82 0
	movl	$1026, %edx
.L406:
.LBE8250:
.LBE8251:
.LBE8252:
.LBE8253:
.LBE8254:
	.loc 3 151 0
	movb	(%ecx), %al
.LVL693:
	testb	%al, %al
	jne	.L404
.LBE8244:
.LBE8243:
	.loc 3 183 0
	addl	$12, %esp
	popl	%ebx
	ret
	.cfi_endproc
.LFE2650:
	.size	putuint.9742.clone.1, .-putuint.9742.clone.1
	.section	.text.bvprintf.9806.clone.0,"ax",@progbits
	.type	bvprintf.9806.clone.0, @function
bvprintf.9806.clone.0:
.LFB2649:
	.loc 3 234 0
	.cfi_startproc
.LVL694:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	pushl	%edi
	.cfi_def_cfa_offset 12
	pushl	%esi
	.cfi_def_cfa_offset 16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	subl	$16, %esp
	.cfi_def_cfa_offset 36
	movl	%eax, %ecx
	movl	%edx, %ebx
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 5, -8
.LBB8255:
.LBB8256:
.LBB8258:
.LBB8310:
.LBB8312:
.LBB8313:
.LBB8314:
.LBB8315:
.LBB8316:
.LBB8317:
	.loc 2 82 0
	movl	$1026, %edx
.LVL695:
.L460:
.LBE8317:
.LBE8316:
.LBE8315:
.LBE8314:
.LBE8313:
.LBE8312:
.LBE8310:
.LBE8258:
.LBE8256:
.LBB8326:
	.loc 3 238 0
#APP
# 238 "src/output.c" 1
	movb %CS:(%ecx), %al
# 0 "" 2
.LVL696:
#NO_APP
.LBE8326:
	.loc 3 239 0
	testb	%al, %al
	je	.L461
	.loc 3 241 0
	cmpb	$37, %al
	jne	.L464
	.loc 3 245 0
	leal	1(%ecx), %esi
.LVL697:
	movl	$0, 4(%esp)
	xorl	%eax, %eax
.LVL698:
	movl	%ecx, %ebp
	movl	%ebx, (%esp)
.LVL699:
.L412:
.LBB8327:
	.loc 3 248 0
#APP
# 248 "src/output.c" 1
	movb %CS:(%esi), %cl
# 0 "" 2
.LVL700:
#NO_APP
.LBE8327:
	movb	%cl, 15(%esp)
	.loc 3 249 0
	leal	-48(%ecx), %edi
.LVL701:
	movl	%edi, %ebx
.LVL702:
	cmpb	$9, %bl
	ja	.L411
	.loc 3 251 0
	imull	$10, %eax, %eax
.LVL703:
	movsbl	%cl,%ecx
.LVL704:
	leal	-48(%eax,%ecx), %eax
.LVL705:
	.loc 3 252 0
	incl	%esi
	jmp	.L412
.LVL706:
.L411:
	movl	%eax, 4(%esp)
	movl	%ebp, %ecx
.LVL707:
	movl	(%esp), %ebx
.LVL708:
	.loc 3 254 0
	cmpb	$108, 15(%esp)
	jne	.L413
.LVL709:
	.loc 3 256 0
	incl	%esi
.LVL710:
	.loc 3 257 0
#APP
# 257 "src/output.c" 1
	movb %CS:(%esi), %al
# 0 "" 2
.LVL711:
#NO_APP
	movb	%al, 15(%esp)
.LVL712:
.L413:
	.loc 3 261 0
	cmpb	$112, 15(%esp)
	je	.L419
	jg	.L423
	cmpb	$99, 15(%esp)
	je	.L417
	jg	.L424
	cmpb	$37, 15(%esp)
	je	.L415
	cmpb	$46, 15(%esp)
	je	.L416
	jmp	.L414
.L424:
	cmpb	$100, 15(%esp)
	je	.L418
	jmp	.L414
.L423:
	cmpb	$117, 15(%esp)
	je	.L421
	cmpb	$120, 15(%esp)
	je	.L422
	cmpb	$115, 15(%esp)
	je	.L420
	jmp	.L414
.L415:
.LBB8328:
.LBB8329:
.LBB8330:
.LBB8331:
.LBB8332:
	.loc 2 82 0
	movb	$37, %al
.LVL713:
	jmp	.L465
.LVL714:
.L418:
.LBE8332:
.LBE8331:
.LBE8330:
.LBE8329:
.LBE8328:
	.loc 3 266 0
	movl	(%ebx), %ecx
.LVL715:
	.loc 3 267 0
	testl	%ecx, %ecx
	jns	.L425
.LBB8333:
.LBB8334:
.LBB8335:
.LBB8336:
.LBB8337:
	.loc 2 82 0
	movb	$45, %al
.LVL716:
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE8337:
.LBE8336:
.LBE8335:
.LBE8334:
.LBE8333:
	.loc 3 269 0
	negl	%ecx
.LVL717:
.L425:
	.loc 3 266 0
	addl	$4, %ebx
	.loc 3 271 0
	movl	%ecx, %eax
.LVL718:
	movl	%edx, 8(%esp)
	call	putuint.9742.clone.1
.LVL719:
	jmp	.L462
.LVL720:
.L421:
	.loc 3 274 0
	leal	4(%ebx), %edi
.LVL721:
	.loc 3 275 0
	movl	(%ebx), %eax
.LVL722:
	movl	%edx, 8(%esp)
	call	putuint.9742.clone.1
	movl	%edi, %ebx
.LVL723:
.L462:
	movl	%esi, %ecx
	movl	8(%esp), %edx
	jmp	.L410
.LVL724:
.L419:
.LBB8338:
.LBB8339:
.LBB8340:
.LBB8341:
.LBB8342:
	.loc 2 82 0
	movb	$48, %al
.LVL725:
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE8342:
.LBE8341:
.LBE8340:
.LBE8339:
.LBE8338:
.LBB8343:
.LBB8344:
.LBB8345:
.LBB8346:
.LBB8347:
	movb	$120, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
	movl	$8, 4(%esp)
.LVL726:
.L422:
.LBE8347:
.LBE8346:
.LBE8345:
.LBE8344:
.LBE8343:
	.loc 3 284 0
	movl	(%ebx), %ecx
.LVL727:
.LBB8348:
.LBB8257:
	.loc 3 200 0
	cmpl	$0, 4(%esp)
	jne	.L426
.LBB8309:
	.loc 3 203 0
	cmpl	$65535, %ecx
	ja	.L427
	movl	%ecx, %edi
	movl	$1, 4(%esp)
	jmp	.L428
.LVL728:
.L427:
	.loc 3 205 0
	movl	%ecx, %edi
	shrl	$16, %edi
.LVL729:
	movl	$5, 4(%esp)
.LVL730:
.L428:
	.loc 3 207 0
	cmpl	$255, %edi
	jbe	.L429
	.loc 3 208 0
	addl	$2, 4(%esp)
	.loc 3 209 0
	shrl	$8, %edi
.LVL731:
.L429:
	.loc 3 212 0
	cmpl	$16, %edi
	sbbl	$-1, 4(%esp)
.LVL732:
.L426:
.LBE8309:
	.loc 3 215 0
	cmpl	$4, 4(%esp)
	je	.L434
	jg	.L438
	cmpl	$2, 4(%esp)
	je	.L432
	jg	.L433
	cmpl	$1, 4(%esp)
	je	.L431
	jmp	.L430
.L438:
	cmpl	$6, 4(%esp)
	je	.L436
	jl	.L435
	cmpl	$7, 4(%esp)
	je	.L437
.L430:
	.loc 3 216 0
	movl	%ecx, %eax
.LVL733:
	shrl	$28, %eax
.LBB8302:
.LBB8303:
	.loc 3 189 0
	cmpl	$9, %eax
	ja	.L439
	.loc 3 190 0
	addl	$48, %eax
.LVL734:
	jmp	.L440
.LVL735:
.L439:
	.loc 3 192 0
	addl	$87, %eax
.LVL736:
.L440:
.LBB8304:
.LBB8305:
.LBB8306:
.LBB8307:
.LBB8308:
	.loc 2 82 0
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
.LVL737:
#NO_APP
.L437:
.LBE8308:
.LBE8307:
.LBE8306:
.LBE8305:
.LBE8304:
.LBE8303:
.LBE8302:
	.loc 3 217 0
	movl	%ecx, %eax
.LVL738:
	shrl	$24, %eax
	andl	$15, %eax
.LBB8295:
.LBB8296:
	.loc 3 189 0
	cmpl	$9, %eax
	ja	.L441
	.loc 3 190 0
	addl	$48, %eax
.LVL739:
	jmp	.L442
.LVL740:
.L441:
	.loc 3 192 0
	addl	$87, %eax
.LVL741:
.L442:
.LBB8297:
.LBB8298:
.LBB8299:
.LBB8300:
.LBB8301:
	.loc 2 82 0
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
.LVL742:
#NO_APP
.L436:
.LBE8301:
.LBE8300:
.LBE8299:
.LBE8298:
.LBE8297:
.LBE8296:
.LBE8295:
	.loc 3 218 0
	movl	%ecx, %eax
.LVL743:
	shrl	$20, %eax
	andl	$15, %eax
.LBB8288:
.LBB8289:
	.loc 3 189 0
	cmpl	$9, %eax
	ja	.L443
	.loc 3 190 0
	addl	$48, %eax
.LVL744:
	jmp	.L444
.LVL745:
.L443:
	.loc 3 192 0
	addl	$87, %eax
.LVL746:
.L444:
.LBB8290:
.LBB8291:
.LBB8292:
.LBB8293:
.LBB8294:
	.loc 2 82 0
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
.LVL747:
#NO_APP
.L435:
.LBE8294:
.LBE8293:
.LBE8292:
.LBE8291:
.LBE8290:
.LBE8289:
.LBE8288:
	.loc 3 219 0
	movl	%ecx, %eax
.LVL748:
	shrl	$16, %eax
	andl	$15, %eax
.LBB8281:
.LBB8282:
	.loc 3 189 0
	cmpl	$9, %eax
	ja	.L445
	.loc 3 190 0
	addl	$48, %eax
.LVL749:
	jmp	.L446
.LVL750:
.L445:
	.loc 3 192 0
	addl	$87, %eax
.LVL751:
.L446:
.LBB8283:
.LBB8284:
.LBB8285:
.LBB8286:
.LBB8287:
	.loc 2 82 0
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
.LVL752:
#NO_APP
.L434:
.LBE8287:
.LBE8286:
.LBE8285:
.LBE8284:
.LBE8283:
.LBE8282:
.LBE8281:
	.loc 3 220 0
	movl	%ecx, %eax
.LVL753:
	shrl	$12, %eax
	andl	$15, %eax
.LBB8274:
.LBB8275:
	.loc 3 189 0
	cmpl	$9, %eax
	ja	.L447
	.loc 3 190 0
	addl	$48, %eax
.LVL754:
	jmp	.L448
.LVL755:
.L447:
	.loc 3 192 0
	addl	$87, %eax
.LVL756:
.L448:
.LBB8276:
.LBB8277:
.LBB8278:
.LBB8279:
.LBB8280:
	.loc 2 82 0
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
.LVL757:
#NO_APP
.L433:
.LBE8280:
.LBE8279:
.LBE8278:
.LBE8277:
.LBE8276:
.LBE8275:
.LBE8274:
	.loc 3 221 0
	movl	%ecx, %eax
.LVL758:
	shrl	$8, %eax
	andl	$15, %eax
.LBB8267:
.LBB8268:
	.loc 3 189 0
	cmpl	$9, %eax
	ja	.L449
	.loc 3 190 0
	addl	$48, %eax
.LVL759:
	jmp	.L450
.LVL760:
.L449:
	.loc 3 192 0
	addl	$87, %eax
.LVL761:
.L450:
.LBB8269:
.LBB8270:
.LBB8271:
.LBB8272:
.LBB8273:
	.loc 2 82 0
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
.LVL762:
#NO_APP
.L432:
.LBE8273:
.LBE8272:
.LBE8271:
.LBE8270:
.LBE8269:
.LBE8268:
.LBE8267:
	.loc 3 222 0
	movl	%ecx, %eax
.LVL763:
	shrl	$4, %eax
	andl	$15, %eax
.LBB8260:
.LBB8261:
	.loc 3 189 0
	cmpl	$9, %eax
	ja	.L451
	.loc 3 190 0
	addl	$48, %eax
.LVL764:
	jmp	.L452
.LVL765:
.L451:
	.loc 3 192 0
	addl	$87, %eax
.LVL766:
.L452:
.LBB8262:
.LBB8263:
.LBB8264:
.LBB8265:
.LBB8266:
	.loc 2 82 0
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
.LVL767:
#NO_APP
.L431:
.LBE8266:
.LBE8265:
.LBE8264:
.LBE8263:
.LBE8262:
.LBE8261:
.LBE8260:
	.loc 3 223 0
	movl	%ecx, %eax
.LVL768:
	andl	$15, %eax
.LBB8259:
.LBB8311:
	.loc 3 189 0
	cmpl	$9, %eax
	ja	.L453
	.loc 3 190 0
	addl	$48, %eax
.LVL769:
	jmp	.L454
.LVL770:
.L453:
	.loc 3 192 0
	addl	$87, %eax
.LVL771:
.L454:
.LBE8311:
.LBE8259:
.LBE8257:
.LBE8348:
	.loc 3 283 0
	addl	$4, %ebx
.LVL772:
.L465:
.LBB8349:
.LBB8325:
.LBB8324:
.LBB8323:
.LBB8322:
.LBB8321:
.LBB8320:
.LBB8319:
.LBB8318:
	.loc 2 82 0
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
	jmp	.L463
.LVL773:
.L417:
.LBE8318:
.LBE8319:
.LBE8320:
.LBE8321:
.LBE8322:
.LBE8323:
.LBE8324:
.LBE8325:
.LBE8349:
	.loc 3 287 0
	leal	4(%ebx), %ecx
.LVL774:
.LBB8350:
.LBB8351:
.LBB8352:
.LBB8353:
.LBB8354:
	.loc 2 82 0
	movl	(%ebx), %eax
.LVL775:
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
	movl	%ecx, %ebx
	jmp	.L463
.LVL776:
.L416:
.LBE8354:
.LBE8353:
.LBE8352:
.LBE8351:
.LBE8350:
.LBB8355:
	.loc 3 292 0
#APP
# 292 "src/output.c" 1
	movb %CS:1(%esi), %al
# 0 "" 2
.LVL777:
#NO_APP
.LBE8355:
	movl	%esi, %ecx
	cmpb	$115, %al
	jne	.L410
.LVL778:
	.loc 3 295 0
	movl	(%ebx), %ecx
.LVL779:
	jmp	.L456
.LVL780:
.L457:
.LBB8356:
.LBB8357:
.LBB8358:
.LBB8359:
.LBB8360:
.LBB8361:
.LBB8362:
	.loc 2 82 0
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE8362:
.LBE8361:
.LBE8360:
.LBE8359:
.LBE8358:
	.loc 3 151 0
	incl	%ecx
.LVL781:
.L456:
	movb	(%ecx), %al
.LVL782:
	testb	%al, %al
	jne	.L457
.LBE8357:
.LBE8356:
	.loc 3 294 0
	leal	1(%esi), %ecx
.LVL783:
	.loc 3 295 0
	addl	$4, %ebx
	jmp	.L410
.LVL784:
.L420:
	.loc 3 299 0
	movl	(%ebx), %ecx
.LVL785:
.L459:
.LBB8363:
.LBB8364:
.LBB8365:
.LBB8366:
	.loc 3 161 0
#APP
# 161 "src/output.c" 1
	movb %CS:(%ecx), %al
# 0 "" 2
.LVL786:
#NO_APP
.LBE8366:
	.loc 3 162 0
	testb	%al, %al
	jne	.L458
.LBE8365:
.LBE8364:
.LBE8363:
	.loc 3 299 0
	addl	$4, %ebx
.LVL787:
.L463:
	movl	%esi, %ecx
.LVL788:
	jmp	.L410
.LVL789:
.L458:
.LBB8374:
.LBB8373:
.LBB8372:
.LBB8367:
.LBB8368:
.LBB8369:
.LBB8370:
.LBB8371:
	.loc 2 82 0
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE8371:
.LBE8370:
.LBE8369:
.LBE8368:
.LBE8367:
.LBE8372:
	.loc 3 160 0
	incl	%ecx
.LVL790:
	jmp	.L459
.LVL791:
.L414:
.LBE8373:
.LBE8374:
.LBB8375:
.LBB8376:
.LBB8377:
.LBB8378:
.LBB8379:
	.loc 2 82 0
	movb	$37, %al
.LVL792:
.L464:
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
.LVL793:
#NO_APP
.L410:
.LBE8379:
.LBE8378:
.LBE8377:
.LBE8376:
.LBE8375:
.LBE8255:
	.loc 3 237 0
	incl	%ecx
	jmp	.L460
.LVL794:
.L461:
	.loc 3 308 0
	addl	$16, %esp
	popl	%ebx
.LVL795:
	popl	%esi
	popl	%edi
.LVL796:
	popl	%ebp
	ret
	.cfi_endproc
.LFE2649:
	.size	bvprintf.9806.clone.0, .-bvprintf.9806.clone.0
	.section	.text.panic.1646,"ax",@progbits
	.type	panic.1646, @function
panic.1646:
.LFB319:
	.loc 3 312 0
	.cfi_startproc
.LVL797:
	.loc 3 311 0
	leal	8(%esp), %edx
.LBB8380:
	.loc 3 316 0
	movl	4(%esp), %eax
	call	bvprintf.9806.clone.0
.LBE8380:
.LBB8381:
.LBB8382:
	.loc 8 13 0
#APP
# 13 "src/util.h" 1
	cli
# 0 "" 2
#NO_APP
.L467:
.LBE8382:
.LBE8381:
.LBB8383:
.LBB8384:
	.loc 8 52 0
#APP
# 52 "src/util.h" 1
	hlt
# 0 "" 2
#NO_APP
	jmp	.L467
.LBE8384:
.LBE8383:
	.cfi_endproc
.LFE319:
	.size	panic.1646, .-panic.1646
	.section	.text.__dprintf.1654,"ax",@progbits
	.type	__dprintf.1654, @function
__dprintf.1654:
.LFB320:
	.loc 3 329 0
	.cfi_startproc
.LVL798:
	.loc 3 328 0
	leal	8(%esp), %edx
	.loc 3 344 0
	movl	4(%esp), %eax
	call	bvprintf.9806.clone.0
	.loc 3 347 0
	ret
	.cfi_endproc
.LFE320:
	.size	__dprintf.1654, .-__dprintf.1654
	.section	.rodata.str1.1
.LC3:
	.string	"ebda moved from %x to %x\n"
	.section	.text.pmm_malloc.1832,"ax",@progbits
	.type	pmm_malloc.1832, @function
pmm_malloc.1832:
.LFB145:
	.loc 4 191 0
	.cfi_startproc
.LVL799:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	pushl	%edi
	.cfi_def_cfa_offset 12
	pushl	%esi
	.cfi_def_cfa_offset 16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	subl	$60, %esp
	.cfi_def_cfa_offset 80
	movl	%eax, %ebp
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 5, -8
	movl	%edx, 56(%esp)
	movl	%ecx, 28(%esp)
	.loc 4 192 0
	xorl	%edx, %edx
.LVL800:
#APP
# 192 "src/pmm.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB8385:
#APP
# 192 "src/pmm.c" 1
	addr32 movl %ES:ZoneTmpHigh+8, %ecx
# 0 "" 2
.LVL801:
#NO_APP
.LBE8385:
.LBB8386:
.LBB8387:
	.loc 4 123 0
#APP
# 123 "src/pmm.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB8388:
#APP
# 123 "src/pmm.c" 1
	addr32 movl %ES:ZoneTmpHigh+8, %ebx
# 0 "" 2
.LVL802:
#NO_APP
.LBE8388:
	.loc 4 124 0
	leal	-20(%ebx), %eax
.LVL803:
	andl	$-16, %eax
	.loc 4 125 0
#APP
# 125 "src/pmm.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB8389:
#APP
# 125 "src/pmm.c" 1
	addr32 movl %ES:ZoneTmpHigh+4, %esi
# 0 "" 2
.LVL804:
#NO_APP
.LBE8389:
	cmpl	%esi, %eax
	jb	.L472
	cmpl	%ebx, %eax
	ja	.L472
	.loc 4 128 0
#APP
# 128 "src/pmm.c" 1
	movw %dx, %ES
# 0 "" 2
# 128 "src/pmm.c" 1
	addr32 movl %eax, %ES:ZoneTmpHigh+8
# 0 "" 2
#NO_APP
	jmp	.L473
.L472:
	.loc 4 129 0
	xorl	%eax, %eax
.LVL805:
.L473:
.LBE8387:
.LBE8386:
	.loc 4 194 0
	movl	%eax, %ebx
.LVL806:
	.loc 4 195 0
	movl	%ecx, 24(%esp)
	testl	%eax, %eax
	jne	.L475
.LVL807:
	.loc 4 196 0
#APP
# 196 "src/pmm.c" 1
	movw %ax, %ES
# 0 "" 2
.LVL808:
#NO_APP
.LBB8390:
#APP
# 196 "src/pmm.c" 1
	addr32 movl %ES:ZoneTmpLow+8, %ecx
# 0 "" 2
.LVL809:
#NO_APP
.LBE8390:
.LBB8391:
.LBB8392:
	.loc 4 123 0
#APP
# 123 "src/pmm.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB8393:
#APP
# 123 "src/pmm.c" 1
	addr32 movl %ES:ZoneTmpLow+8, %edx
# 0 "" 2
.LVL810:
#NO_APP
.LBE8393:
	.loc 4 124 0
	leal	-20(%edx), %ebx
.LVL811:
	andl	$-16, %ebx
	.loc 4 125 0
#APP
# 125 "src/pmm.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB8394:
#APP
# 125 "src/pmm.c" 1
	addr32 movl %ES:ZoneTmpLow+4, %esi
# 0 "" 2
.LVL812:
#NO_APP
.LBE8394:
	cmpl	%esi, %ebx
	jb	.L476
	cmpl	%edx, %ebx
	ja	.L476
	.loc 4 128 0
#APP
# 128 "src/pmm.c" 1
	movw %ax, %ES
# 0 "" 2
# 128 "src/pmm.c" 1
	addr32 movl %ebx, %ES:ZoneTmpLow+8
# 0 "" 2
#NO_APP
	jmp	.L477
.L476:
	.loc 4 129 0
	xorl	%ebx, %ebx
.LVL813:
.L477:
.LBE8392:
.LBE8391:
	.loc 4 198 0
	testl	%ebx, %ebx
.LVL814:
	je	.L478
	movl	%ecx, 24(%esp)
.LVL815:
.L475:
	.loc 4 201 0
	cmpl	$ZoneLow, %ebp
	jne	.L479
.LBB8395:
.LBB8396:
	.loc 4 79 0
	xorl	%edx, %edx
.LVL816:
#APP
# 79 "src/pmm.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB8397:
#APP
# 79 "src/pmm.c" 1
	addr32 movl %ES:ZoneLow+8, %eax
# 0 "" 2
#NO_APP
	movl	%eax, 36(%esp)
.LBE8397:
	.loc 4 80 0
	movl	80(%esp), %ecx
.LVL817:
	negl	%ecx
	movl	%ecx, 16(%esp)
	subl	28(%esp), %eax
.LVL818:
	andl	%ecx, %eax
	.loc 4 81 0
#APP
# 81 "src/pmm.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB8398:
#APP
# 81 "src/pmm.c" 1
	addr32 movl %ES:ZoneLow+4, %esi
# 0 "" 2
.LVL819:
#NO_APP
.LBE8398:
	.loc 4 82 0
	cmpl	36(%esp), %eax
	ja	.L490
	cmpl	%esi, %eax
	jae	.L479
.L490:
.LBB8399:
.LBB8400:
	.loc 10 249 0
	movl	$64, %edx
#APP
# 249 "src/biosvar.h" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB8401:
#APP
# 249 "src/biosvar.h" 1
	movw %ES:14, %di
# 0 "" 2
.LVL820:
#NO_APP
.LBE8401:
.LBE8400:
.LBE8399:
	.loc 4 90 0
	movzwl	%di, %edx
	sall	$4, %edx
	movl	%edx, (%esp)
	.loc 4 91 0
#APP
# 91 "src/pmm.c" 1
	movw %di, %ES
# 0 "" 2
#NO_APP
.LBB8402:
#APP
# 91 "src/pmm.c" 1
	movb %ES:0, %cl
# 0 "" 2
#NO_APP
	movl	%ecx, %edi
.LVL821:
.LBE8402:
	.loc 4 92 0
	andl	$255, %edi
.LVL822:
	movl	%edi, %edx
	sall	$10, %edx
	movl	%edx, 32(%esp)
	addl	(%esp), %edx
	movl	%edx, 20(%esp)
	.loc 4 93 0
	cmpl	%esi, %edx
	jne	.L481
	movl	36(%esp), %ecx
	movl	%ecx, 20(%esp)
	jmp	.L482
.L481:
	.loc 4 96 0
	movl	20(%esp), %eax
	subl	28(%esp), %eax
	andl	16(%esp), %eax
.L482:
	.loc 4 98 0
	andl	$-1024, %eax
	movl	%eax, 36(%esp)
	.loc 4 99 0
	imull	$-1024, %edi, %edi
	addl	%eax, %edi
	movl	%edi, 16(%esp)
	.loc 4 100 0
	cmpl	$589823, %edi
	jbe	.L479
.LBB8403:
.LBB8404:
	.loc 4 51 0
	movl	$64, %esi
.LVL823:
#APP
# 51 "src/pmm.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB8405:
#APP
# 51 "src/pmm.c" 1
	movw %ES:19, %ax
# 0 "" 2
.LVL824:
#NO_APP
.LBE8405:
	.loc 4 52 0
	movzwl	%ax, %eax
.LVL825:
	sall	$10, %eax
	cmpl	%eax, (%esp)
	jne	.L479
	.loc 4 58 0
	movl	%edi, %eax
	shrl	$4, %eax
	movw	%ax, 40(%esp)
.LBB8406:
.LBB8407:
	.loc 6 185 0
#APP
# 185 "src/util.c" 1
	movw %ax, %ES
# 0 "" 2
	.loc 6 187 0
#NO_APP
	movl	(%esp), %edx
	shrl	$4, %edx
	movl	%edx, 12(%esp)
	movl	32(%esp), %ecx
	movl	%ecx, 8(%esp)
	movl	$0, 4(%esp)
	xorw	%si, %si
	xorl	%edi, %edi
.LVL826:
#APP
# 187 "src/util.c" 1
	movw %ds, %ax
movw %dx, %ds
rep movsb (%si),%es:(%di)
movw %ax, %ds
# 0 "" 2
#NO_APP
.LBE8407:
.LBE8406:
	.loc 4 67 0
	pushl	16(%esp)
	.cfi_def_cfa_offset 84
	pushl	4(%esp)
	.cfi_def_cfa_offset 88
	pushl	$.LC3
	.cfi_def_cfa_offset 92
	.cfi_escape 0x2e,0xc
	call	__dprintf.1654
	addl	$12, %esp
	.cfi_def_cfa_offset 80
.LBB8408:
	.loc 4 68 0
	movl	16(%esp), %eax
	shrl	$10, %eax
	movl	$64, %edx
#APP
# 68 "src/pmm.c" 1
	movw %dx, %ES
# 0 "" 2
# 68 "src/pmm.c" 1
	movw %ax, %ES:19
# 0 "" 2
.LVL827:
#NO_APP
.LBE8408:
.LBB8409:
	.loc 4 69 0
#APP
# 69 "src/pmm.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	movl	40(%esp), %ecx
#APP
# 69 "src/pmm.c" 1
	movw %cx, %ES:14
# 0 "" 2
#NO_APP
.LBE8409:
.LBE8404:
.LBE8403:
	.loc 4 110 0
	xorl	%esi, %esi
#APP
# 110 "src/pmm.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
	movl	20(%esp), %eax
.LVL828:
#APP
# 110 "src/pmm.c" 1
	addr32 movl %eax, %ES:ZoneLow+8
# 0 "" 2
	.loc 4 111 0
# 111 "src/pmm.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
	movl	36(%esp), %edx
#APP
# 111 "src/pmm.c" 1
	addr32 movl %edx, %ES:ZoneLow+4
# 0 "" 2
.LVL829:
#NO_APP
.L479:
.LBE8396:
.LBE8395:
	.loc 4 203 0
	xorl	%edx, %edx
.LVL830:
#APP
# 203 "src/pmm.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB8410:
#APP
# 203 "src/pmm.c" 1
	addr32 movl %ES:8(%ebp), %esi
# 0 "" 2
.LVL831:
#NO_APP
.LBE8410:
.LBB8411:
.LBB8412:
	.loc 4 123 0
#APP
# 123 "src/pmm.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB8413:
#APP
# 123 "src/pmm.c" 1
	addr32 movl %ES:8(%ebp), %ecx
# 0 "" 2
.LVL832:
#NO_APP
.LBE8413:
	.loc 4 124 0
	movl	%ecx, %eax
.LVL833:
	subl	28(%esp), %eax
	movl	80(%esp), %edi
.LVL834:
	negl	%edi
	andl	%edi, %eax
	.loc 4 125 0
#APP
# 125 "src/pmm.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB8414:
#APP
# 125 "src/pmm.c" 1
	addr32 movl %ES:4(%ebp), %edi
# 0 "" 2
.LVL835:
#NO_APP
.LBE8414:
	cmpl	%edi, %eax
	jb	.L483
	cmpl	%ecx, %eax
	ja	.L483
	.loc 4 128 0
#APP
# 128 "src/pmm.c" 1
	movw %dx, %ES
# 0 "" 2
# 128 "src/pmm.c" 1
	addr32 movl %eax, %ES:8(%ebp)
# 0 "" 2
#NO_APP
.LBE8412:
.LBE8411:
	.loc 4 205 0
	testl	%eax, %eax
.LVL836:
	jne	.L484
.L483:
	xorl	%edx, %edx
.LVL837:
.LBB8415:
.LBB8416:
.LBB8417:
.LBB8418:
.LBB8419:
	.loc 4 138 0
	xorl	%ecx, %ecx
.LVL838:
.L487:
	xorl	%esi, %esi
.LVL839:
#APP
# 138 "src/pmm.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB8420:
#APP
# 138 "src/pmm.c" 1
	addr32 movl %ES:Zones(,%edx,4), %eax
# 0 "" 2
.LVL840:
#NO_APP
.LBE8420:
	.loc 4 139 0
#APP
# 139 "src/pmm.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB8421:
#APP
# 139 "src/pmm.c" 1
	addr32 movl %ES:8(%eax), %edi
# 0 "" 2
.LVL841:
#NO_APP
.LBE8421:
	cmpl	%edi, %ebx
	jb	.L485
	.loc 4 140 0
#APP
# 140 "src/pmm.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB8422:
#APP
# 140 "src/pmm.c" 1
	addr32 movl %ES:(%eax), %edi
# 0 "" 2
.LVL842:
#NO_APP
.LBE8422:
	.loc 4 139 0
	cmpl	%edi, %ebx
	jb	.L486
.LVL843:
.L485:
.LBE8419:
	.loc 4 137 0
	incl	%edx
.LVL844:
	cmpl	$5, %edx
	jne	.L487
	jmp	.L478
.LVL845:
.L486:
.LBE8418:
.LBE8417:
	.loc 4 151 0
	testl	%eax, %eax
	je	.L478
#APP
# 151 "src/pmm.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB8423:
#APP
# 151 "src/pmm.c" 1
	addr32 movl %ES:8(%eax), %edx
# 0 "" 2
.LVL846:
#NO_APP
.LBE8423:
	cmpl	%ebx, %edx
	jne	.L478
	.loc 4 153 0
#APP
# 153 "src/pmm.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
	movl	24(%esp), %ecx
#APP
# 153 "src/pmm.c" 1
	addr32 movl %ecx, %ES:8(%eax)
# 0 "" 2
#NO_APP
	jmp	.L478
.LVL847:
.L484:
.LBE8416:
.LBE8415:
	.loc 4 213 0
#APP
# 213 "src/pmm.c" 1
	movw %dx, %ES
# 0 "" 2
# 213 "src/pmm.c" 1
	addr32 movl %eax, %ES:(%ebx)
# 0 "" 2
	.loc 4 214 0
# 214 "src/pmm.c" 1
	movw %dx, %ES
# 0 "" 2
# 214 "src/pmm.c" 1
	addr32 movl %esi, %ES:4(%ebx)
# 0 "" 2
	.loc 4 215 0
# 215 "src/pmm.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	movl	56(%esp), %esi
.LVL848:
#APP
# 215 "src/pmm.c" 1
	addr32 movl %esi, %ES:8(%ebx)
# 0 "" 2
	.loc 4 216 0
# 216 "src/pmm.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	movl	24(%esp), %ecx
.LVL849:
#APP
# 216 "src/pmm.c" 1
	addr32 movl %ecx, %ES:12(%ebx)
# 0 "" 2
	.loc 4 217 0
# 217 "src/pmm.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB8424:
#APP
# 217 "src/pmm.c" 1
	addr32 movl %ES:PMMAllocs, %ecx
# 0 "" 2
.LVL850:
#NO_APP
.LBE8424:
#APP
# 217 "src/pmm.c" 1
	addr32 movl %ecx, %ES:16(%ebx)
# 0 "" 2
	.loc 4 218 0
# 218 "src/pmm.c" 1
	movw %dx, %ES
# 0 "" 2
# 218 "src/pmm.c" 1
	addr32 movl %ebx, %ES:PMMAllocs
# 0 "" 2
	.loc 4 219 0
#NO_APP
	jmp	.L488
.LVL851:
.L478:
	xorl	%eax, %eax
.LVL852:
.L488:
.LVL853:
	.loc 4 220 0
	addl	$60, %esp
	popl	%ebx
.LVL854:
	popl	%esi
.LVL855:
	popl	%edi
.LVL856:
	popl	%ebp
.LVL857:
	ret	$4
	.cfi_endproc
.LFE145:
	.size	pmm_malloc.1832, .-pmm_malloc.1832
	.section	.rodata.str1.1
.LC4:
	.string	"pmm call arg1=%x\n"
	.section	.text.handle_pmm,"ax",@progbits
.globl handle_pmm
	.type	handle_pmm, @function
handle_pmm:
.LFB156:
	.loc 4 475 0
	.cfi_startproc
.LVL858:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	pushl	%edi
	.cfi_def_cfa_offset 12
	pushl	%esi
	.cfi_def_cfa_offset 16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	subl	$4, %esp
	.cfi_def_cfa_offset 24
	movl	%eax, %ebx
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 5, -8
	.loc 4 479 0
	movw	(%eax), %si
.LVL859:
	.loc 4 480 0
	movzwl	%si, %eax
.LVL860:
	pushl	%eax
	.cfi_def_cfa_offset 28
	pushl	$.LC4
	.cfi_def_cfa_offset 32
	.cfi_escape 0x2e,0x8
	call	__dprintf.1654
.LVL861:
	popl	%edi
	.cfi_def_cfa_offset 28
	popl	%ebp
	.cfi_def_cfa_offset 24
	.loc 4 482 0
	cmpw	$1, %si
.LVL862:
	je	.L495
	jb	.L494
	orl	$-1, %eax
.LVL863:
	cmpw	$2, %si
	jne	.L497
	jmp	.L533
.LVL864:
.L494:
.LBB8457:
.LBB8458:
	.loc 4 388 0
	movl	2(%ebx), %ebp
.LVL865:
	movl	6(%ebx), %eax
	movl	%eax, (%esp)
	.loc 4 393 0
	movzwl	10(%ebx), %eax
	testb	$8, %al
	jne	.L498
	movl	$ZoneTmpLow, %edi
.LVL866:
	movl	$ZoneTmpHigh, %ebx
.LVL867:
	jmp	.L499
.LVL868:
.L498:
	movl	$ZoneLow, %edi
.LVL869:
	movl	$ZoneHigh, %ebx
.LVL870:
.L499:
	.loc 4 398 0
	testl	%ebp, %ebp
	jne	.L500
	.loc 4 400 0
	andl	$3, %eax
	cmpl	$2, %eax
	je	.L503
	cmpl	$3, %eax
	je	.L504
	decl	%eax
	jne	.L501
.LBB8459:
.LBB8460:
	.loc 4 269 0
#APP
# 269 "src/pmm.c" 1
	movw %bp, %ES
# 0 "" 2
#NO_APP
.LBB8461:
#APP
# 269 "src/pmm.c" 1
	addr32 movl %ES:8(%edi), %eax
# 0 "" 2
.LVL871:
#NO_APP
.LBE8461:
#APP
# 269 "src/pmm.c" 1
	movw %bp, %ES
# 0 "" 2
#NO_APP
.LBB8462:
#APP
# 269 "src/pmm.c" 1
	addr32 movl %ES:4(%edi), %edx
# 0 "" 2
.LVL872:
#NO_APP
.LBE8462:
	subl	%edx, %eax
	.loc 4 270 0
	cmpl	$ZoneTmpHigh, %edi
	je	.L506
	cmpl	$ZoneTmpLow, %edi
	jmp	.L531
.LVL873:
.L503:
.LBE8460:
.LBE8459:
.LBB8463:
.LBB8464:
	.loc 4 269 0
#APP
# 269 "src/pmm.c" 1
	movw %bp, %ES
# 0 "" 2
#NO_APP
.LBB8465:
#APP
# 269 "src/pmm.c" 1
	addr32 movl %ES:8(%ebx), %eax
# 0 "" 2
.LVL874:
#NO_APP
.LBE8465:
#APP
# 269 "src/pmm.c" 1
	movw %bp, %ES
# 0 "" 2
#NO_APP
.LBB8466:
#APP
# 269 "src/pmm.c" 1
	addr32 movl %ES:4(%ebx), %edx
# 0 "" 2
.LVL875:
#NO_APP
.LBE8466:
	subl	%edx, %eax
	.loc 4 270 0
	cmpl	$ZoneTmpHigh, %ebx
	je	.L506
	cmpl	$ZoneTmpLow, %ebx
.LVL876:
.L531:
	jne	.L497
.L506:
	.loc 4 274 0
	cmpl	$32, %eax
	jbe	.L501
	.loc 4 276 0
	subl	$32, %eax
	jmp	.L497
.LVL877:
.L504:
.LBE8464:
.LBE8463:
.LBB8467:
.LBB8468:
.LBB8469:
	.loc 4 269 0
#APP
# 269 "src/pmm.c" 1
	movw %bp, %ES
# 0 "" 2
#NO_APP
.LBB8470:
#APP
# 269 "src/pmm.c" 1
	addr32 movl %ES:8(%edi), %edx
# 0 "" 2
.LVL878:
#NO_APP
.LBE8470:
#APP
# 269 "src/pmm.c" 1
	movw %bp, %ES
# 0 "" 2
#NO_APP
.LBB8471:
#APP
# 269 "src/pmm.c" 1
	addr32 movl %ES:4(%edi), %eax
# 0 "" 2
.LVL879:
#NO_APP
.LBE8471:
	subl	%eax, %edx
	.loc 4 270 0
	cmpl	$ZoneTmpHigh, %edi
	je	.L507
	cmpl	$ZoneTmpLow, %edi
	jne	.L508
.L507:
	.loc 4 274 0
	cmpl	$32, %edx
	ja	.L509
	xorl	%edx, %edx
	jmp	.L508
.L509:
	.loc 4 276 0
	subl	$32, %edx
.L508:
.LBE8469:
.LBE8468:
.LBB8472:
.LBB8473:
	.loc 4 269 0
	xorl	%ecx, %ecx
#APP
# 269 "src/pmm.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB8474:
#APP
# 269 "src/pmm.c" 1
	addr32 movl %ES:8(%ebx), %eax
# 0 "" 2
.LVL880:
#NO_APP
.LBE8474:
#APP
# 269 "src/pmm.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB8475:
#APP
# 269 "src/pmm.c" 1
	addr32 movl %ES:4(%ebx), %ecx
# 0 "" 2
.LVL881:
#NO_APP
.LBE8475:
	subl	%ecx, %eax
	.loc 4 270 0
	cmpl	$ZoneTmpHigh, %ebx
	je	.L510
	cmpl	$ZoneTmpLow, %ebx
	jne	.L511
.L510:
	.loc 4 274 0
	cmpl	$32, %eax
	ja	.L512
	xorl	%eax, %eax
	jmp	.L511
.L512:
	.loc 4 276 0
	subl	$32, %eax
.L511:
	cmpl	%edx, %eax
	jae	.L497
.LVL882:
	movl	%edx, %eax
	jmp	.L497
.LVL883:
.L500:
.LBE8473:
.LBE8472:
.LBE8467:
	.loc 4 417 0
	sall	$4, %ebp
.LVL884:
	.loc 4 418 0
	testl	%ebp, %ebp
	jle	.L501
	.loc 4 421 0
	testb	$4, %al
	je	.L514
.LBB8476:
.LBB8477:
	.loc 8 91 0
#APP
# 91 "src/util.h" 1
	bsf %ebp,%ecx
# 0 "" 2
.LVL885:
#NO_APP
.LBE8477:
.LBE8476:
	.loc 4 422 0
	movl	$1, %esi
.LVL886:
	sall	%cl, %esi
	.loc 4 423 0
	cmpl	$15, %esi
	ja	.L515
.LVL887:
.L514:
	movl	$16, %esi
.LVL888:
.L515:
	.loc 4 426 0
	andl	$3, %eax
	cmpl	$2, %eax
	je	.L529
	cmpl	$3, %eax
	je	.L518
	decl	%eax
	jne	.L501
	.loc 4 431 0
	pushl	%esi
	.cfi_def_cfa_offset 28
	movl	%ebp, %ecx
.LVL889:
	movl	4(%esp), %edx
	movl	%edi, %eax
	jmp	.L526
	.cfi_def_cfa_offset 24
.LVL890:
.L518:
.LBB8478:
	.loc 4 435 0
	pushl	%esi
	.cfi_def_cfa_offset 28
	movl	%ebp, %ecx
.LVL891:
	movl	4(%esp), %edx
	movl	%edi, %eax
	.cfi_escape 0x2e,0x4
	call	pmm_malloc.1832
	.cfi_def_cfa_offset 24
	.loc 4 436 0
	testl	%eax, %eax
.LVL892:
	jne	.L497
.LVL893:
.L529:
	.loc 4 438 0
	pushl	%esi
	.cfi_def_cfa_offset 28
	movl	%ebp, %ecx
.LVL894:
	movl	4(%esp), %edx
	movl	%ebx, %eax
.LVL895:
.L526:
	call	pmm_malloc.1832
	.cfi_def_cfa_offset 24
	jmp	.L497
.LVL896:
.L501:
	xorl	%eax, %eax
	jmp	.L497
.LVL897:
.L495:
.LBE8478:
.LBE8458:
.LBE8457:
.LBB8479:
.LBB8480:
	.loc 4 447 0
	movl	2(%ebx), %ecx
.LVL898:
	.loc 4 449 0
	xorl	%eax, %eax
.LVL899:
	cmpl	$-1, %ecx
	je	.L497
.LBB8481:
.LBB8482:
	.loc 4 284 0
#APP
# 284 "src/pmm.c" 1
	movw %ax, %ES
# 0 "" 2
.LVL900:
#NO_APP
.LBB8483:
#APP
# 284 "src/pmm.c" 1
	addr32 movl %ES:PMMAllocs, %eax
# 0 "" 2
.LVL901:
#NO_APP
.LBE8483:
	.loc 4 285 0
	xorl	%edx, %edx
	jmp	.L521
.LVL902:
.L524:
#APP
# 285 "src/pmm.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB8484:
#APP
# 285 "src/pmm.c" 1
	addr32 movl %ES:8(%eax), %ebx
# 0 "" 2
.LVL903:
#NO_APP
.LBE8484:
	cmpl	%ecx, %ebx
	jne	.L522
	.loc 4 286 0
	xorl	%edx, %edx
#APP
# 286 "src/pmm.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB8485:
#APP
# 286 "src/pmm.c" 1
	addr32 movl %ES:(%eax), %eax
# 0 "" 2
.LVL904:
#NO_APP
	jmp	.L497
.LVL905:
.L522:
.LBE8485:
	.loc 4 284 0
#APP
# 284 "src/pmm.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB8486:
#APP
# 284 "src/pmm.c" 1
	addr32 movl %ES:16(%eax), %eax
# 0 "" 2
.LVL906:
#NO_APP
.L521:
.LBE8486:
	testl	%eax, %eax
	jne	.L524
	jmp	.L497
.LVL907:
.L533:
.LBE8482:
.LBE8481:
.LBE8480:
.LBE8479:
.LBB8487:
.LBB8488:
	.loc 4 460 0
	movl	2(%ebx), %eax
.LVL908:
	.cfi_escape 0x2e,0x0
	call	pmm_free.1834
	testl	%eax, %eax
.LVL909:
	setne	%al
.LVL910:
	movzbl	%al, %eax
.LVL911:
.L497:
.LVL912:
.LBE8488:
.LBE8487:
	.loc 4 488 0
	popl	%esi
	.cfi_def_cfa_offset 20
.LVL913:
	popl	%ebx
.LVL914:
	popl	%esi
	popl	%edi
.LVL915:
	popl	%ebp
.LVL916:
	ret
	.cfi_endproc
.LFE156:
	.size	handle_pmm, .-handle_pmm
	.section	.rodata.str1.1
.LC5:
	.string	"  NULL\n"
.LC6:
	.string	"   a=%08x  b=%08x  c=%08x  d=%08x ds=%04x es=%04x ss=%04x\n"
.LC7:
	.string	"  si=%08x di=%08x bp=%08x sp=%08x cs=%04x ip=%04x  f=%04x\n"
	.section	.text.dump_regs.10019,"ax",@progbits
	.type	dump_regs.10019, @function
dump_regs.10019:
.LFB325:
	.loc 3 430 0
	.cfi_startproc
.LVL917:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	movl	%eax, %ebx
	.cfi_offset 3, -8
	.loc 3 431 0
	testl	%eax, %eax
	jne	.L535
	.loc 3 432 0
	pushl	$.LC5
	.cfi_def_cfa_offset 12
	.cfi_escape 0x2e,0x4
	call	__dprintf.1654
.LVL918:
	popl	%eax
	.cfi_def_cfa_offset 8
	.loc 3 433 0
	jmp	.L537
.LVL919:
.L535:
.LBB8489:
	.loc 3 435 0
#APP
# 435 "src/output.c" 1
	movw %SS, %ax
# 0 "" 2
.LVL920:
#NO_APP
.LBE8489:
	movzwl	%ax, %eax
.LVL921:
	pushl	%eax
	.cfi_def_cfa_offset 12
	movzwl	2(%ebx), %eax
.LVL922:
	pushl	%eax
	.cfi_def_cfa_offset 16
	movzwl	(%ebx), %eax
	pushl	%eax
	.cfi_def_cfa_offset 20
	pushl	20(%ebx)
	.cfi_def_cfa_offset 24
	pushl	24(%ebx)
	.cfi_def_cfa_offset 28
	pushl	16(%ebx)
	.cfi_def_cfa_offset 32
	pushl	28(%ebx)
	.cfi_def_cfa_offset 36
	pushl	$.LC6
	.cfi_def_cfa_offset 40
	.cfi_escape 0x2e,0x20
	call	__dprintf.1654
	addl	$32, %esp
	.cfi_def_cfa_offset 8
	.loc 3 438 0
	movzwl	36(%ebx), %eax
	pushl	%eax
	.cfi_def_cfa_offset 12
	movzwl	32(%ebx), %eax
	pushl	%eax
	.cfi_def_cfa_offset 16
	movzwl	34(%ebx), %eax
	pushl	%eax
	.cfi_def_cfa_offset 20
	leal	38(%ebx), %eax
	pushl	%eax
	.cfi_def_cfa_offset 24
	pushl	12(%ebx)
	.cfi_def_cfa_offset 28
	pushl	4(%ebx)
	.cfi_def_cfa_offset 32
	pushl	8(%ebx)
	.cfi_def_cfa_offset 36
	pushl	$.LC7
	.cfi_def_cfa_offset 40
	call	__dprintf.1654
	addl	$32, %esp
	.cfi_def_cfa_offset 8
.L537:
	.loc 3 441 0
	popl	%ebx
.LVL923:
	ret
	.cfi_endproc
.LFE325:
	.size	dump_regs.10019, .-dump_regs.10019
	.section	.rodata.str1.1
.LC8:
	.string	"enter %s:\n"
	.section	.text.handle_05,"ax",@progbits
.globl handle_05
	.type	handle_05, @function
handle_05:
.LFB75:
	.loc 1 44 0
	.cfi_startproc
.LVL924:
	subl	$4, %esp
	.cfi_def_cfa_offset 8
.LBB8490:
.LBB8491:
	.loc 3 456 0
	pushl	$__func__.2025
	.cfi_def_cfa_offset 12
	pushl	$.LC8
	.cfi_def_cfa_offset 16
	movl	%eax, 8(%esp)
.LVL925:
	.cfi_escape 0x2e,0x8
	call	__dprintf.1654
	.loc 3 457 0
	movl	8(%esp), %eax
.LBE8491:
.LBE8490:
	.loc 1 46 0
	addl	$12, %esp
.LBB8493:
.LBB8492:
	.loc 3 457 0
	jmp	dump_regs.10019
	.cfi_def_cfa_offset 8
.LBE8492:
.LBE8493:
	.cfi_endproc
.LFE75:
	.size	handle_05, .-handle_05
	.section	.rodata.str1.1
.LC9:
	.string	"KBD: int09 handler: AL=0\n"
.LC10:
	.string	"KBD: int09h_handler(): unknown scancode read: 0x%02x!\n"
.LC11:
	.string	"KBD: scancode & asciicode are zero?\n"
	.section	.text.__process_key.27270,"ax",@progbits
	.type	__process_key.27270, @function
__process_key.27270:
.LFB870:
	.loc 11 377 0
	.cfi_startproc
.LVL926:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	pushl	%edi
	.cfi_def_cfa_offset 12
	pushl	%esi
	.cfi_def_cfa_offset 16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	subl	$24, %esp
	.cfi_def_cfa_offset 44
	.loc 11 378 0
	movl	$64, %ecx
#APP
# 378 "src/kbd.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB8494:
#APP
# 378 "src/kbd.c" 1
	movb %ES:23, %dl
# 0 "" 2
.LVL927:
#NO_APP
.LBE8494:
	.loc 11 379 0
#APP
# 379 "src/kbd.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB8495:
#APP
# 379 "src/kbd.c" 1
	movb %ES:24, %bl
# 0 "" 2
#NO_APP
	movl	%ebx, %esi
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 5, -8
.LVL928:
.LBE8495:
	.loc 11 380 0
#APP
# 380 "src/kbd.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB8496:
#APP
# 380 "src/kbd.c" 1
	movb %ES:150, %bl
# 0 "" 2
.LVL929:
#NO_APP
.LBE8496:
	.loc 11 382 0
	movzbl	%bl, %edi
	movl	%edi, 16(%esp)
	andl	$1, %edi
	je	.L541
	.loc 11 384 0
	andl	$127, %eax
.LVL930:
	cmpl	$29, %eax
	je	.L583
	.loc 11 388 0
	andl	$-2, %ebx
.LVL931:
.LBB8497:
	.loc 11 389 0
#APP
# 389 "src/kbd.c" 1
	movw %cx, %ES
# 0 "" 2
# 389 "src/kbd.c" 1
	movb %bl, %ES:150
# 0 "" 2
#NO_APP
	jmp	.L583
.LVL932:
.L541:
.LBE8497:
	.loc 11 403 0
	cmpb	$-99, %al
	je	.L552
	ja	.L561
	cmpb	$54, %al
	je	.L547
	ja	.L562
	cmpb	$29, %al
	je	.L545
	cmpb	$42, %al
	je	.L546
	testb	%al, %al
	je	.L544
	jmp	.L543
.L562:
	cmpb	$58, %al
	je	.L549
	ja	.L563
	cmpb	$56, %al
	jne	.L543
	jmp	.L590
.L563:
	cmpb	$69, %al
	je	.L550
	cmpb	$70, %al
	jne	.L543
	jmp	.L591
.L561:
	cmpb	$-70, %al
	je	.L556
	ja	.L564
	cmpb	$-74, %al
	je	.L554
	cmpb	$-72, %al
	je	.L555
	cmpb	$-86, %al
	jne	.L543
	jmp	.L592
.L564:
	cmpb	$-58, %al
	je	.L558
	ja	.L565
	cmpb	$-59, %al
	jne	.L543
	jmp	.L593
.L565:
	cmpb	$-32, %al
	je	.L559
	cmpb	$-31, %al
	jne	.L543
	jmp	.L594
.L544:
.LBB8498:
	.loc 11 405 0
	pushl	$.LC9
	.cfi_def_cfa_offset 48
	.cfi_escape 0x2e,0x4
	call	__dprintf.1654
.LVL933:
	popl	%esi
	.cfi_def_cfa_offset 44
.LVL934:
	.loc 11 406 0
	jmp	.L583
.LVL935:
.L549:
	.loc 11 409 0
	xorl	$64, %edx
.LVL936:
	.loc 11 410 0
	orl	$64, %esi
.LVL937:
	.loc 11 411 0
	jmp	.L566
.LVL938:
.L556:
	.loc 11 413 0
	andl	$-65, %esi
.LVL939:
	.loc 11 414 0
	jmp	.L566
.LVL940:
.L546:
	.loc 11 417 0
	orl	$2, %edx
.LVL941:
	.loc 11 418 0
	jmp	.L566
.LVL942:
.L592:
	.loc 11 420 0
	andl	$-3, %edx
.LVL943:
	.loc 11 421 0
	jmp	.L566
.LVL944:
.L547:
	.loc 11 424 0
	orl	$1, %edx
.LVL945:
	.loc 11 425 0
	jmp	.L566
.LVL946:
.L554:
	.loc 11 427 0
	andl	$-2, %edx
.LVL947:
	.loc 11 428 0
	jmp	.L566
.LVL948:
.L545:
	.loc 11 431 0
	orl	$4, %edx
.LVL949:
	.loc 11 432 0
	testb	$2, 16(%esp)
	je	.L567
	.loc 11 433 0
	orl	$4, %ebx
.LVL950:
	jmp	.L566
.LVL951:
.L567:
	.loc 11 435 0
	orl	$1, %esi
.LVL952:
	jmp	.L566
.LVL953:
.L552:
	.loc 11 438 0
	andl	$-5, %edx
.LVL954:
	.loc 11 439 0
	testb	$2, 16(%esp)
	je	.L568
	.loc 11 440 0
	andl	$-5, %ebx
.LVL955:
	jmp	.L566
.LVL956:
.L568:
	.loc 11 442 0
	andl	$-2, %esi
.LVL957:
	jmp	.L566
.LVL958:
.L590:
	.loc 11 446 0
	orl	$8, %edx
.LVL959:
	.loc 11 447 0
	testb	$2, 16(%esp)
	je	.L569
	.loc 11 448 0
	orl	$8, %ebx
.LVL960:
	jmp	.L566
.LVL961:
.L569:
	.loc 11 450 0
	orl	$2, %esi
.LVL962:
	jmp	.L566
.LVL963:
.L555:
	.loc 11 453 0
	andl	$-9, %edx
.LVL964:
	.loc 11 454 0
	testb	$2, 16(%esp)
	je	.L570
	.loc 11 455 0
	andl	$-9, %ebx
.LVL965:
	jmp	.L566
.LVL966:
.L570:
	.loc 11 457 0
	andl	$-3, %esi
.LVL967:
	jmp	.L566
.LVL968:
.L550:
	.loc 11 461 0
	orl	$32, %esi
.LVL969:
	.loc 11 462 0
	xorl	$32, %edx
.LVL970:
	.loc 11 463 0
	jmp	.L566
.LVL971:
.L593:
	.loc 11 465 0
	andl	$-33, %esi
.LVL972:
	.loc 11 466 0
	jmp	.L566
.LVL973:
.L591:
	.loc 11 469 0
	orl	$16, %esi
.LVL974:
	.loc 11 470 0
	xorl	$16, %edx
.LVL975:
	.loc 11 471 0
	jmp	.L566
.LVL976:
.L558:
	.loc 11 473 0
	andl	$-17, %esi
.LVL977:
	.loc 11 474 0
	jmp	.L566
.LVL978:
.L559:
	.loc 11 478 0
	orl	$2, %ebx
.LVL979:
.LBB8499:
	.loc 11 479 0
#APP
# 479 "src/kbd.c" 1
	movw %cx, %ES
# 0 "" 2
# 479 "src/kbd.c" 1
	movb %bl, %ES:150(%edi)
# 0 "" 2
#NO_APP
	jmp	.L583
.LVL980:
.L594:
.LBE8499:
	.loc 11 483 0
	orl	$1, %ebx
.LVL981:
	.loc 11 484 0
	jmp	.L566
.LVL982:
.L543:
	.loc 11 487 0
	testb	%al, %al
	js	.L566
	.loc 11 490 0
	cmpb	$83, %al
	jne	.L572
	movl	%edx, %ecx
.LVL983:
	andl	$12, %ecx
	cmpl	$12, %ecx
	jne	.L573
.LBB8500:
	.loc 11 494 0
	movl	$64, %eax
.LVL984:
#APP
# 494 "src/kbd.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
	movl	$4660, %eax
#APP
# 494 "src/kbd.c" 1
	movw %ax, %ES:114
# 0 "" 2
#NO_APP
.LBE8500:
	.loc 11 495 0
	.cfi_escape 0x2e,0x0
	call	reset_vector
.LVL985:
.L572:
	.loc 11 497 0
	cmpb	$88, %al
	jbe	.L573
	.loc 11 498 0
	movzbl	%al, %eax
.LVL986:
	pushl	%eax
	.cfi_def_cfa_offset 48
	pushl	$.LC10
	.cfi_def_cfa_offset 52
	.cfi_escape 0x2e,0x8
	call	__dprintf.1654
.LVL987:
	popl	%ecx
	.cfi_def_cfa_offset 48
	popl	%ebx
	.cfi_def_cfa_offset 44
.LVL988:
	.loc 11 500 0
	jmp	.L583
.LVL989:
.L573:
	.loc 11 503 0
	movzbl	%al, %edi
.LVL990:
	imull	$10, %edi, %edi
.LVL991:
	leal	scan_to_scanascii.27268(%edi), %ecx
.LVL992:
	.loc 11 504 0
	movzbl	%dl, %ebp
	testl	$8, %ebp
	je	.L574
.LBB8501:
	.loc 11 505 0
#APP
# 505 "src/kbd.c" 1
	movw %CS:6(%ecx), %ax
# 0 "" 2
.LVL993:
#NO_APP
	jmp	.L584
.LVL994:
.L574:
.LBE8501:
	.loc 11 507 0
	testl	$4, %ebp
	je	.L576
.LBB8502:
	.loc 11 508 0
#APP
# 508 "src/kbd.c" 1
	movw %CS:4(%ecx), %ax
# 0 "" 2
.LVL995:
#NO_APP
	jmp	.L584
.LVL996:
.L576:
.LBE8502:
	.loc 11 510 0
	testb	$2, 16(%esp)
	je	.L577
	cmpb	$70, %al
.LVL997:
	jbe	.L577
	cmpb	$83, %al
	ja	.L577
.LBB8503:
	.loc 11 514 0
#APP
# 514 "src/kbd.c" 1
	movw %CS:scan_to_scanascii.27268(%edi), %ax
# 0 "" 2
.LVL998:
#NO_APP
.LBE8503:
	shrw	$8, %ax
.LVL999:
	movb	$-32, %cl
.LVL1000:
	.loc 11 510 0
	jmp	.L575
.LVL1001:
.L577:
	.loc 11 515 0
	andl	$3, %ebp
	je	.L578
.LBB8504:
	.loc 11 519 0
#APP
# 519 "src/kbd.c" 1
	movb %CS:8(%ecx), %al
# 0 "" 2
.LVL1002:
#NO_APP
.LBE8504:
	testb	%dl, %al
	je	.L579
.LBB8505:
	.loc 11 520 0
#APP
# 520 "src/kbd.c" 1
	movw %CS:scan_to_scanascii.27268(%edi), %ax
# 0 "" 2
.LVL1003:
#NO_APP
	jmp	.L584
.LVL1004:
.L579:
.LBE8505:
.LBB8506:
	.loc 11 523 0
#APP
# 523 "src/kbd.c" 1
	movw %CS:2(%ecx), %ax
# 0 "" 2
.LVL1005:
#NO_APP
	jmp	.L584
.LVL1006:
.L578:
.LBE8506:
.LBB8507:
	.loc 11 528 0
#APP
# 528 "src/kbd.c" 1
	movb %CS:8(%ecx), %al
# 0 "" 2
.LVL1007:
#NO_APP
.LBE8507:
	testb	%dl, %al
	je	.L580
.LBB8508:
	.loc 11 529 0
#APP
# 529 "src/kbd.c" 1
	movw %CS:2(%ecx), %ax
# 0 "" 2
.LVL1008:
#NO_APP
	jmp	.L584
.LVL1009:
.L580:
.LBE8508:
.LBB8509:
	.loc 11 532 0
#APP
# 532 "src/kbd.c" 1
	movw %CS:scan_to_scanascii.27268(%edi), %ax
# 0 "" 2
.LVL1010:
#NO_APP
.L584:
.LBE8509:
	movb	%al, %cl
.LVL1011:
	.loc 11 533 0
	shrw	$8, %ax
.LVL1012:
.L575:
	.loc 11 536 0
	testb	%al, %al
	jne	.L581
	testb	%cl, %cl
	jne	.L581
	.loc 11 537 0
	pushl	$.LC11
	.cfi_def_cfa_offset 48
	movb	%al, 16(%esp)
.LVL1013:
	movb	%dl, 8(%esp)
.LVL1014:
	movb	%cl, 12(%esp)
.LVL1015:
	.cfi_escape 0x2e,0x4
	call	__dprintf.1654
	popl	%edx
	.cfi_def_cfa_offset 44
	movb	8(%esp), %cl
	movb	4(%esp), %dl
	movb	12(%esp), %al
.LVL1016:
.L581:
.LBB8510:
.LBB8511:
	.loc 11 53 0
	movl	$64, %edi
#APP
# 53 "src/kbd.c" 1
	movw %di, %ES
# 0 "" 2
#NO_APP
.LBB8512:
#APP
# 53 "src/kbd.c" 1
	movw %ES:128, %bp
# 0 "" 2
#NO_APP
	movw	%bp, 16(%esp)
.LBE8512:
	.loc 11 54 0
#APP
# 54 "src/kbd.c" 1
	movw %di, %ES
# 0 "" 2
#NO_APP
.LBB8513:
#APP
# 54 "src/kbd.c" 1
	movw %ES:130, %bp
# 0 "" 2
#NO_APP
	movw	%bp, 20(%esp)
.LBE8513:
	.loc 11 56 0
#APP
# 56 "src/kbd.c" 1
	movw %di, %ES
# 0 "" 2
#NO_APP
.LBB8514:
#APP
# 56 "src/kbd.c" 1
	movw %ES:26, %bp
# 0 "" 2
#NO_APP
	movw	%bp, 22(%esp)
.LBE8514:
	.loc 11 57 0
#APP
# 57 "src/kbd.c" 1
	movw %di, %ES
# 0 "" 2
#NO_APP
.LBB8515:
#APP
# 57 "src/kbd.c" 1
	movw %ES:28, %di
# 0 "" 2
#NO_APP
	movw	%di, 2(%esp)
.LBE8515:
	.loc 11 60 0
	addl	$2, %edi
.LVL1017:
	.loc 11 61 0
	cmpw	20(%esp), %di
	jb	.L582
	movl	16(%esp), %edi
.LVL1018:
.L582:
	.loc 11 64 0
	cmpw	22(%esp), %di
	je	.L566
.LBB8516:
	.loc 11 67 0
	movl	$64, %ebp
#APP
# 67 "src/kbd.c" 1
	movw %bp, %ES
# 0 "" 2
#NO_APP
	movzwl	2(%esp), %ebp
#APP
# 67 "src/kbd.c" 1
	movb %cl, %ES:(%ebp)
# 0 "" 2
#NO_APP
.LBE8516:
.LBB8517:
	.loc 11 68 0
	movl	$64, %ecx
.LVL1019:
#APP
# 68 "src/kbd.c" 1
	movw %cx, %ES
# 0 "" 2
# 68 "src/kbd.c" 1
	movb %al, %ES:1(%ebp)
# 0 "" 2
#NO_APP
.LBE8517:
.LBB8518:
	.loc 11 69 0
#APP
# 69 "src/kbd.c" 1
	movw %cx, %ES
# 0 "" 2
# 69 "src/kbd.c" 1
	movw %di, %ES:28
# 0 "" 2
.LVL1020:
#NO_APP
.L566:
.LBE8518:
.LBE8511:
.LBE8510:
.LBE8498:
	.loc 11 541 0
	andl	$-3, %ebx
.LVL1021:
.LBB8519:
	.loc 11 543 0
	movl	$64, %eax
.LVL1022:
#APP
# 543 "src/kbd.c" 1
	movw %ax, %ES
# 0 "" 2
# 543 "src/kbd.c" 1
	movb %dl, %ES:23
# 0 "" 2
#NO_APP
.LBE8519:
.LBB8520:
	.loc 11 544 0
#APP
# 544 "src/kbd.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
	movl	%esi, %edx
.LVL1023:
#APP
# 544 "src/kbd.c" 1
	movb %dl, %ES:24
# 0 "" 2
#NO_APP
.LBE8520:
.LBB8521:
	.loc 11 545 0
#APP
# 545 "src/kbd.c" 1
	movw %ax, %ES
# 0 "" 2
# 545 "src/kbd.c" 1
	movb %bl, %ES:150
# 0 "" 2
.LVL1024:
#NO_APP
.L583:
.LBE8521:
	.loc 11 546 0
	addl	$24, %esp
	popl	%ebx
.LVL1025:
	popl	%esi
.LVL1026:
	popl	%edi
.LVL1027:
	popl	%ebp
	ret
	.cfi_endproc
.LFE870:
	.size	__process_key.27270, .-__process_key.27270
	.section	.text.process_key.1705,"ax",@progbits
	.type	process_key.1705, @function
process_key.1705:
.LFB871:
	.loc 11 550 0
	.cfi_startproc
.LVL1028:
	pushl	%edi
	.cfi_def_cfa_offset 8
	pushl	%esi
	.cfi_def_cfa_offset 12
	pushl	%ebx
	.cfi_def_cfa_offset 16
.LBB8522:
	.loc 11 558 0
	movzbl	%al, %eax
.LVL1029:
	orb	$79, %ah
#APP
# 558 "src/kbd.c" 1
	pushl %ebp
sti
stc
int $21
pushfl
popl %ecx
cli
cld
popl %ebp
# 0 "" 2
.LVL1030:
	.loc 11 559 0
#NO_APP
	andb	$1, %cl
.LVL1031:
	je	.L597
	.cfi_offset 3, -16
	.cfi_offset 6, -12
	.cfi_offset 7, -8
.LBE8522:
	.loc 11 563 0
	movzbl	%al, %eax
.LVL1032:
	.loc 11 564 0
	popl	%ebx
	popl	%esi
	popl	%edi
	.loc 11 563 0
	jmp	__process_key.27270
.LVL1033:
.L597:
	.loc 11 564 0
	popl	%ebx
	popl	%esi
	popl	%edi
	ret
	.cfi_endproc
.LFE871:
	.size	process_key.1705, .-process_key.1705
	.section	.text.prockeys.72633,"ax",@progbits
	.type	prockeys.72633, @function
prockeys.72633:
.LFB2276:
	.file 26 "src/usb-hid.c"
	.loc 26 127 0
	.cfi_startproc
.LVL1034:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	movl	%eax, %ebx
	.cfi_offset 3, -8
	.loc 26 128 0
	cmpw	$255, %ax
	jbe	.L599
.LBB8523:
	.loc 26 129 0
	shrw	$8, %ax
.LVL1035:
	.loc 26 130 0
	cmpb	$-31, %al
.LVL1036:
	jne	.L600
	.loc 26 132 0
	movl	$225, %eax
.LVL1037:
	call	process_key.1705
	.loc 26 133 0
	andl	$-128, %ebx
.LVL1038:
	movb	%bl, %al
	orl	$29, %eax
	movzbl	%al, %eax
	call	process_key.1705
	.loc 26 134 0
	orl	$69, %ebx
	jmp	.L599
.LVL1039:
.L600:
	.loc 26 137 0
	movzbl	%al, %eax
.LVL1040:
	call	process_key.1705
.LVL1041:
.L599:
.LBE8523:
	.loc 26 139 0
	movzbl	%bl, %eax
.LVL1042:
	.loc 26 140 0
	popl	%ebx
	.loc 26 139 0
	jmp	process_key.1705
.LVL1043:
	.cfi_endproc
.LFE2276:
	.size	prockeys.72633, .-prockeys.72633
	.section	.text.handle_key.72733,"ax",@progbits
	.type	handle_key.72733, @function
handle_key.72733:
.LFB2279:
	.loc 26 166 0
	.cfi_startproc
.LVL1044:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	movl	%esp, %ebp
	.cfi_offset 5, -8
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$24, %esp
	movl	%eax, %esi
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
.LBB8524:
.LBB8525:
	.loc 10 249 0
	movl	$64, %eax
.LVL1045:
#APP
# 249 "src/biosvar.h" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB8526:
#APP
# 249 "src/biosvar.h" 1
	movw %ES:14, %ax
# 0 "" 2
#NO_APP
	movw	%ax, -30(%ebp)
.LBE8526:
.LBE8525:
.LBE8524:
	.loc 26 172 0
#APP
# 172 "src/usb-hid.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB8527:
.LBB8528:
#APP
# 172 "src/usb-hid.c" 1
	movl %ES:290, %edx
# 0 "" 2
# 172 "src/usb-hid.c" 1
	movl %ES:294, %eax
# 0 "" 2
#NO_APP
.LBE8528:
.LBE8527:
	movl	%edx, -20(%ebp)
	movl	%eax, -16(%ebp)
	movb	-19(%ebp), %dl
	movl	$1, %edi
	xorl	%ebx, %ebx
.LVL1046:
.LVL1047:
.L611:
.LBB8529:
	.loc 26 178 0
	movb	-19(%ebp,%edi), %al
.LVL1048:
	.loc 26 179 0
	testb	%al, %al
	jne	.L603
	jmp	.L627
.L629:
.LBB8530:
.LBB8531:
	.loc 26 145 0
	cmpb	$99, %al
	ja	.L605
.LBB8532:
	.loc 26 147 0
	movzbl	%al, %eax
.LVL1049:
#APP
# 147 "src/usb-hid.c" 1
	movw %CS:KeyToScanCode.72626(%eax,%eax), %ax
# 0 "" 2
.LVL1050:
#NO_APP
.LBE8532:
	.loc 26 148 0
	testw	%ax, %ax
	je	.L605
	.loc 26 149 0
	orb	$-128, %al
.LVL1051:
	movzwl	%ax, %eax
	movb	%dl, -36(%ebp)
	call	prockeys.72633
.LVL1052:
	movb	-36(%ebp), %dl
.LVL1053:
.L605:
.LBE8531:
.LBE8530:
	.loc 26 186 0
	cmpl	$6, %edi
	je	.L606
	cmpb	$0, -18(%ebp,%edi)
	jne	.L607
.L606:
	movb	$-1, %dl
	jmp	.L607
.LVL1054:
.L603:
	xorl	%ecx, %ecx
.LVL1055:
.L610:
	.loc 26 191 0
	cmpb	%al, 2(%esi,%ecx)
	jne	.L608
	.loc 26 193 0
	movb	$0, 2(%esi,%ecx)
	.loc 26 194 0
	movb	%al, -18(%ebp,%ebx)
	incl	%ebx
.LVL1056:
	.loc 26 195 0
	jmp	.L607
.L608:
	.loc 26 182 0
	incl	%ecx
.LVL1057:
	.loc 26 183 0
	cmpl	$6, %ecx
	jne	.L610
	jmp	.L629
.LVL1058:
.L607:
	incl	%edi
.LBE8529:
	.loc 26 177 0
	cmpl	$7, %edi
	jne	.L611
.L627:
	movb	%dl, -19(%ebp)
	.loc 26 199 0
	movb	-20(%ebp), %cl
.LVL1059:
	movb	%cl, -31(%ebp)
	movb	(%esi), %dl
.LVL1060:
	notl	%edx
.LVL1061:
	andl	%ecx, %edx
.LVL1062:
	movl	$ModifierToScanCode.72627, -28(%ebp)
	movl	$ModifierToScanCode.72627, -24(%ebp)
	xorl	%edi, %edi
.LVL1063:
	jmp	.L612
.LVL1064:
.L614:
.LBB8533:
.LBB8534:
	.loc 26 157 0
	movzbl	%dl, %eax
.LVL1065:
	btl	%edi, %eax
	jnc	.L613
.LBB8535:
	.loc 26 159 0
	movl	-24(%ebp), %ecx
#APP
# 159 "src/usb-hid.c" 1
	movw %CS:(%ecx), %ax
# 0 "" 2
.LVL1066:
#NO_APP
.LBE8535:
	orb	$-128, %al
	movzwl	%ax, %eax
	movb	%dl, -36(%ebp)
	call	prockeys.72633
	.loc 26 160 0
	movl	$1, %eax
	movl	%edi, %ecx
.LVL1067:
	sall	%cl, %eax
	notl	%eax
	movb	-36(%ebp), %dl
	andl	%eax, %edx
.LVL1068:
.L613:
	.loc 26 156 0
	incl	%edi
.LVL1069:
	addl	$2, -24(%ebp)
.LVL1070:
.L612:
	testb	%dl, %dl
	jne	.L614
.LBE8534:
.LBE8533:
	.loc 26 202 0
	movb	-31(%ebp), %dl
.LVL1071:
	notl	%edx
.LVL1072:
	andb	(%esi), %dl
.LVL1073:
	xorl	%edi, %edi
.LVL1074:
	jmp	.L615
.LVL1075:
.L617:
.LBB8536:
.LBB8537:
	.loc 26 157 0
	movzbl	%dl, %eax
.LVL1076:
	btl	%edi, %eax
	jnc	.L616
.LBB8538:
	.loc 26 159 0
	movl	-28(%ebp), %ecx
#APP
# 159 "src/usb-hid.c" 1
	movw %CS:(%ecx), %ax
# 0 "" 2
.LVL1077:
#NO_APP
.LBE8538:
	movzwl	%ax, %eax
.LVL1078:
	movb	%dl, -36(%ebp)
	call	prockeys.72633
.LVL1079:
	.loc 26 160 0
	movl	$1, %eax
	movl	%edi, %ecx
.LVL1080:
	sall	%cl, %eax
	notl	%eax
	movb	-36(%ebp), %dl
	andl	%eax, %edx
.LVL1081:
.L616:
	.loc 26 156 0
	incl	%edi
.LVL1082:
	addl	$2, -28(%ebp)
.LVL1083:
.L615:
	testb	%dl, %dl
	jne	.L617
.LBE8537:
.LBE8536:
	.loc 26 203 0
	movb	(%esi), %al
.LVL1084:
	movb	%al, -20(%ebp)
	movb	-19(%ebp), %al
	xorl	%edi, %edi
.LVL1085:
.L620:
.LBB8539:
	.loc 26 205 0
	movb	2(%esi,%edi), %dl
.LVL1086:
	.loc 26 206 0
	testb	%dl, %dl
	je	.L618
.LBB8540:
.LBB8541:
	.loc 26 145 0
	cmpb	$99, %dl
	ja	.L619
.LBB8542:
	.loc 26 147 0
	movzbl	%dl, %eax
.LVL1087:
#APP
# 147 "src/usb-hid.c" 1
	movw %CS:KeyToScanCode.72626(%eax,%eax), %ax
# 0 "" 2
.LVL1088:
#NO_APP
.LBE8542:
	.loc 26 148 0
	testw	%ax, %ax
	je	.L619
	.loc 26 149 0
	movzwl	%ax, %eax
.LVL1089:
	movb	%dl, -36(%ebp)
	call	prockeys.72633
.LVL1090:
	movb	-36(%ebp), %dl
.LVL1091:
.L619:
.LBE8541:
.LBE8540:
	.loc 26 210 0
	movb	%dl, -18(%ebp,%ebx)
	incl	%ebx
.LVL1092:
	movb	$16, %al
.LVL1093:
.L618:
.LBE8539:
	.loc 26 204 0
	incl	%edi
.LVL1094:
	cmpl	$6, %edi
	jne	.L620
	movb	%al, -19(%ebp)
	.loc 26 213 0
	cmpl	$5, %ebx
	ja	.L621
	.loc 26 214 0
	movb	$0, -18(%ebp,%ebx)
	.loc 26 217 0
	testl	%ebx, %ebx
	je	.L622
.L621:
	.loc 26 218 0
	movb	-19(%ebp), %al
	testb	%al, %al
	jne	.L623
	.loc 26 219 0
	movb	-19(%ebp,%ebx), %al
.LBB8543:
.LBB8544:
	.loc 26 145 0
	cmpb	$99, %al
	ja	.L622
.LBB8545:
	.loc 26 147 0
	movzbl	%al, %eax
#APP
# 147 "src/usb-hid.c" 1
	movw %CS:KeyToScanCode.72626(%eax,%eax), %ax
# 0 "" 2
.LVL1095:
#NO_APP
.LBE8545:
	.loc 26 148 0
	testw	%ax, %ax
	je	.L622
	.loc 26 149 0
	movzwl	%ax, %eax
.LVL1096:
	call	prockeys.72633
.LVL1097:
	jmp	.L622
.LVL1098:
.L623:
.LBE8544:
.LBE8543:
	.loc 26 220 0
	cmpb	$-1, %al
	je	.L622
	.loc 26 221 0
	decl	%eax
	movb	%al, -19(%ebp)
.LVL1099:
.L622:
.LBB8546:
	.loc 26 225 0
	movl	-16(%ebp), %eax
.LVL1100:
#APP
# 225 "src/usb-hid.c" 1
	movw -30(%ebp), %ES
# 0 "" 2
#NO_APP
.LBB8547:
	movl	-20(%ebp), %edx
.LVL1101:
#APP
# 225 "src/usb-hid.c" 1
	movl %edx, %ES:290
# 0 "" 2
# 225 "src/usb-hid.c" 1
	movl %eax, %ES:294
# 0 "" 2
#NO_APP
.LBE8547:
.LBE8546:
	.loc 26 226 0
	addl	$24, %esp
	popl	%ebx
.LVL1102:
	popl	%esi
.LVL1103:
	popl	%edi
.LVL1104:
	leave
	ret
	.cfi_endproc
.LFE2279:
	.size	handle_key.72733, .-handle_key.72733
	.section	.text.handle_08,"ax",@progbits
.globl handle_08
	.type	handle_08, @function
handle_08:
.LFB1120:
	.loc 7 439 0
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	pushl	%esi
	.cfi_def_cfa_offset 12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	subl	$8, %esp
	.cfi_def_cfa_offset 24
.LBB8548:
.LBB8549:
	.loc 5 606 0
	movl	$64, %edx
#APP
# 606 "src/floppy.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB8550:
#APP
# 606 "src/floppy.c" 1
	movb %ES:64, %al
# 0 "" 2
.LVL1105:
#NO_APP
.LBE8550:
	.loc 5 607 0
	testb	%al, %al
	je	.L631
	.cfi_offset 3, -16
	.cfi_offset 6, -12
	.cfi_offset 7, -8
	.loc 5 608 0
	decl	%eax
.LVL1106:
.LBB8551:
	.loc 5 609 0
#APP
# 609 "src/floppy.c" 1
	movw %dx, %ES
# 0 "" 2
# 609 "src/floppy.c" 1
	movb %al, %ES:64
# 0 "" 2
#NO_APP
.LBE8551:
	.loc 5 610 0
	testb	%al, %al
	jne	.L631
.LBB8552:
.LBB8553:
	.loc 2 92 0
	movl	$1010, %edx
#APP
# 92 "src/ioport.h" 1
	inb %dx, %al
# 0 "" 2
.LVL1107:
#NO_APP
.LBE8553:
.LBE8552:
.LBB8554:
.LBB8555:
	.loc 2 82 0
	andl	$207, %eax
.LVL1108:
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
.LVL1109:
#NO_APP
.L631:
.LBE8555:
.LBE8554:
.LBE8549:
.LBE8548:
	.loc 7 444 0
	movl	$64, %edx
#APP
# 444 "src/clock.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB8556:
#APP
# 444 "src/clock.c" 1
	movl %ES:108, %eax
# 0 "" 2
.LVL1110:
#NO_APP
.LBE8556:
	.loc 7 445 0
	incl	%eax
.LVL1111:
	.loc 7 447 0
	cmpl	$1573039, %eax
	jbe	.L632
.LBB8557:
	.loc 7 450 0
#APP
# 450 "src/clock.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB8558:
#APP
# 450 "src/clock.c" 1
	movb %ES:112, %al
# 0 "" 2
.LVL1112:
#NO_APP
.LBE8558:
	incl	%eax
.LVL1113:
#APP
# 450 "src/clock.c" 1
	movb %al, %ES:112
# 0 "" 2
#NO_APP
	xorl	%eax, %eax
.LVL1114:
.L632:
.LBE8557:
.LBB8559:
	.loc 7 453 0
	movl	$64, %edx
#APP
# 453 "src/clock.c" 1
	movw %dx, %ES
# 0 "" 2
# 453 "src/clock.c" 1
	movl %eax, %ES:108
# 0 "" 2
#NO_APP
.LBE8559:
.LBB8560:
.LBB8561:
.LBB8562:
	.loc 26 233 0
#APP
# 233 "src/usb-hid.c" 1
	movl %CS:keyboard_pipe, %esi
# 0 "" 2
.LVL1115:
#NO_APP
.LBE8562:
	.loc 26 234 0
	testl	%esi, %esi
	je	.L633
.L636:
.LBB8563:
	.loc 26 239 0
	movl	%esp, %edx
	movl	%esi, %eax
.LVL1116:
	call	usb_poll_intr.60867
	.loc 26 240 0
	testl	%eax, %eax
.LVL1117:
	jne	.L633
	.loc 26 242 0
	movl	%esp, %eax
.LVL1118:
	call	handle_key.72733
	jmp	.L636
.LVL1119:
.L633:
.LBE8563:
.LBE8561:
.LBE8560:
	.loc 7 459 0
	xorl	%eax, %eax
.LVL1120:
#APP
# 459 "src/clock.c" 1
	pushl %ebp
sti
stc
int $28
pushfl
popl %ecx
cli
cld
popl %ebp
# 0 "" 2
.LVL1121:
#NO_APP
.LBB8564:
.LBB8565:
.LBB8566:
	.loc 2 82 0
	movb	$32, %al
.LVL1122:
#APP
# 82 "src/ioport.h" 1
	outb %al, $32
# 0 "" 2
#NO_APP
.LBE8566:
.LBE8565:
.LBE8564:
	.loc 7 462 0
	popl	%edi
	.cfi_def_cfa_offset 20
	popl	%eax
	.cfi_def_cfa_offset 16
	popl	%ebx
	popl	%esi
	popl	%edi
	ret
	.cfi_endproc
.LFE1120:
	.size	handle_08, .-handle_08
	.section	.rodata.str1.1
.LC12:
	.string	"WARNING - Timeout at %s:%d!\n"
	.section	.text.await_not_bsy.20152,"ax",@progbits
	.type	await_not_bsy.20152, @function
await_not_bsy.20152:
.LFB665:
	.file 27 "src/ata.c"
	.loc 27 49 0
	.cfi_startproc
.LVL1123:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	movl	%esp, %ebp
	.cfi_offset 5, -8
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$16, %esp
	movl	%eax, %ebx
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
.LBB8567:
.LBB8568:
.LBB8569:
.LBB8570:
.LBB8571:
	.loc 7 135 0
#APP
# 135 "src/clock.c" 1
	movl %CS:cpu_khz, %ecx
# 0 "" 2
.LVL1124:
#NO_APP
.LBE8571:
.LBB8572:
.LBB8573:
	.loc 8 85 0
#APP
# 85 "src/util.h" 1
	rdtsc
# 0 "" 2
.LVL1125:
#NO_APP
	movl	%eax, -20(%ebp)
	movl	%edx, -16(%ebp)
.LBE8573:
.LBE8572:
	.loc 7 136 0
	movl	$32000, %esi
	movl	%ecx, %eax
	mull	%esi
	movl	%eax, -28(%ebp)
	movl	%edx, -24(%ebp)
	movl	-20(%ebp), %eax
	movl	-16(%ebp), %edx
	addl	%eax, -28(%ebp)
	adcl	%edx, -24(%ebp)
.LBE8570:
.LBE8569:
.LBB8574:
.LBB8575:
.LBB8576:
	.loc 2 92 0
	addl	$7, %ebx
.LVL1126:
.L642:
	movl	%ebx, %edx
#APP
# 92 "src/ioport.h" 1
	inb %dx, %al
# 0 "" 2
.LVL1127:
#NO_APP
.LBE8576:
.LBE8575:
	.loc 27 36 0
	testb	%al, %al
	js	.L638
	.loc 27 37 0
	movzbl	%al, %eax
.LVL1128:
	jmp	.L639
.LVL1129:
.L638:
.LBB8577:
.LBB8578:
.LBB8579:
	.loc 8 85 0
#APP
# 85 "src/util.h" 1
	rdtsc
# 0 "" 2
.LVL1130:
#NO_APP
	movl	%eax, -20(%ebp)
	movl	%edx, -16(%ebp)
.LBE8579:
.LBE8578:
.LBE8577:
	.loc 27 38 0
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %edx
	subl	%eax, -20(%ebp)
	sbbl	%edx, -16(%ebp)
	cmpl	$0, -16(%ebp)
	jl	.L640
	jg	.L644
	cmpl	$0, -20(%ebp)
	jbe	.L640
.L644:
.LBB8580:
.LBB8581:
	.loc 3 508 0
	pushl	$39
	pushl	$__func__.20137
	pushl	$.LC12
	.cfi_escape 0x2e,0xc
	call	__dprintf.1654
.LVL1131:
	addl	$12, %esp
	orl	$-1, %eax
	jmp	.L639
.LVL1132:
.L640:
.LBE8581:
.LBE8580:
.LBB8582:
.LBB8583:
.LBB8584:
.LBB8585:
	.loc 6 72 0
#APP
# 72 "src/util.c" 1
	sti
nop
rep ; nop
cli
cld

# 0 "" 2
#NO_APP
	jmp	.L642
.L639:
.LBE8585:
.LBE8584:
.LBE8583:
.LBE8582:
.LBE8574:
.LBE8568:
.LBE8567:
	.loc 27 51 0
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
	.cfi_endproc
.LFE665:
	.size	await_not_bsy.20152, .-await_not_bsy.20152
	.section	.text.ata_pio_transfer.20669,"ax",@progbits
	.type	ata_pio_transfer.20669, @function
ata_pio_transfer.20669:
.LFB675:
	.loc 27 298 0
	.cfi_startproc
.LVL1133:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	pushl	%edi
	.cfi_def_cfa_offset 12
	pushl	%esi
	.cfi_def_cfa_offset 16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	subl	$36, %esp
	.cfi_def_cfa_offset 56
	movl	%eax, %ebx
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 5, -8
	movl	%edx, 20(%esp)
	movl	%ecx, 12(%esp)
.LBB8586:
	.loc 27 304 0
	movl	12(%eax), %eax
.LVL1134:
#APP
# 304 "src/ata.c" 1
	movl %CS:36(%eax), %eax
# 0 "" 2
.LVL1135:
#NO_APP
.LBE8586:
.LBB8587:
	.loc 27 305 0
#APP
# 305 "src/ata.c" 1
	movw %CS:-983040(%eax), %dx
# 0 "" 2
.LVL1136:
#NO_APP
	movw	%dx, 6(%esp)
.LBE8587:
.LBB8588:
	.loc 27 306 0
#APP
# 306 "src/ata.c" 1
	movw %CS:-983038(%eax), %cx
# 0 "" 2
.LVL1137:
#NO_APP
.LBE8588:
	.loc 27 307 0
	movzwl	16(%ebx), %ebp
.LVL1138:
	.loc 27 308 0
	movl	8(%ebx), %esi
	movl	%esi, (%esp)
.LBB8589:
.LBB8590:
	.loc 25 155 0
	movl	$2, %edx
	movl	12(%esp), %eax
.LVL1139:
	movl	%edx, %esi
	cltd
	idivl	%esi
	movzwl	%ax, %edi
	movl	%edi, 16(%esp)
	movl	$0, 8(%esp)
.LBE8590:
.LBE8589:
.LBB8594:
.LBB8595:
.LBB8596:
.LBB8597:
	.loc 2 92 0
	addl	$2, %ecx
.LVL1140:
	movw	%cx, 26(%esp)
.LBE8597:
.LBE8596:
	.loc 27 67 0
	movzwl	6(%esp), %eax
	movl	%eax, 28(%esp)
.LBE8595:
.LBE8594:
	.loc 27 336 0
	leal	-1(%ebp), %edx
	movl	%edx, 32(%esp)
.LVL1141:
.L652:
	.loc 27 311 0
	cmpl	$0, 20(%esp)
	je	.L646
.LBB8601:
.LBB8593:
	.loc 25 154 0
	movl	(%esp), %eax
	shrl	$4, %eax
#APP
# 154 "src/farptr.h" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB8591:
.LBB8592:
	.loc 2 124 0
	movl	(%esp), %esi
	andl	$15, %esi
	movl	16(%esp), %ecx
.LVL1142:
	movw	6(%esp), %dx
#APP
# 124 "src/ioport.h" 1
	rep outsw %es:(%esi), (%dx)
# 0 "" 2
.LVL1143:
#NO_APP
	jmp	.L647
.LVL1144:
.L646:
.LBE8592:
.LBE8591:
.LBE8593:
.LBE8601:
.LBB8602:
.LBB8603:
	.loc 25 142 0
	movl	(%esp), %eax
	shrl	$4, %eax
#APP
# 142 "src/farptr.h" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB8604:
.LBB8605:
	.loc 2 111 0
	movl	(%esp), %edi
.LVL1145:
	andl	$15, %edi
	movl	16(%esp), %ecx
.LVL1146:
	movw	6(%esp), %dx
#APP
# 111 "src/ioport.h" 1
	rep insw (%dx), %es:(%edi)
# 0 "" 2
.LVL1147:
#NO_APP
.L647:
.LBE8605:
.LBE8604:
.LBE8603:
.LBE8602:
.LBB8606:
.LBB8600:
.LBB8599:
.LBB8598:
	.loc 2 92 0
	movw	26(%esp), %dx
#APP
# 92 "src/ioport.h" 1
	inb %dx, %al
# 0 "" 2
.LVL1148:
#NO_APP
.LBE8598:
.LBE8599:
	.loc 27 67 0
	movl	28(%esp), %eax
.LVL1149:
	call	await_not_bsy.20152
.LVL1150:
.LBE8600:
.LBE8606:
	.loc 27 329 0
	testl	%eax, %eax
.LVL1151:
	jns	.L648
	.loc 27 331 0
	subw	%bp, 16(%ebx)
.LVL1152:
	.loc 27 332 0
	jmp	.L649
.LVL1153:
.L648:
	.loc 27 335 0
	decl	%ebp
.LVL1154:
	.loc 27 336 0
	movl	8(%esp), %edx
	cmpl	%edx, 32(%esp)
	je	.L650
	incl	%edx
	movl	%edx, 8(%esp)
	.loc 27 339 0
	andl	$137, %eax
.LVL1155:
	cmpl	$8, %eax
	jne	.L651
	.loc 27 297 0
	movl	12(%esp), %esi
.LVL1156:
	addl	%esi, (%esp)
	jmp	.L652
.LVL1157:
.L651:
	.loc 27 342 0
	subw	%bp, 16(%ebx)
.LVL1158:
	movl	$-6, %eax
.LVL1159:
	.loc 27 343 0
	jmp	.L649
.LVL1160:
.L650:
	.loc 27 347 0
	andl	$169, %eax
.LVL1161:
	.loc 27 349 0
	cmpl	$0, 20(%esp)
	jne	.L653
	.loc 27 350 0
	andl	$-33, %eax
.L653:
	.loc 27 351 0
	testl	%eax, %eax
	je	.L649
	movl	$-7, %eax
.L649:
.LVL1162:
	.loc 27 357 0
	addl	$36, %esp
	popl	%ebx
.LVL1163:
	popl	%esi
.LVL1164:
	popl	%edi
.LVL1165:
	popl	%ebp
.LVL1166:
	ret
	.cfi_endproc
.LFE675:
	.size	ata_pio_transfer.20669, .-ata_pio_transfer.20669
	.section	.text.ndelay_await_not_bsy.20173,"ax",@progbits
	.type	ndelay_await_not_bsy.20173, @function
ndelay_await_not_bsy.20173:
.LFB668:
	.loc 27 73 0
	.cfi_startproc
.LVL1167:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	movl	%esp, %ebp
	.cfi_offset 5, -8
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$8, %esp
	movl	%eax, %ecx
.LBB8607:
.LBB8608:
	.loc 7 112 0
#APP
# 112 "src/clock.c" 1
	movl %CS:cpu_khz, %ebx
# 0 "" 2
.LVL1168:
#NO_APP
.LBE8608:
.LBB8609:
.LBB8610:
.LBB8611:
.LBB8612:
	.loc 8 85 0
#APP
# 85 "src/util.h" 1
	rdtsc
# 0 "" 2
.LVL1169:
#NO_APP
	movl	%eax, -20(%ebp)
	movl	%edx, -16(%ebp)
.LBE8612:
.LBE8611:
	.loc 7 97 0
	imull	$400, %ebx, %eax
	movl	$1000000, %edx
	movl	%edx, %ebx
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
.LVL1170:
	xorl	%edx, %edx
	divl	%ebx
	movl	%eax, %ebx
.LVL1171:
	xorl	%esi, %esi
.LVL1172:
	addl	-20(%ebp), %ebx
.LVL1173:
	adcl	-16(%ebp), %esi
.LVL1174:
	jmp	.L656
.L657:
.LBB8613:
.LBB8614:
	.loc 8 36 0
#APP
# 36 "src/util.h" 1
	rep ; nop
# 0 "" 2
#NO_APP
.L656:
.LBE8614:
.LBE8613:
.LBB8615:
.LBB8616:
.LBB8617:
	.loc 8 85 0
#APP
# 85 "src/util.h" 1
	rdtsc
# 0 "" 2
#NO_APP
	movl	%eax, -20(%ebp)
	movl	%edx, -16(%ebp)
.LBE8617:
.LBE8616:
.LBE8615:
	.loc 7 98 0
	subl	%ebx, -20(%ebp)
	sbbl	%esi, -16(%ebp)
	cmpl	$0, -16(%ebp)
	jl	.L657
	jg	.L660
	cmpl	$0, -20(%ebp)
	jbe	.L657
.L660:
.LBE8610:
.LBE8609:
.LBE8607:
	.loc 27 75 0
	movzwl	%cx, %eax
.LVL1175:
	.loc 27 76 0
	popl	%edx
	popl	%ecx
	popl	%ebx
.LVL1176:
	popl	%esi
.LVL1177:
	popl	%edi
	leave
	.loc 27 75 0
	jmp	await_not_bsy.20152
.LVL1178:
	.cfi_endproc
.LFE668:
	.size	ndelay_await_not_bsy.20173, .-ndelay_await_not_bsy.20173
	.section	.text.send_cmd.20413,"ax",@progbits
	.type	send_cmd.20413, @function
send_cmd.20413:
.LFB672:
	.loc 27 193 0
	.cfi_startproc
.LVL1179:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	pushl	%edi
	.cfi_def_cfa_offset 12
	pushl	%esi
	.cfi_def_cfa_offset 16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	subl	$4, %esp
	.cfi_def_cfa_offset 24
	movl	%edx, %esi
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 5, -8
.LBB8618:
	.loc 27 194 0
#APP
# 194 "src/ata.c" 1
	movl %CS:36(%eax), %edx
# 0 "" 2
.LVL1180:
#NO_APP
.LBE8618:
.LBB8619:
	.loc 27 195 0
#APP
# 195 "src/ata.c" 1
	movb %CS:40(%eax), %cl
# 0 "" 2
#NO_APP
	movb	%cl, 3(%esp)
.LBE8619:
.LBB8620:
	.loc 27 196 0
#APP
# 196 "src/ata.c" 1
	movw %CS:-983040(%edx), %bx
# 0 "" 2
.LVL1181:
#NO_APP
.LBE8620:
	.loc 27 199 0
	movzwl	%bx, %ebp
	movl	%ebp, %eax
.LVL1182:
	call	await_not_bsy.20152
.LVL1183:
	.loc 27 200 0
	testl	%eax, %eax
.LVL1184:
	js	.L662
	.loc 27 203 0
	movb	5(%esi), %al
.LVL1185:
	cmpb	$1, 3(%esp)
	sbbl	%edi, %edi
	andl	$-16, %edi
	subl	$80, %edi
.LVL1186:
	andl	$79, %eax
	orl	%eax, %edi
.LVL1187:
	.loc 27 204 0
	leal	6(%ebx), %edx
.LBB8621:
.LBB8622:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb %dx, %al
# 0 "" 2
#NO_APP
	movb	%al, %cl
.LBE8622:
.LBE8621:
.LBB8623:
.LBB8624:
	.loc 2 82 0
	movl	%edi, %eax
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE8624:
.LBE8623:
	.loc 27 206 0
	xorl	%edi, %ecx
	andb	$16, %cl
	je	.L665
	.loc 27 208 0
	movl	%ebp, %eax
	call	ndelay_await_not_bsy.20173
	.loc 27 209 0
	testl	%eax, %eax
.LVL1188:
	js	.L662
.L665:
	.loc 27 214 0
	movb	6(%esi), %cl
	movl	%ecx, %eax
.LVL1189:
	andl	$238, %eax
	cmpl	$36, %eax
	jne	.L666
.LBB8625:
.LBB8626:
	.loc 2 82 0
	movb	7(%esi), %al
	leal	1(%ebx), %edx
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE8626:
.LBE8625:
.LBB8627:
.LBB8628:
	movb	8(%esi), %al
	leal	2(%ebx), %edx
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE8628:
.LBE8627:
.LBB8629:
.LBB8630:
	movb	9(%esi), %al
	leal	3(%ebx), %edx
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE8630:
.LBE8629:
.LBB8631:
.LBB8632:
	movb	10(%esi), %al
	leal	4(%ebx), %edx
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE8632:
.LBE8631:
.LBB8633:
.LBB8634:
	movb	11(%esi), %al
	leal	5(%ebx), %edx
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.L666:
.LBE8634:
.LBE8633:
.LBB8635:
.LBB8636:
	movb	(%esi), %al
	leal	1(%ebx), %edx
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE8636:
.LBE8635:
.LBB8637:
.LBB8638:
	movb	1(%esi), %al
	leal	2(%ebx), %edx
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE8638:
.LBE8637:
.LBB8639:
.LBB8640:
	movb	2(%esi), %al
	leal	3(%ebx), %edx
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE8640:
.LBE8639:
.LBB8641:
.LBB8642:
	movb	3(%esi), %al
	leal	4(%ebx), %edx
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE8642:
.LBE8641:
.LBB8643:
.LBB8644:
	movb	4(%esi), %al
	leal	5(%ebx), %edx
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE8644:
.LBE8643:
.LBB8645:
.LBB8646:
	leal	7(%ebx), %edx
	movb	%cl, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
	xorl	%eax, %eax
.LVL1190:
.L662:
.LVL1191:
.LBE8646:
.LBE8645:
	.loc 27 229 0
	popl	%ebx
	.cfi_def_cfa_offset 20
.LVL1192:
	popl	%ebx
	popl	%esi
.LVL1193:
	popl	%edi
.LVL1194:
	popl	%ebp
	ret
	.cfi_endproc
.LFE672:
	.size	send_cmd.20413, .-send_cmd.20413
	.section	.text.ata_readwrite.21200,"ax",@progbits
	.type	ata_readwrite.21200, @function
ata_readwrite.21200:
.LFB680:
	.loc 27 533 0
	.cfi_startproc
.LVL1195:
	pushl	%edi
	.cfi_def_cfa_offset 8
	leal	8(%esp), %edi
	.cfi_offset 7, -8
	.cfi_def_cfa 7, 0
	andl	$-16, %esp
	pushl	-4(%edi)
	pushl	%ebp
	movl	%esp, %ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0x0
	pushl	%edi
	.cfi_escape 0xf,0x3,0x75,0x7c,0x6
	pushl	%esi
	pushl	%ebx
	subl	$60, %esp
	movl	%eax, %ebx
	.cfi_escape 0x10,0x3,0x2,0x75,0x74
	.cfi_escape 0x10,0x6,0x2,0x75,0x78
	movl	%edx, -44(%ebp)
	.loc 27 534 0
	movl	(%eax), %eax
.LVL1196:
	movl	4(%ebx), %edx
.LVL1197:
	movl	$12, %ecx
.LVL1198:
.LBB8647:
.LBB8648:
	.loc 6 178 0
	leal	-36(%ebp), %esi
.L669:
	decl	%ecx
.LVL1199:
	movb	$0, (%esi,%ecx)
	.loc 6 177 0
	testl	%ecx, %ecx
	jne	.L669
.LBE8648:
.LBE8647:
	.loc 27 541 0
	movl	16(%ebx), %ecx
.LVL1200:
	movw	%cx, -38(%ebp)
	cmpw	$255, %cx
	ja	.L670
	movzwl	%cx, %esi
	xorl	%edi, %edi
	addl	%eax, %esi
	adcl	%edx, %edi
	cmpl	$0, %edi
	ja	.L670
	cmpl	$268435455, %esi
	jbe	.L671
.L670:
	.loc 27 549 0
	cmpl	$1, -44(%ebp)
	sbbl	%ecx, %ecx
	andl	$-16, %ecx
	addl	$52, %ecx
	movb	%cl, -72(%ebp)
	.loc 27 542 0
	movw	-38(%ebp), %si
	shrw	$8, %si
	movl	%esi, %ecx
	movb	%cl, -28(%ebp)
	.loc 27 543 0
	movl	%eax, %esi
	movl	%edx, %edi
	shrdl	$24, %edi, %esi
	shrl	$24, %edi
	movl	%esi, %ecx
	movb	%cl, -27(%ebp)
	.loc 27 544 0
	movl	%edx, %esi
	movb	%dl, -26(%ebp)
.LVL1201:
	.loc 27 545 0
	shrl	$8, %esi
	movl	%esi, %ecx
	movb	%cl, -25(%ebp)
	.loc 27 549 0
	movb	-72(%ebp), %cl
	movb	%cl, -30(%ebp)
	movl	%eax, %esi
.LVL1202:
	andl	$16777215, %esi
	xorl	%ecx, %ecx
.LVL1203:
	movl	%esi, %eax
	movl	%ecx, %edx
	jmp	.L675
.LVL1204:
.L671:
	.loc 27 556 0
	cmpl	$1, -44(%ebp)
	sbbl	%ecx, %ecx
	andl	$-16, %ecx
	addl	$48, %ecx
	movb	%cl, -30(%ebp)
.LVL1205:
.L675:
	.loc 27 563 0
	movb	-38(%ebp), %cl
	movb	%cl, -35(%ebp)
	.loc 27 564 0
	movb	%al, -34(%ebp)
	.loc 27 565 0
	movl	%eax, %esi
	movl	%edx, %edi
	shrdl	$8, %edi, %esi
	shrl	$8, %edi
	movl	%esi, %ecx
	movb	%cl, -33(%ebp)
	.loc 27 566 0
	movl	%eax, %esi
	movl	%edx, %edi
	shrdl	$16, %edi, %esi
	shrl	$16, %edi
	movl	%esi, %ecx
	movb	%cl, -32(%ebp)
	.loc 27 567 0
	shrdl	$24, %edx, %eax
.LVL1206:
	shrl	$24, %edx
	andl	$15, %eax
	orl	$64, %eax
	movb	%al, -31(%ebp)
.LBB8649:
.LBB8650:
.LBB8660:
	.loc 27 493 0
	movl	12(%ebx), %ecx
.LVL1207:
.LBE8660:
.LBB8659:
	.loc 27 495 0
#APP
# 495 "src/ata.c" 1
	movl %CS:36(%ecx), %eax
# 0 "" 2
.LVL1208:
#NO_APP
.LBE8659:
.LBB8658:
	.loc 27 496 0
#APP
# 496 "src/ata.c" 1
	movw %CS:-983040(%eax), %si
# 0 "" 2
.LVL1209:
#NO_APP
.LBE8658:
.LBB8657:
	.loc 27 497 0
#APP
# 497 "src/ata.c" 1
	movw %CS:-983038(%eax), %di
# 0 "" 2
.LVL1210:
#NO_APP
.LBE8657:
	.loc 27 500 0
	addl	$2, %edi
.LVL1211:
.LBB8655:
.LBB8656:
	.loc 2 82 0
	movb	$10, %al
.LVL1212:
	movl	%edi, %edx
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE8656:
.LBE8655:
	.loc 27 502 0
	leal	-36(%ebp), %edx
	movl	%ecx, %eax
	call	send_cmd.20413
.LVL1213:
	movl	%eax, %ecx
.LVL1214:
	.loc 27 503 0
	testl	%eax, %eax
	jne	.L678
.LVL1215:
.LBB8653:
.LBB8654:
	.loc 27 235 0
	movzwl	%si, %eax
.LVL1216:
	call	ndelay_await_not_bsy.20173
.LVL1217:
	movl	%eax, %ecx
.LVL1218:
	.loc 27 236 0
	testl	%eax, %eax
	js	.L678
.LVL1219:
	.loc 27 239 0
	testb	$1, %al
	je	.L679
	movl	$-4, %ecx
.LVL1220:
	jmp	.L678
.LVL1221:
.L679:
	.loc 27 244 0
	andb	$8, %cl
.LVL1222:
	jne	.L680
	movl	$-5, %ecx
.LVL1223:
.L678:
.LBE8654:
.LBE8653:
.LBB8651:
.LBB8652:
	.loc 2 82 0
	movb	$8, %al
	movl	%edi, %edx
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE8652:
.LBE8651:
.LBE8650:
.LBE8649:
	.loc 27 574 0
	cmpl	$1, %ecx
	sbbl	%eax, %eax
	notl	%eax
	andl	$12, %eax
	.loc 27 577 0
	addl	$60, %esp
	popl	%ebx
.LVL1224:
	popl	%esi
.LVL1225:
	popl	%edi
	leave
	leal	-8(%edi), %esp
	popl	%edi
	ret
.LVL1226:
.L680:
.LBB8662:
.LBB8661:
	.loc 27 508 0
	movl	$512, %ecx
.LVL1227:
	movl	-44(%ebp), %edx
	movl	%ebx, %eax
	call	ata_pio_transfer.20669
	movl	%eax, %ecx
.LVL1228:
	jmp	.L678
.LBE8661:
.LBE8662:
	.cfi_endproc
.LFE680:
	.size	ata_readwrite.21200, .-ata_readwrite.21200
	.section	.text.process_ata_misc_op.20381,"ax",@progbits
	.type	process_ata_misc_op.20381, @function
process_ata_misc_op.20381:
.LFB671:
	.loc 27 147 0
	.cfi_startproc
.LVL1229:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	movl	%esp, %ebp
	.cfi_offset 5, -8
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$24, %esp
.LBB8740:
	.loc 27 151 0
	movl	12(%eax), %esi
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
.LVL1230:
.LBE8740:
	.loc 27 153 0
	movb	18(%eax), %dl
	cmpb	$5, %dl
	ja	.L690
	cmpb	$4, %dl
	jae	.L688
	testb	%dl, %dl
	je	.L687
	jmp	.L686
.L690:
	cmpb	$7, %dl
	je	.L688
	cmpb	$16, %dl
	jne	.L686
	jmp	.L713
.L687:
.LBB8741:
.LBB8742:
.LBB8743:
	.loc 27 82 0
#APP
# 82 "src/ata.c" 1
	movl %CS:36(%esi), %eax
# 0 "" 2
.LVL1231:
#NO_APP
.LBE8743:
.LBB8744:
	.loc 27 83 0
#APP
# 83 "src/ata.c" 1
	movb %CS:40(%esi), %dl
# 0 "" 2
#NO_APP
	movl	%edx, %edi
.LVL1232:
.LBE8744:
.LBB8745:
	.loc 27 84 0
#APP
# 84 "src/ata.c" 1
	movw %CS:-983040(%eax), %bx
# 0 "" 2
.LVL1233:
#NO_APP
.LBE8745:
.LBB8746:
	.loc 27 85 0
#APP
# 85 "src/ata.c" 1
	movw %CS:-983038(%eax), %ax
# 0 "" 2
.LVL1234:
#NO_APP
.LBE8746:
	.loc 27 89 0
	addl	$2, %eax
.LVL1235:
	movw	%ax, -22(%ebp)
.LBB8747:
.LBB8748:
	.loc 2 82 0
	movb	$14, %al
	movw	-22(%ebp), %dx
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE8748:
.LBE8747:
	.loc 27 90 0
	movl	$5, %eax
	call	udelay.1730
.LBB8749:
.LBB8750:
	.loc 2 82 0
	movb	$10, %al
	movw	-22(%ebp), %dx
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE8750:
.LBE8749:
.LBB8751:
.LBB8752:
	.loc 7 128 0
#APP
# 128 "src/clock.c" 1
	movl %CS:cpu_khz, %ecx
# 0 "" 2
.LVL1236:
#NO_APP
.LBE8752:
.LBB8753:
.LBB8754:
.LBB8755:
.LBB8756:
	.loc 8 85 0
#APP
# 85 "src/util.h" 1
	rdtsc
# 0 "" 2
.LVL1237:
#NO_APP
.LBE8756:
.LBE8755:
	.loc 7 106 0
	sall	%ecx
.LVL1238:
	movl	%ecx, -20(%ebp)
	movl	$0, -16(%ebp)
	addl	%eax, -20(%ebp)
	adcl	%edx, -16(%ebp)
.LVL1239:
	jmp	.L691
.LVL1240:
.L692:
.LBB8757:
.LBB8758:
.LBB8759:
.LBB8760:
	.loc 6 72 0
#APP
# 72 "src/util.c" 1
	sti
nop
rep ; nop
cli
cld

# 0 "" 2
.LVL1241:
#NO_APP
.L691:
.LBE8760:
.LBE8759:
.LBE8758:
.LBE8757:
.LBB8761:
.LBB8762:
.LBB8763:
	.loc 8 85 0
#APP
# 85 "src/util.h" 1
	rdtsc
# 0 "" 2
.LVL1242:
#NO_APP
.LBE8763:
.LBE8762:
.LBE8761:
	.loc 7 107 0
	subl	-20(%ebp), %eax
	sbbl	-16(%ebp), %edx
.LVL1243:
	cmpl	$0, %edx
	jl	.L692
	jg	.L704
	cmpl	$0, %eax
	jbe	.L692
.L704:
.LBE8754:
.LBE8753:
.LBE8751:
	.loc 27 95 0
	movzwl	%bx, %eax
	movl	%eax, -28(%ebp)
	call	await_not_bsy.20152
	.loc 27 96 0
	testl	%eax, %eax
.LVL1244:
	js	.L694
	.loc 27 98 0
	movl	%edi, %edx
	testb	%dl, %dl
	je	.L695
.LBB8764:
.LBB8765:
.LBB8766:
.LBB8767:
	.loc 7 135 0
#APP
# 135 "src/clock.c" 1
	movl %CS:cpu_khz, %edi
# 0 "" 2
.LVL1245:
#NO_APP
.LBE8767:
.LBB8768:
.LBB8769:
	.loc 8 85 0
#APP
# 85 "src/util.h" 1
	rdtsc
# 0 "" 2
.LVL1246:
#NO_APP
	movl	%eax, -36(%ebp)
	movl	%edx, -32(%ebp)
.LBE8769:
.LBE8768:
	.loc 7 136 0
	movl	$32000, %ecx
	movl	%edi, %eax
	mull	%ecx
	movl	%eax, -20(%ebp)
	movl	%edx, -16(%ebp)
	movl	-36(%ebp), %eax
	movl	-32(%ebp), %edx
	addl	%eax, -20(%ebp)
	adcl	%edx, -16(%ebp)
.LBE8766:
.LBE8765:
	.loc 27 102 0
	leal	6(%ebx), %edi
.LVL1247:
.L709:
.LBB8770:
.LBB8771:
	.loc 2 82 0
	movb	$-80, %al
	movl	%edi, %edx
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE8771:
.LBE8770:
	.loc 27 103 0
	movl	-28(%ebp), %eax
	call	ndelay_await_not_bsy.20173
	.loc 27 104 0
	testl	%eax, %eax
.LVL1248:
	js	.L694
.LBB8772:
.LBB8773:
	.loc 2 92 0
	movl	%edi, %edx
#APP
# 92 "src/ioport.h" 1
	inb %dx, %al
# 0 "" 2
.LVL1249:
#NO_APP
.LBE8773:
.LBE8772:
	.loc 27 106 0
	cmpb	$-80, %al
	je	.L696
.LBB8774:
.LBB8775:
.LBB8776:
	.loc 8 85 0
#APP
# 85 "src/util.h" 1
	rdtsc
# 0 "" 2
.LVL1250:
#NO_APP
.LBE8776:
.LBE8775:
.LBE8774:
	.loc 27 109 0
	subl	-20(%ebp), %eax
	sbbl	-16(%ebp), %edx
	cmpl	$0, %edx
	jl	.L709
	jg	.L705
	cmpl	$0, %eax
	jbe	.L709
.L705:
.LBB8777:
.LBB8778:
	.loc 3 508 0
	pushl	$110
	pushl	$__func__.20205
	jmp	.L711
.LVL1251:
.L695:
.LBE8778:
.LBE8777:
.LBE8764:
.LBB8779:
.LBB8780:
	.loc 2 82 0
	leal	6(%ebx), %edx
	movb	$-96, %al
.LVL1252:
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
.LVL1253:
#NO_APP
.L696:
.LBE8780:
.LBE8779:
.LBB8781:
	.loc 27 120 0
#APP
# 120 "src/ata.c" 1
	movb %CS:(%esi), %al
# 0 "" 2
.LVL1254:
#NO_APP
.LBE8781:
	.loc 27 121 0
	cmpb	$2, %al
	jne	.L694
.LBB8782:
.LBB8783:
.LBB8784:
.LBB8785:
.LBB8786:
.LBB8787:
	.loc 7 135 0
#APP
# 135 "src/clock.c" 1
	movl %CS:cpu_khz, %esi
# 0 "" 2
.LVL1255:
#NO_APP
.LBE8787:
.LBB8788:
.LBB8789:
	.loc 8 85 0
#APP
# 85 "src/util.h" 1
	rdtsc
# 0 "" 2
.LVL1256:
#NO_APP
	movl	%eax, -20(%ebp)
	movl	%edx, -16(%ebp)
.LBE8789:
.LBE8788:
	.loc 7 136 0
	movl	$32000, %ecx
	movl	%esi, %eax
	mull	%ecx
	movl	%eax, %esi
.LVL1257:
	movl	%edx, %edi
.LVL1258:
	addl	-20(%ebp), %esi
.LVL1259:
	adcl	-16(%ebp), %edi
.LVL1260:
.LBE8786:
.LBE8785:
.LBB8790:
.LBB8791:
.LBB8792:
	.loc 2 92 0
	leal	7(%ebx), %edx
	movl	%edx, %ecx
.L701:
	movl	%ecx, %edx
#APP
# 92 "src/ioport.h" 1
	inb %dx, %al
# 0 "" 2
.LVL1261:
#NO_APP
.LBE8792:
.LBE8791:
	.loc 27 36 0
	testb	$64, %al
	jne	.L694
.LBB8793:
.LBB8794:
.LBB8795:
	.loc 8 85 0
#APP
# 85 "src/util.h" 1
	rdtsc
# 0 "" 2
.LVL1262:
#NO_APP
	movl	%eax, -20(%ebp)
	movl	%edx, -16(%ebp)
.LBE8795:
.LBE8794:
.LBE8793:
	.loc 27 38 0
	subl	%esi, -20(%ebp)
	sbbl	%edi, -16(%ebp)
	cmpl	$0, -16(%ebp)
	jl	.L699
	jg	.L706
	cmpl	$0, -20(%ebp)
	jbe	.L699
.L706:
.LBB8796:
.LBB8797:
	.loc 3 508 0
	pushl	$39
	pushl	$__func__.20137
.LVL1263:
.L711:
	pushl	$.LC12
	.cfi_escape 0x2e,0xc
	call	__dprintf.1654
	addl	$12, %esp
	jmp	.L694
.LVL1264:
.L699:
.LBE8797:
.LBE8796:
.LBB8798:
.LBB8799:
.LBB8800:
.LBB8801:
	.loc 6 72 0
#APP
# 72 "src/util.c" 1
	sti
nop
rep ; nop
cli
cld

# 0 "" 2
#NO_APP
	jmp	.L701
.LVL1265:
.L694:
.LBE8801:
.LBE8800:
.LBE8799:
.LBE8798:
.LBE8790:
.LBE8784:
.LBE8783:
.LBE8782:
.LBB8802:
.LBB8803:
	.loc 2 82 0
	movb	$8, %al
.LVL1266:
	movw	-22(%ebp), %dx
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
	jmp	.L688
.LVL1267:
.L713:
.LBE8803:
.LBE8802:
.LBE8742:
.LBE8741:
.LBB8804:
.LBB8805:
.LBB8806:
	.loc 27 136 0
#APP
# 136 "src/ata.c" 1
	movl %CS:36(%esi), %eax
# 0 "" 2
.LVL1268:
#NO_APP
.LBE8806:
.LBB8807:
	.loc 27 137 0
#APP
# 137 "src/ata.c" 1
	movw %CS:-983040(%eax), %dx
# 0 "" 2
.LVL1269:
#NO_APP
.LBE8807:
.LBB8808:
.LBB8809:
	.loc 2 92 0
	addl	$7, %edx
.LVL1270:
#APP
# 92 "src/ioport.h" 1
	inb %dx, %al
# 0 "" 2
.LVL1271:
#NO_APP
.LBE8809:
.LBE8808:
	.loc 27 139 0
	movl	%eax, %edx
.LVL1272:
	andl	$192, %edx
	movl	$170, %eax
	cmpl	$64, %edx
	jne	.L702
	jmp	.L688
.LVL1273:
.L686:
.LBE8805:
.LBE8804:
	.loc 27 164 0
	movw	$0, 16(%eax)
	movl	$1, %eax
.LVL1274:
	.loc 27 165 0
	jmp	.L702
.LVL1275:
.L688:
	xorl	%eax, %eax
.LVL1276:
.L702:
	.loc 27 167 0
	leal	-12(%ebp), %esp
	popl	%ebx
.LVL1277:
	popl	%esi
.LVL1278:
	popl	%edi
.LVL1279:
	leave
	ret
	.cfi_endproc
.LFE671:
	.size	process_ata_misc_op.20381, .-process_ata_misc_op.20381
	.section	.text.i8042_wait_write.42503,"ax",@progbits
	.type	i8042_wait_write.42503, @function
i8042_wait_write.42503:
.LFB1330:
	.file 28 "src/ps2port.c"
	.loc 28 41 0
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.loc 28 41 0
	xorl	%ebx, %ebx
	.cfi_offset 3, -8
.LVL1280:
.L717:
.LBB8810:
.LBB8811:
.LBB8812:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $100, %al
# 0 "" 2
.LVL1281:
#NO_APP
.LBE8812:
.LBE8811:
	.loc 28 46 0
	testb	$2, %al
	jne	.L715
	xorl	%eax, %eax
.LVL1282:
	jmp	.L716
.LVL1283:
.L715:
	.loc 28 48 0
	movl	$50, %eax
.LVL1284:
	call	udelay.1730
.LBE8810:
	.loc 28 44 0
	incl	%ebx
	cmpl	$10000, %ebx
	jne	.L717
.LBB8813:
.LBB8814:
	.loc 3 508 0
	pushl	$50
	.cfi_def_cfa_offset 12
	pushl	$__func__.42510
	.cfi_def_cfa_offset 16
	pushl	$.LC12
	.cfi_def_cfa_offset 20
	.cfi_escape 0x2e,0xc
	call	__dprintf.1654
	addl	$12, %esp
	.cfi_def_cfa_offset 8
	orl	$-1, %eax
.L716:
.LBE8814:
.LBE8813:
	.loc 28 52 0
	popl	%ebx
.LVL1285:
	ret
	.cfi_endproc
.LFE1330:
	.size	i8042_wait_write.42503, .-i8042_wait_write.42503
	.section	.text.i8042_command.23898,"ax",@progbits
	.type	i8042_command.23898, @function
i8042_command.23898:
.LFB1333:
	.loc 28 107 0
	.cfi_startproc
.LVL1286:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	pushl	%edi
	.cfi_def_cfa_offset 12
	pushl	%esi
	.cfi_def_cfa_offset 16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	subl	$8, %esp
	.cfi_def_cfa_offset 28
	movl	%eax, %ebx
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 5, -8
	movl	%edx, %ebp
.LBB8815:
.LBB8816:
	.loc 28 75 0
	movl	%eax, %esi
.LVL1287:
	sarl	$8, %esi
	andl	$15, %esi
	.loc 28 76 0
	sarl	$12, %eax
.LVL1288:
	andl	$15, %eax
	movl	%eax, 4(%esp)
	.loc 28 79 0
	call	i8042_wait_write.42503
.LVL1289:
	movl	%eax, %edi
.LVL1290:
	.loc 28 80 0
	testl	%eax, %eax
	jne	.L721
.LVL1291:
.LBB8817:
.LBB8818:
	.loc 2 82 0
	movb	%bl, %al
.LVL1292:
#APP
# 82 "src/ioport.h" 1
	outb %al, $100
# 0 "" 2
#NO_APP
	xorl	%ebx, %ebx
.LVL1293:
	jmp	.L722
.L724:
.LBE8818:
.LBE8817:
	.loc 28 87 0
	call	i8042_wait_write.42503
	.loc 28 88 0
	testl	%eax, %eax
	jne	.L723
.LVL1294:
.LBB8819:
.LBB8820:
	.loc 2 82 0
	movb	(%ebp,%ebx), %al
.LVL1295:
#APP
# 82 "src/ioport.h" 1
	outb %al, $96
# 0 "" 2
#NO_APP
.LBE8820:
.LBE8819:
	.loc 28 86 0
	incl	%ebx
.L722:
	cmpl	4(%esp), %ebx
	jl	.L724
	xorl	%ebx, %ebx
.LVL1296:
	jmp	.L725
.LVL1297:
.L728:
	xorl	%edx, %edx
.L727:
.LBB8821:
.LBB8822:
.LBB8823:
.LBB8824:
.LBB8825:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $100, %al
# 0 "" 2
.LVL1298:
#NO_APP
.LBE8825:
.LBE8824:
	.loc 28 31 0
	testb	$1, %al
	jne	.L726
	.loc 28 33 0
	movl	$50, %eax
.LVL1299:
	movl	%edx, (%esp)
.LVL1300:
	call	udelay.1730
.LBE8823:
	.loc 28 29 0
	movl	(%esp), %edx
	incl	%edx
.LVL1301:
	cmpl	$10000, %edx
	jne	.L727
.LBB8826:
.LBB8827:
	.loc 3 508 0
	pushl	$35
	.cfi_def_cfa_offset 32
	pushl	$__func__.42492
	.cfi_def_cfa_offset 36
	pushl	$.LC12
	.cfi_def_cfa_offset 40
	.cfi_escape 0x2e,0xc
	call	__dprintf.1654
.LVL1302:
	addl	$12, %esp
	.cfi_def_cfa_offset 28
	orl	$-1, %eax
.LVL1303:
	jmp	.L723
.LVL1304:
.L726:
.LBE8827:
.LBE8826:
.LBE8822:
.LBE8821:
.LBB8828:
.LBB8829:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $96, %al
# 0 "" 2
.LVL1305:
#NO_APP
.LBE8829:
.LBE8828:
	.loc 28 98 0
	movb	%al, (%ebp,%ebx)
	.loc 28 94 0
	incl	%ebx
.L725:
	cmpl	%esi, %ebx
	jl	.L728
.LVL1306:
.L721:
	movl	%edi, %eax
.LVL1307:
.L723:
.LVL1308:
.LBE8816:
.LBE8815:
	.loc 28 113 0
	popl	%esi
	.cfi_def_cfa_offset 24
.LVL1309:
	popl	%edi
	.cfi_def_cfa_offset 20
.LVL1310:
	popl	%ebx
.LVL1311:
	popl	%esi
	popl	%edi
	popl	%ebp
.LVL1312:
	ret
	.cfi_endproc
.LFE1333:
	.size	i8042_command.23898, .-i8042_command.23898
	.section	.rodata.str1.1
.LC13:
	.string	"Got ps2 nak (status=%x)\n"
.LC14:
	.string	"Discarding ps2 data %02x (status=%02x)\n"
	.section	.text.ps2_recvbyte.42608,"ax",@progbits
	.type	ps2_recvbyte.42608, @function
ps2_recvbyte.42608:
.LFB1336:
	.loc 28 141 0
	.cfi_startproc
.LVL1313:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	movl	%esp, %ebp
	.cfi_offset 5, -8
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$16, %esp
	movl	%eax, %edi
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	movl	%edx, %esi
	movl	%ecx, %ebx
.LBB8830:
.LBB8831:
.LBB8832:
	.loc 7 135 0
#APP
# 135 "src/clock.c" 1
	movl %CS:cpu_khz, %ecx
# 0 "" 2
.LVL1314:
#NO_APP
.LBE8832:
.LBB8833:
.LBB8834:
	.loc 8 85 0
#APP
# 85 "src/util.h" 1
	rdtsc
# 0 "" 2
.LVL1315:
#NO_APP
	movl	%eax, -28(%ebp)
	movl	%edx, -24(%ebp)
.LVL1316:
.LBE8834:
.LBE8833:
	.loc 7 136 0
	movl	%ecx, %eax
	mull	%ebx
	movl	%eax, -20(%ebp)
	movl	%edx, -16(%ebp)
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %edx
	addl	%eax, -20(%ebp)
	adcl	%edx, -16(%ebp)
.L740:
.LBE8831:
.LBE8830:
.LBB8835:
.LBB8836:
.LBB8837:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $100, %al
# 0 "" 2
.LVL1317:
#NO_APP
.LBE8837:
.LBE8836:
	.loc 28 145 0
	movzbl	%al, %edx
	testb	$1, %dl
	je	.L732
.LBB8838:
.LBB8839:
.LBB8840:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $96, %al
# 0 "" 2
.LVL1318:
#NO_APP
.LBE8840:
.LBE8839:
	.loc 28 149 0
	movl	%edx, %ecx
.LVL1319:
	shrl	$5, %ecx
	andl	$1, %ecx
	cmpl	%edi, %ecx
	jne	.L733
	.loc 28 150 0
	testl	%esi, %esi
	jne	.L734
	.loc 28 151 0
	movzbl	%al, %eax
.LVL1320:
	jmp	.L735
.LVL1321:
.L734:
	.loc 28 152 0
	cmpb	$-6, %al
	je	.L736
	.loc 28 154 0
	cmpb	$-2, %al
	jne	.L733
	.loc 28 155 0
	pushl	%edx
	pushl	$.LC13
	.cfi_escape 0x2e,0x8
	call	__dprintf.1654
.LVL1322:
	popl	%eax
	popl	%edx
	movl	$254, %eax
	.loc 28 156 0
	jmp	.L735
.LVL1323:
.L733:
	.loc 28 161 0
	pushl	%edx
	movzbl	%al, %eax
.LVL1324:
	pushl	%eax
	pushl	$.LC14
	.cfi_escape 0x2e,0xc
	call	__dprintf.1654
.LVL1325:
	addl	$12, %esp
.LVL1326:
.L732:
.LBE8838:
.LBB8841:
.LBB8842:
.LBB8843:
	.loc 8 85 0
#APP
# 85 "src/util.h" 1
	rdtsc
# 0 "" 2
.LVL1327:
#NO_APP
.LBE8843:
.LBE8842:
.LBE8841:
	.loc 28 164 0
	subl	-20(%ebp), %eax
	sbbl	-16(%ebp), %edx
	cmpl	$0, %edx
	jl	.L737
	jg	.L742
	cmpl	$0, %eax
	jbe	.L737
.L742:
	.loc 28 166 0
	orl	$-1, %eax
	cmpl	$100, %ebx
	jle	.L735
.LBB8844:
.LBB8845:
	.loc 3 508 0
	pushl	$167
	pushl	$__func__.42613
	pushl	$.LC12
	call	__dprintf.1654
.LVL1328:
	addl	$12, %esp
	orl	$-1, %eax
	jmp	.L735
.LVL1329:
.L737:
.LBE8845:
.LBE8844:
.LBB8846:
.LBB8847:
.LBB8848:
.LBB8849:
	.loc 6 72 0
#APP
# 72 "src/util.c" 1
	sti
nop
rep ; nop
cli
cld

# 0 "" 2
#NO_APP
.LBE8849:
.LBE8848:
.LBE8847:
.LBE8846:
.LBE8835:
	.loc 28 171 0
	jmp	.L740
.LVL1330:
.L736:
	movl	$250, %eax
.LVL1331:
.L735:
	.loc 28 172 0
	leal	-12(%ebp), %esp
	popl	%ebx
.LVL1332:
	popl	%esi
.LVL1333:
	popl	%edi
.LVL1334:
	leave
	ret
	.cfi_endproc
.LFE1336:
	.size	ps2_recvbyte.42608, .-ps2_recvbyte.42608
	.section	.text.ps2_sendbyte.42650,"ax",@progbits
	.type	ps2_sendbyte.42650, @function
ps2_sendbyte.42650:
.LFB1337:
	.loc 28 176 0
	.cfi_startproc
.LVL1335:
	pushl	%edi
	.cfi_def_cfa_offset 8
	pushl	%esi
	.cfi_def_cfa_offset 12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	subl	$4, %esp
	.cfi_def_cfa_offset 20
	movl	%eax, %ebx
	.cfi_offset 3, -16
	.cfi_offset 6, -12
	.cfi_offset 7, -8
	movl	%ecx, %esi
	movl	%edx, %edi
	.loc 28 179 0
	testl	%eax, %eax
	je	.L744
.LVL1336:
	movb	%dl, 3(%esp)
.LVL1337:
.LBB8850:
.LBB8851:
	.loc 28 128 0
	leal	3(%esp), %edx
	movl	$4308, %eax
.LVL1338:
	call	i8042_command.23898
.LBE8851:
.LBE8850:
	.loc 28 183 0
	testl	%eax, %eax
.LVL1339:
	jne	.L745
	jmp	.L746
.LVL1340:
.L744:
.LBB8852:
.LBB8853:
	.loc 28 119 0
	call	i8042_wait_write.42503
.LVL1341:
	.loc 28 120 0
	testl	%eax, %eax
.LVL1342:
	jne	.L745
.LBB8854:
.LBB8855:
	.loc 2 82 0
	movl	%edi, %eax
.LVL1343:
#APP
# 82 "src/ioport.h" 1
	outb %al, $96
# 0 "" 2
.LVL1344:
#NO_APP
.L746:
.LBE8855:
.LBE8854:
.LBE8853:
.LBE8852:
	.loc 28 187 0
	movl	%esi, %ecx
	movl	$1, %edx
	movl	%ebx, %eax
.LVL1345:
	call	ps2_recvbyte.42608
	.loc 28 188 0
	testl	%eax, %eax
.LVL1346:
	js	.L745
	.loc 28 190 0
	cmpl	$250, %eax
	sete	%al
.LVL1347:
	movzbl	%al, %eax
.LVL1348:
	decl	%eax
.L745:
.LVL1349:
	.loc 28 194 0
	popl	%ecx
	.cfi_def_cfa_offset 16
	popl	%ebx
.LVL1350:
	popl	%esi
.LVL1351:
	popl	%edi
.LVL1352:
	ret
	.cfi_endproc
.LFE1337:
	.size	ps2_sendbyte.42650, .-ps2_sendbyte.42650
	.section	.text.ps2_command.42672,"ax",@progbits
	.type	ps2_command.42672, @function
ps2_command.42672:
.LFB1338:
	.loc 28 198 0
	.cfi_startproc
.LVL1353:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	pushl	%edi
	.cfi_def_cfa_offset 12
	pushl	%esi
	.cfi_def_cfa_offset 16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	subl	$16, %esp
	.cfi_def_cfa_offset 36
	movl	%eax, %esi
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 5, -8
	movl	%edx, %edi
	movl	%ecx, %ebx
	.loc 28 200 0
	movl	%edx, %eax
.LVL1354:
	sarl	$8, %eax
	andl	$15, %eax
	movl	%eax, 8(%esp)
	.loc 28 201 0
	movl	%edx, %eax
	sarl	$12, %eax
	andl	$15, %eax
	movl	%eax, 4(%esp)
.LBB8856:
.LBB8857:
	.loc 10 249 0
	movl	$64, %eax
#APP
# 249 "src/biosvar.h" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB8858:
#APP
# 249 "src/biosvar.h" 1
	movw %ES:14, %ax
# 0 "" 2
.LVL1355:
#NO_APP
.LBE8858:
.LBE8857:
.LBE8856:
	.loc 28 204 0
#APP
# 204 "src/ps2port.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB8859:
#APP
# 204 "src/ps2port.c" 1
	movb %ES:289, %al
# 0 "" 2
.LVL1356:
#NO_APP
.LBE8859:
	movb	%al, 15(%esp)
.LVL1357:
	.loc 28 206 0
	andl	$-52, %eax
.LVL1358:
	orl	$48, %eax
	movb	%al, 14(%esp)
.LVL1359:
	.loc 28 208 0
	leal	14(%esp), %edx
.LVL1360:
	movl	$4192, %eax
	call	i8042_command.23898
.LVL1361:
	movl	%eax, %ecx
.LVL1362:
	.loc 28 209 0
	testl	%eax, %eax
	jne	.L750
.LVL1363:
.LBB8860:
.LBB8861:
.LBB8862:
.LBB8863:
	.loc 6 72 0
#APP
# 72 "src/util.c" 1
	sti
nop
rep ; nop
cli
cld

# 0 "" 2
#NO_APP
.LBE8863:
.LBE8862:
.LBE8861:
.LBE8860:
	.loc 28 216 0
	testl	%esi, %esi
	je	.L751
	.loc 28 217 0
	andb	$-33, 14(%esp)
.LVL1364:
	jmp	.L752
.LVL1365:
.L751:
	.loc 28 219 0
	andb	$-17, 14(%esp)
.LVL1366:
.L752:
	.loc 28 220 0
	leal	14(%esp), %edx
	movl	$4192, %eax
.LVL1367:
	call	i8042_command.23898
.LVL1368:
	movl	%eax, %ecx
.LVL1369:
	.loc 28 221 0
	testl	%eax, %eax
	jne	.L753
.LVL1370:
	.loc 28 224 0
	cmpl	$767, %edi
	jne	.L754
	.loc 28 228 0
	movw	$1000, %cx
	movl	$255, %edx
	movl	%esi, %eax
.LVL1371:
	call	ps2_sendbyte.42650
	.loc 28 229 0
	movl	%eax, %ecx
.LVL1372:
	testl	%eax, %eax
	jne	.L753
	.loc 28 233 0
	movw	$4000, %cx
	xorl	%edx, %edx
	movl	%esi, %eax
.LVL1373:
	call	ps2_recvbyte.42608
	movl	%eax, %ecx
.LVL1374:
	.loc 28 234 0
	testl	%eax, %eax
	js	.L753
.LVL1375:
	.loc 28 236 0
	movb	%al, (%ebx)
	.loc 28 237 0
	movl	$100, %ecx
	xorl	%edx, %edx
	movl	%esi, %eax
.LVL1376:
	call	ps2_recvbyte.42608
	.loc 28 241 0
	movl	%eax, %edx
.LVL1377:
	notl	%edx
	sarl	$31, %edx
	andl	%edx, %eax
	movb	%al, 1(%ebx)
	jmp	.L770
.LVL1378:
.L754:
	.loc 28 242 0
	cmpl	$754, %edi
	jne	.L757
	.loc 28 246 0
	movl	$200, %ecx
	movl	$242, %edx
	movl	%esi, %eax
.LVL1379:
	call	ps2_sendbyte.42650
	.loc 28 247 0
	movl	%eax, %ecx
.LVL1380:
	testl	%eax, %eax
	jne	.L753
	.loc 28 251 0
	movw	$500, %cx
	xorl	%edx, %edx
	movl	%esi, %eax
.LVL1381:
	call	ps2_recvbyte.42608
	movl	%eax, %ecx
.LVL1382:
	.loc 28 252 0
	testl	%eax, %eax
	js	.L753
.LVL1383:
	.loc 28 254 0
	movb	%al, (%ebx)
	.loc 28 255 0
	leal	-171(%eax), %eax
.LVL1384:
	cmpl	$1, %eax
	jbe	.L759
	cmpl	$43, %ecx
	je	.L759
	cmpl	$96, %ecx
	je	.L759
	cmpl	$93, %ecx
	je	.L759
	cmpl	$71, %ecx
	jne	.L760
.L759:
	.loc 28 258 0
	movl	$500, %ecx
.LVL1385:
	xorl	%edx, %edx
	movl	%esi, %eax
	call	ps2_recvbyte.42608
	movl	%eax, %ecx
.LVL1386:
	.loc 28 259 0
	testl	%eax, %eax
	js	.L753
.LVL1387:
	.loc 28 261 0
	movb	%al, 1(%ebx)
	jmp	.L770
.LVL1388:
.L760:
	.loc 28 263 0
	movb	$0, 1(%ebx)
.LVL1389:
.L770:
	xorl	%ecx, %ecx
	jmp	.L753
.LVL1390:
.L757:
.LBB8864:
	.loc 28 267 0
	movl	%edi, %eax
.LVL1391:
	movzbl	%al, %edx
.LVL1392:
	movl	$200, %ecx
.LVL1393:
	movl	%esi, %eax
	call	ps2_sendbyte.42650
.LVL1394:
	movl	%eax, %ebp
.LVL1395:
	.loc 28 268 0
	xorl	%edi, %edi
.LVL1396:
	testl	%eax, %eax
	je	.L762
.LVL1397:
	jmp	.L761
.LVL1398:
.L763:
	.loc 28 274 0
	movzbl	(%ebx,%edi), %edx
	movl	$200, %ecx
	movl	%esi, %eax
.LVL1399:
	call	ps2_sendbyte.42650
	movl	%eax, %ecx
.LVL1400:
	.loc 28 275 0
	testl	%eax, %eax
	jne	.L753
.LVL1401:
	.loc 28 273 0
	incl	%edi
.LVL1402:
.L762:
	cmpl	4(%esp), %edi
	jl	.L763
	xorl	%edi, %edi
.LVL1403:
	jmp	.L764
.L765:
	.loc 28 281 0
	movl	$500, %ecx
	xorl	%edx, %edx
	movl	%esi, %eax
.LVL1404:
	call	ps2_recvbyte.42608
	movl	%eax, %ecx
.LVL1405:
	.loc 28 282 0
	testl	%eax, %eax
	js	.L753
.LVL1406:
	.loc 28 284 0
	movb	%al, (%ebx,%edi)
	.loc 28 280 0
	incl	%edi
.LVL1407:
.L764:
	cmpl	8(%esp), %edi
	jl	.L765
.L761:
	movl	%ebp, %ecx
.LVL1408:
.L753:
.LBE8864:
	.loc 28 292 0
	leal	15(%esp), %edx
	movl	$4192, %eax
	movl	%ecx, (%esp)
.LVL1409:
	call	i8042_command.23898
	.loc 28 293 0
	testl	%eax, %eax
.LVL1410:
	movl	(%esp), %ecx
	je	.L750
	movl	%eax, %ecx
.LVL1411:
.L750:
	.loc 28 297 0
	movl	%ecx, %eax
.LVL1412:
	addl	$16, %esp
	popl	%ebx
.LVL1413:
	popl	%esi
.LVL1414:
	popl	%edi
.LVL1415:
	popl	%ebp
	ret
	.cfi_endproc
.LFE1338:
	.size	ps2_command.42672, .-ps2_command.42672
	.section	.text.handle_15c2.1703,"ax",@progbits
	.type	handle_15c2.1703, @function
handle_15c2.1703:
.LFB786:
	.loc 9 263 0
	.cfi_startproc
.LVL1416:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	pushl	%edi
	.cfi_def_cfa_offset 12
	pushl	%esi
	.cfi_def_cfa_offset 16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	subl	$4, %esp
	.cfi_def_cfa_offset 24
	movl	%eax, %ebx
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 5, -8
	.loc 9 271 0
	movb	28(%eax), %al
.LVL1417:
	cmpb	$3, %al
	je	.L776
	ja	.L781
	cmpb	$1, %al
	je	.L823
	movb	17(%ebx), %al
	ja	.L775
	jmp	.L828
.L781:
	cmpb	$5, %al
	je	.L778
	jb	.L777
	cmpb	$6, %al
	je	.L779
	cmpb	$7, %al
	jne	.L808
	jmp	.L829
.L828:
.LBB8865:
.LBB8866:
	.loc 9 87 0
	testb	%al, %al
	je	.L783
	decb	%al
	jne	.L808
	jmp	.L830
.L783:
.LBB8867:
.LBB8868:
.LBB8869:
.LBB8870:
	.loc 10 249 0
	movl	$64, %eax
#APP
# 249 "src/biosvar.h" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB8871:
#APP
# 249 "src/biosvar.h" 1
	movw %ES:14, %dx
# 0 "" 2
.LVL1418:
#NO_APP
.LBE8871:
.LBE8870:
.LBE8869:
.LBB8872:
.LBB8873:
	.loc 9 34 0
#APP
# 34 "src/mouse.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB8874:
#APP
# 34 "src/mouse.c" 1
	movb %ES:289, %al
# 0 "" 2
.LVL1419:
#NO_APP
.LBE8874:
	.loc 9 35 0
	orl	$32, %eax
.LVL1420:
	.loc 9 36 0
	andl	$-3, %eax
.LVL1421:
.LBB8875:
	.loc 9 37 0
#APP
# 37 "src/mouse.c" 1
	movw %dx, %ES
# 0 "" 2
# 37 "src/mouse.c" 1
	movb %al, %ES:289
# 0 "" 2
#NO_APP
.LBE8875:
.LBB8876:
.LBB8877:
	.loc 28 313 0
	xorl	%ecx, %ecx
	movl	$245, %edx
.LVL1422:
	jmp	.L817
.LVL1423:
.L830:
.LBE8877:
.LBE8876:
.LBE8873:
.LBE8872:
.LBE8868:
.LBE8867:
.LBB8878:
.LBB8879:
.LBB8880:
.LBB8881:
	.loc 10 249 0
	movl	$64, %eax
#APP
# 249 "src/biosvar.h" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB8882:
#APP
# 249 "src/biosvar.h" 1
	movw %ES:14, %dx
# 0 "" 2
.LVL1424:
#NO_APP
.LBE8882:
.LBE8881:
.LBE8880:
	.loc 9 59 0
#APP
# 59 "src/mouse.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB8883:
#APP
# 59 "src/mouse.c" 1
	movb %ES:39, %al
# 0 "" 2
.LVL1425:
#NO_APP
.LBE8883:
	.loc 9 60 0
	testb	%al, %al
	js	.L787
.LBB8884:
.LBB8885:
.LBB8886:
.LBB8887:
	.loc 14 90 0
	movb	$5, 29(%ebx)
	jmp	.L811
.L787:
.LBE8887:
.LBE8886:
.LBE8885:
.LBE8884:
	.loc 9 65 0
#APP
# 65 "src/mouse.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB8888:
#APP
# 65 "src/mouse.c" 1
	movb %ES:289, %al
# 0 "" 2
.LVL1426:
#NO_APP
.LBE8888:
	.loc 9 66 0
	andl	$-33, %eax
.LVL1427:
	.loc 9 67 0
	orl	$2, %eax
.LVL1428:
.LBB8889:
	.loc 9 68 0
#APP
# 68 "src/mouse.c" 1
	movw %dx, %ES
# 0 "" 2
# 68 "src/mouse.c" 1
	movb %al, %ES:289
# 0 "" 2
#NO_APP
.LBE8889:
.LBB8890:
.LBB8891:
	.loc 28 313 0
	xorl	%ecx, %ecx
	movl	$244, %edx
.LVL1429:
	jmp	.L817
.LVL1430:
.L775:
.LBE8891:
.LBE8890:
.LBE8879:
.LBE8878:
.LBE8866:
.LBE8865:
.LBB8892:
.LBB8893:
	.loc 9 114 0
	cmpb	$6, %al
	ja	.L815
.LBB8894:
	.loc 9 118 0
	movzbl	%al, %eax
#APP
# 118 "src/mouse.c" 1
	movb %CS:sample_rates.24115(%eax), %al
# 0 "" 2
.LVL1431:
#NO_APP
.LBE8894:
	movb	%al, 3(%esp)
.LVL1432:
.LBB8895:
.LBB8896:
	.loc 28 313 0
	leal	3(%esp), %ecx
	movl	$4339, %edx
	jmp	.L817
.LVL1433:
.L776:
.LBE8896:
.LBE8895:
.LBE8893:
.LBE8892:
.LBB8897:
.LBB8898:
	.loc 9 135 0
	movb	17(%ebx), %al
	cmpb	$3, %al
	jbe	.L792
.L815:
.LBB8899:
.LBB8900:
.LBB8901:
.LBB8902:
	.loc 14 90 0
	movb	$2, 29(%ebx)
	jmp	.L811
.L792:
.LBE8902:
.LBE8901:
.LBE8900:
.LBE8899:
	.loc 9 139 0
	movb	%al, 3(%esp)
.LVL1434:
.LBB8903:
.LBB8904:
	.loc 28 313 0
	leal	3(%esp), %ecx
	movl	$4328, %edx
	jmp	.L817
.LVL1435:
.L777:
.LBE8904:
.LBE8903:
.LBE8898:
.LBE8897:
.LBB8905:
.LBB8906:
.LBB8907:
.LBB8908:
	movl	%esp, %ecx
	movl	$754, %edx
	movl	$1, %eax
	call	ps2_command.42672
.LBE8908:
.LBE8907:
	.loc 9 153 0
	testl	%eax, %eax
.LVL1436:
	jne	.L814
	.loc 9 157 0
	movb	(%esp), %al
.LVL1437:
	jmp	.L813
.L778:
.LBE8906:
.LBE8905:
.LBB8909:
.LBB8910:
	.loc 9 165 0
	cmpb	$3, 17(%ebx)
	je	.L795
.LBB8911:
.LBB8912:
.LBB8913:
.LBB8914:
	.loc 14 90 0
	movb	$3, 29(%ebx)
	jmp	.L811
.L795:
.LBE8914:
.LBE8913:
.LBE8912:
.LBE8911:
.LBB8915:
.LBB8916:
	.loc 10 249 0
	movl	$64, %eax
#APP
# 249 "src/biosvar.h" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB8917:
#APP
# 249 "src/biosvar.h" 1
	movw %ES:14, %ax
# 0 "" 2
.LVL1438:
#NO_APP
.LBE8917:
.LBE8916:
.LBE8915:
.LBB8918:
	.loc 9 170 0
#APP
# 170 "src/mouse.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
	xorl	%edx, %edx
#APP
# 170 "src/mouse.c" 1
	movb %dl, %ES:38
# 0 "" 2
#NO_APP
.LBE8918:
.LBB8919:
	.loc 9 171 0
	movb	17(%ebx), %dl
.LVL1439:
#APP
# 171 "src/mouse.c" 1
	movw %ax, %ES
# 0 "" 2
# 171 "src/mouse.c" 1
	movb %dl, %ES:39
# 0 "" 2
#NO_APP
.L823:
.LBE8919:
.LBB8920:
.LBB8921:
.LBB8922:
.LBB8923:
	.loc 28 313 0
	movl	%esp, %ecx
	movl	$767, %edx
.LVL1440:
	movl	$1, %eax
.LVL1441:
	call	ps2_command.42672
.LBE8923:
.LBE8922:
	.loc 9 100 0
	testl	%eax, %eax
.LVL1442:
	jne	.L814
	.loc 9 104 0
	movb	(%esp), %al
.LVL1443:
	movb	%al, 16(%ebx)
	.loc 9 105 0
	movb	1(%esp), %al
.L813:
	movb	%al, 17(%ebx)
	jmp	.L812
.L779:
.LBE8921:
.LBE8920:
.LBE8910:
.LBE8909:
.LBB8924:
.LBB8925:
	.loc 9 225 0
	movb	17(%ebx), %al
	cmpb	$1, %al
	je	.L799
	jb	.L798
	cmpb	$2, %al
	jne	.L808
	jmp	.L831
.L798:
.LBB8926:
.LBB8927:
.LBB8928:
.LBB8929:
	.loc 28 313 0
	movl	%esp, %ecx
	movl	$1001, %edx
	movl	$1, %eax
	call	ps2_command.42672
.LBE8929:
.LBE8928:
	.loc 9 183 0
	testl	%eax, %eax
.LVL1444:
	jne	.L814
	.loc 9 187 0
	movb	(%esp), %al
.LVL1445:
	movb	%al, 16(%ebx)
	.loc 9 188 0
	movb	1(%esp), %al
	movb	%al, 24(%ebx)
	.loc 9 189 0
	movb	2(%esp), %al
	movb	%al, 20(%ebx)
	jmp	.L812
.L799:
.LBE8927:
.LBE8926:
.LBB8930:
.LBB8931:
.LBB8932:
.LBB8933:
	.loc 28 313 0
	xorl	%ecx, %ecx
	movl	$230, %edx
	jmp	.L817
.L831:
.LBE8933:
.LBE8932:
.LBE8931:
.LBE8930:
.LBB8934:
.LBB8935:
.LBB8936:
.LBB8937:
	xorl	%ecx, %ecx
	movl	$231, %edx
.LVL1446:
.L817:
	movl	$1, %eax
.LVL1447:
	call	ps2_command.42672
.LBE8937:
.LBE8936:
	.loc 9 209 0
	testl	%eax, %eax
.LVL1448:
	je	.L812
.LVL1449:
.L814:
.LBB8938:
.LBB8939:
.LBB8940:
.LBB8941:
	.loc 14 90 0
	movb	$4, 29(%ebx)
	jmp	.L811
.LVL1450:
.L829:
.LBE8941:
.LBE8940:
.LBE8939:
.LBE8938:
.LBE8935:
.LBE8934:
.LBE8925:
.LBE8924:
.LBB8942:
.LBB8943:
.LBB8944:
	.loc 9 237 0
	movzwl	2(%ebx), %eax
	sall	$16, %eax
	movzwl	16(%ebx), %ebp
.LBE8944:
.LBB8945:
.LBB8946:
	.loc 10 249 0
	movl	$64, %edx
#APP
# 249 "src/biosvar.h" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB8947:
#APP
# 249 "src/biosvar.h" 1
	movw %ES:14, %di
# 0 "" 2
.LVL1451:
#NO_APP
.LBE8947:
.LBE8946:
.LBE8945:
	.loc 9 239 0
#APP
# 239 "src/mouse.c" 1
	movw %di, %ES
# 0 "" 2
#NO_APP
.LBB8948:
#APP
# 239 "src/mouse.c" 1
	movb %ES:39, %dl
# 0 "" 2
#NO_APP
	movl	%edx, %esi
.LVL1452:
.LBE8948:
	.loc 9 240 0
	orl	%eax, %ebp
	jne	.L804
	.loc 9 242 0
	testb	%dl, %dl
	jns	.L805
	.loc 9 243 0
	andl	$127, %esi
.LVL1453:
.LBB8949:
.LBB8950:
	.loc 9 34 0
#APP
# 34 "src/mouse.c" 1
	movw %di, %ES
# 0 "" 2
#NO_APP
.LBB8951:
#APP
# 34 "src/mouse.c" 1
	movb %ES:289(%ebp), %al
# 0 "" 2
.LVL1454:
#NO_APP
.LBE8951:
	.loc 9 35 0
	orl	$32, %eax
.LVL1455:
	.loc 9 36 0
	andl	$-3, %eax
.LVL1456:
.LBB8952:
	.loc 9 37 0
#APP
# 37 "src/mouse.c" 1
	movw %di, %ES
# 0 "" 2
# 37 "src/mouse.c" 1
	movb %al, %ES:289(%ebp)
# 0 "" 2
#NO_APP
.LBE8952:
.LBB8953:
.LBB8954:
	.loc 28 313 0
	xorl	%ecx, %ecx
	movl	$245, %edx
	movl	$1, %eax
.LVL1457:
	call	ps2_command.42672
	jmp	.L805
.L804:
.LBE8954:
.LBE8953:
.LBE8950:
.LBE8949:
	.loc 9 248 0
	orl	$-128, %esi
.LVL1458:
.L805:
.LBB8955:
	.loc 9 250 0
#APP
# 250 "src/mouse.c" 1
	movw %di, %ES
# 0 "" 2
#NO_APP
	movl	%esi, %eax
#APP
# 250 "src/mouse.c" 1
	movb %al, %ES:39
# 0 "" 2
#NO_APP
.LBE8955:
.LBB8956:
	.loc 9 251 0
#APP
# 251 "src/mouse.c" 1
	movw %di, %ES
# 0 "" 2
# 251 "src/mouse.c" 1
	movl %ebp, %ES:34
# 0 "" 2
.LVL1459:
#NO_APP
.L812:
.LBE8956:
.LBB8957:
.LBB8958:
	.loc 14 77 0
	movb	$0, 29(%ebx)
.LBB8959:
.LBB8960:
	.loc 14 62 0
	andw	$-2, 36(%ebx)
.LBE8960:
.LBE8959:
.LBE8958:
.LBE8957:
.LBE8943:
.LBE8942:
	.loc 9 279 0
	jmp	.L806
.LVL1460:
.L808:
.LBB8961:
.LBB8962:
.LBB8963:
.LBB8964:
.LBB8965:
.LBB8966:
	.loc 14 90 0
	movb	$1, 29(%ebx)
.LVL1461:
.L811:
.LBB8967:
.LBB8968:
	.loc 14 60 0
	orw	$1, 36(%ebx)
.LVL1462:
.L806:
.LBE8968:
.LBE8967:
.LBE8966:
.LBE8965:
.LBE8964:
.LBE8963:
.LBE8962:
.LBE8961:
	.loc 9 282 0
	popl	%ebx
	.cfi_def_cfa_offset 20
.LVL1463:
	popl	%ebx
	popl	%esi
.LVL1464:
	popl	%edi
.LVL1465:
	popl	%ebp
	ret
	.cfi_endproc
.LFE786:
	.size	handle_15c2.1703, .-handle_15c2.1703
	.section	.text.handle_15,"ax",@progbits
.globl handle_15
	.type	handle_15, @function
handle_15:
.LFB2439:
	.file 29 "src/system.c"
	.loc 29 344 0
	.cfi_startproc
.LVL1466:
	pushl	%edi
	.cfi_def_cfa_offset 8
	leal	8(%esp), %edi
	.cfi_offset 7, -8
	.cfi_def_cfa 7, 0
	andl	$-16, %esp
	pushl	-4(%edi)
	pushl	%ebp
	movl	%esp, %ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0x0
	pushl	%edi
	.cfi_escape 0xf,0x3,0x75,0x7c,0x6
	pushl	%esi
	pushl	%ebx
	subl	$76, %esp
	movl	%eax, %edx
	.loc 29 346 0
	movb	29(%eax), %al
.LVL1467:
	cmpb	$-121, %al
	je	.L841
	.cfi_escape 0x10,0x3,0x2,0x75,0x74
	.cfi_escape 0x10,0x6,0x2,0x75,0x78
	ja	.L849
	cmpb	$83, %al
	je	.L837
	ja	.L850
	cmpb	$79, %al
	je	.L886
	cmpb	$82, %al
	je	.L889
	cmpb	$36, %al
	jne	.L833
	jmp	.L898
.L850:
	cmpb	$-125, %al
	je	.L839
	cmpb	$-122, %al
	jne	.L833
	jmp	.L899
.L849:
	cmpb	$-111, %al
	ja	.L851
	cmpb	$-112, %al
	jae	.L880
	cmpb	$-120, %al
	je	.L842
	cmpb	$-119, %al
	jne	.L833
	jmp	.L900
.L851:
	cmpb	$-63, %al
	je	.L846
	ja	.L852
	cmpb	$-64, %al
	jne	.L833
	jmp	.L901
.L852:
	cmpb	$-62, %al
	je	.L847
	cmpb	$-24, %al
	jne	.L833
	jmp	.L902
.L898:
.LBB8969:
.LBB8970:
	.loc 29 67 0
	movb	28(%edx), %al
	cmpb	$1, %al
	je	.L855
	jb	.L854
	cmpb	$2, %al
	je	.L856
	cmpb	$3, %al
	jne	.L833
	jmp	.L903
.L854:
.LBB8971:
.LBB8972:
.LBB8973:
.LBB8974:
.LBB8975:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $146, %al
# 0 "" 2
#NO_APP
	jmp	.L867
.L855:
.LBE8975:
.LBE8974:
.LBE8973:
.LBE8972:
.LBE8971:
.LBB8976:
.LBB8977:
.LBB8978:
.LBB8979:
.LBB8980:
#APP
# 92 "src/ioport.h" 1
	inb $146, %al
# 0 "" 2
.LVL1468:
#NO_APP
.L890:
.LBE8980:
.LBE8979:
.LBB8981:
.LBB8982:
	.loc 2 82 0
	orl	$2, %eax
.LVL1469:
.L888:
#APP
# 82 "src/ioport.h" 1
	outb %al, $146
# 0 "" 2
.LVL1470:
#NO_APP
.L889:
.LBE8982:
.LBE8981:
.LBE8978:
.LBE8977:
.LBB8983:
.LBB8984:
	.loc 14 77 0
	movb	$0, 29(%edx)
	jmp	.L862
.LVL1471:
.L856:
.LBE8984:
.LBE8983:
.LBE8976:
.LBB8985:
.LBB8986:
.LBB8987:
.LBB8988:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $146, %al
# 0 "" 2
.LVL1472:
#NO_APP
.LBE8988:
.LBE8987:
	.loc 29 47 0
	shrl	%eax
.LVL1473:
	andl	$1, %eax
	movb	%al, 28(%edx)
	jmp	.L889
.L903:
.LBE8986:
.LBE8985:
.LBB8989:
.LBB8990:
	.loc 29 54 0
	movw	$3, 16(%edx)
	jmp	.L889
.L837:
.LBE8990:
.LBE8989:
.LBE8970:
.LBE8969:
	.loc 29 350 0
	movl	%edx, %eax
	call	handle_1553.1752
.LVL1474:
	jmp	.L880
.LVL1475:
.L839:
.LBB8991:
.LBB8992:
	.loc 7 568 0
	movb	28(%edx), %al
	testb	%al, %al
	je	.L859
	decb	%al
	jne	.L883
	jmp	.L904
.L859:
.LBB9023:
.LBB9024:
	.loc 7 542 0
	movw	16(%edx), %ax
	movw	%ax, -58(%ebp)
	movw	2(%edx), %si
	movw	24(%edx), %cx
	movw	%cx, -56(%ebp)
	movw	20(%edx), %bx
	movw	%bx, -36(%ebp)
.LBB9026:
.LBB9027:
	.loc 7 498 0
	movl	$64, %ecx
#APP
# 498 "src/clock.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB9032:
#APP
# 498 "src/clock.c" 1
	movb %ES:160, %al
# 0 "" 2
.LVL1476:
#NO_APP
.LBE9032:
	andl	$1, %eax
.LVL1477:
	jne	.L833
.LBB9031:
	.loc 7 502 0
#APP
# 502 "src/clock.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
	movl	$1, %edi
	movl	%edi, %ebx
#APP
# 502 "src/clock.c" 1
	movb %bl, %ES:160(%eax)
# 0 "" 2
#NO_APP
.LBE9031:
.LBB9029:
.LBB9030:
	.loc 7 503 0
	sall	$16, %esi
	movzwl	-58(%ebp), %ebx
	orl	%esi, %ebx
.LBE9030:
#APP
# 503 "src/clock.c" 1
	movw %cx, %ES
# 0 "" 2
# 503 "src/clock.c" 1
	movl %ebx, %ES:152(%eax)
# 0 "" 2
#NO_APP
.LBE9029:
.LBB9028:
	.loc 7 504 0
#APP
# 504 "src/clock.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBE9028:
.LBE9027:
.LBE9026:
	.loc 7 542 0
	movl	-56(%ebp), %ebx
	sall	$16, %ebx
	movzwl	-36(%ebp), %esi
	orl	%esi, %ebx
.LBB9025:
.LBB9051:
.LBB9033:
	.loc 7 504 0
#APP
# 504 "src/clock.c" 1
	movl %ebx, %ES:156(%eax)
# 0 "" 2
#NO_APP
.LBE9033:
.LBB9034:
.LBB9035:
.LBB9036:
.LBB9037:
	.loc 10 249 0
#APP
# 249 "src/biosvar.h" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB9038:
#APP
# 249 "src/biosvar.h" 1
	movw %ES:14(%eax), %bx
# 0 "" 2
.LVL1478:
#NO_APP
.LBE9038:
.LBE9037:
.LBE9036:
	.loc 7 473 0
#APP
# 473 "src/clock.c" 1
	movw %bx, %ES
# 0 "" 2
#NO_APP
.LBB9039:
#APP
# 473 "src/clock.c" 1
	movl %ES:298(%eax), %ecx
# 0 "" 2
.LVL1479:
#NO_APP
.LBE9039:
.LBB9040:
	.loc 7 474 0
	leal	1(%ecx), %esi
.LVL1480:
#APP
# 474 "src/clock.c" 1
	movw %bx, %ES
# 0 "" 2
# 474 "src/clock.c" 1
	movl %esi, %ES:298(%eax)
# 0 "" 2
#NO_APP
.LBE9040:
	.loc 7 475 0
	testl	%ecx, %ecx
	jne	.L862
.LBB9041:
.LBB9042:
.LBB9043:
	.loc 2 82 0
	movb	$-117, %bl
.LVL1481:
	movb	%bl, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE9043:
.LBE9042:
.LBB9044:
.LBB9045:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $113, %al
# 0 "" 2
#NO_APP
	movb	%al, %cl
.LVL1482:
.LBE9045:
.LBE9044:
.LBE9041:
.LBB9046:
.LBB9047:
.LBB9048:
	.loc 2 82 0
	movb	%bl, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE9048:
.LBE9047:
.LBB9049:
.LBB9050:
	orl	$64, %ecx
	movb	%cl, %al
	jmp	.L887
.LVL1483:
.L904:
.LBE9050:
.LBE9049:
.LBE9046:
.LBE9035:
.LBE9034:
.LBE9051:
.LBE9025:
.LBE9024:
.LBE9023:
.LBB9001:
.LBB9002:
.LBB9003:
	.loc 7 512 0
	movl	$64, %eax
#APP
# 512 "src/clock.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB9004:
#APP
# 512 "src/clock.c" 1
	movb %ES:160, %cl
# 0 "" 2
.LVL1484:
#NO_APP
.LBE9004:
	andb	$1, %cl
	je	.L862
.LBB9005:
	.loc 7 515 0
#APP
# 515 "src/clock.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
	xorl	%ecx, %ecx
.LVL1485:
#APP
# 515 "src/clock.c" 1
	movb %cl, %ES:160
# 0 "" 2
#NO_APP
.LBE9005:
.LBB9006:
.LBB9007:
.LBB9008:
.LBB9009:
	.loc 10 249 0
#APP
# 249 "src/biosvar.h" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB9010:
#APP
# 249 "src/biosvar.h" 1
	movw %ES:14, %cx
# 0 "" 2
.LVL1486:
#NO_APP
.LBE9010:
.LBE9009:
.LBE9008:
	.loc 7 486 0
#APP
# 486 "src/clock.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB9011:
#APP
# 486 "src/clock.c" 1
	movl %ES:298, %eax
# 0 "" 2
.LVL1487:
#NO_APP
.LBE9011:
.LBB9012:
	.loc 7 487 0
	leal	-1(%eax), %ebx
.LVL1488:
#APP
# 487 "src/clock.c" 1
	movw %cx, %ES
# 0 "" 2
# 487 "src/clock.c" 1
	movl %ebx, %ES:298
# 0 "" 2
#NO_APP
.LBE9012:
	.loc 7 488 0
	decl	%eax
.LVL1489:
	jne	.L862
.LBB9013:
.LBB9014:
.LBB9015:
	.loc 2 82 0
	movb	$-117, %cl
.LVL1490:
	movb	%cl, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE9015:
.LBE9014:
.LBB9016:
.LBB9017:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $113, %al
# 0 "" 2
#NO_APP
	movb	%al, %bl
.LVL1491:
.LBE9017:
.LBE9016:
.LBE9013:
.LBB9018:
.LBB9019:
.LBB9020:
	.loc 2 82 0
	movb	%cl, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE9020:
.LBE9019:
.LBB9021:
.LBB9022:
	movl	%ebx, %eax
.LVL1492:
	andl	$191, %eax
.LVL1493:
.L887:
#APP
# 82 "src/ioport.h" 1
	outb %al, $113
# 0 "" 2
#NO_APP
	jmp	.L862
.LVL1494:
.L883:
.LBE9022:
.LBE9021:
.LBE9018:
.LBE9007:
.LBE9006:
.LBE9003:
.LBE9002:
.LBE9001:
.LBB8993:
.LBB8994:
.LBB8995:
.LBB8996:
.LBB8997:
.LBB8998:
	.loc 14 90 0
	movb	$-122, 29(%edx)
.LBB8999:
.LBB9000:
	.loc 14 60 0
	orw	$1, 36(%edx)
.LBE9000:
.LBE8999:
.LBE8998:
.LBE8997:
.LBE8996:
.LBE8995:
	.loc 7 562 0
	decb	28(%edx)
	jmp	.L880
.L899:
.LBE8994:
.LBE8993:
.LBE8992:
.LBE8991:
.LBB9058:
.LBB9059:
	.loc 7 526 0
	movb	$0, -25(%ebp)
.LVL1495:
	.loc 7 527 0
	movw	24(%edx), %si
	movw	20(%edx), %cx
	movw	%cx, -56(%ebp)
.LBB9060:
	.loc 7 528 0
#APP
# 528 "src/clock.c" 1
	movw %SS, -36(%ebp)
# 0 "" 2
#NO_APP
.LBE9060:
.LBB9061:
.LBB9062:
	.loc 7 498 0
	movl	$64, %ecx
#APP
# 498 "src/clock.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB9067:
#APP
# 498 "src/clock.c" 1
	movb %ES:160, %al
# 0 "" 2
.LVL1496:
#NO_APP
.LBE9067:
	andl	$1, %eax
.LVL1497:
	jne	.L864
.LBB9066:
	.loc 7 502 0
#APP
# 502 "src/clock.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
	movl	$1, %edi
	movl	%edi, %ebx
#APP
# 502 "src/clock.c" 1
	movb %bl, %ES:160(%eax)
# 0 "" 2
#NO_APP
.LBE9066:
.LBB9064:
.LBB9065:
	.loc 7 503 0
	leal	-25(%ebp), %edi
	movl	-36(%ebp), %ebx
	sall	$16, %ebx
	movzwl	%di, %edi
	orl	%ebx, %edi
.LBE9065:
#APP
# 503 "src/clock.c" 1
	movw %cx, %ES
# 0 "" 2
# 503 "src/clock.c" 1
	movl %edi, %ES:152(%eax)
# 0 "" 2
#NO_APP
.LBE9064:
.LBB9063:
	.loc 7 504 0
#APP
# 504 "src/clock.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBE9063:
.LBE9062:
.LBE9061:
	.loc 7 527 0
	sall	$16, %esi
.LVL1498:
	movzwl	-56(%ebp), %ebx
	orl	%ebx, %esi
.LBB9087:
.LBB9086:
.LBB9068:
	.loc 7 504 0
#APP
# 504 "src/clock.c" 1
	movl %esi, %ES:156(%eax)
# 0 "" 2
#NO_APP
.LBE9068:
.LBB9069:
.LBB9070:
.LBB9071:
.LBB9072:
	.loc 10 249 0
#APP
# 249 "src/biosvar.h" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB9073:
#APP
# 249 "src/biosvar.h" 1
	movw %ES:14(%eax), %bx
# 0 "" 2
.LVL1499:
#NO_APP
.LBE9073:
.LBE9072:
.LBE9071:
	.loc 7 473 0
#APP
# 473 "src/clock.c" 1
	movw %bx, %ES
# 0 "" 2
#NO_APP
.LBB9074:
#APP
# 473 "src/clock.c" 1
	movl %ES:298(%eax), %ecx
# 0 "" 2
.LVL1500:
#NO_APP
.LBE9074:
.LBB9075:
	.loc 7 474 0
	leal	1(%ecx), %esi
.LVL1501:
#APP
# 474 "src/clock.c" 1
	movw %bx, %ES
# 0 "" 2
# 474 "src/clock.c" 1
	movl %esi, %ES:298(%eax)
# 0 "" 2
#NO_APP
.LBE9075:
	.loc 7 475 0
	testl	%ecx, %ecx
	jne	.L881
.LBB9076:
.LBB9077:
.LBB9078:
	.loc 2 82 0
	movb	$-117, %bl
.LVL1502:
	movb	%bl, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE9078:
.LBE9077:
.LBB9079:
.LBB9080:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $113, %al
# 0 "" 2
#NO_APP
	movb	%al, %cl
.LVL1503:
.LBE9080:
.LBE9079:
.LBE9076:
.LBB9081:
.LBB9082:
.LBB9083:
	.loc 2 82 0
	movb	%bl, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $112
# 0 "" 2
#NO_APP
.LBE9083:
.LBE9082:
.LBB9084:
.LBB9085:
	orl	$64, %ecx
	movb	%cl, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $113
# 0 "" 2
#NO_APP
	jmp	.L881
.LVL1504:
.L864:
.LBE9085:
.LBE9084:
.LBE9081:
.LBE9070:
.LBE9069:
.LBE9086:
.LBE9087:
.LBB9088:
.LBB9089:
.LBB9090:
.LBB9091:
	.loc 14 90 0
	movb	$-125, 29(%edx)
	jmp	.L886
.LVL1505:
.L866:
.LBE9091:
.LBE9090:
.LBE9089:
.LBE9088:
.LBB9092:
.LBB9093:
	.loc 8 42 0
#APP
# 42 "src/util.h" 1
	sti ; hlt ; cli ; cld
# 0 "" 2
#NO_APP
.L881:
.LBE9093:
.LBE9092:
	.loc 7 533 0
	cmpb	$0, -25(%ebp)
	je	.L866
	jmp	.L862
.LVL1506:
.L841:
.LBE9059:
.LBE9058:
.LBB9094:
.LBB9095:
.LBB9096:
.LBB9097:
.LBB9098:
.LBB9099:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $146, %al
# 0 "" 2
#NO_APP
	movb	%al, -56(%ebp)
.LBE9099:
.LBE9098:
.LBB9100:
.LBB9101:
	.loc 2 82 0
	orl	$2, %eax
#APP
# 82 "src/ioport.h" 1
	outb %al, $146
# 0 "" 2
#NO_APP
.LBE9101:
.LBE9100:
.LBE9097:
.LBE9096:
	.loc 29 107 0
	movzwl	8(%edx), %esi
.LVL1507:
	.loc 29 109 0
	movw	2(%edx), %ax
.LVL1508:
.LBB9102:
	.loc 29 111 0
	movzwl	%ax, %edi
	sall	$4, %edi
#APP
# 111 "src/system.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB9103:
	addl	%esi, %edi
	movl	%edi, -36(%ebp)
	movl	$0, -32(%ebp)
	movl	-36(%ebp), %ecx
	movl	-32(%ebp), %ebx
	shldl	$16, %ecx, %ebx
	sall	$16, %ecx
	movl	%ecx, -36(%ebp)
	movl	%ebx, -32(%ebp)
	movl	-36(%ebp), %ecx
	movl	-32(%ebp), %ebx
	orl	$47, %ecx
	orb	$147, %bh
#APP
# 111 "src/system.c" 1
	movl %ecx, %ES:8(%esi)
# 0 "" 2
# 111 "src/system.c" 1
	movl %ebx, %ES:12(%esi)
# 0 "" 2
#NO_APP
.LBE9103:
.LBE9102:
.LBB9104:
	.loc 29 114 0
#APP
# 114 "src/system.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB9105:
	movl	$65535, %ecx
.LVL1509:
	movl	$39695, %ebx
.LVL1510:
#APP
# 114 "src/system.c" 1
	movl %ecx, %ES:32(%esi)
# 0 "" 2
# 114 "src/system.c" 1
	movl %ebx, %ES:36(%esi)
# 0 "" 2
#NO_APP
.LBE9105:
.LBE9104:
.LBB9106:
	.loc 29 117 0
#APP
# 117 "src/system.c" 1
	movw %SS, %cx
# 0 "" 2
.LVL1511:
#NO_APP
.LBE9106:
.LBB9107:
	.loc 29 118 0
	movzwl	%cx, %ecx
.LVL1512:
#APP
# 118 "src/system.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB9108:
	sall	$4, %ecx
.LVL1513:
	movl	%ecx, -36(%ebp)
	movl	$0, -32(%ebp)
	movl	-36(%ebp), %ecx
.LVL1514:
	movl	-32(%ebp), %ebx
.LVL1515:
	shldl	$16, %ecx, %ebx
	sall	$16, %ecx
	movl	%ecx, -36(%ebp)
	movl	%ebx, -32(%ebp)
	movl	-36(%ebp), %ecx
	movl	%ebx, %eax
.LVL1516:
	orl	$65535, %ecx
	orb	$147, %ah
#APP
# 118 "src/system.c" 1
	movl %ecx, %ES:40(%esi)
# 0 "" 2
# 118 "src/system.c" 1
	movl %eax, %ES:44(%esi)
# 0 "" 2
#NO_APP
.LBE9108:
.LBE9107:
	.loc 29 121 0
	movw	24(%edx), %cx
.LVL1517:
	.loc 29 122 0
#APP
# 122 "src/system.c" 1
	  lgdtw %es:(1<<3)(%si)
  lidtw %cs:pmode_IDT_info
  movl %cr0, %eax
  orl $(1<<0), %eax
  movl %eax, %cr0
  ljmpw $(4<<3), $1f
1:movw $(2<<3), %ax
  movw %ax, %ds
  movw $(3<<3), %ax
  movw %ax, %es
  xorw %si, %si
  xorw %di, %di
  rep movsw
  movw $(5<<3), %ax
  movw %ax, %ds
  movw %ax, %es
  movl %cr0, %eax
  andl $~(1<<0), %eax
  movl %eax, %cr0
  ljmpw $0xf000, $2f
2:lidtw %cs:rmode_IDT_info
  movw %ss, %ax
  movw %ax, %ds

# 0 "" 2
#NO_APP
.LBB9109:
.LBB9110:
.LBB9111:
.LBB9112:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $146, %al
# 0 "" 2
.LVL1518:
#NO_APP
.LBE9112:
.LBE9111:
	.loc 29 21 0
	testb	$2, -56(%ebp)
	jne	.L890
.L867:
	.loc 29 24 0
	andl	$-3, %eax
.LVL1519:
	jmp	.L888
.LVL1520:
.L842:
.LBE9110:
.LBE9109:
.LBE9095:
.LBE9094:
.LBB9113:
.LBB9114:
.LBB9115:
	.loc 29 177 0
#APP
# 177 "src/system.c" 1
	movl %CS:RamSize, %eax
# 0 "" 2
.LVL1521:
#NO_APP
.LBE9115:
	.loc 29 181 0
	cmpl	$67108864, %eax
	jbe	.L869
	.loc 29 182 0
	movw	$-1024, 28(%edx)
	jmp	.L862
.L869:
	.loc 29 184 0
	subl	$1048576, %eax
.LVL1522:
	shrl	$10, %eax
	movw	%ax, 28(%edx)
	jmp	.L862
.L900:
.LBE9114:
.LBE9113:
.LBB9116:
.LBB9117:
.LBB9118:
.LBB9119:
.LBB9120:
.LBB9121:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $146, %al
# 0 "" 2
#NO_APP
.LBE9121:
.LBE9120:
.LBB9122:
.LBB9123:
	.loc 2 82 0
	orl	$2, %eax
#APP
# 82 "src/ioport.h" 1
	outb %al, $146
# 0 "" 2
#NO_APP
.LBE9123:
.LBE9122:
.LBE9119:
.LBE9118:
.LBB9124:
.LBB9125:
.LBB9126:
	.loc 2 82 0
	movb	$17, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $32
# 0 "" 2
#NO_APP
.LBE9126:
.LBE9125:
.LBB9127:
.LBB9128:
#APP
# 82 "src/ioport.h" 1
	outb %al, $160
# 0 "" 2
#NO_APP
.LBE9128:
.LBE9127:
.LBB9129:
.LBB9130:
	movb	16(%edx), %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $33
# 0 "" 2
#NO_APP
.LBE9130:
.LBE9129:
.LBB9131:
.LBB9132:
	movb	17(%edx), %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $161
# 0 "" 2
#NO_APP
.LBE9132:
.LBE9131:
.LBB9133:
.LBB9134:
	movb	$4, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $33
# 0 "" 2
#NO_APP
.LBE9134:
.LBE9133:
.LBB9135:
.LBB9136:
	movb	$2, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $161
# 0 "" 2
#NO_APP
.LBE9136:
.LBE9135:
.LBB9137:
.LBB9138:
	movb	$1, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $33
# 0 "" 2
#NO_APP
.LBE9138:
.LBE9137:
.LBB9139:
.LBB9140:
#APP
# 82 "src/ioport.h" 1
	outb %al, $161
# 0 "" 2
#NO_APP
.LBE9140:
.LBE9139:
.LBB9141:
.LBB9142:
	movb	$-5, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $33
# 0 "" 2
#NO_APP
.LBE9142:
.LBE9141:
.LBB9143:
.LBB9144:
	movb	$-1, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $161
# 0 "" 2
#NO_APP
.LBE9144:
.LBE9143:
.LBE9124:
	.loc 29 196 0
	movzwl	8(%edx), %esi
.LVL1523:
.LBB9145:
	.loc 29 198 0
#APP
# 198 "src/system.c" 1
	movw 2(%edx), %ES
# 0 "" 2
#NO_APP
.LBB9146:
	movl	$65535, %ecx
.LVL1524:
	movl	$39695, %ebx
.LVL1525:
#APP
# 198 "src/system.c" 1
	movl %ecx, %ES:56(%esi)
# 0 "" 2
# 198 "src/system.c" 1
	movl %ebx, %ES:60(%esi)
# 0 "" 2
#NO_APP
.LBE9146:
.LBE9145:
	.loc 29 201 0
	movw	$24, (%edx)
	.loc 29 202 0
	movw	$32, 2(%edx)
	.loc 29 203 0
	movw	$48, 34(%edx)
.LBB9147:
.LBB9148:
	.loc 14 77 0
	movb	$0, 29(%edx)
.LBB9149:
.LBB9150:
	.loc 14 62 0
	andw	$-2, 36(%edx)
.LBE9150:
.LBE9149:
.LBE9148:
.LBE9147:
	.loc 29 207 0
#APP
# 207 "src/system.c" 1
	  lgdtw %es:(1<<3)(%si)
  lidtw %es:(2<<3)(%si)
  movl %cr0, %eax
  orl $(1<<0), %eax
  movl %eax, %cr0
  ljmpw $(7<<3), $1f
1:movw $(5<<3), %ax
  movw %ax, %ds
  movw %ax, %ss

# 0 "" 2
#NO_APP
.LBE9117:
.LBE9116:
	.loc 29 356 0
	jmp	.L880
.LVL1526:
.L901:
.LBB9151:
.LBB9152:
	.loc 29 251 0
	movw	$-4096, 2(%edx)
	.loc 29 252 0
	movl	$BIOS_CONFIG_TABLE, %eax
	movw	%ax, 16(%edx)
	jmp	.L889
.L846:
.LBE9152:
.LBE9151:
.LBB9153:
.LBB9154:
.LBB9155:
.LBB9156:
	.loc 10 249 0
	movl	$64, %eax
#APP
# 249 "src/biosvar.h" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB9157:
#APP
# 249 "src/biosvar.h" 1
	movw %ES:14, %ax
# 0 "" 2
.LVL1527:
#NO_APP
.LBE9157:
.LBE9156:
.LBE9155:
	.loc 29 259 0
	movw	%ax, 2(%edx)
	jmp	.L862
.LVL1528:
.L847:
.LBE9154:
.LBE9153:
	.loc 29 361 0
	movl	%edx, %eax
	call	handle_15c2.1703
.LVL1529:
	jmp	.L880
.LVL1530:
.L902:
.LBB9158:
.LBB9159:
	.loc 29 328 0
	movb	28(%edx), %al
	cmpb	$1, %al
	je	.L872
	cmpb	$32, %al
	jne	.L833
	jmp	.L905
.L872:
.LBB9160:
.LBB9161:
.LBB9162:
	.loc 29 273 0
#APP
# 273 "src/system.c" 1
	movl %CS:RamSize, %eax
# 0 "" 2
.LVL1531:
#NO_APP
.LBE9162:
	.loc 29 276 0
	cmpl	$16777216, %eax
	jbe	.L874
	.loc 29 278 0
	movw	$15360, 24(%edx)
	.loc 29 280 0
	subl	$16777216, %eax
.LVL1532:
	shrl	$16, %eax
	movw	%ax, 20(%edx)
	jmp	.L875
.LVL1533:
.L874:
	.loc 29 282 0
	subl	$1048576, %eax
.LVL1534:
	shrl	$10, %eax
	movw	%ax, 24(%edx)
	.loc 29 283 0
	movw	$0, 20(%edx)
.L875:
	.loc 29 287 0
	movw	24(%edx), %ax
	movw	%ax, 28(%edx)
	.loc 29 288 0
	movw	20(%edx), %ax
	movw	%ax, 16(%edx)
	jmp	.L862
.L905:
.LBE9161:
.LBE9160:
.LBB9163:
.LBB9164:
.LBB9165:
	.loc 29 300 0
#APP
# 300 "src/system.c" 1
	movl %CS:e820_count, %ebx
# 0 "" 2
#NO_APP
	movl	%ebx, -76(%ebp)
.LBE9165:
	.loc 29 301 0
	cmpl	$1397571920, 20(%edx)
	jne	.L833
	movzwl	16(%edx), %esi
	cmpl	%ebx, %esi
	jge	.L833
	cmpl	$19, 24(%edx)
	jbe	.L833
.LBB9166:
.LBB9167:
	.loc 10 296 0
#APP
# 296 "src/biosvar.h" 1
	movw %CS, -36(%ebp)
# 0 "" 2
#NO_APP
.LBE9167:
.LBE9166:
	.loc 29 307 0
	movzwl	4(%edx), %edi
.LBB9168:
.LBB9169:
	.loc 6 185 0
#APP
# 185 "src/util.c" 1
	movw 2(%edx), %ES
# 0 "" 2
	.loc 6 187 0
#NO_APP
	imull	$20, %esi, %esi
	addl	$e820_list, %esi
	movl	$20, %ecx
.LVL1535:
	movl	-36(%ebp), %ebx
#APP
# 187 "src/util.c" 1
	movw %ds, %ax
movw %bx, %ds
rep movsb (%si),%es:(%di)
movw %ax, %ds
# 0 "" 2
.LVL1536:
#NO_APP
.LBE9169:
.LBE9168:
	.loc 29 310 0
	movzwl	16(%edx), %eax
	movl	-76(%ebp), %ebx
	decl	%ebx
	cmpl	%ebx, %eax
	jne	.L878
	.loc 29 311 0
	movl	$0, 16(%edx)
	jmp	.L879
.L878:
	.loc 29 313 0
	incl	16(%edx)
.L879:
	.loc 29 314 0
	movl	$1397571920, 28(%edx)
	.loc 29 315 0
	movl	$20, 24(%edx)
	jmp	.L862
.LVL1537:
.L833:
.LBE9164:
.LBE9163:
.LBE9159:
.LBE9158:
.LBB9170:
.LBB9171:
.LBB9172:
.LBB9173:
.LBB9174:
.LBB9175:
	.loc 14 90 0
	movb	$-122, 29(%edx)
.LVL1538:
.L886:
.LBB9176:
.LBB9177:
	.loc 14 60 0
	orw	$1, 36(%edx)
	jmp	.L880
.LVL1539:
.L862:
.LBE9177:
.LBE9176:
.LBE9175:
.LBE9174:
.LBE9173:
.LBE9172:
.LBE9171:
.LBE9170:
.LBB9178:
.LBB9057:
.LBB9056:
.LBB9055:
.LBB9052:
.LBB9053:
.LBB9054:
	.loc 14 62 0
	andw	$-2, 36(%edx)
.LVL1540:
.L880:
.LBE9054:
.LBE9053:
.LBE9052:
.LBE9055:
.LBE9056:
.LBE9057:
.LBE9178:
	.loc 29 365 0
	addl	$76, %esp
	popl	%ebx
.LVL1541:
	popl	%esi
.LVL1542:
	popl	%edi
.LVL1543:
	leave
	leal	-8(%edi), %esp
	popl	%edi
	ret
	.cfi_endproc
.LFE2439:
	.size	handle_15, .-handle_15
	.section	.text.handle_16,"ax",@progbits
.globl handle_16
	.type	handle_16, @function
handle_16:
.LFB869:
	.loc 11 245 0
	.cfi_startproc
.LVL1544:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	pushl	%edi
	.cfi_def_cfa_offset 12
	pushl	%esi
	.cfi_def_cfa_offset 16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	subl	$8, %esp
	.cfi_def_cfa_offset 28
	movl	%eax, %ebx
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 5, -8
.LBB9179:
.LBB9180:
	.loc 11 228 0
	movl	$64, %esi
#APP
# 228 "src/kbd.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB9181:
#APP
# 228 "src/kbd.c" 1
	movb %ES:23, %al
# 0 "" 2
.LVL1545:
#NO_APP
.LBE9181:
	shrb	$4, %al
	andl	$7, %eax
	movb	%al, 7(%esp)
.LVL1546:
	.loc 11 229 0
#APP
# 229 "src/kbd.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB9182:
#APP
# 229 "src/kbd.c" 1
	movb %ES:151, %dl
# 0 "" 2
#NO_APP
	movl	%edx, %edi
.LVL1547:
.LBE9182:
	.loc 11 231 0
	andl	$7, %edx
	cmpb	%dl, %al
	je	.L907
.LBB9183:
.LBB9184:
	.loc 28 303 0
	leal	7(%esp), %ecx
	movl	$4333, %edx
	xorl	%eax, %eax
	call	ps2_command.42672
.LBE9184:
.LBE9183:
	.loc 11 235 0
	testl	%eax, %eax
.LVL1548:
	jne	.L907
	.loc 11 238 0
	movl	%edi, %edx
.LVL1549:
	andl	$-8, %edx
.LVL1550:
	orb	7(%esp), %dl
.LVL1551:
.LBB9185:
	.loc 11 239 0
#APP
# 239 "src/kbd.c" 1
	movw %si, %ES
# 0 "" 2
# 239 "src/kbd.c" 1
	movb %dl, %ES:151(%eax)
# 0 "" 2
#NO_APP
.L907:
.LBE9185:
.LBE9180:
.LBE9179:
	.loc 11 253 0
	movb	29(%ebx), %al
.LVL1552:
	cmpb	$10, %al
	je	.L914
	ja	.L920
	cmpb	$2, %al
	je	.L911
	ja	.L921
	testb	%al, %al
	je	.L909
	decb	%al
	jne	.L927
	jmp	.L935
.L921:
	cmpb	$5, %al
	je	.L912
	cmpb	$9, %al
	jne	.L927
	jmp	.L936
.L920:
	cmpb	$18, %al
	je	.L917
	ja	.L922
	cmpb	$16, %al
	je	.L915
	cmpb	$17, %al
	jne	.L927
	jmp	.L937
.L922:
	cmpb	$111, %al
	je	.L918
	cmpb	$-110, %al
	jne	.L927
	jmp	.L938
.L909:
.LBB9186:
.LBB9187:
	.loc 11 116 0
	xorl	%ecx, %ecx
	jmp	.L929
.L935:
.LBE9187:
.LBE9186:
.LBB9188:
.LBB9189:
	.loc 11 123 0
	xorl	%ecx, %ecx
.L930:
	xorl	%edx, %edx
.LVL1553:
.L928:
	movl	%ebx, %eax
	call	dequeue_key.26840
.LBE9189:
.LBE9188:
	.loc 11 255 0
	jmp	.L927
.LVL1554:
.L911:
.LBB9190:
.LBB9191:
.LBB9192:
.LBB9193:
.LBB9194:
.LBB9195:
	.loc 6 72 0
#APP
# 72 "src/util.c" 1
	sti
nop
rep ; nop
cli
cld

# 0 "" 2
#NO_APP
.LBE9195:
.LBE9194:
.LBE9193:
.LBE9192:
	.loc 11 131 0
	movl	$64, %eax
#APP
# 131 "src/kbd.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB9196:
#APP
# 131 "src/kbd.c" 1
	movb %ES:23, %al
# 0 "" 2
.LVL1555:
#NO_APP
.LBE9196:
	movb	%al, 28(%ebx)
.LBE9191:
.LBE9190:
	.loc 11 256 0
	jmp	.L927
.LVL1556:
.L912:
.LBB9197:
.LBB9198:
	.loc 11 138 0
	movzbl	24(%ebx), %edi
.LVL1557:
	movzbl	25(%ebx), %esi
.LBB9199:
.LBB9200:
	.loc 11 53 0
	movl	$64, %edx
.LVL1558:
#APP
# 53 "src/kbd.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB9201:
#APP
# 53 "src/kbd.c" 1
	movw %ES:128, %ax
# 0 "" 2
.LVL1559:
#NO_APP
.LBE9201:
	.loc 11 54 0
#APP
# 54 "src/kbd.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB9202:
#APP
# 54 "src/kbd.c" 1
	movw %ES:130, %bp
# 0 "" 2
.LVL1560:
#NO_APP
.LBE9202:
	.loc 11 56 0
#APP
# 56 "src/kbd.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB9203:
#APP
# 56 "src/kbd.c" 1
	movw %ES:26, %cx
# 0 "" 2
#NO_APP
	movw	%cx, 2(%esp)
.LBE9203:
	.loc 11 57 0
#APP
# 57 "src/kbd.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB9204:
#APP
# 57 "src/kbd.c" 1
	movw %ES:28, %dx
# 0 "" 2
.LVL1561:
#NO_APP
.LBE9204:
	.loc 11 60 0
	leal	2(%edx), %ecx
.LVL1562:
	.loc 11 61 0
	cmpw	%bp, %cx
	jae	.L923
	movl	%ecx, %eax
.L923:
	.loc 11 64 0
	xorl	%ecx, %ecx
.LVL1563:
	cmpw	2(%esp), %ax
	je	.L925
.LBB9205:
	.loc 11 67 0
	movl	$64, %ebp
.LVL1564:
#APP
# 67 "src/kbd.c" 1
	movw %bp, %ES
# 0 "" 2
#NO_APP
	movzwl	%dx, %edx
.LVL1565:
	movl	%edi, %ecx
#APP
# 67 "src/kbd.c" 1
	movb %cl, %ES:(%edx)
# 0 "" 2
#NO_APP
.LBE9205:
.LBB9206:
	.loc 11 68 0
#APP
# 68 "src/kbd.c" 1
	movw %bp, %ES
# 0 "" 2
#NO_APP
	movl	%esi, %ecx
#APP
# 68 "src/kbd.c" 1
	movb %cl, %ES:1(%edx)
# 0 "" 2
#NO_APP
.LBE9206:
.LBB9207:
	.loc 11 69 0
#APP
# 69 "src/kbd.c" 1
	movw %bp, %ES
# 0 "" 2
# 69 "src/kbd.c" 1
	movw %ax, %ES:28
# 0 "" 2
#NO_APP
	movb	$1, %cl
.LVL1566:
.L925:
.LBE9207:
.LBE9200:
.LBE9199:
	.loc 11 138 0
	xorl	$1, %ecx
	movb	%cl, 28(%ebx)
.LBE9198:
.LBE9197:
	.loc 11 257 0
	jmp	.L927
.LVL1567:
.L936:
.LBB9208:
.LBB9209:
	.loc 11 155 0
	movb	$48, 28(%ebx)
.LBE9209:
.LBE9208:
	.loc 11 258 0
	jmp	.L927
.L914:
.LBB9210:
.LBB9211:
.LBB9212:
.LBB9213:
	.loc 28 303 0
	leal	5(%esp), %ecx
	movl	$754, %edx
.LVL1568:
	xorl	%eax, %eax
	call	ps2_command.42672
.LBE9213:
.LBE9212:
	.loc 11 164 0
	testl	%eax, %eax
.LVL1569:
	je	.L926
	.loc 11 165 0
	movw	$0, 16(%ebx)
	jmp	.L927
.L926:
	.loc 11 168 0
	movzbl	6(%esp), %edx
	sall	$8, %edx
	movzbl	5(%esp), %eax
.LVL1570:
	orl	%edx, %eax
	movw	%ax, 16(%ebx)
	jmp	.L927
.LVL1571:
.L915:
.LBE9211:
.LBE9210:
.LBB9214:
.LBB9215:
	.loc 11 175 0
	movl	$1, %ecx
.L929:
	movl	$1, %edx
.LVL1572:
	jmp	.L928
.LVL1573:
.L937:
.LBE9215:
.LBE9214:
.LBB9216:
.LBB9217:
	.loc 11 182 0
	movl	$1, %ecx
	jmp	.L930
.L917:
.LBE9217:
.LBE9216:
.LBB9218:
.LBB9219:
.LBB9220:
.LBB9221:
.LBB9222:
.LBB9223:
	.loc 6 72 0
#APP
# 72 "src/util.c" 1
	sti
nop
rep ; nop
cli
cld

# 0 "" 2
#NO_APP
.LBE9223:
.LBE9222:
.LBE9221:
.LBE9220:
	.loc 11 190 0
	movl	$64, %eax
#APP
# 190 "src/kbd.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB9224:
#APP
# 190 "src/kbd.c" 1
	movb %ES:23, %dl
# 0 "" 2
.LVL1574:
#NO_APP
.LBE9224:
	movb	%dl, 28(%ebx)
	.loc 11 191 0
#APP
# 191 "src/kbd.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB9225:
#APP
# 191 "src/kbd.c" 1
	movb %ES:24, %dl
# 0 "" 2
.LVL1575:
#NO_APP
.LBE9225:
	.loc 11 192 0
#APP
# 192 "src/kbd.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB9226:
#APP
# 192 "src/kbd.c" 1
	movb %ES:150, %al
# 0 "" 2
#NO_APP
.LBE9226:
	.loc 11 191 0
	andl	$12, %eax
	andl	$-13, %edx
	orl	%edx, %eax
	movb	%al, 29(%ebx)
.LBE9219:
.LBE9218:
	.loc 11 262 0
	jmp	.L927
.LVL1576:
.L938:
.LBB9227:
.LBB9228:
	.loc 11 209 0
	movb	$-128, 29(%ebx)
.LBE9228:
.LBE9227:
	.loc 11 263 0
	jmp	.L927
.L918:
.LBB9229:
.LBB9230:
	.loc 11 199 0
	cmpb	$8, 28(%ebx)
	jne	.L927
	.loc 11 201 0
	movb	$2, 29(%ebx)
.LVL1577:
.L927:
.LBE9230:
.LBE9229:
	.loc 11 268 0
	popl	%esi
	.cfi_def_cfa_offset 24
	popl	%edi
	.cfi_def_cfa_offset 20
.LVL1578:
	popl	%ebx
.LVL1579:
	popl	%esi
	popl	%edi
	popl	%ebp
.LVL1580:
	ret
	.cfi_endproc
.LFE869:
	.size	handle_16, .-handle_16
	.section	.rodata.str1.1
.LC15:
	.string	"ps2 mouse irq but no mouse data.\n"
	.section	.text.handle_74,"ax",@progbits
.globl handle_74
	.type	handle_74, @function
handle_74:
.LFB1341:
	.loc 28 327 0
	.cfi_startproc
.LBB9231:
.LBB9232:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $100, %al
# 0 "" 2
.LVL1581:
#NO_APP
.LBE9232:
.LBE9231:
	.loc 28 334 0
	andl	$33, %eax
.LVL1582:
	cmpl	$33, %eax
	je	.L940
	.loc 28 336 0
	pushl	$.LC15
	.cfi_def_cfa_offset 8
	.cfi_escape 0x2e,0x4
	call	__dprintf.1654
	popl	%eax
	.cfi_def_cfa_offset 4
	.loc 28 337 0
	jmp	.L941
.L940:
.LBB9233:
.LBB9234:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $96, %al
# 0 "" 2
.LVL1583:
#NO_APP
.LBE9234:
.LBE9233:
.LBB9235:
.LBB9236:
	.loc 10 249 0
	movl	$64, %edx
#APP
# 249 "src/biosvar.h" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB9237:
#APP
# 249 "src/biosvar.h" 1
	movw %ES:14, %dx
# 0 "" 2
.LVL1584:
#NO_APP
.LBE9237:
.LBE9236:
.LBE9235:
	.loc 28 341 0
#APP
# 341 "src/ps2port.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB9238:
#APP
# 341 "src/ps2port.c" 1
	movb %ES:289, %dl
# 0 "" 2
.LVL1585:
#NO_APP
.LBE9238:
	andb	$2, %dl
	je	.L941
	.loc 28 345 0
	movzbl	%al, %eax
.LVL1586:
	.cfi_escape 0x2e,0x0
	call	process_mouse.1709
.LVL1587:
.L941:
.LBB9239:
.LBB9240:
.LBB9241:
	.loc 2 82 0
	movb	$32, %al
.LVL1588:
#APP
# 82 "src/ioport.h" 1
	outb %al, $160
# 0 "" 2
#NO_APP
.LBE9241:
.LBE9240:
.LBB9242:
.LBB9243:
.LBB9244:
#APP
# 82 "src/ioport.h" 1
	outb %al, $32
# 0 "" 2
#NO_APP
.LBE9244:
.LBE9243:
.LBE9242:
.LBE9239:
	.loc 28 349 0
	ret
	.cfi_endproc
.LFE1341:
	.size	handle_74, .-handle_74
	.section	.rodata.str1.1
.LC16:
	.string	"ps2 keyboard irq but found mouse data?!\n"
	.section	.text.handle_09,"ax",@progbits
.globl handle_09
	.type	handle_09, @function
handle_09:
.LFB1342:
	.loc 28 354 0
	.cfi_startproc
.LBB9245:
.LBB9246:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $100, %al
# 0 "" 2
.LVL1589:
#NO_APP
.LBE9246:
.LBE9245:
	.loc 28 362 0
	movl	%eax, %edx
.LVL1590:
	andl	$32, %edx
	je	.L944
	.loc 28 363 0
	pushl	$.LC16
	.cfi_def_cfa_offset 8
	.cfi_escape 0x2e,0x4
	call	__dprintf.1654
	popl	%edx
	.cfi_def_cfa_offset 4
	.loc 28 364 0
	jmp	.L945
.L944:
.LBB9247:
.LBB9248:
	.loc 2 92 0
#APP
# 92 "src/ioport.h" 1
	inb $96, %al
# 0 "" 2
.LVL1591:
#NO_APP
.LBE9248:
.LBE9247:
.LBB9249:
.LBB9250:
	.loc 10 249 0
	movl	$64, %ecx
#APP
# 249 "src/biosvar.h" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB9251:
#APP
# 249 "src/biosvar.h" 1
	movw %ES:14(%edx), %cx
# 0 "" 2
.LVL1592:
#NO_APP
.LBE9251:
.LBE9250:
.LBE9249:
	.loc 28 368 0
#APP
# 368 "src/ps2port.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB9252:
#APP
# 368 "src/ps2port.c" 1
	movb %ES:289(%edx), %dl
# 0 "" 2
.LVL1593:
#NO_APP
.LBE9252:
	andb	$1, %dl
	je	.L945
	.loc 28 372 0
	movzbl	%al, %eax
.LVL1594:
	.cfi_escape 0x2e,0x0
	call	process_key.1705
.LVL1595:
.L945:
.LBB9253:
.LBB9254:
.LBB9255:
	.loc 2 82 0
	movb	$32, %al
.LVL1596:
#APP
# 82 "src/ioport.h" 1
	outb %al, $32
# 0 "" 2
#NO_APP
.LBE9255:
.LBE9254:
.LBE9253:
	.loc 28 376 0
	ret
	.cfi_endproc
.LFE1342:
	.size	handle_09, .-handle_09
	.section	.rodata.str1.1
.LC17:
	.string	"In resume (status=%d)\n"
.LC18:
	.string	"Unimplemented shutdown status: %02x\n"
	.section	.text.handle_resume,"ax",@progbits
.globl handle_resume
	.type	handle_resume, @function
handle_resume:
.LFB1472:
	.file 30 "src/resume.c"
	.loc 30 30 0
	.cfi_startproc
.LVL1597:
	pushl	%esi
	.cfi_def_cfa_offset 8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	movb	%al, %bl
	.cfi_offset 3, -12
	.cfi_offset 6, -8
.LBB9256:
.LBB9257:
.LBB9258:
	.loc 2 82 0
	xorl	%edx, %edx
	movb	%dl, %al
.LVL1598:
#APP
# 82 "src/ioport.h" 1
	outb %al, $13
# 0 "" 2
#NO_APP
.LBE9258:
.LBE9257:
.LBB9259:
.LBB9260:
#APP
# 82 "src/ioport.h" 1
	outb %al, $218
# 0 "" 2
#NO_APP
.LBE9260:
.LBE9259:
.LBB9261:
.LBB9262:
	movb	$-64, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $214
# 0 "" 2
#NO_APP
.LBE9262:
.LBE9261:
.LBB9263:
.LBB9264:
	movb	%dl, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $212
# 0 "" 2
#NO_APP
.LBE9264:
.LBE9263:
.LBE9256:
	.loc 30 34 0
	movzbl	%bl, %esi
	pushl	%esi
	.cfi_def_cfa_offset 16
	pushl	$.LC17
	.cfi_def_cfa_offset 20
	.cfi_escape 0x2e,0x8
	call	__dprintf.1654
	popl	%ecx
	.cfi_def_cfa_offset 16
	popl	%eax
	.cfi_def_cfa_offset 12
	.loc 30 36 0
	cmpb	$12, %bl
	je	.L953
	ja	.L955
	cmpb	$5, %bl
	je	.L950
	ja	.L956
	testb	%bl, %bl
	je	.L949
	jmp	.L948
.L956:
	cmpb	$10, %bl
	je	.L951
	cmpb	$11, %bl
	jne	.L948
	jmp	.L959
.L955:
	cmpb	$-2, %bl
	jne	.L949
	.loc 30 40 0
	xorl	%eax, %eax
#APP
# 40 "src/resume.c" 1
	movw %ax, %ss
movl $4096, %esp
pushl $s3_resume
jmp transition32

# 0 "" 2
	.loc 30 47 0
#NO_APP
	jmp	.L948
.L949:
	.loc 30 55 0
	.cfi_escape 0x2e,0x0
	call	reset_vector
.L950:
.LBB9265:
.LBB9266:
.LBB9267:
	.loc 2 82 0
	movb	$32, %al
#APP
# 82 "src/ioport.h" 1
	outb %al, $160
# 0 "" 2
#NO_APP
.LBE9267:
.LBE9266:
.LBB9268:
.LBB9269:
.LBB9270:
#APP
# 82 "src/ioport.h" 1
	outb %al, $32
# 0 "" 2
#NO_APP
.L951:
.LBE9270:
.LBE9269:
.LBE9268:
.LBE9265:
	.loc 30 65 0
	movl	$64, %eax
#APP
# 65 "src/resume.c" 1
	movw %ax, %ds
ljmpw *103

# 0 "" 2
	.loc 30 70 0
#NO_APP
	jmp	.L948
.L959:
	.loc 30 74 0
	movl	$64, %eax
#APP
# 74 "src/resume.c" 1
	movw %ax, %ds
lssw 103, %sp
iretw

# 0 "" 2
	.loc 30 80 0
#NO_APP
	jmp	.L948
.L953:
	.loc 30 84 0
	movl	$64, %eax
#APP
# 84 "src/resume.c" 1
	movw %ax, %ds
lssw 103, %sp
lretw

# 0 "" 2
#NO_APP
.L948:
	.loc 30 93 0
	pushl	%esi
	.cfi_def_cfa_offset 16
	pushl	$.LC18
	.cfi_def_cfa_offset 20
	.cfi_escape 0x2e,0x8
	call	panic.1646
	.cfi_def_cfa_offset 12
	.cfi_endproc
.LFE1472:
	.size	handle_resume, .-handle_resume
	.section	.rodata.str1.1
.LC19:
	.string	"pnp call arg1=%x\n"
	.section	.text.handle_pnp,"ax",@progbits
.globl handle_pnp
	.type	handle_pnp, @function
handle_pnp:
.LFB1531:
	.file 31 "src/pnpbios.c"
	.loc 31 67 0
	.cfi_startproc
.LVL1599:
	pushl	%esi
	.cfi_def_cfa_offset 8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	movl	%eax, %ebx
	.cfi_offset 3, -12
	.cfi_offset 6, -8
	.loc 31 71 0
	movw	(%eax), %si
.LVL1600:
	.loc 31 72 0
	movzwl	%si, %eax
.LVL1601:
	pushl	%eax
	.cfi_def_cfa_offset 16
	pushl	$.LC19
	.cfi_def_cfa_offset 20
	.cfi_escape 0x2e,0x8
	call	__dprintf.1654
.LVL1602:
	popl	%edx
	.cfi_def_cfa_offset 16
	popl	%ecx
	.cfi_def_cfa_offset 12
	.loc 31 74 0
	movl	$130, %eax
	cmpw	$96, %si
.LVL1603:
	jne	.L963
.LBB9271:
.LBB9272:
	.loc 31 53 0
	movzwl	2(%ebx), %eax
.LVL1604:
.LBB9273:
	.loc 31 55 0
#APP
# 55 "src/pnpbios.c" 1
	movw 4(%ebx), %ES
# 0 "" 2
#NO_APP
	movl	$257, %edx
#APP
# 55 "src/pnpbios.c" 1
	movw %dx, %ES:(%eax)
# 0 "" 2
#NO_APP
	xorl	%eax, %eax
.LVL1605:
.L963:
.LBE9273:
.LBE9272:
.LBE9271:
	.loc 31 78 0
	popl	%ebx
.LVL1606:
	popl	%esi
.LVL1607:
	ret
	.cfi_endproc
.LFE1531:
	.size	handle_pnp, .-handle_pnp
	.section	.rodata.str1.1
.LC20:
	.string	"WARNING - Unable to allocate resource at %s:%d!\n"
	.section	.text.configure_uhci.63731,"ax",@progbits
	.type	configure_uhci.63731, @function
configure_uhci.63731:
.LFB2045:
	.loc 19 119 0
	.cfi_startproc
.LVL1608:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	pushl	%edi
	.cfi_def_cfa_offset 12
	pushl	%esi
	.cfi_def_cfa_offset 16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	subl	$4, %esp
	.cfi_def_cfa_offset 24
	movl	%eax, %edi
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 5, -8
.LVL1609:
.LBB9274:
.LBB9275:
	.loc 8 390 0
	pushl	$16
	.cfi_def_cfa_offset 28
	movl	$16, %ecx
	orl	$-1, %edx
	movl	$ZoneHigh, %eax
.LVL1610:
	.cfi_escape 0x2e,0x4
	call	pmm_malloc.1832
	.cfi_def_cfa_offset 24
	movl	%eax, %esi
.LBE9275:
.LBE9274:
.LBB9276:
.LBB9277:
	.loc 8 408 0
	pushl	$4096
	.cfi_def_cfa_offset 28
	movl	$4096, %ecx
	orl	$-1, %edx
	movl	$ZoneHigh, %eax
	call	pmm_malloc.1832
	.cfi_def_cfa_offset 24
	movl	%eax, %ebp
.LVL1611:
.LBE9277:
.LBE9276:
.LBB9278:
.LBB9279:
	.loc 8 390 0
	pushl	$16
	.cfi_def_cfa_offset 28
	movl	$8, %ecx
	orl	$-1, %edx
	movl	$ZoneHigh, %eax
	call	pmm_malloc.1832
	.cfi_def_cfa_offset 24
	movl	%eax, %ebx
.LBE9279:
.LBE9278:
.LBB9280:
.LBB9281:
	pushl	$16
	.cfi_def_cfa_offset 28
	movl	$8, %ecx
	orl	$-1, %edx
	movl	$ZoneHigh, %eax
	call	pmm_malloc.1832
	.cfi_def_cfa_offset 24
	movl	%eax, %edx
.LBE9281:
.LBE9280:
	.loc 19 127 0
	testl	%ebp, %ebp
	je	.L966
	testl	%esi, %esi
	je	.L966
	testl	%eax, %eax
	je	.L966
.LBB9282:
.LBB9284:
	.loc 8 414 0
	movl	$16, %eax
.LVL1612:
.LBE9284:
.LBE9282:
	.loc 19 127 0
	testl	%ebx, %ebx
	jne	.L974
.L966:
.LBB9286:
.LBB9287:
	.loc 3 500 0
	pushl	$128
	.cfi_def_cfa_offset 28
	pushl	$__func__.63738
	.cfi_def_cfa_offset 32
	pushl	$.LC20
	.cfi_def_cfa_offset 36
	movl	%edx, 12(%esp)
	.cfi_escape 0x2e,0xc
	call	__dprintf.1654
.LVL1613:
	addl	$12, %esp
	.cfi_def_cfa_offset 24
.LBE9287:
.LBE9286:
.LBB9288:
.LBB9289:
	.loc 8 414 0
	movl	%esi, %eax
	.cfi_escape 0x2e,0x0
	call	pmm_free.1834
.LBE9289:
.LBE9288:
.LBB9290:
.LBB9291:
	movl	%ebp, %eax
	call	pmm_free.1834
.LBE9291:
.LBE9290:
.LBB9292:
.LBB9293:
	movl	%ebx, %eax
	call	pmm_free.1834
.LBE9293:
.LBE9292:
.LBB9294:
.LBB9295:
	movl	(%esp), %edx
	movl	%edx, %eax
	call	pmm_free.1834
.LBE9295:
.LBE9294:
.LBB9296:
.LBB9283:
	movl	%edi, %eax
.LBE9283:
.LBE9296:
	.loc 19 179 0
	popl	%ebx
	.cfi_def_cfa_offset 20
	popl	%ebx
	popl	%esi
	popl	%edi
.LVL1614:
	popl	%ebp
.LVL1615:
.LBB9297:
.LBB9285:
	.loc 8 414 0
	jmp	pmm_free.1834
.LVL1616:
.L974:
.LBE9285:
.LBE9297:
.LBB9298:
.LBB9299:
	.loc 6 178 0
	decl	%eax
	movb	$0, (%esi,%eax)
	.loc 6 177 0
	testl	%eax, %eax
	jne	.L974
.LBE9299:
.LBE9298:
	.loc 19 134 0
	movl	$1, (%esi)
	.loc 19 135 0
	movl	$-2064535, 8(%esi)
	movb	$8, %al
.LVL1617:
.L970:
.LBB9300:
.LBB9301:
	.loc 6 178 0
	decl	%eax
.LVL1618:
	movb	$0, (%edx,%eax)
	.loc 6 177 0
	testl	%eax, %eax
	jne	.L970
.LBE9301:
.LBE9300:
	.loc 19 138 0
	movl	%esi, 4(%edx)
	.loc 19 139 0
	movl	$1, (%edx)
	movb	$8, %al
.LVL1619:
.L971:
.LBB9302:
.LBB9303:
	.loc 6 178 0
	decl	%eax
.LVL1620:
	movb	$0, (%ebx,%eax)
	.loc 6 177 0
	testl	%eax, %eax
	jne	.L971
.LBE9303:
.LBE9302:
	.loc 19 143 0
	movl	$1, 4(%ebx)
	.loc 19 144 0
	orl	$2, %edx
	movl	%edx, (%ebx)
	.loc 19 147 0
	movl	%ebx, %edx
	orl	$2, %edx
.L972:
	movl	%edx, (%ebp,%eax,4)
.LVL1621:
	.loc 19 146 0
	incl	%eax
.LVL1622:
	cmpl	$1024, %eax
	jne	.L972
	.loc 19 148 0
	movl	%ebp, 28(%edi)
	.loc 19 149 0
	movl	%ebx, 24(%edi)
	movl	%ebx, 20(%edi)
	.loc 19 150 0
	.loc 19 153 0
	movl	16(%edi), %ecx
.LBB9304:
.LBB9305:
	.loc 2 82 0
	leal	12(%ecx), %edx
	movb	$64, %al
.LVL1623:
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE9305:
.LBE9304:
.LBB9306:
.LBB9307:
	.loc 2 88 0
	leal	8(%ecx), %edx
	movl	%ebp, %eax
#APP
# 88 "src/ioport.h" 1
	outl %eax, %dx
# 0 "" 2
#NO_APP
.LBE9307:
.LBE9306:
.LBB9308:
.LBB9309:
	.loc 2 85 0
	leal	6(%ecx), %edx
	xorl	%eax, %eax
#APP
# 85 "src/ioport.h" 1
	outw %ax, %dx
# 0 "" 2
#NO_APP
.LBE9309:
.LBE9308:
.LBB9310:
.LBB9311:
	movb	$-63, %al
	movl	%ecx, %edx
#APP
# 85 "src/ioport.h" 1
	outw %ax, %dx
# 0 "" 2
#NO_APP
.LBE9311:
.LBE9310:
.LBB9312:
.LBB9313:
	.loc 19 85 0
	call	__force_link_error__only_in_32bit_flat
.LBE9313:
.LBE9312:
	.cfi_endproc
.LFE2045:
	.size	configure_uhci.63731, .-configure_uhci.63731
	.section	.rodata.str1.1
.LC21:
	.string	"wait_td error - status=%x\n"
	.section	.text.wait_td.64059,"ax",@progbits
	.type	wait_td.64059, @function
wait_td.64059:
.LFB2053:
	.loc 19 413 0
	.cfi_startproc
.LVL1624:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	movl	%esp, %ebp
	.cfi_offset 5, -8
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$16, %esp
	movl	%eax, %ecx
.LBB9314:
.LBB9315:
.LBB9316:
	.loc 7 135 0
#APP
# 135 "src/clock.c" 1
	movl %CS:cpu_khz, %esi
# 0 "" 2
.LVL1625:
#NO_APP
.LBE9316:
.LBB9317:
.LBB9318:
	.loc 8 85 0
#APP
# 85 "src/util.h" 1
	rdtsc
# 0 "" 2
.LVL1626:
#NO_APP
	movl	%eax, -28(%ebp)
	movl	%edx, -24(%ebp)
.LBE9318:
.LBE9317:
	.loc 7 136 0
	movl	$5000, %ebx
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	movl	%esi, %eax
	mull	%ebx
	movl	%eax, %ebx
.LVL1627:
	movl	%edx, %esi
.LVL1628:
	addl	-28(%ebp), %ebx
.LVL1629:
	adcl	-24(%ebp), %esi
.LVL1630:
.L984:
.LBE9315:
.LBE9314:
	.loc 19 417 0
	movl	4(%ecx), %edx
.LVL1631:
	.loc 19 418 0
	testl	$8388608, %edx
	je	.L980
.LBB9319:
.LBB9320:
.LBB9321:
	.loc 8 85 0
#APP
# 85 "src/util.h" 1
	rdtsc
# 0 "" 2
#NO_APP
	movl	%eax, -28(%ebp)
	movl	%edx, -24(%ebp)
.LVL1632:
.LBE9321:
.LBE9320:
.LBE9319:
	.loc 19 420 0
	subl	%ebx, -28(%ebp)
	sbbl	%esi, -24(%ebp)
	cmpl	$0, -24(%ebp)
	jl	.L981
	jg	.L987
	cmpl	$0, -28(%ebp)
	jbe	.L981
.L987:
.LBB9322:
.LBB9323:
	.loc 3 508 0
	pushl	$421
	pushl	$__func__.64064
	pushl	$.LC12
	.cfi_escape 0x2e,0xc
	call	__dprintf.1654
.LVL1633:
	addl	$12, %esp
	orl	$-1, %eax
.LBE9323:
.LBE9322:
	.loc 19 422 0
	jmp	.L983
.LVL1634:
.L981:
.LBB9324:
.LBB9325:
.LBB9326:
.LBB9327:
	.loc 6 72 0
#APP
# 72 "src/util.c" 1
	sti
nop
rep ; nop
cli
cld

# 0 "" 2
#NO_APP
.LBE9327:
.LBE9326:
.LBE9325:
.LBE9324:
	.loc 19 425 0
	jmp	.L984
.LVL1635:
.L980:
	.loc 19 426 0
	xorl	%eax, %eax
	testl	$7733248, %edx
	je	.L983
	.loc 19 427 0
	pushl	%edx
	pushl	$.LC21
	.cfi_escape 0x2e,0x8
	call	__dprintf.1654
.LVL1636:
	popl	%esi
.LVL1637:
	popl	%edi
	movl	$-2, %eax
.LVL1638:
.L983:
	.loc 19 431 0
	leal	-12(%ebp), %esp
	popl	%ebx
.LVL1639:
	popl	%esi
.LVL1640:
	popl	%edi
	leave
	ret
	.cfi_endproc
.LFE2053:
	.size	wait_td.64059, .-wait_td.64059
	.section	.rodata.str1.1
.LC22:
	.string	"uhci_send_bulk failed\n"
	.section	.text.uhci_send_bulk.60595,"ax",@progbits
	.type	uhci_send_bulk.60595, @function
uhci_send_bulk.60595:
.LFB2054:
	.loc 19 438 0
	.cfi_startproc
.LVL1641:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	movl	%esp, %ebp
	.cfi_offset 5, -8
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$144, %esp
	leal	8(%ebp), %edi
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	movl	%edx, -148(%ebp)
	movl	%ecx, -108(%ebp)
	movl	(%edi), %edi
	movl	%edi, -100(%ebp)
.LBB9328:
	.loc 19 441 0
	leal	-12(%eax), %edx
.LVL1642:
	movl	%edx, -120(%ebp)
.LBE9328:
.LBB9329:
	.loc 19 444 0
	leal	8(%eax), %edx
	movl	%edx, %ecx
.LVL1643:
	shrl	$4, %ecx
#APP
# 444 "src/usb-uhci.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB9330:
	andl	$15, %edx
#APP
# 444 "src/usb-uhci.c" 1
	movw %ES:(%edx), %dx
# 0 "" 2
.LVL1644:
#NO_APP
.LBE9330:
.LBE9329:
	movzwl	%dx, %edx
.LVL1645:
	movl	%edx, -116(%ebp)
.LBB9331:
	.loc 19 445 0
	leal	7(%eax), %edx
	movl	%edx, %ecx
	shrl	$4, %ecx
#APP
# 445 "src/usb-uhci.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB9332:
	andl	$15, %edx
#APP
# 445 "src/usb-uhci.c" 1
	movb %ES:(%edx), %cl
# 0 "" 2
#NO_APP
	movb	%cl, -137(%ebp)
.LBE9332:
.LBE9331:
.LBB9333:
	.loc 19 446 0
	leal	6(%eax), %edx
	movl	%edx, %ecx
	shrl	$4, %ecx
#APP
# 446 "src/usb-uhci.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB9334:
	andl	$15, %edx
#APP
# 446 "src/usb-uhci.c" 1
	movb %ES:(%edx), %cl
# 0 "" 2
.LVL1646:
#NO_APP
.LBE9334:
.LBE9333:
.LBB9335:
	.loc 19 447 0
	leal	5(%eax), %edx
	movl	%edx, %ebx
	shrl	$4, %ebx
#APP
# 447 "src/usb-uhci.c" 1
	movw %bx, %ES
# 0 "" 2
#NO_APP
.LBB9336:
	andl	$15, %edx
#APP
# 447 "src/usb-uhci.c" 1
	movb %ES:(%edx), %dl
# 0 "" 2
.LVL1647:
#NO_APP
.LBE9336:
.LBE9335:
	movzbl	%dl, %edx
.LVL1648:
	sall	$7, %edx
	movzbl	%cl, %ecx
.LVL1649:
	orl	%ecx, %edx
.LBB9337:
	.loc 19 448 0
	addl	$14, %eax
.LVL1650:
	movl	%eax, %esi
	shrl	$4, %esi
	movl	%esi, -136(%ebp)
#APP
# 448 "src/usb-uhci.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB9338:
	andl	$15, %eax
	movl	%eax, -132(%ebp)
#APP
# 448 "src/usb-uhci.c" 1
	movb %ES:(%eax), %al
# 0 "" 2
.LVL1651:
#NO_APP
.LBE9338:
.LBE9337:
	cmpb	$1, %al
	sbbl	%ebx, %ebx
.LVL1652:
	notl	%ebx
	andl	$524288, %ebx
	.loc 19 452 0
	leal	-76(%ebp), %esi
	andl	$-16, %esi
	movl	$64, %eax
.LVL1653:
.L991:
.LBB9339:
.LBB9340:
	.loc 6 178 0
	decl	%eax
.LVL1654:
	movb	$0, (%eax,%esi)
	.loc 6 177 0
	testl	%eax, %eax
	jne	.L991
.LBE9340:
.LBE9339:
	.loc 19 456 0
.LBB9341:
.LBB9342:
.LBB9343:
	.loc 19 457 0
#APP
# 457 "src/usb-uhci.c" 1
	movw %SS, %cx
# 0 "" 2
.LVL1655:
#NO_APP
.LBE9343:
	movl	-120(%ebp), %eax
.LVL1656:
	addl	$4, %eax
	movl	%eax, %edi
	shrl	$4, %edi
	movl	%edi, -128(%ebp)
#APP
# 457 "src/usb-uhci.c" 1
	movw %di, %ES
# 0 "" 2
#NO_APP
	andl	$15, %eax
	movl	%eax, -124(%ebp)
	movzwl	%cx, %ecx
.LVL1657:
	sall	$4, %ecx
	addl	%esi, %ecx
#APP
# 457 "src/usb-uhci.c" 1
	movl %ecx, %ES:(%eax)
# 0 "" 2
#NO_APP
.LBE9342:
.LBE9341:
.LBB9344:
	.loc 19 473 0
	sall	$8, %edx
	movl	%edx, -144(%ebp)
	xorl	%edi, %edi
.LVL1658:
	movl	%esi, -156(%ebp)
.LBE9344:
	.loc 19 460 0
	jmp	.L992
.LVL1659:
.L1001:
.LBB9346:
	.loc 19 461 0
	movl	%edi, %edx
.LVL1660:
	andl	$3, %edx
	sall	$4, %edx
	addl	-156(%ebp), %edx
.LVL1661:
	.loc 19 462 0
	movl	%edx, %eax
.LVL1662:
	movl	%edx, -152(%ebp)
.LVL1663:
	call	wait_td.64059
	.loc 19 463 0
	testl	%eax, %eax
.LVL1664:
	movl	-152(%ebp), %edx
	jne	.L993
	.loc 19 461 0
	incl	%edi
.LVL1665:
	movl	-100(%ebp), %eax
.LVL1666:
	movl	-116(%ebp), %ecx
	cmpl	%ecx, %eax
.LVL1667:
	jle	.L994
	movl	%ecx, %eax
.LVL1668:
.L994:
.LBB9345:
	.loc 19 469 0
#APP
# 469 "src/usb-uhci.c" 1
	movw %SS, %si
# 0 "" 2
.LVL1669:
#NO_APP
.LBE9345:
	.loc 19 471 0
	movl	$1, %ecx
	cmpl	-100(%ebp), %eax
	je	.L996
	.loc 19 469 0
	movzwl	%si, %esi
.LVL1670:
	sall	$4, %esi
	movl	%edi, %ecx
	andl	$3, %ecx
	sall	$4, %ecx
	addl	-156(%ebp), %ecx
	leal	(%esi,%ecx), %ecx
.LVL1671:
.L996:
	.loc 19 471 0
	movl	%ecx, (%edx)
.LVL1672:
	.loc 19 472 0
	cmpl	$1, -148(%ebp)
	sbbl	%ecx, %ecx
	andl	$120, %ecx
	addl	$105, %ecx
	movl	-144(%ebp), %esi
.LVL1673:
	orl	%ebx, %esi
	movl	%esi, -104(%ebp)
	leal	-1(%eax), %esi
	sall	$21, %esi
	orl	%esi, -104(%ebp)
	orl	%ecx, -104(%ebp)
	movl	-104(%ebp), %ecx
	movl	%ecx, 8(%edx)
	.loc 19 475 0
	movl	-108(%ebp), %esi
	movl	%esi, 12(%edx)
	.loc 19 476 0
	.loc 19 477 0
	cmpb	$1, -137(%ebp)
	sbbl	%ecx, %ecx
	andl	$-67108864, %ecx
	addl	$478150656, %ecx
	movl	%ecx, 4(%edx)
	.loc 19 479 0
	xorl	$524288, %ebx
.LVL1674:
	.loc 19 481 0
	addl	%eax, %esi
	movl	%esi, -108(%ebp)
	.loc 19 482 0
	subl	%eax, -100(%ebp)
.LVL1675:
.L992:
.LBE9346:
	.loc 19 460 0
	cmpl	$0, -100(%ebp)
	jne	.L1001
	movl	-156(%ebp), %esi
	.loc 19 437 0
	leal	4(%edi), %eax
.LVL1676:
	movl	%eax, -100(%ebp)
.LVL1677:
.L1002:
.LBB9347:
	.loc 19 486 0
	movl	%edi, %eax
.LVL1678:
	andl	$3, %eax
	sall	$4, %eax
	leal	(%esi,%eax), %eax
.LVL1679:
	incl	%edi
	.loc 19 487 0
	call	wait_td.64059
.LVL1680:
	.loc 19 488 0
	testl	%eax, %eax
.LVL1681:
	jne	.L993
.LBE9347:
	.loc 19 485 0
	cmpl	-100(%ebp), %edi
	jne	.L1002
.LBB9348:
.LBB9349:
	.loc 19 492 0
#APP
# 492 "src/usb-uhci.c" 1
	movw -136(%ebp), %ES
# 0 "" 2
#NO_APP
	testl	%ebx, %ebx
	setne	%al
.LVL1682:
	movl	-132(%ebp), %edx
#APP
# 492 "src/usb-uhci.c" 1
	movb %al, %ES:(%edx)
# 0 "" 2
#NO_APP
	xorl	%eax, %eax
.LBE9349:
.LBE9348:
	.loc 19 493 0
	jmp	.L1003
.LVL1683:
.L993:
	.loc 19 495 0
	pushl	$.LC22
	.cfi_escape 0x2e,0x4
	call	__dprintf.1654
.LVL1684:
	popl	%eax
.LBB9350:
.LBB9351:
	.loc 19 496 0
#APP
# 496 "src/usb-uhci.c" 1
	movw -128(%ebp), %ES
# 0 "" 2
#NO_APP
	movl	$1, %eax
	movl	-124(%ebp), %ecx
#APP
# 496 "src/usb-uhci.c" 1
	movl %eax, %ES:(%ecx)
# 0 "" 2
#NO_APP
.LBE9351:
.LBE9350:
.LBB9352:
	.loc 19 497 0
	movl	-120(%ebp), %eax
	addl	$24, %eax
	movl	%eax, %edx
	shrl	$4, %edx
#APP
# 497 "src/usb-uhci.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB9353:
	andl	$15, %eax
#APP
# 497 "src/usb-uhci.c" 1
	movw %ES:(%eax), %dx
# 0 "" 2
.LVL1685:
#NO_APP
.LBE9353:
.LBE9352:
.LBB9354:
.LBB9355:
	.loc 19 234 0
	.loc 19 235 0
	leal	6(%edx), %edi
.LVL1686:
.LBB9356:
.LBB9357:
	.loc 2 97 0
	movl	%edi, %edx
.LVL1687:
#APP
# 97 "src/ioport.h" 1
	inw %dx, %ax
# 0 "" 2
#NO_APP
	movl	%eax, %ecx
.LVL1688:
.LBE9357:
.LBE9356:
.LBB9358:
.LBB9359:
.LBB9360:
	.loc 7 135 0
#APP
# 135 "src/clock.c" 1
	movl %CS:cpu_khz, %ebx
# 0 "" 2
.LVL1689:
#NO_APP
.LBE9360:
.LBB9361:
.LBB9362:
	.loc 8 85 0
#APP
# 85 "src/util.h" 1
	rdtsc
# 0 "" 2
#NO_APP
	movl	%eax, -100(%ebp)
	movl	%edx, -96(%ebp)
.LBE9362:
.LBE9361:
	.loc 7 136 0
	movl	$5000, %esi
	movl	%ebx, %eax
	mull	%esi
	movl	%eax, %ebx
.LVL1690:
	movl	%edx, %esi
.LVL1691:
	addl	-100(%ebp), %ebx
.LVL1692:
	adcl	-96(%ebp), %esi
.LVL1693:
.L1007:
.LBE9359:
.LBE9358:
.LBB9363:
.LBB9364:
	.loc 2 97 0
	movl	%edi, %edx
#APP
# 97 "src/ioport.h" 1
	inw %dx, %ax
# 0 "" 2
.LVL1694:
#NO_APP
.LBE9364:
.LBE9363:
	.loc 19 238 0
	cmpw	%cx, %ax
	jne	.L1004
.LBB9365:
.LBB9366:
.LBB9367:
	.loc 8 85 0
#APP
# 85 "src/util.h" 1
	rdtsc
# 0 "" 2
.LVL1695:
#NO_APP
	movl	%eax, -100(%ebp)
	movl	%edx, -96(%ebp)
.LBE9367:
.LBE9366:
.LBE9365:
	.loc 19 240 0
	subl	%ebx, -100(%ebp)
	sbbl	%esi, -96(%ebp)
	cmpl	$0, -96(%ebp)
	jl	.L1005
	jg	.L1009
	cmpl	$0, -100(%ebp)
	jbe	.L1005
.L1009:
.LBB9368:
.LBB9369:
	.loc 3 508 0
	pushl	$241
	pushl	$__func__.63839
	pushl	$.LC12
	.cfi_escape 0x2e,0xc
	call	__dprintf.1654
.LVL1696:
	addl	$12, %esp
	jmp	.L1004
.LVL1697:
.L1005:
.LBE9369:
.LBE9368:
.LBB9370:
.LBB9371:
.LBB9372:
.LBB9373:
	.loc 6 72 0
#APP
# 72 "src/util.c" 1
	sti
nop
rep ; nop
cli
cld

# 0 "" 2
#NO_APP
	jmp	.L1007
.LVL1698:
.L1004:
	orl	$-1, %eax
.LVL1699:
.L1003:
.LBE9373:
.LBE9372:
.LBE9371:
.LBE9370:
.LBE9355:
.LBE9354:
	.loc 19 499 0
	leal	-12(%ebp), %esp
	popl	%ebx
.LVL1700:
	popl	%esi
.LVL1701:
	popl	%edi
.LVL1702:
	leave
	ret	$4
	.cfi_endproc
.LFE2054:
	.size	uhci_send_bulk.60595, .-uhci_send_bulk.60595
	.section	.text.configure_ohci.66659,"ax",@progbits
	.type	configure_ohci.66659, @function
configure_ohci.66659:
.LFB2124:
	.loc 20 172 0
	.cfi_startproc
.LVL1703:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	movl	%esp, %ebp
	.cfi_offset 5, -8
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$24, %esp
	movl	%eax, %ebx
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
.LBB9374:
.LBB9375:
	.loc 8 408 0
	pushl	$256
	movl	$256, %ecx
	orl	$-1, %edx
	movl	$ZoneHigh, %eax
.LVL1704:
	.cfi_escape 0x2e,0x4
	call	pmm_malloc.1832
	movl	%eax, %edi
.LBE9375:
.LBE9374:
.LBB9376:
.LBB9377:
	.loc 8 390 0
	pushl	$16
	movl	$16, %ecx
	orl	$-1, %edx
	movl	$ZoneHigh, %eax
	call	pmm_malloc.1832
	movl	%eax, %esi
.LBE9377:
.LBE9376:
	.loc 20 178 0
	testl	%eax, %eax
	je	.L1026
	.loc 20 180 0
	movl	$256, %eax
.LVL1705:
	.loc 20 178 0
	testl	%edi, %edi
	jne	.L1030
.L1026:
.LBB9378:
.LBB9379:
	.loc 3 500 0
	pushl	$179
	pushl	$__func__.66664
	pushl	$.LC20
	.cfi_escape 0x2e,0xc
	call	__dprintf.1654
.LVL1706:
	addl	$12, %esp
.LBE9379:
.LBE9378:
	.loc 20 180 0
	jmp	.L1015
.LVL1707:
.L1030:
.LBB9380:
.LBB9381:
	.loc 6 178 0
	decl	%eax
.LVL1708:
	movb	$0, (%edi,%eax)
	.loc 6 177 0
	testl	%eax, %eax
	jne	.L1030
	movb	$16, %al
.LVL1709:
.L1017:
.LBE9381:
.LBE9380:
.LBB9382:
.LBB9383:
	.loc 6 178 0
	decl	%eax
.LVL1710:
	movb	$0, (%esi,%eax)
	.loc 6 177 0
	testl	%eax, %eax
	jne	.L1017
.LBE9383:
.LBE9382:
	.loc 20 184 0
	movl	$16384, (%esi)
.L1018:
	.loc 20 187 0
	movl	%esi, (%edi,%eax,4)
.LVL1711:
	.loc 20 186 0
	incl	%eax
.LVL1712:
	cmpl	$32, %eax
	jne	.L1018
.LBB9384:
.LBB9385:
	.loc 20 115 0
	movl	16(%ebx), %eax
.LVL1713:
.LBB9420:
.LBB9421:
	.loc 8 135 0
	movl	52(%eax), %edx
	movl	%edx, -36(%ebp)
.LBE9421:
.LBE9420:
.LBB9418:
.LBB9419:
	movl	4(%eax), %ecx
.LBE9419:
.LBE9418:
	.loc 20 116 0
	andl	$512, %ecx
	movl	%ecx, -24(%ebp)
.LBB9416:
.LBB9417:
	.loc 8 126 0
	movl	%ecx, 4(%eax)
.LBE9417:
.LBE9416:
.LBB9414:
.LBB9415:
	.loc 8 135 0
	movl	4(%eax), %eax
.LBE9415:
.LBE9414:
.LBB9401:
.LBB9402:
	.loc 7 128 0
#APP
# 128 "src/clock.c" 1
	movl %CS:cpu_khz, %ecx
# 0 "" 2
.LVL1714:
#NO_APP
.LBE9402:
.LBB9403:
.LBB9404:
.LBB9405:
.LBB9406:
	.loc 8 85 0
#APP
# 85 "src/util.h" 1
	rdtsc
# 0 "" 2
.LVL1715:
#NO_APP
.LBE9406:
.LBE9405:
	.loc 7 106 0
	imull	$50, %ecx, %ecx
.LVL1716:
	movl	%ecx, -20(%ebp)
	movl	$0, -16(%ebp)
	addl	%eax, -20(%ebp)
	adcl	%edx, -16(%ebp)
.LVL1717:
	jmp	.L1019
.LVL1718:
.L1020:
.LBB9407:
.LBB9408:
.LBB9409:
.LBB9410:
	.loc 6 72 0
#APP
# 72 "src/util.c" 1
	sti
nop
rep ; nop
cli
cld

# 0 "" 2
.LVL1719:
#NO_APP
.L1019:
.LBE9410:
.LBE9409:
.LBE9408:
.LBE9407:
.LBB9411:
.LBB9412:
.LBB9413:
	.loc 8 85 0
#APP
# 85 "src/util.h" 1
	rdtsc
# 0 "" 2
.LVL1720:
#NO_APP
.LBE9413:
.LBE9412:
.LBE9411:
	.loc 7 107 0
	subl	-20(%ebp), %eax
	sbbl	-16(%ebp), %edx
.LVL1721:
	cmpl	$0, %edx
	jl	.L1020
	jg	.L1027
	cmpl	$0, %eax
	jbe	.L1020
.L1027:
.LBE9404:
.LBE9403:
.LBE9401:
.LBB9396:
.LBB9397:
.LBB9398:
	.loc 7 141 0
#APP
# 141 "src/clock.c" 1
	movl %CS:cpu_khz, %eax
# 0 "" 2
#NO_APP
	movl	%eax, -20(%ebp)
.LBE9398:
.LBB9399:
.LBB9400:
	.loc 8 85 0
#APP
# 85 "src/util.h" 1
	rdtsc
# 0 "" 2
#NO_APP
	movl	%eax, -32(%ebp)
	movl	%edx, -28(%ebp)
.LBE9400:
.LBE9399:
	.loc 7 142 0
	movl	$1000, %edx
	movl	-20(%ebp), %eax
	movl	%edx, %ecx
	xorl	%edx, %edx
	divl	%ecx
	movw	$10, %cx
	mull	%ecx
	movl	%eax, -20(%ebp)
	movl	%edx, -16(%ebp)
	movl	-32(%ebp), %edx
	movl	-28(%ebp), %ecx
	addl	%edx, -20(%ebp)
	adcl	%ecx, -16(%ebp)
.LBE9397:
.LBE9396:
.LBB9394:
.LBB9395:
	.loc 8 126 0
	movl	16(%ebx), %ecx
	leal	8(%ecx), %eax
	movl	%eax, -32(%ebp)
	movl	$1, 8(%ecx)
.L1035:
.LBE9395:
.LBE9394:
.LBB9386:
.LBB9387:
.LBB9388:
	.loc 8 135 0
	movl	-32(%ebp), %edx
	movl	(%edx), %eax
.LVL1722:
.LBE9388:
.LBE9387:
	.loc 20 130 0
	testl	%eax, %eax
	je	.L1022
.LBB9389:
.LBB9390:
.LBB9391:
	.loc 8 85 0
#APP
# 85 "src/util.h" 1
	rdtsc
# 0 "" 2
.LVL1723:
#NO_APP
.LBE9391:
.LBE9390:
.LBE9389:
	.loc 20 132 0
	subl	-20(%ebp), %eax
	sbbl	-16(%ebp), %edx
	cmpl	$0, %edx
	jl	.L1035
	jg	.L1028
	cmpl	$0, %eax
	jbe	.L1035
.L1028:
.LBB9392:
.LBB9393:
	.loc 3 508 0
	pushl	$133
	pushl	$__func__.66618
	pushl	$.LC12
	call	__dprintf.1654
	addl	$12, %esp
.LBE9393:
.LBE9392:
.LBE9386:
.LBE9385:
.LBE9384:
.LBB9439:
.LBB9440:
.LBB9441:
.LBB9442:
	.loc 8 135 0
	movl	16(%ebx), %eax
	movl	4(%eax), %edx
.LVL1724:
.LBE9442:
.LBE9441:
	.loc 20 165 0
	andl	$512, %edx
.LBB9443:
.LBB9444:
	.loc 8 126 0
	movl	%edx, 4(%eax)
.LBE9444:
.LBE9443:
.LBB9445:
.LBB9446:
	.loc 8 135 0
	movl	4(%eax), %eax
	jmp	.L1015
.LVL1725:
.L1022:
.LBE9446:
.LBE9445:
.LBE9440:
.LBE9439:
.LBB9447:
.LBB9438:
.LBB9422:
.LBB9423:
	.loc 8 126 0
	movl	$0, 32(%ecx)
.LBE9423:
.LBE9422:
.LBB9424:
.LBB9425:
	movl	16(%ebx), %ecx
	movl	$0, 40(%ecx)
.LBE9425:
.LBE9424:
.LBB9426:
.LBB9427:
	movl	%edi, 24(%ecx)
.LBE9427:
.LBE9426:
	.loc 20 144 0
	movl	-36(%ebp), %esi
.LVL1726:
	andl	$16383, %esi
	.loc 20 145 0
	movl	-36(%ebp), %ebx
.LVL1727:
	notl	%ebx
	andl	$-2147483648, %ebx
	orl	%esi, %ebx
	imull	$6, %esi, %eax
.LVL1728:
	subl	$1260, %eax
	movl	$7, %edx
	movl	%edx, %edi
	xorl	%edx, %edx
	divl	%edi
	sall	$16, %eax
	orl	%eax, %ebx
.LBB9428:
.LBB9429:
	.loc 8 126 0
	movl	%ebx, 52(%ecx)
.LBE9429:
.LBE9428:
	.loc 20 148 0
	leal	(%esi,%esi,8), %eax
	movl	$10, %edx
	movl	%edx, %ebx
	xorl	%edx, %edx
	divl	%ebx
	andl	$16383, %eax
.LBB9430:
.LBB9431:
	.loc 8 126 0
	movl	%eax, 64(%ecx)
.LBE9431:
.LBE9430:
.LBB9432:
.LBB9433:
	.loc 8 135 0
	movl	4(%ecx), %eax
.LBE9433:
.LBE9432:
	.loc 20 154 0
	movl	-24(%ebp), %eax
	orb	$-105, %al
.LBB9434:
.LBB9435:
	.loc 8 126 0
	movl	%eax, 4(%ecx)
.LBE9435:
.LBE9434:
.LBB9436:
.LBB9437:
	.loc 8 135 0
	movl	4(%ecx), %eax
.LBE9437:
.LBE9436:
.LBE9438:
.LBE9447:
.LBB9448:
.LBB9449:
	.loc 20 89 0
	.cfi_escape 0x2e,0x0
	call	__force_link_error__only_in_32bit_flat
.LVL1729:
.L1015:
.LBE9449:
.LBE9448:
.LBB9450:
.LBB9451:
	.loc 8 414 0
	movl	%edi, %eax
	call	pmm_free.1834
.LVL1730:
.LBE9451:
.LBE9450:
.LBB9452:
.LBB9453:
	movl	%esi, %eax
.LBE9453:
.LBE9452:
	.loc 20 204 0
	leal	-12(%ebp), %esp
	popl	%ebx
.LVL1731:
	popl	%esi
	popl	%edi
	leave
.LBB9455:
.LBB9454:
	.loc 8 414 0
	jmp	pmm_free.1834
.LBE9454:
.LBE9455:
	.cfi_endproc
.LFE2124:
	.size	configure_ohci.66659, .-configure_ohci.66659
	.section	.text.configure_ehci.69345,"ax",@progbits
	.type	configure_ehci.69345, @function
configure_ehci.69345:
.LFB2200:
	.loc 21 175 0
	.cfi_startproc
.LVL1732:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	movl	%esp, %ebp
	.cfi_offset 5, -8
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$24, %esp
	movl	%eax, %ebx
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
.LVL1733:
.LBB9456:
.LBB9457:
	.loc 8 408 0
	pushl	$4096
	movl	$4096, %ecx
	orl	$-1, %edx
	movl	$ZoneHigh, %eax
.LVL1734:
	.cfi_escape 0x2e,0x4
	call	pmm_malloc.1832
	movl	%eax, -16(%ebp)
.LBE9457:
.LBE9456:
.LBB9458:
.LBB9459:
	pushl	$64
	movl	$48, %ecx
	orl	$-1, %edx
	movl	$ZoneHigh, %eax
	call	pmm_malloc.1832
	movl	%eax, %esi
.LBE9459:
.LBE9458:
.LBB9460:
.LBB9461:
	pushl	$64
	movl	$48, %ecx
	orl	$-1, %edx
	movl	$ZoneHigh, %eax
	call	pmm_malloc.1832
	movl	%eax, %edi
.LBE9461:
.LBE9460:
	.loc 21 182 0
	testl	%esi, %esi
	je	.L1038
	cmpl	$0, -16(%ebp)
	je	.L1038
	testl	%eax, %eax
	jne	.L1039
.L1038:
.LBB9462:
.LBB9463:
	.loc 3 500 0
	pushl	$183
	pushl	$__func__.69351
	pushl	$.LC20
	jmp	.L1055
.L1039:
.LBE9463:
.LBE9462:
.LBB9464:
.LBB9465:
	.loc 8 135 0
	movl	20(%ebx), %eax
	movl	%eax, -36(%ebp)
	movl	(%eax), %edx
.LBE9465:
.LBE9464:
	.loc 21 191 0
	andl	$-51, %edx
	orl	$2, %edx
.LBB9466:
.LBB9467:
	.loc 8 126 0
	movl	%edx, (%eax)
.LBE9467:
.LBE9466:
.LBB9468:
.LBB9469:
.LBB9470:
	.loc 7 135 0
#APP
# 135 "src/clock.c" 1
	movl %CS:cpu_khz, %ecx
# 0 "" 2
.LVL1735:
#NO_APP
.LBE9470:
.LBB9471:
.LBB9472:
	.loc 8 85 0
#APP
# 85 "src/util.h" 1
	rdtsc
# 0 "" 2
#NO_APP
	movl	%eax, -32(%ebp)
	movl	%edx, -28(%ebp)
.LBE9472:
.LBE9471:
	.loc 7 136 0
	movl	$250, %eax
	mull	%ecx
	movl	%eax, -24(%ebp)
	movl	%edx, -20(%ebp)
	movl	-32(%ebp), %edx
	movl	-28(%ebp), %ecx
.LVL1736:
	addl	%edx, -24(%ebp)
	adcl	%ecx, -20(%ebp)
	movl	-36(%ebp), %ecx
.L1054:
.LBE9469:
.LBE9468:
.LBB9473:
.LBB9474:
	.loc 8 135 0
	movl	(%ecx), %edx
.LVL1737:
.LBE9474:
.LBE9473:
	.loc 21 195 0
	testb	$2, %dl
	je	.L1041
.LBB9475:
.LBB9476:
.LBB9477:
	.loc 8 85 0
#APP
# 85 "src/util.h" 1
	rdtsc
# 0 "" 2
#NO_APP
	movl	%eax, -32(%ebp)
	movl	%edx, -28(%ebp)
.LVL1738:
.LBE9477:
.LBE9476:
.LBE9475:
	.loc 21 197 0
	movl	-24(%ebp), %eax
	movl	-20(%ebp), %edx
	subl	%eax, -32(%ebp)
	sbbl	%edx, -28(%ebp)
	cmpl	$0, -28(%ebp)
	jl	.L1054
	jg	.L1048
	cmpl	$0, -32(%ebp)
	jbe	.L1054
.L1048:
.LBB9478:
.LBB9479:
	.loc 3 508 0
	pushl	$198
	pushl	$__func__.69351
	pushl	$.LC12
.L1055:
	.cfi_escape 0x2e,0xc
	call	__dprintf.1654
	addl	$12, %esp
.LBE9479:
.LBE9478:
.LBB9480:
.LBB9481:
	.loc 8 414 0
	movl	-16(%ebp), %eax
	.cfi_escape 0x2e,0x0
	call	pmm_free.1834
.LBE9481:
.LBE9480:
.LBB9482:
.LBB9483:
	movl	%esi, %eax
	call	pmm_free.1834
.LBE9483:
.LBE9482:
.LBB9484:
.LBB9485:
	movl	%edi, %eax
	call	pmm_free.1834
.LBE9485:
.LBE9484:
.LBB9486:
.LBB9487:
	movl	%ebx, %eax
.LBE9487:
.LBE9486:
	.loc 21 248 0
	leal	-12(%ebp), %esp
	popl	%ebx
.LVL1739:
	popl	%esi
	popl	%edi
	leave
.LBB9489:
.LBB9488:
	.loc 8 414 0
	jmp	pmm_free.1834
.LVL1740:
.L1041:
.LBE9488:
.LBE9489:
.LBB9490:
.LBB9491:
	.loc 8 126 0
	movl	$0, 8(%ecx)
	movl	$48, %eax
.LVL1741:
.L1044:
.LBE9491:
.LBE9490:
.LBB9492:
.LBB9493:
	.loc 6 178 0
	decl	%eax
.LVL1742:
	movb	$0, (%esi,%eax)
	.loc 6 177 0
	testl	%eax, %eax
	jne	.L1044
.LBE9493:
.LBE9492:
	.loc 21 208 0
	movl	$1, (%esi)
	.loc 21 209 0
	movl	$1, 8(%esi)
	.loc 21 210 0
	movl	$64, 24(%esi)
	.loc 21 211 0
	movl	$1, 20(%esi)
	movl	$1, 16(%esi)
	.loc 21 214 0
	orl	$2, %esi
.L1045:
	movl	-16(%ebp), %ecx
	movl	%esi, (%ecx,%eax,4)
.LVL1743:
	.loc 21 213 0
	incl	%eax
.LVL1744:
	cmpl	$1024, %eax
	jne	.L1045
.LBB9494:
.LBB9495:
	.loc 8 126 0
	movl	20(%ebx), %eax
.LVL1745:
	movl	%ecx, 20(%eax)
	movl	$48, %eax
.LVL1746:
.L1046:
.LBE9495:
.LBE9494:
.LBB9496:
.LBB9497:
	.loc 6 178 0
	decl	%eax
.LVL1747:
	movb	$0, (%edi,%eax)
	.loc 6 177 0
	testl	%eax, %eax
	jne	.L1046
.LBE9497:
.LBE9496:
	.loc 21 219 0
	movl	%edi, %eax
.LVL1748:
	orl	$2, %eax
	movl	%eax, (%edi)
	.loc 21 220 0
	movl	$32768, 4(%edi)
	.loc 21 221 0
	movl	$64, 24(%edi)
	.loc 21 222 0
	movl	$1, 20(%edi)
	movl	$1, 16(%edi)
	.loc 21 223 0
	movl	%edi, 24(%ebx)
.LBB9498:
.LBB9499:
	.loc 8 126 0
	movl	20(%ebx), %eax
	movl	%edi, 24(%eax)
.LBE9499:
.LBE9498:
	.loc 21 227 0
	orl	$49, %edx
.LVL1749:
.LBB9500:
.LBB9501:
	.loc 8 126 0
	movl	%edx, (%eax)
.LBE9501:
.LBE9500:
.LBB9502:
.LBB9503:
	movl	$1, 64(%eax)
.LBE9503:
.LBE9502:
.LBB9504:
.LBB9505:
	.loc 8 135 0
	movl	16(%ebx), %eax
	movl	4(%eax), %eax
.LBE9505:
.LBE9504:
	.loc 21 231 0
	andl	$15, %eax
	movl	%eax, 60(%ebx)
.LBB9506:
.LBB9507:
	.loc 21 158 0
	call	__force_link_error__only_in_32bit_flat
.LBE9507:
.LBE9506:
	.cfi_endproc
.LFE2200:
	.size	configure_ehci.69345, .-configure_ehci.69345
	.section	.rodata.str1.1
.LC23:
	.string	"ehci_wait_td error - status=%x\n"
	.section	.text.ehci_wait_td.69720,"ax",@progbits
	.type	ehci_wait_td.69720, @function
ehci_wait_td.69720:
.LFB2209:
	.loc 21 561 0
	.cfi_startproc
.LVL1750:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	movl	%esp, %ebp
	.cfi_offset 5, -8
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$16, %esp
	movl	%eax, %ecx
.LBB9508:
.LBB9509:
.LBB9510:
	.loc 7 135 0
#APP
# 135 "src/clock.c" 1
	movl %CS:cpu_khz, %esi
# 0 "" 2
.LVL1751:
#NO_APP
.LBE9510:
.LBB9511:
.LBB9512:
	.loc 8 85 0
#APP
# 85 "src/util.h" 1
	rdtsc
# 0 "" 2
.LVL1752:
#NO_APP
	movl	%eax, -28(%ebp)
	movl	%edx, -24(%ebp)
.LBE9512:
.LBE9511:
	.loc 7 136 0
	movl	$5000, %ebx
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	movl	%esi, %eax
	mull	%ebx
	movl	%eax, %ebx
.LVL1753:
	movl	%edx, %esi
.LVL1754:
	addl	-28(%ebp), %ebx
.LVL1755:
	adcl	-24(%ebp), %esi
.LVL1756:
.L1061:
.LBE9509:
.LBE9508:
	.loc 21 565 0
	movl	8(%ecx), %edx
.LVL1757:
	.loc 21 566 0
	testb	%dl, %dl
	jns	.L1057
.LBB9513:
.LBB9514:
.LBB9515:
	.loc 8 85 0
#APP
# 85 "src/util.h" 1
	rdtsc
# 0 "" 2
#NO_APP
	movl	%eax, -28(%ebp)
	movl	%edx, -24(%ebp)
.LVL1758:
.LBE9515:
.LBE9514:
.LBE9513:
	.loc 21 568 0
	subl	%ebx, -28(%ebp)
	sbbl	%esi, -24(%ebp)
	cmpl	$0, -24(%ebp)
	jl	.L1058
	jg	.L1064
	cmpl	$0, -28(%ebp)
	jbe	.L1058
.L1064:
.LBB9516:
.LBB9517:
	.loc 3 508 0
	pushl	$569
	pushl	$__func__.69725
	pushl	$.LC12
	.cfi_escape 0x2e,0xc
	call	__dprintf.1654
.LVL1759:
	addl	$12, %esp
	orl	$-1, %eax
.LBE9517:
.LBE9516:
	.loc 21 570 0
	jmp	.L1060
.LVL1760:
.L1058:
.LBB9518:
.LBB9519:
.LBB9520:
.LBB9521:
	.loc 6 72 0
#APP
# 72 "src/util.c" 1
	sti
nop
rep ; nop
cli
cld

# 0 "" 2
#NO_APP
.LBE9521:
.LBE9520:
.LBE9519:
.LBE9518:
	.loc 21 573 0
	jmp	.L1061
.LVL1761:
.L1057:
	.loc 21 574 0
	xorl	%eax, %eax
	testb	$64, %dl
	je	.L1060
	.loc 21 575 0
	pushl	%edx
	pushl	$.LC23
	.cfi_escape 0x2e,0x8
	call	__dprintf.1654
.LVL1762:
	popl	%edx
	popl	%ecx
	movl	$-2, %eax
.LVL1763:
.L1060:
	.loc 21 579 0
	leal	-12(%ebp), %esp
	popl	%ebx
.LVL1764:
	popl	%esi
.LVL1765:
	popl	%edi
	leave
	ret
	.cfi_endproc
.LFE2209:
	.size	ehci_wait_td.69720, .-ehci_wait_td.69720
	.section	.rodata.str1.1
.LC24:
	.string	"ehci_send_bulk failed\n"
	.section	.text.ehci_send_bulk.60691,"ax",@progbits
	.type	ehci_send_bulk.60691, @function
ehci_send_bulk.60691:
.LFB2210:
	.loc 21 585 0
	.cfi_startproc
.LVL1766:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	movl	%esp, %ebp
	.cfi_offset 5, -8
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$204, %esp
	leal	8(%ebp), %edi
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	movl	%edx, -208(%ebp)
	movl	%ecx, -180(%ebp)
	movl	(%edi), %edi
	movl	%edi, -184(%ebp)
.LBB9522:
	.loc 21 588 0
	leal	-60(%eax), %edi
.LVL1767:
.LBE9522:
	.loc 21 594 0
	leal	-140(%ebp), %esi
	andl	$-32, %esi
	movl	$128, %eax
.LVL1768:
.L1066:
.LBB9523:
.LBB9524:
	.loc 6 178 0
	decl	%eax
.LVL1769:
	movb	$0, (%eax,%esi)
	.loc 6 177 0
	testl	%eax, %eax
	jne	.L1066
.LBE9524:
.LBE9523:
.LBB9525:
	.loc 21 598 0
	leal	68(%edi), %eax
.LVL1770:
	movl	%eax, %edx
.LVL1771:
	shrl	$4, %edx
#APP
# 598 "src/usb-ehci.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB9526:
	andl	$15, %eax
#APP
# 598 "src/usb-ehci.c" 1
	movw %ES:(%eax), %ax
# 0 "" 2
.LVL1772:
#NO_APP
.LBE9526:
.LBE9525:
.LBB9527:
.LBB9528:
.LBB9529:
	.loc 21 599 0
	leal	67(%edi), %edx
	movl	%edx, %ecx
.LVL1773:
	shrl	$4, %ecx
#APP
# 599 "src/usb-ehci.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB9530:
	andl	$15, %edx
#APP
# 599 "src/usb-ehci.c" 1
	movb %ES:(%edx), %cl
# 0 "" 2
#NO_APP
	movb	%cl, -188(%ebp)
.LBE9530:
.LBE9529:
.LBB9531:
	leal	65(%edi), %edx
	movl	%edx, %ecx
	shrl	$4, %ecx
#APP
# 599 "src/usb-ehci.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB9532:
	andl	$15, %edx
#APP
# 599 "src/usb-ehci.c" 1
	movb %ES:(%edx), %bl
# 0 "" 2
#NO_APP
	movb	%bl, -176(%ebp)
.LBE9532:
.LBE9531:
.LBB9533:
	leal	66(%edi), %edx
	movl	%edx, %ecx
	shrl	$4, %ecx
#APP
# 599 "src/usb-ehci.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB9534:
	andl	$15, %edx
#APP
# 599 "src/usb-ehci.c" 1
	movb %ES:(%edx), %dl
# 0 "" 2
.LVL1774:
#NO_APP
.LBE9534:
.LBE9533:
	leal	4(%edi), %ecx
	movl	%ecx, %ebx
	shrl	$4, %ebx
#APP
# 599 "src/usb-ehci.c" 1
	movw %bx, %ES
# 0 "" 2
#NO_APP
	andl	$15, %ecx
	movzbl	%dl, %edx
.LVL1775:
	orl	$1073741824, %edx
	movzwl	%ax, %eax
.LVL1776:
	movl	%eax, %ebx
	sall	$16, %ebx
	orl	%ebx, %edx
	movzbl	-188(%ebp), %ebx
	sall	$12, %ebx
	orl	%ebx, %edx
	movzbl	-176(%ebp), %ebx
	sall	$8, %ebx
	orl	%ebx, %edx
#APP
# 599 "src/usb-ehci.c" 1
	movl %edx, %ES:(%ecx)
# 0 "" 2
#NO_APP
.LBE9528:
.LBE9527:
.LBB9535:
.LBB9536:
.LBB9537:
	.loc 21 605 0
	leal	71(%edi), %edx
	movl	%edx, %ecx
	shrl	$4, %ecx
#APP
# 605 "src/usb-ehci.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB9538:
	andl	$15, %edx
#APP
# 605 "src/usb-ehci.c" 1
	movb %ES:(%edx), %cl
# 0 "" 2
#NO_APP
	movb	%cl, -188(%ebp)
.LBE9538:
.LBE9537:
.LBB9539:
	leal	70(%edi), %edx
	movl	%edx, %ecx
	shrl	$4, %ecx
#APP
# 605 "src/usb-ehci.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB9540:
	andl	$15, %edx
#APP
# 605 "src/usb-ehci.c" 1
	movb %ES:(%edx), %cl
# 0 "" 2
.LVL1777:
#NO_APP
.LBE9540:
.LBE9539:
	leal	8(%edi), %edx
	movl	%edx, %ebx
	shrl	$4, %ebx
#APP
# 605 "src/usb-ehci.c" 1
	movw %bx, %ES
# 0 "" 2
#NO_APP
	andl	$15, %edx
	movzbl	-188(%ebp), %ebx
	sall	$23, %ebx
	movzbl	%cl, %ecx
.LVL1778:
	sall	$16, %ecx
	orl	%ecx, %ebx
	orl	$1073741824, %ebx
#APP
# 605 "src/usb-ehci.c" 1
	movl %ebx, %ES:(%edx)
# 0 "" 2
#NO_APP
.LBE9536:
.LBE9535:
	.loc 21 609 0
.LBB9541:
.LBB9542:
.LBB9543:
	.loc 21 610 0
#APP
# 610 "src/usb-ehci.c" 1
	movw %SS, %dx
# 0 "" 2
.LVL1779:
#NO_APP
.LBE9543:
	leal	16(%edi), %ecx
	movl	%ecx, %ebx
	shrl	$4, %ebx
	movl	%ebx, -192(%ebp)
#APP
# 610 "src/usb-ehci.c" 1
	movw %bx, %ES
# 0 "" 2
#NO_APP
	andl	$15, %ecx
	movl	%ecx, -188(%ebp)
	movzwl	%dx, %edx
.LVL1780:
	sall	$4, %edx
	addl	%esi, %edx
#APP
# 610 "src/usb-ehci.c" 1
	movl %edx, %ES:(%ecx)
# 0 "" 2
#NO_APP
.LBE9542:
.LBE9541:
	.loc 21 611 0
.LBB9544:
.LBB9545:
.LBB9546:
	.loc 21 612 0
	leal	24(%edi), %ecx
	movl	%ecx, %ebx
	shrl	$4, %ebx
#APP
# 612 "src/usb-ehci.c" 1
	movw %bx, %ES
# 0 "" 2
#NO_APP
.LBB9547:
	andl	$15, %ecx
#APP
# 612 "src/usb-ehci.c" 1
	movl %ES:(%ecx), %edx
# 0 "" 2
#NO_APP
.LBE9547:
.LBE9546:
	andl	$-2147483648, %edx
#APP
# 612 "src/usb-ehci.c" 1
	movl %edx, %ES:(%ecx)
# 0 "" 2
#NO_APP
	xorl	%ebx, %ebx
.LVL1781:
.LBE9545:
.LBE9544:
.LBB9548:
.LBB9549:
.LBB9550:
.LBB9551:
	.loc 21 439 0
	negl	%eax
.LVL1782:
	movl	%eax, -212(%ebp)
	movl	%edi, -196(%ebp)
.LBE9551:
.LBE9550:
.LBE9549:
.LBE9548:
	.loc 21 615 0
	jmp	.L1067
.LVL1783:
.L1078:
.LBB9557:
	.loc 21 616 0
	movl	%ebx, %edi
.LVL1784:
	andl	$3, %edi
	sall	$5, %edi
	leal	(%esi,%edi), %edi
.LVL1785:
	.loc 21 617 0
	movl	%edi, %eax
.LVL1786:
	call	ehci_wait_td.69720
	.loc 21 618 0
	testl	%eax, %eax
.LVL1787:
	jne	.L1088
.LBB9555:
	.loc 21 621 0
#APP
# 621 "src/usb-ehci.c" 1
	movw %SS, -202(%ebp)
# 0 "" 2
#NO_APP
.LBE9555:
.LBB9556:
.LBB9554:
	.loc 21 434 0
	leal	12(%edi), %ecx
.LVL1788:
	.loc 21 584 0
	leal	32(%edi), %eax
.LVL1789:
	movl	%eax, -200(%ebp)
	movl	-184(%ebp), %edx
	movl	%edx, -176(%ebp)
	movl	-180(%ebp), %eax
.LVL1790:
.L1073:
.LBB9552:
	.loc 21 436 0
	cmpl	-200(%ebp), %ecx
	jne	.L1069
	.loc 21 439 0
	subl	-180(%ebp), %eax
.LVL1791:
	andl	-212(%ebp), %eax
	jmp	.L1070
.LVL1792:
.L1069:
	.loc 21 441 0
	movl	%eax, %edx
	andl	$4095, %edx
	movl	%edx, -216(%ebp)
	movl	$4096, %edx
	subl	-216(%ebp), %edx
	movl	%edx, -216(%ebp)
	movl	-176(%ebp), %edx
	cmpl	%edx, -216(%ebp)
	jbe	.L1071
	movl	%edx, -216(%ebp)
.L1071:
	.loc 21 444 0
	movl	%eax, (%ecx)
	.loc 21 446 0
	addl	-216(%ebp), %eax
.LVL1793:
.LBE9552:
	.loc 21 435 0
	movl	-216(%ebp), %edx
	subl	%edx, -176(%ebp)
	je	.L1072
.LBB9553:
	.loc 21 447 0
	addl	$4, %ecx
.LVL1794:
	jmp	.L1073
.L1072:
.LBE9553:
	.loc 21 449 0
	subl	-180(%ebp), %eax
.LVL1795:
.L1070:
.LBE9554:
.LBE9556:
	.loc 21 616 0
	incl	%ebx
.LVL1796:
	.loc 21 625 0
	movl	$1, %ecx
.LVL1797:
	cmpl	-184(%ebp), %eax
	je	.L1075
	.loc 21 621 0
	movzwl	-202(%ebp), %edx
	sall	$4, %edx
	movl	%ebx, %ecx
	andl	$3, %ecx
	sall	$5, %ecx
	leal	(%esi,%ecx), %ecx
	leal	(%edx,%ecx), %ecx
.L1075:
	.loc 21 625 0
	movl	%ecx, (%edi)
	.loc 21 626 0
	movl	$1, 4(%edi)
	.loc 21 627 0
	.loc 21 629 0
	cmpl	$1, -208(%ebp)
	sbbl	%ecx, %ecx
	notl	%ecx
	andl	$256, %ecx
	.loc 21 628 0
	movl	%eax, %edx
	sall	$16, %edx
	andl	$2147418112, %edx
	orl	$3200, %edx
	orl	%ecx, %edx
	movl	%edx, 8(%edi)
	.loc 21 631 0
	addl	%eax, -180(%ebp)
	.loc 21 632 0
	subl	%eax, -184(%ebp)
.LVL1798:
.L1067:
.LBE9557:
	.loc 21 615 0
	cmpl	$0, -184(%ebp)
	jne	.L1078
	movl	-196(%ebp), %edi
.LVL1799:
	.loc 21 584 0
	leal	4(%ebx), %ecx
	movl	%ecx, -176(%ebp)
.LVL1800:
.L1079:
.LBB9558:
	.loc 21 636 0
	movl	%ebx, %eax
.LVL1801:
	andl	$3, %eax
	sall	$5, %eax
	leal	(%esi,%eax), %eax
.LVL1802:
	incl	%ebx
	.loc 21 637 0
	call	ehci_wait_td.69720
.LVL1803:
	.loc 21 638 0
	testl	%eax, %eax
.LVL1804:
	jne	.L1068
.LBE9558:
	.loc 21 635 0
	cmpl	-176(%ebp), %ebx
	jne	.L1079
	jmp	.L1080
.LVL1805:
.L1088:
	movl	-196(%ebp), %edi
.LVL1806:
.L1068:
	.loc 21 644 0
	pushl	$.LC24
	.cfi_escape 0x2e,0x4
	call	__dprintf.1654
.LVL1807:
	popl	%ebx
.LVL1808:
.LBB9559:
.LBB9560:
	.loc 21 645 0
#APP
# 645 "src/usb-ehci.c" 1
	movw -192(%ebp), %ES
# 0 "" 2
#NO_APP
	movl	$1, %eax
	movl	-188(%ebp), %ebx
#APP
# 645 "src/usb-ehci.c" 1
	movl %eax, %ES:(%ebx)
# 0 "" 2
#NO_APP
.LBE9560:
.LBE9559:
.LBB9561:
.LBB9562:
	.loc 21 646 0
	leal	20(%edi), %edx
	movl	%edx, %ecx
	shrl	$4, %ecx
#APP
# 646 "src/usb-ehci.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
	andl	$15, %edx
#APP
# 646 "src/usb-ehci.c" 1
	movl %eax, %ES:(%edx)
# 0 "" 2
#NO_APP
.LBE9562:
.LBE9561:
.LBB9563:
.LBB9564:
	.loc 21 648 0
	addl	$60, %edi
.LVL1809:
	shrl	$4, %edi
#APP
# 648 "src/usb-ehci.c" 1
	movw %di, %ES
# 0 "" 2
#NO_APP
.LBE9564:
.LBE9563:
.LBB9565:
.LBB9566:
.LBB9567:
.LBB9568:
	.loc 7 128 0
#APP
# 128 "src/clock.c" 1
	movl %CS:cpu_khz, %ecx
# 0 "" 2
.LVL1810:
#NO_APP
.LBE9568:
.LBB9569:
.LBB9570:
.LBB9571:
.LBB9572:
	.loc 8 85 0
#APP
# 85 "src/util.h" 1
	rdtsc
# 0 "" 2
.LVL1811:
#NO_APP
.LBE9572:
.LBE9571:
	.loc 7 106 0
	imull	$10, %ecx, %ecx
.LVL1812:
	xorl	%ebx, %ebx
.LVL1813:
	addl	%eax, %ecx
.LVL1814:
	adcl	%edx, %ebx
.LVL1815:
	jmp	.L1081
.LVL1816:
.L1082:
.LBB9573:
.LBB9574:
.LBB9575:
.LBB9576:
	.loc 6 72 0
#APP
# 72 "src/util.c" 1
	sti
nop
rep ; nop
cli
cld

# 0 "" 2
.LVL1817:
#NO_APP
.L1081:
.LBE9576:
.LBE9575:
.LBE9574:
.LBE9573:
.LBB9577:
.LBB9578:
.LBB9579:
	.loc 8 85 0
#APP
# 85 "src/util.h" 1
	rdtsc
# 0 "" 2
.LVL1818:
#NO_APP
.LBE9579:
.LBE9578:
.LBE9577:
	.loc 7 107 0
	subl	%ecx, %eax
	sbbl	%ebx, %edx
.LVL1819:
	cmpl	$0, %edx
	jl	.L1082
	jg	.L1085
	cmpl	$0, %eax
	jbe	.L1082
.L1085:
	orl	$-1, %eax
.LVL1820:
.L1080:
.LVL1821:
.LBE9570:
.LBE9569:
.LBE9567:
.LBE9566:
.LBE9565:
	.loc 21 652 0
	leal	-12(%ebp), %esp
	popl	%ebx
.LVL1822:
	popl	%esi
	popl	%edi
.LVL1823:
	leave
	ret	$4
	.cfi_endproc
.LFE2210:
	.size	ehci_send_bulk.60691, .-ehci_send_bulk.60691
	.section	.text.usb_send_bulk.60856,"ax",@progbits
	.type	usb_send_bulk.60856, @function
usb_send_bulk.60856:
.LFB1966:
	.loc 17 105 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	pushl	%edi
	.cfi_def_cfa_offset 12
	pushl	%esi
	.cfi_def_cfa_offset 16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	subl	$4, %esp
	.cfi_def_cfa_offset 24
	movl	24(%esp), %ebp
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 5, -8
.LBB9580:
	.loc 17 106 0
	leal	4(%eax), %esi
	movl	%esi, %edi
	shrl	$4, %edi
#APP
# 106 "src/usb.c" 1
	movw %di, %ES
# 0 "" 2
#NO_APP
.LBB9581:
	andl	$15, %esi
#APP
# 106 "src/usb.c" 1
	movb %ES:(%esi), %bl
# 0 "" 2
#NO_APP
	movb	%bl, 3(%esp)
.LBE9581:
.LBE9580:
	cmpb	$2, %bl
	je	.L1092
	cmpb	$3, %bl
	jne	.L1096
	jmp	.L1098
.L1092:
	.loc 17 115 0
	orl	$-1, %eax
	popl	%ebp
	.cfi_def_cfa_offset 20
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret	$4
.L1096:
	.loc 17 109 0
	movl	%ebp, 24(%esp)
	.loc 17 115 0
	popl	%edi
	.cfi_def_cfa_offset 16
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	.loc 17 109 0
	jmp	uhci_send_bulk.60595
	.cfi_def_cfa_offset 12
.L1098:
	.loc 17 113 0
	movl	%ebp, 24(%esp)
	.loc 17 115 0
	popl	%esi
	.cfi_def_cfa_offset 8
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	.loc 17 113 0
	jmp	ehci_send_bulk.60691
	.cfi_def_cfa_offset 4
	.cfi_endproc
.LFE1966:
	.size	usb_send_bulk.60856, .-usb_send_bulk.60856
	.section	.rodata.str1.1
.LC25:
	.string	"USB transmission failed\n"
	.section	.text.cdb_read.20128,"ax",@progbits
	.type	cdb_read.20128, @function
cdb_read.20128:
.LFB1895:
	.file 32 "src/blockcmd.c"
	.loc 32 71 0
	.cfi_startproc
.LVL1824:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	pushl	%edi
	.cfi_def_cfa_offset 12
	pushl	%esi
	.cfi_def_cfa_offset 16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	subl	$84, %esp
	.cfi_def_cfa_offset 104
	movl	%eax, %ebx
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 5, -8
	.loc 32 71 0
	movl	$16, %eax
.LVL1825:
.LBB9632:
.LBB9633:
	.loc 6 178 0
	leal	43(%esp), %edx
.L1100:
	decl	%eax
.LVL1826:
	movb	$0, (%edx,%eax)
	.loc 6 177 0
	testl	%eax, %eax
	jne	.L1100
.LBE9633:
.LBE9632:
.LBB9634:
.LBB9635:
	.loc 8 111 0
	movl	(%ebx), %eax
.LVL1827:
#APP
# 111 "src/util.h" 1
	bswapl %eax
# 0 "" 2
#NO_APP
.LBE9635:
.LBE9634:
	.loc 32 74 0
	movb	$40, 43(%esp)
	.loc 32 75 0
	movl	%eax, 45(%esp)
	.loc 32 76 0
	movl	16(%ebx), %eax
.LVL1828:
	movzwl	%ax, %edx
	movl	%edx, %ecx
	sall	$8, %ecx
	shrw	$8, %ax
	orl	%ecx, %eax
	movw	%ax, 50(%esp)
.LBB9636:
	.loc 32 77 0
	movl	12(%ebx), %ecx
#APP
# 77 "src/blockcmd.c" 1
	movw %CS:26(%ecx), %bp
# 0 "" 2
.LVL1829:
#NO_APP
.LBE9636:
	movzwl	%bp, %eax
	movl	%eax, 8(%esp)
.LBB9637:
.LBB9638:
.LBB9676:
	.loc 32 19 0
#APP
# 19 "src/blockcmd.c" 1
	movb %CS:(%ecx), %al
# 0 "" 2
.LVL1830:
#NO_APP
.LBE9676:
	.loc 32 20 0
	cmpb	$3, %al
	je	.L1102
	cmpb	$6, %al
	jne	.L1122
	jmp	.L1126
.L1102:
.LBB9650:
.LBB9651:
.LBB9665:
	.loc 27 609 0
#APP
# 609 "src/ata.c" 1
	movl %CS:36(%ecx), %eax
# 0 "" 2
.LVL1831:
#NO_APP
.LBE9665:
.LBB9664:
	.loc 27 610 0
#APP
# 610 "src/ata.c" 1
	movw %CS:-983040(%eax), %dx
# 0 "" 2
#NO_APP
	movw	%dx, (%esp)
.LBE9664:
.LBB9663:
	.loc 27 611 0
#APP
# 611 "src/ata.c" 1
	movw %CS:-983038(%eax), %dx
# 0 "" 2
.LVL1832:
#NO_APP
	movl	$12, %eax
.LVL1833:
.LBE9663:
.LBB9661:
.LBB9662:
	.loc 6 178 0
	leal	72(%esp), %esi
.L1104:
	decl	%eax
.LVL1834:
	movb	$0, (%esi,%eax)
	.loc 6 177 0
	testl	%eax, %eax
	jne	.L1104
.LBE9662:
.LBE9661:
	.loc 27 615 0
	movl	%ebp, %eax
.LVL1835:
	movb	%al, 75(%esp)
	.loc 27 616 0
	movl	%ebp, %eax
.LVL1836:
	shrw	$8, %ax
	movb	%al, 76(%esp)
	.loc 27 617 0
	movb	$-96, 78(%esp)
	.loc 27 620 0
	leal	2(%edx), %ebp
.LVL1837:
.LBB9659:
.LBB9660:
	.loc 2 82 0
	movb	$10, %al
	movl	%ebp, %edx
.LVL1838:
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE9660:
.LBE9659:
	.loc 27 622 0
	movl	%esi, %edx
	movl	%ecx, %eax
	call	send_cmd.20413
	movl	%eax, %ecx
.LVL1839:
	.loc 27 623 0
	testl	%eax, %eax
	jne	.L1105
.LVL1840:
	.loc 27 625 0
	movzwl	(%esp), %edi
.LBB9657:
.LBB9658:
	.loc 27 235 0
	movl	%edi, %eax
.LVL1841:
	call	ndelay_await_not_bsy.20173
.LVL1842:
	movl	%eax, %ecx
.LVL1843:
	.loc 27 236 0
	testl	%eax, %eax
	js	.L1105
.LVL1844:
	.loc 27 239 0
	testb	$1, %al
	je	.L1106
	movl	$-4, %ecx
.LVL1845:
	jmp	.L1105
.LVL1846:
.L1106:
	.loc 27 244 0
	andb	$8, %cl
.LVL1847:
	jne	.L1107
	movl	$-5, %ecx
.LVL1848:
	jmp	.L1105
.LVL1849:
.L1123:
.LBE9658:
.LBE9657:
	.loc 27 638 0
	testb	$1, %cl
	je	.L1108
.LVL1850:
.LBB9654:
.LBB9655:
.LBB9656:
	.loc 2 92 0
	movl	(%esp), %edx
	incl	%edx
#APP
# 92 "src/ioport.h" 1
	inb %dx, %al
# 0 "" 2
.LVL1851:
#NO_APP
	movl	$-2, %ecx
.LVL1852:
	jmp	.L1105
.LVL1853:
.L1108:
.LBE9656:
.LBE9655:
.LBE9654:
	.loc 27 647 0
	andb	$8, %cl
.LVL1854:
	jne	.L1109
	movl	$-3, %ecx
.LVL1855:
	jmp	.L1105
.L1109:
	.loc 27 653 0
	movl	8(%esp), %ecx
.LVL1856:
	xorl	%edx, %edx
	movl	%ebx, %eax
	call	ata_pio_transfer.20669
	movl	%eax, %ecx
.LVL1857:
.L1105:
.LBB9652:
.LBB9653:
	.loc 2 82 0
	movb	$8, %al
.LVL1858:
	movl	%ebp, %edx
#APP
# 82 "src/ioport.h" 1
	outb %al, %dx
# 0 "" 2
#NO_APP
.LBE9653:
.LBE9652:
	.loc 27 658 0
	cmpl	$1, %ecx
	sbbl	%eax, %eax
	notl	%eax
	andl	$12, %eax
	jmp	.L1111
.LVL1859:
.L1126:
.LBE9651:
.LBE9650:
.LBB9639:
.LBB9640:
.LBB9641:
	.file 33 "src/usb-msc.c"
	.loc 33 57 0
#APP
# 57 "src/usb-msc.c" 1
	movl %CS:36(%ecx), %eax
# 0 "" 2
.LVL1860:
#NO_APP
	movl	%eax, 4(%esp)
.LBE9641:
.LBB9642:
	.loc 33 58 0
#APP
# 58 "src/usb-msc.c" 1
	movl %CS:40(%ecx), %eax
# 0 "" 2
.LVL1861:
#NO_APP
.LBE9642:
	.loc 33 61 0
	imull	8(%esp), %edx
	movl	%edx, (%esp)
	movl	$31, %edx
.LVL1862:
.LBB9643:
.LBB9644:
	.loc 6 178 0
	leal	12(%esp), %ecx
.L1112:
	decl	%edx
.LVL1863:
	movb	$0, (%ecx,%edx)
	.loc 6 177 0
	testl	%edx, %edx
	jne	.L1112
.LBE9644:
.LBE9643:
	.loc 33 64 0
	movl	$1128420181, 12(%esp)
	.loc 33 65 0
	movl	$999, 16(%esp)
	.loc 33 66 0
	movl	(%esp), %edx
.LVL1864:
	movl	%edx, 20(%esp)
	.loc 33 67 0
	movb	$-128, 24(%esp)
	.loc 33 68 0
	movb	$0, 25(%esp)
	.loc 33 69 0
	movb	$12, 26(%esp)
.LBB9645:
.LBB9646:
.LBB9647:
	.loc 6 204 0
#APP
# 204 "src/util.c" 1
	movw %SS, %dx
# 0 "" 2
.LVL1865:
#NO_APP
.LBE9647:
#APP
# 204 "src/util.c" 1
	movw %dx, %ES
# 0 "" 2
	.loc 32 77 0
#NO_APP
	leal	43(%esp), %esi
	.loc 6 208 0
	movl	$12, %ecx
.LVL1866:
	leal	27(%esp), %edi
.LVL1867:
#APP
# 208 "src/util.c" 1
	rep movsb (%esi),%es:(%edi)
# 0 "" 2
.LVL1868:
#NO_APP
.LBE9646:
.LBE9645:
.LBB9648:
	.loc 33 74 0
#APP
# 74 "src/usb-msc.c" 1
	movw %SS, %dx
# 0 "" 2
.LVL1869:
#NO_APP
.LBE9648:
	.loc 33 73 0
	movzwl	%dx, %edx
.LVL1870:
	sall	$4, %edx
	leal	12(%esp,%edx), %ecx
.LVL1871:
	pushl	$31
	.cfi_def_cfa_offset 108
	xorl	%edx, %edx
	.cfi_escape 0x2e,0x4
	call	usb_send_bulk.60856
	.cfi_def_cfa_offset 104
.LVL1872:
	.loc 33 75 0
	testl	%eax, %eax
.LVL1873:
	jne	.L1115
	.loc 33 79 0
	movl	8(%ebx), %ecx
	pushl	(%esp)
	.cfi_def_cfa_offset 108
	movl	$128, %edx
	movl	8(%esp), %eax
.LVL1874:
	call	usb_send_bulk.60856
	.cfi_def_cfa_offset 104
	.loc 33 80 0
	testl	%eax, %eax
.LVL1875:
	jne	.L1115
.LBB9649:
	.loc 33 86 0
#APP
# 86 "src/usb-msc.c" 1
	movw %SS, %ax
# 0 "" 2
.LVL1876:
#NO_APP
.LBE9649:
	.loc 33 85 0
	movzwl	%ax, %eax
.LVL1877:
	sall	$4, %eax
	leal	59(%esp,%eax), %ecx
	pushl	$13
	.cfi_def_cfa_offset 108
	movl	$128, %edx
	movl	8(%esp), %eax
	call	usb_send_bulk.60856
	.cfi_def_cfa_offset 104
	.loc 33 87 0
	testl	%eax, %eax
.LVL1878:
	jne	.L1115
	.loc 33 90 0
	movb	71(%esp), %dl
	testb	%dl, %dl
	je	.L1111
	.loc 33 92 0
	cmpb	$2, %dl
	je	.L1115
	.loc 33 95 0
	movzwl	%bp, %ebp
.LVL1879:
	movl	67(%esp), %eax
.LVL1880:
	xorl	%edx, %edx
	divl	%ebp
	subw	%ax, 16(%ebx)
	jmp	.L1124
.LVL1881:
.L1115:
	.loc 33 100 0
	pushl	$.LC25
	.cfi_def_cfa_offset 108
	call	__dprintf.1654
.LVL1882:
	popl	%eax
	.cfi_def_cfa_offset 104
	.loc 33 101 0
	movw	$0, 16(%ebx)
.L1124:
	movl	$12, %eax
	jmp	.L1111
.LVL1883:
.L1122:
.LBE9640:
.LBE9639:
	.loc 32 26 0
	movw	$0, 16(%ebx)
	movl	$1, %eax
.LVL1884:
.L1111:
.LVL1885:
.LBE9638:
.LBE9637:
	.loc 32 78 0
	addl	$84, %esp
	popl	%ebx
.LVL1886:
	popl	%esi
.LVL1887:
	popl	%edi
.LVL1888:
	popl	%ebp
.LVL1889:
	ret
.LVL1890:
.L1107:
.LBB9679:
.LBB9678:
.LBB9677:
.LBB9675:
.LBB9666:
	.loc 27 630 0
#APP
# 630 "src/ata.c" 1
	movw %SS, %ax
# 0 "" 2
.LVL1891:
#NO_APP
.LBE9666:
	movzwl	%ax, %eax
.LVL1892:
	sall	$4, %eax
	leal	43(%esp,%eax), %esi
.LBB9667:
.LBB9668:
	.loc 25 154 0
	movl	%esi, %eax
	shrl	$4, %eax
#APP
# 154 "src/farptr.h" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB9669:
.LBB9670:
	.loc 2 124 0
	andl	$15, %esi
	movl	$6, %ecx
.LVL1893:
	movl	(%esp), %edx
#APP
# 124 "src/ioport.h" 1
	rep outsw %es:(%esi), (%dx)
# 0 "" 2
.LVL1894:
#NO_APP
.LBE9670:
.LBE9669:
.LBE9668:
.LBE9667:
.LBB9671:
.LBB9672:
.LBB9673:
.LBB9674:
	.loc 2 92 0
	movl	%ebp, %edx
#APP
# 92 "src/ioport.h" 1
	inb %dx, %al
# 0 "" 2
.LVL1895:
#NO_APP
.LBE9674:
.LBE9673:
	.loc 27 67 0
	movl	%edi, %eax
.LVL1896:
	.cfi_escape 0x2e,0x0
	call	await_not_bsy.20152
.LVL1897:
	movl	%eax, %ecx
.LVL1898:
.LBE9672:
.LBE9671:
	.loc 27 633 0
	testl	%eax, %eax
	jns	.L1123
.LVL1899:
	jmp	.L1105
.LBE9675:
.LBE9677:
.LBE9678:
.LBE9679:
	.cfi_endproc
.LFE1895:
	.size	cdb_read.20128, .-cdb_read.20128
	.section	.text.process_op.1208,"ax",@progbits
	.type	process_op.1208, @function
process_op.1208:
.LFB488:
	.loc 24 276 0
	.cfi_startproc
.LVL1900:
.LBB9689:
	.loc 24 278 0
	movl	12(%eax), %edx
#APP
# 278 "src/block.c" 1
	movb %CS:(%edx), %dl
# 0 "" 2
.LVL1901:
#NO_APP
.LBE9689:
	.loc 24 279 0
	cmpb	$3, %dl
	je	.L1131
	ja	.L1135
	cmpb	$1, %dl
	je	.L1129
	cmpb	$2, %dl
	jne	.L1128
	jmp	.L1157
.L1135:
	cmpb	$5, %dl
	je	.L1133
	jb	.L1132
	cmpb	$6, %dl
	jne	.L1128
	jmp	.L1158
.L1129:
	.loc 24 281 0
	jmp	process_floppy_op.1223
.LVL1902:
.L1157:
.LBB9690:
.LBB9691:
	.loc 27 586 0
	movb	18(%eax), %dl
.LVL1903:
	cmpb	$2, %dl
	je	.L1137
	cmpb	$3, %dl
	jne	.L1151
	jmp	.L1159
.L1137:
	.loc 27 588 0
	xorl	%edx, %edx
	jmp	.L1152
.L1159:
	.loc 27 590 0
	movl	$1, %edx
.L1152:
	jmp	ata_readwrite.21200
.LVL1904:
.L1131:
.LBE9691:
.LBE9690:
.LBB9692:
.LBB9693:
	.loc 27 667 0
	movb	18(%eax), %dl
.LVL1905:
	cmpb	$3, %dl
	je	.L1141
	cmpb	$5, %dl
	je	.L1141
	cmpb	$2, %dl
	je	.L1153
.L1151:
	.loc 27 674 0
	jmp	process_ata_misc_op.20381
.LVL1906:
.L1133:
.LBE9693:
.LBE9692:
.LBB9694:
.LBB9695:
	.file 34 "src/cdrom.c"
	.loc 34 92 0
	cmpb	$16, 18(%eax)
	ja	.L1128
	movsbl	18(%eax),%ecx
	movl	$1, %edx
.LVL1907:
	sall	%cl, %edx
	xorl	%ecx, %ecx
	testl	$65681, %edx
	jne	.L1146
	movb	$3, %cl
	testb	$40, %dl
	jne	.L1146
	andb	$4, %dl
	je	.L1128
	.loc 34 94 0
	jmp	cdemu_read.39086
.LVL1908:
.L1158:
.LBE9695:
.LBE9694:
.LBB9696:
.LBB9697:
	.loc 33 114 0
	cmpb	$16, 18(%eax)
	ja	.L1128
	movsbl	18(%eax),%ecx
	movl	$1, %edx
.LVL1909:
	sall	%cl, %edx
	testl	$65681, %edx
	jne	.L1132
	testb	$40, %dl
	jne	.L1141
	andb	$4, %dl
	je	.L1128
.L1153:
	.loc 33 116 0
	jmp	cdb_read.20128
.LVL1910:
.L1128:
.LBE9697:
.LBE9696:
	.loc 24 293 0
	movw	$0, 16(%eax)
	movl	$1, %ecx
	.loc 24 294 0
	jmp	.L1146
.L1132:
	xorl	%ecx, %ecx
	jmp	.L1146
.LVL1911:
.L1141:
	movl	$3, %ecx
.LVL1912:
.L1146:
	.loc 24 296 0
	movl	%ecx, %eax
.LVL1913:
	ret
	.cfi_endproc
.LFE488:
	.size	process_op.1208, .-process_op.1208
	.section	.text.__send_disk_op.14761,"ax",@progbits
	.type	__send_disk_op.14761, @function
__send_disk_op.14761:
.LFB489:
	.loc 24 301 0
	.cfi_startproc
.LVL1914:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	pushl	%edi
	.cfi_def_cfa_offset 12
	pushl	%esi
	.cfi_def_cfa_offset 16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	subl	$20, %esp
	.cfi_def_cfa_offset 40
	movl	%eax, %ebp
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 5, -8
	movl	%edx, %ebx
.LBB9698:
	.loc 24 303 0
#APP
# 303 "src/block.c" 1
	movw %SS, %ax
# 0 "" 2
.LVL1915:
#NO_APP
.LBE9698:
.LBB9699:
.LBB9700:
	.loc 6 185 0
#APP
# 185 "src/util.c" 1
	movw %ax, %ES
# 0 "" 2
	.loc 6 187 0
#NO_APP
	movl	$20, %ecx
.LVL1916:
	movl	%ebp, %esi
.LVL1917:
	movl	%esp, %edi
.LVL1918:
#APP
# 187 "src/util.c" 1
	movw %ds, %ax
movw %bx, %ds
rep movsb (%si),%es:(%di)
movw %ax, %ds
# 0 "" 2
.LVL1919:
#NO_APP
.LBE9700:
.LBE9699:
	.loc 24 311 0
	movl	%esp, %eax
.LVL1920:
	call	process_op.1208
.LVL1921:
.LBB9701:
	.loc 24 314 0
#APP
# 314 "src/block.c" 1
	movw %bx, %ES
# 0 "" 2
#NO_APP
	movl	16(%esp), %edx
.LVL1922:
#APP
# 314 "src/block.c" 1
	movw %dx, %ES:16(%ebp)
# 0 "" 2
#NO_APP
.LBE9701:
	.loc 24 317 0
	addl	$20, %esp
	popl	%ebx
.LVL1923:
	popl	%esi
.LVL1924:
	popl	%edi
.LVL1925:
	popl	%ebp
.LVL1926:
	ret
	.cfi_endproc
.LFE489:
	.size	__send_disk_op.14761, .-__send_disk_op.14761
	.section	.text.cdemu_read.39086,"ax",@progbits
	.type	cdemu_read.39086, @function
cdemu_read.39086:
.LFB1255:
	.loc 34 22 0
	.cfi_startproc
.LVL1927:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	movl	%esp, %ebp
	.cfi_offset 5, -8
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$52, %esp
	movl	%eax, %ebx
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
.LBB9702:
.LBB9703:
	.loc 10 249 0
	movl	$64, %eax
.LVL1928:
#APP
# 249 "src/biosvar.h" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB9704:
#APP
# 249 "src/biosvar.h" 1
	movw %ES:14, %ax
# 0 "" 2
#NO_APP
	movw	%ax, -34(%ebp)
.LBE9704:
.LBE9703:
.LBE9702:
	.loc 34 25 0
#APP
# 25 "src/cdrom.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB9705:
#APP
# 25 "src/cdrom.c" 1
	movl %ES:302, %eax
# 0 "" 2
.LVL1929:
#NO_APP
.LBE9705:
	.loc 34 27 0
	subl	$983040, %eax
.LVL1930:
	movl	%eax, -20(%ebp)
	.loc 34 28 0
	movb	18(%ebx), %al
	movb	%al, -14(%ebp)
	.loc 34 29 0
#APP
# 29 "src/cdrom.c" 1
	movw -34(%ebp), %ES
# 0 "" 2
#NO_APP
.LBB9706:
#APP
# 29 "src/cdrom.c" 1
	movl %ES:306, %eax
# 0 "" 2
.LVL1931:
#NO_APP
.LBE9706:
	xorl	%edx, %edx
	movl	(%ebx), %esi
	movl	4(%ebx), %edi
	shrdl	$2, %edi, %esi
	shrl	$2, %edi
	addl	%esi, %eax
.LVL1932:
	adcl	%edi, %edx
	movl	%eax, -32(%ebp)
	movl	%edx, -28(%ebp)
	.loc 34 31 0
	movzwl	16(%ebx), %edx
	movl	%edx, -64(%ebp)
	.loc 34 32 0
	movw	$0, 16(%ebx)
	.loc 34 35 0
	testb	$3, (%ebx)
	je	.L1163
.LBB9707:
	.loc 34 37 0
	movw	$1, -16(%ebp)
	.loc 34 38 0
	movzwl	-34(%ebp), %eax
	sall	$4, %eax
	addl	$872, %eax
	movl	%eax, -24(%ebp)
	.loc 34 39 0
	leal	-32(%ebp), %eax
	call	process_op.1208
	.loc 34 40 0
	testl	%eax, %eax
.LVL1933:
	jne	.L1164
	.loc 34 42 0
	movl	(%ebx), %esi
	movl	%esi, %eax
.LVL1934:
	andl	$3, %eax
	movb	$4, -35(%ebp)
	subb	%al, -35(%ebp)
	.loc 34 43 0
	movzbl	-35(%ebp), %eax
.LVL1935:
	cmpl	-64(%ebp), %eax
	jle	.L1165
	.loc 34 44 0
	movb	-64(%ebp), %cl
	movb	%cl, -35(%ebp)
.L1165:
	.loc 34 45 0
	movzbl	-35(%ebp), %eax
.LVL1936:
	subl	%eax, -64(%ebp)
	.loc 34 46 0
	sall	$9, %eax
	movl	%eax, -40(%ebp)
	.loc 34 47 0
	movl	8(%ebx), %edi
.LBB9708:
.LBB9709:
	.loc 6 185 0
	movl	%edi, %eax
	shrl	$4, %eax
#APP
# 185 "src/util.c" 1
	movw %ax, %ES
# 0 "" 2
	.loc 6 187 0
#NO_APP
	andl	$3, %esi
	sall	$9, %esi
	addl	$872, %esi
	andl	$15, %edi
	movl	-40(%ebp), %eax
	movl	%eax, -52(%ebp)
	movl	%esi, -56(%ebp)
	movl	%edi, -60(%ebp)
	movl	%eax, %ecx
	movw	-34(%ebp), %dx
#APP
# 187 "src/util.c" 1
	movw %ds, %ax
movw %dx, %ds
rep movsb (%si),%es:(%di)
movw %ax, %ds
# 0 "" 2
#NO_APP
.LBE9709:
.LBE9708:
	.loc 34 50 0
	movl	-40(%ebp), %ecx
	addl	%ecx, 8(%ebx)
	.loc 34 51 0
	movzbl	-35(%ebp), %eax
.LVL1937:
	addw	%ax, 16(%ebx)
	.loc 34 52 0
	addl	$1, -32(%ebp)
	adcl	$0, -28(%ebp)
.L1163:
.LBE9707:
	.loc 34 55 0
	cmpl	$3, -64(%ebp)
	jle	.L1166
.LBB9710:
	.loc 34 57 0
	movl	-64(%ebp), %eax
.LVL1938:
	sarl	$2, %eax
	movw	%ax, -16(%ebp)
	.loc 34 58 0
	movl	8(%ebx), %eax
	movl	%eax, -24(%ebp)
	.loc 34 59 0
	leal	-32(%ebp), %eax
	call	process_op.1208
	.loc 34 60 0
	movl	-16(%ebp), %ecx
	sall	$2, %ecx
	addw	%cx, 16(%ebx)
	.loc 34 61 0
	testl	%eax, %eax
.LVL1939:
	jne	.L1164
	.loc 34 63 0
	movb	-64(%ebp), %cl
.LVL1940:
	andl	$-4, %ecx
.LVL1941:
	.loc 34 64 0
	andl	$3, -64(%ebp)
	.loc 34 65 0
	movzbl	%cl, %eax
.LVL1942:
	sall	$9, %eax
	addl	%eax, 8(%ebx)
	.loc 34 66 0
	shrb	$2, %cl
.LVL1943:
	movzbl	%cl, %esi
	xorl	%edi, %edi
	addl	%esi, -32(%ebp)
	adcl	%edi, -28(%ebp)
.LVL1944:
.L1166:
.LBE9710:
	.loc 34 69 0
	xorl	%eax, %eax
.LVL1945:
	cmpl	$0, -64(%ebp)
	je	.L1164
.LBB9711:
	.loc 34 71 0
	movw	$1, -16(%ebp)
	.loc 34 72 0
	movzwl	-34(%ebp), %eax
.LVL1946:
	sall	$4, %eax
	addl	$872, %eax
	movl	%eax, -24(%ebp)
	.loc 34 73 0
	leal	-32(%ebp), %eax
	call	process_op.1208
	.loc 34 74 0
	testl	%eax, %eax
.LVL1947:
	jne	.L1164
	.loc 34 76 0
	movb	-64(%ebp), %al
.LVL1948:
	movb	%al, -35(%ebp)
	.loc 34 78 0
	movl	8(%ebx), %edi
.LBB9712:
.LBB9713:
	.loc 6 185 0
	movl	%edi, %eax
	shrl	$4, %eax
#APP
# 185 "src/util.c" 1
	movw %ax, %ES
# 0 "" 2
	.loc 6 187 0
#NO_APP
	movzbl	-35(%ebp), %ecx
	sall	$9, %ecx
	andl	$15, %edi
	movl	$872, %esi
.LVL1949:
	movw	-34(%ebp), %ax
#APP
# 187 "src/util.c" 1
	movw %ds, %dx
movw %ax, %ds
rep movsb (%si),%es:(%di)
movw %dx, %ds
# 0 "" 2
.LVL1950:
#NO_APP
.LBE9713:
.LBE9712:
	.loc 34 80 0
	movzbl	-35(%ebp), %edx
.LVL1951:
	addw	%dx, 16(%ebx)
	xorl	%eax, %eax
.LVL1952:
.L1164:
.LVL1953:
.LBE9711:
	.loc 34 84 0
	addl	$52, %esp
	popl	%ebx
.LVL1954:
	popl	%esi
.LVL1955:
	popl	%edi
.LVL1956:
	leave
	ret
	.cfi_endproc
.LFE1255:
	.size	cdemu_read.39086, .-cdemu_read.39086
	.section	.rodata.str1.1
.LC26:
	.string	"stub %s:%d:\n"
	.section	.text.disk_1305.80338,"ax",@progbits
	.type	disk_1305.80338, @function
disk_1305.80338:
.LFB2530:
	.loc 23 201 0
	.cfi_startproc
.LVL1957:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	movl	%esp, %ebp
	.cfi_offset 5, -8
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$48, %esp
	movl	%eax, -60(%ebp)
	movl	%edx, %ebx
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
.LBB9714:
.LBB9715:
	.loc 3 464 0
	pushl	$202
	pushl	$__func__.80340
	pushl	$.LC26
	.cfi_escape 0x2e,0xc
	call	__dprintf.1654
.LVL1958:
	addl	$12, %esp
	.loc 3 465 0
	movl	-60(%ebp), %eax
	.cfi_escape 0x2e,0x0
	call	dump_regs.10019
.LBE9715:
.LBE9714:
.LBB9716:
.LBB9717:
.LBB9718:
	.loc 23 62 0
#APP
# 62 "src/disk.c" 1
	movl %CS:cdemu_drive_gf, %eax
# 0 "" 2
.LVL1959:
#NO_APP
.LBE9718:
	.loc 23 61 0
	subl	$983040, %eax
.LVL1960:
	cmpl	%eax, %ebx
	jne	.L1172
.LBB9719:
.LBB9720:
.LBB9721:
	.loc 10 249 0
	movl	$64, %eax
#APP
# 249 "src/biosvar.h" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB9722:
#APP
# 249 "src/biosvar.h" 1
	movw %ES:14, %ax
# 0 "" 2
.LVL1961:
#NO_APP
.LBE9722:
.LBE9721:
.LBE9720:
	.loc 23 69 0
#APP
# 69 "src/disk.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB9723:
#APP
# 69 "src/disk.c" 1
	movw %ES:320, %cx
# 0 "" 2
.LVL1962:
#NO_APP
.LBE9723:
	.loc 23 70 0
#APP
# 70 "src/disk.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB9724:
#APP
# 70 "src/disk.c" 1
	movw %ES:324, %di
# 0 "" 2
.LVL1963:
#NO_APP
	jmp	.L1173
.LVL1964:
.L1172:
.LBE9724:
.LBE9719:
.LBB9725:
	.loc 23 74 0
#APP
# 74 "src/disk.c" 1
	movw %CS:2(%ebx), %cx
# 0 "" 2
.LVL1965:
#NO_APP
.LBE9725:
.LBB9726:
	.loc 23 75 0
#APP
# 75 "src/disk.c" 1
	movw %CS:6(%ebx), %di
# 0 "" 2
.LVL1966:
#NO_APP
.L1173:
.LBE9726:
.LBE9717:
.LBE9716:
	.loc 23 207 0
	movl	-60(%ebp), %eax
.LVL1967:
	movb	28(%eax), %dl
.LVL1968:
	.loc 23 208 0
	movb	21(%eax), %al
	movb	%al, -33(%ebp)
	.loc 23 210 0
	movzbl	%al, %esi
.LVL1969:
	cmpw	%cx, %si
	jae	.L1174
	testb	%dl, %dl
	je	.L1174
	movzbl	%dl, %edx
.LVL1970:
	cmpw	%di, %dx
	jbe	.L1175
.LVL1971:
.L1174:
.LBB9727:
.LBB9728:
	.loc 23 26 0
	movl	-60(%ebp), %edx
.LVL1972:
	cmpb	$0, 20(%edx)
	js	.L1176
.LBB9729:
	.loc 23 27 0
	movl	$64, %eax
#APP
# 27 "src/disk.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
	movb	$1, %al
#APP
# 27 "src/disk.c" 1
	movb %al, %ES:65
# 0 "" 2
#NO_APP
	jmp	.L1177
.L1176:
.LBE9729:
.LBB9730:
	.loc 23 29 0
	movl	$64, %eax
#APP
# 29 "src/disk.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
	movb	$1, %al
#APP
# 29 "src/disk.c" 1
	movb %al, %ES:116
# 0 "" 2
#NO_APP
.L1177:
.LBE9730:
.LBB9731:
.LBB9732:
.LBB9733:
.LBB9734:
	.loc 14 90 0
	movl	-60(%ebp), %ecx
.LVL1973:
	movb	$1, 29(%ecx)
.LBB9735:
.LBB9736:
	.loc 14 60 0
	orw	$1, 36(%ecx)
	jmp	.L1182
.LVL1974:
.L1175:
.LBE9736:
.LBE9735:
.LBE9734:
.LBE9733:
.LBE9732:
.LBE9731:
.LBE9728:
.LBE9727:
	.loc 23 216 0
	movl	%ebx, -20(%ebp)
	.loc 23 217 0
	movb	$5, -14(%ebp)
	.loc 23 218 0
	movzbl	-33(%ebp), %eax
.LVL1975:
	movl	%eax, -32(%ebp)
	movl	$0, -28(%ebp)
	.loc 23 219 0
	movw	%dx, -16(%ebp)
	.loc 23 220 0
	movl	-60(%ebp), %ebx
.LVL1976:
	movzwl	2(%ebx), %eax
.LVL1977:
	sall	$4, %eax
	movzwl	16(%ebx), %edx
	addl	%edx, %eax
	movl	%eax, -24(%ebp)
.LBB9737:
.LBB9738:
	.loc 24 327 0
#APP
# 327 "src/block.c" 1
	movw %SS, %dx
# 0 "" 2
.LVL1978:
#NO_APP
.LBE9738:
.LBB9739:
.LBB9740:
.LBB9741:
.LBB9742:
	.loc 10 249 0
	movl	$64, %esi
#APP
# 249 "src/biosvar.h" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB9743:
#APP
# 249 "src/biosvar.h" 1
	movw %ES:14, %di
# 0 "" 2
.LVL1979:
#NO_APP
	movw	%di, -40(%ebp)
.LBE9743:
.LBE9742:
.LBE9741:
	.loc 18 92 0
	leal	-32(%ebp), %eax
	movzwl	%dx, %edx
.LVL1980:
	movl	%eax, -56(%ebp)
	movl	%edx, -48(%ebp)
	movl	$__send_disk_op.14761, -52(%ebp)
	movl	$__send_disk_op.14761, %ecx
.LVL1981:
#APP
# 92 "src/stacks.c" 1
	movw %ss, %bx
movl %esp, %esi
movw %di, %ds
movw %di, %ss
movl $872, %esp
calll *%ecx
movw %bx, %ds
movw %bx, %ss
movl %esi, %esp
# 0 "" 2
.LVL1982:
#NO_APP
	movl	%eax, -56(%ebp)
.LBE9740:
.LBE9739:
.LBE9737:
.LBB9744:
.LBB9745:
	.loc 23 25 0
	movb	-56(%ebp), %al
.LVL1983:
	.loc 23 26 0
	movl	-60(%ebp), %edi
	cmpb	$0, 20(%edi)
	js	.L1179
.LBB9746:
	.loc 23 27 0
	movl	$64, %edx
.LVL1984:
#APP
# 27 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
# 27 "src/disk.c" 1
	movb %al, %ES:65
# 0 "" 2
#NO_APP
	jmp	.L1180
.LVL1985:
.L1179:
.LBE9746:
.LBB9747:
	.loc 23 29 0
	movl	$64, %ecx
#APP
# 29 "src/disk.c" 1
	movw %cx, %ES
# 0 "" 2
# 29 "src/disk.c" 1
	movb %al, %ES:116
# 0 "" 2
#NO_APP
.L1180:
.LBE9747:
	.loc 23 30 0
	testb	%al, %al
	je	.L1181
.LBB9748:
.LBB9749:
.LBB9750:
.LBB9751:
	.loc 14 90 0
	movl	-60(%ebp), %ebx
	movb	%al, 29(%ebx)
.LBB9752:
.LBB9753:
	.loc 14 60 0
	orw	$1, 36(%ebx)
	jmp	.L1182
.L1181:
.LBE9753:
.LBE9752:
.LBE9751:
.LBE9750:
.LBE9749:
.LBE9748:
.LBB9754:
.LBB9755:
	.loc 14 77 0
	movl	-60(%ebp), %esi
	movb	$0, 29(%esi)
.LBB9756:
.LBB9757:
	.loc 14 62 0
	andw	$-2, 36(%esi)
.LVL1986:
.L1182:
.LBE9757:
.LBE9756:
.LBE9755:
.LBE9754:
.LBE9745:
.LBE9744:
	.loc 23 223 0
	leal	-12(%ebp), %esp
	popl	%ebx
.LVL1987:
	popl	%esi
.LVL1988:
	popl	%edi
.LVL1989:
	leave
	ret
	.cfi_endproc
.LFE2530:
	.size	disk_1305.80338, .-disk_1305.80338
	.section	.text.disk_13.82387,"ax",@progbits
	.type	disk_13.82387, @function
disk_13.82387:
.LFB2560:
	.loc 23 719 0
	.cfi_startproc
.LVL1990:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	movl	%esp, %ebp
	.cfi_offset 5, -8
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$32, %esp
	movl	%eax, -40(%ebp)
	movl	%edx, -44(%ebp)
.LBB10226:
	.loc 23 723 0
	movl	$64, %ecx
#APP
# 723 "src/disk.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
	xorl	%esi, %esi
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	movl	%esi, %eax
.LVL1991:
#APP
# 723 "src/disk.c" 1
	movb %al, %ES:142
# 0 "" 2
#NO_APP
.LBE10226:
	.loc 23 725 0
	movl	-40(%ebp), %edx
.LVL1992:
	movb	29(%edx), %bl
	cmpb	$20, %bl
	je	.L1197
	ja	.L1210
	cmpb	$5, %bl
	je	.L1190
	ja	.L1211
	cmpb	$2, %bl
	je	.L1187
	ja	.L1212
	testb	%bl, %bl
	je	.L1185
	decb	%bl
	jne	.L1184
	jmp	.L1361
.L1212:
	cmpb	$3, %bl
	je	.L1188
	cmpb	$4, %bl
	jne	.L1184
	jmp	.L1362
.L1211:
	cmpb	$12, %bl
	je	.L1196
	ja	.L1213
	cmpb	$8, %bl
	je	.L1191
	cmpb	$9, %bl
	jne	.L1184
	jmp	.L1363
.L1213:
	cmpb	$16, %bl
	je	.L1195
	cmpb	$17, %bl
	je	.L1196
	cmpb	$13, %bl
	jne	.L1184
	jmp	.L1303
.L1210:
	cmpb	$68, %bl
	je	.L1203
	ja	.L1214
	cmpb	$65, %bl
	je	.L1200
	ja	.L1215
	cmpb	$21, %bl
	je	.L1198
	cmpb	$22, %bl
	jne	.L1184
	jmp	.L1364
.L1215:
	cmpb	$66, %bl
	je	.L1201
	cmpb	$67, %bl
	jne	.L1184
	jmp	.L1365
.L1214:
	cmpb	$71, %bl
	je	.L1206
	ja	.L1216
	cmpb	$69, %bl
	je	.L1204
	cmpb	$70, %bl
	jne	.L1184
	jmp	.L1366
.L1216:
	cmpb	$73, %bl
	je	.L1208
	jb	.L1207
	cmpb	$78, %bl
	jne	.L1184
	jmp	.L1367
.L1185:
	.loc 23 726 0
	movl	-44(%ebp), %edx
	movl	-40(%ebp), %eax
	.loc 23 753 0
	addl	$32, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	.loc 23 726 0
	jmp	disk_1300.80266
.L1361:
.LBB10227:
.LBB10228:
	.loc 23 167 0
	movl	-40(%ebp), %ebx
	cmpb	$0, 20(%ebx)
	js	.L1217
	.loc 23 169 0
#APP
# 169 "src/disk.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB10229:
#APP
# 169 "src/disk.c" 1
	movb %ES:65, %dl
# 0 "" 2
.LVL1993:
#NO_APP
	jmp	.L1218
.LVL1994:
.L1217:
.LBE10229:
	.loc 23 171 0
#APP
# 171 "src/disk.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB10230:
#APP
# 171 "src/disk.c" 1
	movb %ES:116, %dl
# 0 "" 2
.LVL1995:
#NO_APP
.L1218:
.LBE10230:
	.loc 23 172 0
	movl	-40(%ebp), %esi
	movb	%dl, 29(%esi)
.LBB10231:
.LBB10232:
	.loc 14 59 0
	testb	%dl, %dl
	jne	.L1324
	.loc 14 62 0
	movl	-40(%ebp), %edi
	andw	$-2, 36(%edi)
	jmp	.L1318
.LVL1996:
.L1187:
.LBE10232:
.LBE10231:
.LBE10228:
.LBE10227:
.LBB10233:
.LBB10234:
	.loc 23 181 0
	movl	$2, %ecx
	jmp	.L1327
.L1188:
.LBE10234:
.LBE10233:
.LBB10235:
.LBB10236:
	.loc 23 188 0
	movl	$3, %ecx
.L1327:
	movl	-44(%ebp), %edx
	movl	-40(%ebp), %eax
.LBE10236:
.LBE10235:
	.loc 23 753 0
	addl	$32, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
.LBB10238:
.LBB10237:
	.loc 23 188 0
	jmp	basic_access.80083
.L1362:
.LBE10237:
.LBE10238:
.LBB10239:
.LBB10240:
	.loc 23 195 0
	movl	$4, %ecx
	jmp	.L1327
.L1190:
.LBE10240:
.LBE10239:
	.loc 23 731 0
	movl	-44(%ebp), %edx
	movl	-40(%ebp), %eax
	.loc 23 753 0
	addl	$32, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	.loc 23 731 0
	jmp	disk_1305.80338
.L1191:
.LBB10241:
.LBB10242:
.LBB10243:
.LBB10244:
	.loc 10 249 0
#APP
# 249 "src/biosvar.h" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB10245:
#APP
# 249 "src/biosvar.h" 1
	movw %ES:14, %si
# 0 "" 2
.LVL1997:
#NO_APP
.LBE10245:
.LBE10244:
.LBE10243:
.LBB10246:
.LBB10247:
.LBB10248:
	.loc 23 62 0
#APP
# 62 "src/disk.c" 1
	movl %CS:cdemu_drive_gf, %ebx
# 0 "" 2
.LVL1998:
#NO_APP
.LBE10248:
	.loc 23 61 0
	subl	$983040, %ebx
.LVL1999:
	cmpl	%ebx, -44(%ebp)
	jne	.L1221
.LBB10249:
	.loc 23 68 0
#APP
# 68 "src/disk.c" 1
	movw %si, %ES
# 0 "" 2
.LVL2000:
#NO_APP
.LBB10250:
#APP
# 68 "src/disk.c" 1
	movw %ES:322, %di
# 0 "" 2
.LVL2001:
#NO_APP
.LBE10250:
	.loc 23 69 0
#APP
# 69 "src/disk.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB10251:
#APP
# 69 "src/disk.c" 1
	movw %ES:320, %ax
# 0 "" 2
.LVL2002:
#NO_APP
.LBE10251:
	.loc 23 70 0
#APP
# 70 "src/disk.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB10252:
#APP
# 70 "src/disk.c" 1
	movw %ES:324, %dx
# 0 "" 2
#NO_APP
	movw	%dx, -16(%ebp)
	jmp	.L1222
.LVL2003:
.L1221:
.LBE10252:
.LBE10249:
.LBB10253:
	.loc 23 73 0
	movl	-44(%ebp), %ecx
#APP
# 73 "src/disk.c" 1
	movw %CS:4(%ecx), %di
# 0 "" 2
.LVL2004:
#NO_APP
.LBE10253:
.LBB10254:
	.loc 23 74 0
#APP
# 74 "src/disk.c" 1
	movw %CS:2(%ecx), %ax
# 0 "" 2
.LVL2005:
#NO_APP
.LBE10254:
.LBB10255:
	.loc 23 75 0
#APP
# 75 "src/disk.c" 1
	movw %CS:6(%ecx), %bx
# 0 "" 2
#NO_APP
	movw	%bx, -16(%ebp)
.LVL2006:
.L1222:
.LBE10255:
.LBE10247:
.LBE10246:
	.loc 23 233 0
	leal	-1(%edi), %ebx
.LVL2007:
	.loc 23 236 0
	movl	-40(%ebp), %edx
	movb	20(%edx), %cl
	testb	%cl, %cl
	js	.L1223
.LBB10256:
	.loc 23 238 0
#APP
# 238 "src/disk.c" 1
	movb %CS:Drives, %cl
# 0 "" 2
.LVL2008:
#NO_APP
.LBE10256:
.LBB10257:
	.loc 23 241 0
#APP
# 241 "src/disk.c" 1
	movl %CS:cdemu_drive_gf, %edi
# 0 "" 2
.LVL2009:
#NO_APP
.LBE10257:
	.loc 23 240 0
	subl	$983040, %edi
.LVL2010:
	cmpl	%edi, -44(%ebp)
	jne	.L1224
	.loc 23 242 0
#APP
# 242 "src/disk.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB10258:
#APP
# 242 "src/disk.c" 1
	movb %ES:317, %dl
# 0 "" 2
.LVL2011:
#NO_APP
.LBE10258:
	movzbl	%dl, %edx
.LVL2012:
	sall	%edx
.LVL2013:
	jmp	.L1323
.L1224:
.LBB10259:
	.loc 23 244 0
	movl	-44(%ebp), %edi
#APP
# 244 "src/disk.c" 1
	movb %CS:1(%edi), %dl
# 0 "" 2
.LVL2014:
#NO_APP
.LBE10259:
	movzbl	%dl, %edx
.LVL2015:
.L1323:
	movl	-40(%ebp), %edi
	movw	%dx, 16(%edi)
	.loc 23 247 0
	movl	-40(%ebp), %edx
.LVL2016:
	movw	$-4096, 2(%edx)
	.loc 23 248 0
	movl	$diskette_param_table2, %edx
	movl	-40(%ebp), %edi
	movw	%dx, 4(%edi)
	jmp	.L1226
.LVL2017:
.L1223:
	.loc 23 249 0
	cmpb	$-33, %cl
	ja	.L1227
	.loc 23 251 0
	movl	$64, %edx
#APP
# 251 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB10260:
#APP
# 251 "src/disk.c" 1
	movb %ES:117, %cl
# 0 "" 2
.LVL2018:
#NO_APP
.LBE10260:
	.loc 23 252 0
	leal	-2(%edi), %ebx
.LVL2019:
	jmp	.L1226
.LVL2020:
.L1227:
.LBB10261:
.LBB10262:
.LBB10263:
	.loc 23 29 0
	movl	$64, %edx
#APP
# 29 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	movb	$1, %dl
#APP
# 29 "src/disk.c" 1
	movb %dl, %ES:116
# 0 "" 2
#NO_APP
.LBE10263:
.LBB10264:
.LBB10265:
.LBB10266:
.LBB10267:
	.loc 14 90 0
	movl	-40(%ebp), %eax
.LVL2021:
	jmp	.L1325
.LVL2022:
.L1226:
.LBE10267:
.LBE10266:
.LBE10265:
.LBE10264:
.LBE10262:
.LBE10261:
	.loc 23 259 0
#APP
# 259 "src/disk.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB10268:
#APP
# 259 "src/disk.c" 1
	movb %ES:316, %dl
# 0 "" 2
.LVL2023:
#NO_APP
.LBE10268:
	testb	%dl, %dl
	je	.L1228
.LBB10269:
	.loc 23 260 0
#APP
# 260 "src/disk.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB10270:
#APP
# 260 "src/disk.c" 1
	movb %ES:318, %dl
# 0 "" 2
.LVL2024:
#NO_APP
.LBE10270:
	.loc 23 261 0
	movl	-40(%ebp), %edi
	movzbl	20(%edi), %esi
.LVL2025:
	xorl	%esi, %edx
	.loc 23 263 0
	cmpb	$-128, %dl
	adcb	$0, %cl
	.loc 23 264 0
	cmpb	$2, %cl
	jbe	.L1228
	movl	%esi, %edx
	testb	%dl, %dl
	js	.L1228
	movb	$2, %cl
.LVL2026:
.L1228:
.LBE10269:
	.loc 23 269 0
	movl	-40(%ebp), %esi
.LVL2027:
	movb	$0, 28(%esi)
	.loc 23 270 0
	movb	%bl, 25(%esi)
	.loc 23 271 0
	shrw	$2, %bx
.LVL2028:
	andl	$-64, %ebx
	movb	-16(%ebp), %dl
.LVL2029:
	andl	$63, %edx
	orl	%edx, %ebx
	movb	%bl, 24(%esi)
	.loc 23 272 0
	leal	-1(%eax), %edx
	movb	%dl, 21(%esi)
.LBB10271:
.LBB10272:
	.loc 23 26 0
	cmpb	$0, 20(%esi)
	js	.L1230
.LBB10273:
	.loc 23 27 0
	movl	$64, %edx
#APP
# 27 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	xorl	%edx, %edx
#APP
# 27 "src/disk.c" 1
	movb %dl, %ES:65
# 0 "" 2
#NO_APP
	jmp	.L1231
.L1230:
.LBE10273:
.LBB10274:
	.loc 23 29 0
	movl	$64, %edx
#APP
# 29 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	xorl	%edx, %edx
#APP
# 29 "src/disk.c" 1
	movb %dl, %ES:116
# 0 "" 2
#NO_APP
.L1231:
.LBE10274:
.LBB10275:
.LBB10276:
	.loc 14 77 0
	movl	-40(%ebp), %edi
	movb	$0, 29(%edi)
.LBB10277:
.LBB10278:
	.loc 14 62 0
	andw	$-2, 36(%edi)
.LBE10278:
.LBE10277:
.LBE10276:
.LBE10275:
.LBE10272:
.LBE10271:
	.loc 23 275 0
	movb	%cl, 20(%edi)
	jmp	.L1318
.LVL2030:
.L1363:
.LBE10242:
.LBE10241:
.LBB10279:
.LBB10280:
.LBB10281:
.LBB10282:
.LBB10283:
	.loc 23 26 0
	movl	-40(%ebp), %eax
	cmpb	$0, 20(%eax)
	js	.L1232
.LBB10284:
	.loc 23 27 0
#APP
# 27 "src/disk.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
	movl	%esi, %edx
	jmp	.L1330
.L1232:
.LBE10284:
.LBB10285:
	.loc 23 29 0
#APP
# 29 "src/disk.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
	movl	%esi, %ecx
#APP
# 29 "src/disk.c" 1
	movb %cl, %ES:116
# 0 "" 2
#NO_APP
	jmp	.L1268
.L1195:
.LBE10285:
.LBE10283:
.LBE10282:
.LBE10281:
.LBE10280:
.LBE10279:
	.loc 23 736 0
	movl	-44(%ebp), %edx
	movl	-40(%ebp), %eax
	.loc 23 753 0
	addl	$32, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	.loc 23 736 0
	jmp	disk_1310.80585
.L1196:
.LBB10286:
.LBB10287:
.LBB10288:
.LBB10289:
.LBB10290:
	.loc 23 26 0
	movl	-40(%ebp), %edi
	cmpb	$0, 20(%edi)
	jmp	.L1347
.L1197:
.LBE10290:
.LBE10289:
.LBE10288:
.LBE10287:
.LBE10286:
.LBB10291:
.LBB10292:
.LBB10293:
.LBB10294:
.LBB10295:
	movl	-40(%ebp), %ebx
	cmpb	$0, 20(%ebx)
	jmp	.L1347
.L1198:
.LBE10295:
.LBE10294:
.LBE10293:
.LBE10292:
.LBE10291:
.LBB10296:
.LBB10297:
.LBB10298:
.LBB10299:
	movl	-40(%ebp), %ebx
	cmpb	$0, 20(%ebx)
	js	.L1242
.LBB10300:
	.loc 23 27 0
#APP
# 27 "src/disk.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
	movl	%esi, %eax
#APP
# 27 "src/disk.c" 1
	movb %al, %ES:65
# 0 "" 2
#NO_APP
	jmp	.L1243
.L1242:
.LBE10300:
.LBB10301:
	.loc 23 29 0
#APP
# 29 "src/disk.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
	movl	%esi, %edx
#APP
# 29 "src/disk.c" 1
	movb %dl, %ES:116
# 0 "" 2
#NO_APP
.L1243:
.LBE10301:
.LBB10302:
.LBB10303:
	.loc 14 77 0
	movl	-40(%ebp), %ecx
	movb	$0, 29(%ecx)
.LBB10304:
.LBB10305:
	.loc 14 62 0
	andw	$-2, 36(%ecx)
.LBE10305:
.LBE10304:
.LBE10303:
.LBE10302:
.LBE10299:
.LBE10298:
	.loc 23 331 0
	movl	-40(%ebp), %ebx
	movb	20(%ebx), %cl
	addl	$-128, %ecx
	cmpb	$95, %cl
	jbe	.L1244
	.loc 23 333 0
	movb	$1, 29(%ebx)
	jmp	.L1318
.L1244:
.LBB10306:
.LBB10307:
.LBB10308:
	.loc 23 62 0
#APP
# 62 "src/disk.c" 1
	movl %CS:cdemu_drive_gf, %ecx
# 0 "" 2
.LVL2031:
#NO_APP
.LBE10308:
	.loc 23 61 0
	subl	$983040, %ecx
.LVL2032:
	cmpl	%ecx, -44(%ebp)
	jne	.L1245
.LBB10309:
.LBB10310:
.LBB10311:
	.loc 10 249 0
	movl	$64, %edx
#APP
# 249 "src/biosvar.h" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB10312:
#APP
# 249 "src/biosvar.h" 1
	movw %ES:14, %dx
# 0 "" 2
.LVL2033:
#NO_APP
.LBE10312:
.LBE10311:
.LBE10310:
	.loc 23 68 0
#APP
# 68 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB10313:
#APP
# 68 "src/disk.c" 1
	movw %ES:322, %cx
# 0 "" 2
.LVL2034:
#NO_APP
.LBE10313:
	.loc 23 69 0
#APP
# 69 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB10314:
#APP
# 69 "src/disk.c" 1
	movw %ES:320, %bx
# 0 "" 2
.LVL2035:
#NO_APP
.LBE10314:
	.loc 23 70 0
#APP
# 70 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB10315:
#APP
# 70 "src/disk.c" 1
	movw %ES:324, %dx
# 0 "" 2
.LVL2036:
#NO_APP
	jmp	.L1246
.LVL2037:
.L1245:
.LBE10315:
.LBE10309:
.LBB10316:
	.loc 23 73 0
	movl	-44(%ebp), %esi
#APP
# 73 "src/disk.c" 1
	movw %CS:4(%esi), %cx
# 0 "" 2
.LVL2038:
#NO_APP
.LBE10316:
.LBB10317:
	.loc 23 74 0
#APP
# 74 "src/disk.c" 1
	movw %CS:2(%esi), %bx
# 0 "" 2
.LVL2039:
#NO_APP
.LBE10317:
.LBB10318:
	.loc 23 75 0
#APP
# 75 "src/disk.c" 1
	movw %CS:6(%esi), %dx
# 0 "" 2
.LVL2040:
#NO_APP
.L1246:
.LBE10318:
.LBE10307:
.LBE10306:
	.loc 23 343 0
	movzwl	%dx, %edx
.LVL2041:
	movzwl	%bx, %ebx
.LVL2042:
	imull	%ebx, %edx
	movzwl	%cx, %ecx
.LVL2043:
	decl	%ecx
.LVL2044:
	imull	%ecx, %edx
	.loc 23 344 0
	movl	%edx, %ecx
	shrl	$16, %ecx
	movl	-40(%ebp), %edi
	movw	%cx, 24(%edi)
	.loc 23 345 0
	movw	%dx, 20(%edi)
	.loc 23 346 0
	movb	$3, 29(%edi)
	jmp	.L1318
.LVL2045:
.L1364:
.LBE10297:
.LBE10296:
.LBB10319:
.LBB10320:
	.loc 23 352 0
	movl	-40(%ebp), %eax
	cmpb	$0, 20(%eax)
	jns	.L1247
.LBB10321:
.LBB10322:
.LBB10323:
	.loc 23 29 0
#APP
# 29 "src/disk.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
	movb	$1, %dl
#APP
# 29 "src/disk.c" 1
	movb %dl, %ES:116
# 0 "" 2
.LVL2046:
#NO_APP
.L1325:
.LBE10323:
.LBB10324:
.LBB10325:
.LBB10326:
.LBB10327:
	.loc 14 90 0
	movb	$1, 29(%eax)
.LBB10328:
.LBB10329:
	.loc 14 60 0
	orw	$1, 36(%eax)
	jmp	.L1318
.LVL2047:
.L1247:
.LBE10329:
.LBE10328:
.LBE10327:
.LBE10326:
.LBE10325:
.LBE10324:
.LBE10322:
.LBE10321:
.LBB10330:
.LBB10331:
.LBB10332:
	.loc 23 27 0
#APP
# 27 "src/disk.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
	movb	$6, %dl
#APP
# 27 "src/disk.c" 1
	movb %dl, %ES:65
# 0 "" 2
#NO_APP
.LBE10332:
.LBB10333:
.LBB10334:
.LBB10335:
.LBB10336:
	.loc 14 90 0
	movl	-40(%ebp), %edx
	movb	$6, 29(%edx)
	jmp	.L1326
.L1200:
.LBE10336:
.LBE10335:
.LBE10334:
.LBE10333:
.LBE10331:
.LBE10330:
.LBE10320:
.LBE10319:
.LBB10337:
.LBB10338:
	.loc 23 364 0
	movl	-40(%ebp), %ebx
	movw	$-21931, 16(%ebx)
	.loc 23 365 0
	movw	$7, 24(%ebx)
.LBB10339:
.LBB10340:
	.loc 23 26 0
	cmpb	$0, 20(%ebx)
	js	.L1248
.LBB10341:
	.loc 23 27 0
#APP
# 27 "src/disk.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
	movl	%esi, %eax
#APP
# 27 "src/disk.c" 1
	movb %al, %ES:65
# 0 "" 2
#NO_APP
	jmp	.L1249
.L1248:
.LBE10341:
.LBB10342:
	.loc 23 29 0
#APP
# 29 "src/disk.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
	movl	%esi, %edx
#APP
# 29 "src/disk.c" 1
	movb %dl, %ES:116
# 0 "" 2
#NO_APP
.L1249:
.LBE10342:
.LBB10343:
.LBB10344:
.LBB10345:
.LBB10346:
	.loc 14 62 0
	movl	-40(%ebp), %ecx
	andw	$-2, 36(%ecx)
.LBE10346:
.LBE10345:
.LBE10344:
.LBE10343:
.LBE10340:
.LBE10339:
	.loc 23 367 0
	movb	$48, 29(%ecx)
.LBE10338:
.LBE10337:
	.loc 23 741 0
	jmp	.L1318
.L1201:
.LBB10347:
.LBB10348:
	.loc 23 374 0
	movl	$2, %ecx
	jmp	.L1328
.L1365:
.LBE10348:
.LBE10347:
.LBB10349:
.LBB10350:
	.loc 23 381 0
	movl	$3, %ecx
	jmp	.L1328
.L1203:
.LBE10350:
.LBE10349:
.LBB10351:
.LBB10352:
	.loc 23 388 0
	movl	$4, %ecx
	jmp	.L1328
.L1204:
.LBE10352:
.LBE10351:
.LBB10353:
.LBB10354:
	.loc 23 446 0
	movl	-40(%ebp), %ebx
	movb	20(%ebx), %dl
	cmpb	$-33, %dl
	jbe	.L1345
	.loc 23 452 0
	movl	-40(%ebp), %esi
	movb	28(%esi), %bl
	cmpb	$1, %bl
	je	.L1255
	jb	.L1254
	cmpb	$2, %bl
	jne	.L1316
	jmp	.L1368
.L1254:
.LBB10355:
.LBB10356:
.LBB10357:
.LBB10358:
	.loc 10 249 0
	movl	$64, %edx
#APP
# 249 "src/biosvar.h" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB10359:
#APP
# 249 "src/biosvar.h" 1
	movw %ES:14, %ax
# 0 "" 2
.LVL2048:
#NO_APP
.LBE10359:
.LBE10358:
.LBE10357:
	.loc 23 396 0
	movl	-40(%ebp), %edi
	movzbl	20(%edi), %ecx
	subl	$224, %ecx
.LVL2049:
	.loc 23 397 0
#APP
# 397 "src/disk.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
.LBB10360:
#APP
# 397 "src/disk.c" 1
	movb %ES:342(%ecx), %bl
# 0 "" 2
#NO_APP
	movl	%ebx, %esi
.LVL2050:
.LBE10360:
	.loc 23 398 0
	incb	%bl
	jne	.L1257
	.loc 23 399 0
	movb	$1, 28(%edi)
.LBB10361:
.LBB10362:
	.loc 23 26 0
	cmpb	$0, 20(%edi)
	js	.L1258
.LBB10363:
	.loc 23 27 0
#APP
# 27 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	movb	$-76, %dl
#APP
# 27 "src/disk.c" 1
	movb %dl, %ES:65
# 0 "" 2
#NO_APP
	jmp	.L1259
.L1258:
.LBE10363:
.LBB10364:
	.loc 23 29 0
#APP
# 29 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	movb	$-76, %dl
#APP
# 29 "src/disk.c" 1
	movb %dl, %ES:116
# 0 "" 2
#NO_APP
.L1259:
.LBE10364:
.LBB10365:
.LBB10366:
.LBB10367:
.LBB10368:
	.loc 14 90 0
	movl	-40(%ebp), %esi
.LVL2051:
	movb	$-76, 29(%esi)
	jmp	.L1324
.LVL2052:
.L1257:
.LBE10368:
.LBE10367:
.LBE10366:
.LBE10365:
.LBE10362:
.LBE10361:
.LBB10369:
	.loc 23 403 0
	incl	%esi
.LVL2053:
#APP
# 403 "src/disk.c" 1
	movw %ax, %ES
# 0 "" 2
#NO_APP
	movl	%esi, %eax
.LVL2054:
#APP
# 403 "src/disk.c" 1
	movb %al, %ES:342(%ecx)
# 0 "" 2
#NO_APP
.LBE10369:
	.loc 23 404 0
	movl	-40(%ebp), %ecx
.LVL2055:
	movb	$1, 28(%ecx)
	jmp	.L1338
.LVL2056:
.L1255:
.LBE10356:
.LBE10355:
.LBB10370:
.LBB10371:
.LBB10372:
.LBB10373:
	.loc 10 249 0
#APP
# 249 "src/biosvar.h" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB10374:
#APP
# 249 "src/biosvar.h" 1
	movw %ES:14, %bx
# 0 "" 2
.LVL2057:
#NO_APP
.LBE10374:
.LBE10373:
.LBE10372:
	.loc 23 413 0
	movl	-40(%ebp), %esi
	movzbl	20(%esi), %ecx
	subl	$224, %ecx
.LVL2058:
	.loc 23 414 0
#APP
# 414 "src/disk.c" 1
	movw %bx, %ES
# 0 "" 2
#NO_APP
.LBB10375:
#APP
# 414 "src/disk.c" 1
	movb %ES:342(%ecx), %dl
# 0 "" 2
.LVL2059:
#NO_APP
.LBE10375:
	.loc 23 415 0
	testb	%dl, %dl
	jne	.L1262
	.loc 23 416 0
	movb	$0, 28(%esi)
.LBB10376:
.LBB10377:
	.loc 23 26 0
	cmpb	$0, 20(%esi)
	js	.L1263
.LBB10378:
	.loc 23 27 0
	movl	$64, %edx
.LVL2060:
#APP
# 27 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	movb	$-80, %dl
#APP
# 27 "src/disk.c" 1
	movb %dl, %ES:65
# 0 "" 2
#NO_APP
	jmp	.L1264
.LVL2061:
.L1263:
.LBE10378:
.LBB10379:
	.loc 23 29 0
	movl	$64, %edx
.LVL2062:
#APP
# 29 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	movb	$-80, %dl
#APP
# 29 "src/disk.c" 1
	movb %dl, %ES:116
# 0 "" 2
#NO_APP
.L1264:
.LBE10379:
.LBB10380:
.LBB10381:
.LBB10382:
.LBB10383:
	.loc 14 90 0
	movl	-40(%ebp), %edi
	movb	$-80, 29(%edi)
.LBB10384:
.LBB10385:
	.loc 14 60 0
	orw	$1, 36(%edi)
	jmp	.L1318
.LVL2063:
.L1262:
.LBE10385:
.LBE10384:
.LBE10383:
.LBE10382:
.LBE10381:
.LBE10380:
.LBE10377:
.LBE10376:
	.loc 23 420 0
	decl	%edx
.LVL2064:
.LBB10386:
	.loc 23 421 0
#APP
# 421 "src/disk.c" 1
	movw %bx, %ES
# 0 "" 2
# 421 "src/disk.c" 1
	movb %dl, %ES:342(%ecx)
# 0 "" 2
#NO_APP
.LBE10386:
	.loc 23 422 0
	testb	%dl, %dl
	movl	-40(%ebp), %eax
	setne	28(%eax)
.LBB10387:
.LBB10388:
	.loc 23 26 0
	cmpb	$0, 20(%eax)
	jmp	.L1340
.LVL2065:
.L1368:
.LBE10388:
.LBE10387:
.LBE10371:
.LBE10370:
.LBB10389:
.LBB10390:
	.loc 23 430 0
	movzbl	%dl, %ecx
.LBB10391:
.LBB10392:
	.loc 10 249 0
	movl	$64, %edx
#APP
# 249 "src/biosvar.h" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
.LBB10393:
#APP
# 249 "src/biosvar.h" 1
	movw %ES:14, %bx
# 0 "" 2
.LVL2066:
#NO_APP
.LBE10393:
.LBE10392:
.LBE10391:
	.loc 23 431 0
#APP
# 431 "src/disk.c" 1
	movw %bx, %ES
# 0 "" 2
#NO_APP
.LBB10394:
#APP
# 431 "src/disk.c" 1
	movb %ES:118(%ecx), %cl
# 0 "" 2
.LVL2067:
#NO_APP
.LBE10394:
	.loc 23 432 0
	testb	%cl, %cl
	movl	-40(%ebp), %ecx
.LVL2068:
	setne	28(%ecx)
.LVL2069:
.L1338:
.LBB10395:
.LBB10396:
	.loc 23 26 0
	cmpb	$0, 20(%ecx)
	js	.L1267
.LBB10397:
	.loc 23 27 0
#APP
# 27 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	xorl	%edx, %edx
.L1330:
#APP
# 27 "src/disk.c" 1
	movb %dl, %ES:65
# 0 "" 2
#NO_APP
	jmp	.L1268
.L1267:
.LBE10397:
.LBB10398:
	.loc 23 29 0
#APP
# 29 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	xorl	%edx, %edx
#APP
# 29 "src/disk.c" 1
	movb %dl, %ES:116
# 0 "" 2
#NO_APP
.L1268:
.LBE10398:
.LBB10399:
.LBB10400:
	.loc 14 77 0
	movl	-40(%ebp), %ebx
.LVL2070:
	movb	$0, 29(%ebx)
.LBB10401:
.LBB10402:
	.loc 14 62 0
	andw	$-2, 36(%ebx)
	jmp	.L1318
.LVL2071:
.L1366:
.LBE10402:
.LBE10401:
.LBE10400:
.LBE10399:
.LBE10396:
.LBE10395:
.LBE10390:
.LBE10389:
.LBE10354:
.LBE10353:
	.loc 23 746 0
	movl	-44(%ebp), %edx
	movl	-40(%ebp), %eax
	.loc 23 753 0
	addl	$32, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	.loc 23 746 0
	jmp	disk_1346.80820
.L1206:
.LBB10403:
.LBB10404:
	.loc 23 498 0
	movl	$7, %ecx
.L1328:
	movl	-44(%ebp), %edx
	movl	-40(%ebp), %eax
.LBE10404:
.LBE10403:
	.loc 23 753 0
	addl	$32, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
.LBB10406:
.LBB10405:
	.loc 23 498 0
	jmp	extended_access.80147
.L1207:
.LBE10405:
.LBE10406:
.LBB10407:
.LBB10408:
	.loc 23 505 0
	movl	-40(%ebp), %edi
#APP
# 505 "src/disk.c" 1
	movw (%edi), %ES
# 0 "" 2
#NO_APP
.LBB10409:
	movzwl	8(%edi), %ecx
#APP
# 505 "src/disk.c" 1
	movw %ES:(%ecx), %ax
# 0 "" 2
#NO_APP
	movw	%ax, -14(%ebp)
.LBE10409:
	.loc 23 508 0
	cmpw	$25, %ax
	ja	.L1269
.LBB10410:
.LBB10411:
	.loc 23 26 0
	cmpb	$0, 20(%edi)
	js	.L1270
.LBB10412:
	.loc 23 27 0
	movl	$64, %edx
#APP
# 27 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	movb	$1, %dl
#APP
# 27 "src/disk.c" 1
	movb %dl, %ES:65
# 0 "" 2
#NO_APP
	jmp	.L1271
.L1270:
.LBE10412:
.LBB10413:
	.loc 23 29 0
	movl	$64, %edx
#APP
# 29 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	movb	$1, %dl
#APP
# 29 "src/disk.c" 1
	movb %dl, %ES:116
# 0 "" 2
#NO_APP
.L1271:
.LBE10413:
.LBB10414:
.LBB10415:
.LBB10416:
.LBB10417:
	.loc 14 90 0
	movl	-40(%ebp), %edx
	movb	$1, 29(%edx)
.L1326:
.LBB10418:
.LBB10419:
	.loc 14 60 0
	orw	$1, 36(%edx)
	jmp	.L1318
.L1269:
.LBE10419:
.LBE10418:
.LBE10417:
.LBE10416:
.LBE10415:
.LBE10414:
.LBE10411:
.LBE10410:
.LBB10420:
	.loc 23 515 0
	movl	-44(%ebp), %ecx
#APP
# 515 "src/disk.c" 1
	movb %CS:(%ecx), %cl
# 0 "" 2
#NO_APP
	movb	%cl, -16(%ebp)
.LBE10420:
.LBB10421:
	.loc 23 516 0
	movl	-44(%ebp), %ebx
#APP
# 516 "src/disk.c" 1
	movw %CS:30(%ebx), %bx
# 0 "" 2
#NO_APP
	movw	%bx, -30(%ebp)
.LBE10421:
.LBB10422:
	.loc 23 517 0
	movl	-44(%ebp), %esi
#APP
# 517 "src/disk.c" 1
	movw %CS:28(%esi), %si
# 0 "" 2
#NO_APP
	movw	%si, -18(%ebp)
.LBE10422:
.LBB10423:
	.loc 23 518 0
	movl	-44(%ebp), %edi
#APP
# 518 "src/disk.c" 1
	movw %CS:32(%edi), %di
# 0 "" 2
#NO_APP
	movw	%di, -20(%ebp)
.LBE10423:
.LBB10424:
.LBB10425:
	.loc 23 519 0
	movl	-44(%ebp), %eax
#APP
# 519 "src/disk.c" 1
	movl %CS:8(%eax), %ebx
# 0 "" 2
# 519 "src/disk.c" 1
	movl %CS:12(%eax), %ecx
# 0 "" 2
#NO_APP
.LBE10425:
.LBE10424:
.LBB10426:
	.loc 23 520 0
#APP
# 520 "src/disk.c" 1
	movw %CS:26(%eax), %dx
# 0 "" 2
#NO_APP
	movw	%dx, -32(%ebp)
.LBE10426:
.LBB10427:
	.loc 23 525 0
	movl	-40(%ebp), %esi
#APP
# 525 "src/disk.c" 1
	movw (%esi), %ES
# 0 "" 2
#NO_APP
	movzwl	8(%esi), %esi
	movl	$26, %edi
#APP
# 525 "src/disk.c" 1
	movw %di, %ES:(%esi)
# 0 "" 2
#NO_APP
.LBE10427:
	.loc 23 526 0
	cmpb	$3, -16(%ebp)
	jne	.L1272
.LBB10428:
	.loc 23 528 0
	movl	-40(%ebp), %eax
#APP
# 528 "src/disk.c" 1
	movw (%eax), %ES
# 0 "" 2
#NO_APP
	movzwl	8(%eax), %ecx
	movl	$116, %ebx
#APP
# 528 "src/disk.c" 1
	movw %bx, %ES:2(%ecx)
# 0 "" 2
#NO_APP
.LBE10428:
.LBB10429:
	.loc 23 529 0
#APP
# 529 "src/disk.c" 1
	movw (%eax), %ES
# 0 "" 2
#NO_APP
	movzwl	8(%eax), %ebx
	orl	$-1, %ecx
#APP
# 529 "src/disk.c" 1
	movl %ecx, %ES:4(%ebx)
# 0 "" 2
#NO_APP
.LBE10429:
.LBB10430:
	.loc 23 530 0
#APP
# 530 "src/disk.c" 1
	movw (%eax), %ES
# 0 "" 2
#NO_APP
	movzwl	8(%eax), %ebx
#APP
# 530 "src/disk.c" 1
	movl %ecx, %ES:8(%ebx)
# 0 "" 2
#NO_APP
.LBE10430:
.LBB10431:
	.loc 23 531 0
#APP
# 531 "src/disk.c" 1
	movw (%eax), %ES
# 0 "" 2
#NO_APP
	movzwl	8(%eax), %ebx
#APP
# 531 "src/disk.c" 1
	movl %ecx, %ES:12(%ebx)
# 0 "" 2
#NO_APP
.LBE10431:
.LBB10432:
	.loc 23 532 0
#APP
# 532 "src/disk.c" 1
	movw (%eax), %ES
# 0 "" 2
#NO_APP
.LBB10433:
	movzwl	8(%eax), %ecx
	orl	$-1, %ebx
.LVL2072:
	movl	%ebx, %esi
.LVL2073:
#APP
# 532 "src/disk.c" 1
	movl %ebx, %ES:16(%ecx)
# 0 "" 2
# 532 "src/disk.c" 1
	movl %esi, %ES:20(%ecx)
# 0 "" 2
#NO_APP
	jmp	.L1273
.LVL2074:
.L1272:
.LBE10433:
.LBE10432:
	.loc 23 534 0
	movzwl	-20(%ebp), %edi
.LVL2075:
	movzwl	-18(%ebp), %esi
.LVL2076:
	movl	%edi, %eax
	mull	%esi
	movl	%eax, -28(%ebp)
	movl	%edx, -24(%ebp)
	imull	$16383, %edx, %edx
	movl	%edx, -36(%ebp)
	movl	$16383, %esi
.LVL2077:
	movl	-28(%ebp), %eax
	mull	%esi
	movl	-36(%ebp), %edi
.LVL2078:
	addl	%edx, %edi
	cmpl	%edi, %ecx
	jb	.L1274
	ja	.L1319
	cmpl	%eax, %ebx
	jbe	.L1274
.L1319:
.LBB10434:
	.loc 23 535 0
	movl	-40(%ebp), %edx
#APP
# 535 "src/disk.c" 1
	movw (%edx), %ES
# 0 "" 2
#NO_APP
	movzwl	8(%edx), %esi
	xorl	%edi, %edi
#APP
# 535 "src/disk.c" 1
	movw %di, %ES:2(%esi)
# 0 "" 2
#NO_APP
.LBE10434:
.LBB10435:
	.loc 23 536 0
#APP
# 536 "src/disk.c" 1
	movw (%edx), %ES
# 0 "" 2
#NO_APP
	movzwl	8(%edx), %esi
	movl	$16383, %edi
#APP
# 536 "src/disk.c" 1
	movl %edi, %ES:4(%esi)
# 0 "" 2
#NO_APP
	jmp	.L1276
.L1274:
.LBE10435:
.LBB10436:
	.loc 23 538 0
	movl	-40(%ebp), %esi
#APP
# 538 "src/disk.c" 1
	movw (%esi), %ES
# 0 "" 2
#NO_APP
	movzwl	8(%esi), %esi
	movl	$2, %edi
#APP
# 538 "src/disk.c" 1
	movw %di, %ES:2(%esi)
# 0 "" 2
#NO_APP
.LBE10436:
.LBB10437:
	.loc 23 539 0
	movl	-40(%ebp), %eax
#APP
# 539 "src/disk.c" 1
	movw (%eax), %ES
# 0 "" 2
#NO_APP
	movzwl	8(%eax), %esi
	movzwl	-30(%ebp), %edi
.LVL2079:
#APP
# 539 "src/disk.c" 1
	movl %edi, %ES:4(%esi)
# 0 "" 2
#NO_APP
.L1276:
.LBE10437:
.LBB10438:
	.loc 23 541 0
	movl	-40(%ebp), %edx
#APP
# 541 "src/disk.c" 1
	movw (%edx), %ES
# 0 "" 2
#NO_APP
	movzwl	8(%edx), %esi
	movzwl	-18(%ebp), %edi
.LVL2080:
#APP
# 541 "src/disk.c" 1
	movl %edi, %ES:8(%esi)
# 0 "" 2
#NO_APP
.LBE10438:
.LBB10439:
	.loc 23 542 0
#APP
# 542 "src/disk.c" 1
	movw (%edx), %ES
# 0 "" 2
#NO_APP
	movzwl	8(%edx), %esi
	movzwl	-20(%ebp), %edi
.LVL2081:
#APP
# 542 "src/disk.c" 1
	movl %edi, %ES:12(%esi)
# 0 "" 2
#NO_APP
.LBE10439:
.LBB10440:
	.loc 23 543 0
#APP
# 543 "src/disk.c" 1
	movw (%edx), %ES
# 0 "" 2
#NO_APP
.LBB10441:
	movzwl	8(%edx), %esi
#APP
# 543 "src/disk.c" 1
	movl %ebx, %ES:16(%esi)
# 0 "" 2
# 543 "src/disk.c" 1
	movl %ecx, %ES:20(%esi)
# 0 "" 2
.LVL2082:
#NO_APP
.L1273:
.LBE10441:
.LBE10440:
.LBB10442:
	.loc 23 545 0
	movl	-40(%ebp), %ecx
#APP
# 545 "src/disk.c" 1
	movw (%ecx), %ES
# 0 "" 2
#NO_APP
	movzwl	8(%ecx), %ecx
	movl	-32(%ebp), %esi
.LVL2083:
#APP
# 545 "src/disk.c" 1
	movw %si, %ES:24(%ecx)
# 0 "" 2
#NO_APP
.LBE10442:
	.loc 23 547 0
	cmpw	$29, -14(%ebp)
	jbe	.L1304
	movb	-16(%ebp), %cl
	subl	$2, %ecx
	cmpb	$1, %cl
	ja	.L1304
.LBB10443:
.LBB10444:
	.loc 10 249 0
	movl	$64, %ecx
#APP
# 249 "src/biosvar.h" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB10445:
#APP
# 249 "src/biosvar.h" 1
	movw %ES:14, %cx
# 0 "" 2
.LVL2084:
#NO_APP
.LBE10445:
.LBE10444:
.LBE10443:
.LBB10446:
	.loc 23 555 0
	movl	-40(%ebp), %edx
#APP
# 555 "src/disk.c" 1
	movw (%edx), %ES
# 0 "" 2
#NO_APP
	movzwl	8(%edx), %ebx
.LVL2085:
	movl	$30, %esi
#APP
# 555 "src/disk.c" 1
	movw %si, %ES:(%ebx)
# 0 "" 2
#NO_APP
.LBE10446:
.LBB10447:
	.loc 23 557 0
#APP
# 557 "src/disk.c" 1
	movw (%edx), %ES
# 0 "" 2
#NO_APP
	movzwl	8(%edx), %ebx
#APP
# 557 "src/disk.c" 1
	movw %cx, %ES:28(%ebx)
# 0 "" 2
#NO_APP
.LBE10447:
.LBB10448:
	.loc 23 558 0
#APP
# 558 "src/disk.c" 1
	movw (%edx), %ES
# 0 "" 2
#NO_APP
	movzwl	8(%edx), %ebx
	movl	$326, %esi
#APP
# 558 "src/disk.c" 1
	movw %si, %ES:26(%ebx)
# 0 "" 2
#NO_APP
.LBE10448:
.LBB10449:
	.loc 23 564 0
	movl	-44(%ebp), %ebx
#APP
# 564 "src/disk.c" 1
	movl %CS:36(%ebx), %esi
# 0 "" 2
.LVL2086:
#NO_APP
.LBE10449:
.LBB10450:
	.loc 23 565 0
#APP
# 565 "src/disk.c" 1
	movb %CS:40(%ebx), %al
# 0 "" 2
#NO_APP
	movb	%al, -18(%ebp)
.LBE10450:
.LBB10451:
	.loc 23 566 0
#APP
# 566 "src/disk.c" 1
	movw %CS:-983040(%esi), %dx
# 0 "" 2
#NO_APP
	movw	%dx, -20(%ebp)
.LBE10451:
.LBB10452:
	.loc 23 567 0
#APP
# 567 "src/disk.c" 1
	movw %CS:-983038(%esi), %bx
# 0 "" 2
#NO_APP
	movw	%bx, -28(%ebp)
.LBE10452:
.LBB10453:
	.loc 23 568 0
#APP
# 568 "src/disk.c" 1
	movb %CS:-983034(%esi), %al
# 0 "" 2
#NO_APP
	movl	%eax, %edi
.LVL2087:
.LBE10453:
	.loc 23 571 0
	movl	$96, %ebx
.LVL2088:
	cmpb	$2, -16(%ebp)
	jne	.L1282
.LBB10454:
.LBB10455:
	.loc 23 572 0
	movl	-44(%ebp), %ebx
.LVL2089:
#APP
# 572 "src/disk.c" 1
	movb %CS:25(%ebx), %dl
# 0 "" 2
.LVL2090:
#NO_APP
.LBE10455:
	.loc 23 573 0
	xorl	%ebx, %ebx
.LVL2091:
	testb	%dl, %dl
	je	.L1282
	.loc 23 575 0
	movl	$520, %ebx
.LVL2092:
	cmpb	$1, %dl
	je	.L1282
	.loc 23 577 0
	movl	$8, %ebx
	cmpb	$3, %dl
	jne	.L1282
	movl	$1544, %ebx
.L1282:
.LBE10454:
.LBB10456:
	.loc 23 589 0
#APP
# 589 "src/disk.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
	movl	-20(%ebp), %eax
#APP
# 589 "src/disk.c" 1
	movw %ax, %ES:326
# 0 "" 2
#NO_APP
.LBE10456:
.LBB10457:
	.loc 23 590 0
	movl	-28(%ebp), %edx
.LVL2093:
	addl	$2, %edx
.LVL2094:
#APP
# 590 "src/disk.c" 1
	movw %cx, %ES
# 0 "" 2
# 590 "src/disk.c" 1
	movw %dx, %ES:328
# 0 "" 2
#NO_APP
.LBE10457:
.LBB10458:
	.loc 23 591 0
	cmpb	$1, -18(%ebp)
	sbbl	%edx, %edx
.LVL2095:
	andl	$-16, %edx
.LVL2096:
	subl	$16, %edx
.LVL2097:
#APP
# 591 "src/disk.c" 1
	movw %cx, %ES
# 0 "" 2
# 591 "src/disk.c" 1
	movb %dl, %ES:330
# 0 "" 2
#NO_APP
.LBE10458:
.LBB10459:
	.loc 23 593 0
#APP
# 593 "src/disk.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
	movb	$-53, %dl
.LVL2098:
#APP
# 593 "src/disk.c" 1
	movb %dl, %ES:331
# 0 "" 2
#NO_APP
.LBE10459:
.LBB10460:
	.loc 23 594 0
#APP
# 594 "src/disk.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
	movl	%edi, %edx
#APP
# 594 "src/disk.c" 1
	movb %dl, %ES:332
# 0 "" 2
#NO_APP
.LBE10460:
.LBB10461:
	.loc 23 595 0
#APP
# 595 "src/disk.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
	movb	$1, %dl
#APP
# 595 "src/disk.c" 1
	movb %dl, %ES:333
# 0 "" 2
#NO_APP
.LBE10461:
.LBB10462:
	.loc 23 596 0
#APP
# 596 "src/disk.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
	xorl	%edx, %edx
#APP
# 596 "src/disk.c" 1
	movb %dl, %ES:334
# 0 "" 2
#NO_APP
.LBE10462:
.LBB10463:
	.loc 23 597 0
#APP
# 597 "src/disk.c" 1
	movw %cx, %ES
# 0 "" 2
# 597 "src/disk.c" 1
	movb %dl, %ES:335
# 0 "" 2
#NO_APP
.LBE10463:
.LBB10464:
	.loc 23 598 0
#APP
# 598 "src/disk.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBE10464:
	.loc 23 585 0
	orl	$16, %ebx
.LVL2099:
.LBB10465:
	.loc 23 598 0
#APP
# 598 "src/disk.c" 1
	movw %bx, %ES:336
# 0 "" 2
#NO_APP
.LBE10465:
.LBB10466:
	.loc 23 599 0
#APP
# 599 "src/disk.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
	xorl	%edx, %edx
#APP
# 599 "src/disk.c" 1
	movw %dx, %ES:338
# 0 "" 2
#NO_APP
.LBE10466:
.LBB10467:
	.loc 23 600 0
#APP
# 600 "src/disk.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
	movb	$17, %dl
#APP
# 600 "src/disk.c" 1
	movb %dl, %ES:340
# 0 "" 2
#NO_APP
.LBE10467:
.LBB10468:
.LBB10469:
	.loc 6 98 0
#APP
# 98 "src/util.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
	movl	$326, %edx
	xorl	%ebx, %ebx
.LVL2100:
.L1288:
.LBB10470:
	.loc 6 102 0
#APP
# 102 "src/util.c" 1
	movb %ES:(%edx), %al
# 0 "" 2
#NO_APP
	movl	%eax, %edi
.LVL2101:
.LBE10470:
	addl	%edi, %ebx
.LVL2102:
	incl	%edx
	.loc 6 101 0
	cmpl	$341, %edx
	jne	.L1288
.LBE10469:
.LBE10468:
.LBB10471:
	.loc 23 604 0
	negl	%ebx
.LVL2103:
#APP
# 604 "src/disk.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
	xorl	%ecx, %ecx
.LVL2104:
#APP
# 604 "src/disk.c" 1
	movb %bl, %ES:341
# 0 "" 2
#NO_APP
.LBE10471:
	.loc 23 606 0
	cmpw	$65, -14(%ebp)
	jbe	.L1302
.LBB10472:
	.loc 23 612 0
	movl	-40(%ebp), %ebx
.LVL2105:
#APP
# 612 "src/disk.c" 1
	movw (%ebx), %ES
# 0 "" 2
#NO_APP
	movzwl	8(%ebx), %edx
	movl	$-16675, %ebx
#APP
# 612 "src/disk.c" 1
	movw %bx, %ES:30(%edx)
# 0 "" 2
#NO_APP
.LBE10472:
.LBB10473:
	.loc 23 613 0
	movl	-40(%ebp), %edi
.LVL2106:
#APP
# 613 "src/disk.c" 1
	movw (%edi), %ES
# 0 "" 2
#NO_APP
	movzwl	8(%edi), %edx
	movb	$36, %bl
#APP
# 613 "src/disk.c" 1
	movb %bl, %ES:32(%edx)
# 0 "" 2
#NO_APP
.LBE10473:
.LBB10474:
	.loc 23 614 0
#APP
# 614 "src/disk.c" 1
	movw (%edi), %ES
# 0 "" 2
#NO_APP
	movzwl	8(%edi), %ebx
	xorl	%edx, %edx
#APP
# 614 "src/disk.c" 1
	movb %dl, %ES:33(%ebx)
# 0 "" 2
#NO_APP
.LBE10474:
.LBB10475:
	.loc 23 615 0
#APP
# 615 "src/disk.c" 1
	movw (%edi), %ES
# 0 "" 2
#NO_APP
	movzwl	8(%edi), %ebx
	xorl	%edi, %edi
#APP
# 615 "src/disk.c" 1
	movw %di, %ES:34(%ebx)
# 0 "" 2
#NO_APP
.LBE10475:
.LBB10476:
	.loc 23 617 0
#APP
# 617 "src/disk.c" 1
	movl %CS:-983032(%esi), %ebx
# 0 "" 2
.LVL2107:
#NO_APP
.LBE10476:
	.loc 23 618 0
	cmpl	$-1, %ebx
	je	.L1292
.LBB10477:
.LBB10478:
	.loc 23 619 0
	movl	-40(%ebp), %eax
#APP
# 619 "src/disk.c" 1
	movw (%eax), %ES
# 0 "" 2
#NO_APP
	movzwl	8(%eax), %esi
.LVL2108:
	movl	$80, %edi
	movl	%edi, %eax
#APP
# 619 "src/disk.c" 1
	movb %al, %ES:36(%esi)
# 0 "" 2
#NO_APP
.LBE10478:
.LBB10479:
	.loc 23 620 0
	movl	-40(%ebp), %esi
#APP
# 620 "src/disk.c" 1
	movw (%esi), %ES
# 0 "" 2
#NO_APP
	movzwl	8(%esi), %esi
	movl	$67, %edi
	movl	%edi, %eax
#APP
# 620 "src/disk.c" 1
	movb %al, %ES:37(%esi)
# 0 "" 2
#NO_APP
.LBE10479:
.LBB10480:
	.loc 23 621 0
	movl	-40(%ebp), %esi
#APP
# 621 "src/disk.c" 1
	movw (%esi), %ES
# 0 "" 2
#NO_APP
	movzwl	8(%esi), %esi
	movl	$73, %edi
	movl	%edi, %eax
#APP
# 621 "src/disk.c" 1
	movb %al, %ES:38(%esi)
# 0 "" 2
#NO_APP
.LBE10480:
.LBB10481:
	.loc 23 622 0
	movl	-40(%ebp), %esi
#APP
# 622 "src/disk.c" 1
	movw (%esi), %ES
# 0 "" 2
#NO_APP
	movl	%esi, %edi
	movzwl	8(%esi), %esi
#APP
# 622 "src/disk.c" 1
	movb %dl, %ES:39(%esi)
# 0 "" 2
#NO_APP
.LBE10481:
.LBB10482:
	.loc 23 626 0
#APP
# 626 "src/disk.c" 1
	movw (%edi), %ES
# 0 "" 2
#NO_APP
.LBB10483:
	movzwl	8(%edi), %esi
	movl	%ebx, %edx
.LVL2109:
	andl	$7, %edx
	sall	$16, %edx
	movzbl	%bh, %edi
	orl	%edi, %edx
	shrw	$3, %bx
	andl	$31, %ebx
	sall	$8, %ebx
	orl	%ebx, %edx
#APP
# 626 "src/disk.c" 1
	movl %edx, %ES:48(%esi)
# 0 "" 2
# 626 "src/disk.c" 1
	movl %ecx, %ES:52(%esi)
# 0 "" 2
#NO_APP
	jmp	.L1293
.LVL2110:
.L1292:
.LBE10483:
.LBE10482:
.LBE10477:
.LBB10484:
	.loc 23 629 0
	movl	-40(%ebp), %eax
#APP
# 629 "src/disk.c" 1
	movw (%eax), %ES
# 0 "" 2
#NO_APP
	movzwl	8(%eax), %ebx
.LVL2111:
	movl	$73, %esi
.LVL2112:
	movl	%esi, %eax
#APP
# 629 "src/disk.c" 1
	movb %al, %ES:36(%ebx)
# 0 "" 2
#NO_APP
.LBE10484:
.LBB10485:
	.loc 23 630 0
	movl	-40(%ebp), %ebx
#APP
# 630 "src/disk.c" 1
	movw (%ebx), %ES
# 0 "" 2
#NO_APP
	movzwl	8(%ebx), %ebx
	movl	$83, %esi
	movl	%esi, %eax
#APP
# 630 "src/disk.c" 1
	movb %al, %ES:37(%ebx)
# 0 "" 2
#NO_APP
.LBE10485:
.LBB10486:
	.loc 23 631 0
	movl	-40(%ebp), %ebx
#APP
# 631 "src/disk.c" 1
	movw (%ebx), %ES
# 0 "" 2
#NO_APP
	movzwl	8(%ebx), %ebx
	movl	$65, %esi
	movl	%esi, %eax
#APP
# 631 "src/disk.c" 1
	movb %al, %ES:38(%ebx)
# 0 "" 2
#NO_APP
.LBE10486:
.LBB10487:
	.loc 23 632 0
	movl	-40(%ebp), %ebx
#APP
# 632 "src/disk.c" 1
	movw (%ebx), %ES
# 0 "" 2
#NO_APP
	movl	%ebx, %esi
	movzwl	8(%ebx), %ebx
#APP
# 632 "src/disk.c" 1
	movb %dl, %ES:39(%ebx)
# 0 "" 2
#NO_APP
.LBE10487:
.LBB10488:
	.loc 23 634 0
#APP
# 634 "src/disk.c" 1
	movw (%esi), %ES
# 0 "" 2
#NO_APP
.LBB10489:
	movzwl	8(%esi), %edx
	movzwl	-20(%ebp), %ebx
.LVL2113:
#APP
# 634 "src/disk.c" 1
	movl %ebx, %ES:48(%edx)
# 0 "" 2
# 634 "src/disk.c" 1
	movl %ecx, %ES:52(%edx)
# 0 "" 2
#NO_APP
.L1293:
.LBE10489:
.LBE10488:
.LBB10490:
	.loc 23 637 0
	movl	-40(%ebp), %edi
#APP
# 637 "src/disk.c" 1
	movw (%edi), %ES
# 0 "" 2
#NO_APP
	movzwl	8(%edi), %ecx
	movb	$65, %dl
#APP
# 637 "src/disk.c" 1
	movb %dl, %ES:40(%ecx)
# 0 "" 2
#NO_APP
.LBE10490:
.LBB10491:
	.loc 23 638 0
#APP
# 638 "src/disk.c" 1
	movw (%edi), %ES
# 0 "" 2
#NO_APP
	movzwl	8(%edi), %ecx
	movb	$84, %bl
.LVL2114:
#APP
# 638 "src/disk.c" 1
	movb %bl, %ES:41(%ecx)
# 0 "" 2
#NO_APP
.LBE10491:
.LBB10492:
	.loc 23 639 0
#APP
# 639 "src/disk.c" 1
	movw (%edi), %ES
# 0 "" 2
#NO_APP
	movzwl	8(%edi), %ecx
#APP
# 639 "src/disk.c" 1
	movb %dl, %ES:42(%ecx)
# 0 "" 2
#NO_APP
.LBE10492:
.LBB10493:
	.loc 23 640 0
#APP
# 640 "src/disk.c" 1
	movw (%edi), %ES
# 0 "" 2
#NO_APP
	movzwl	8(%edi), %ecx
	xorl	%edx, %edx
#APP
# 640 "src/disk.c" 1
	movb %dl, %ES:43(%ecx)
# 0 "" 2
#NO_APP
.LBE10493:
.LBB10494:
	.loc 23 641 0
#APP
# 641 "src/disk.c" 1
	movw (%edi), %ES
# 0 "" 2
#NO_APP
	movzwl	8(%edi), %ecx
#APP
# 641 "src/disk.c" 1
	movb %dl, %ES:44(%ecx)
# 0 "" 2
#NO_APP
.LBE10494:
.LBB10495:
	.loc 23 642 0
#APP
# 642 "src/disk.c" 1
	movw (%edi), %ES
# 0 "" 2
#NO_APP
	movzwl	8(%edi), %ecx
#APP
# 642 "src/disk.c" 1
	movb %dl, %ES:45(%ecx)
# 0 "" 2
#NO_APP
.LBE10495:
.LBB10496:
	.loc 23 643 0
#APP
# 643 "src/disk.c" 1
	movw (%edi), %ES
# 0 "" 2
#NO_APP
	movzwl	8(%edi), %ecx
#APP
# 643 "src/disk.c" 1
	movb %dl, %ES:46(%ecx)
# 0 "" 2
#NO_APP
.LBE10496:
.LBB10497:
	.loc 23 644 0
#APP
# 644 "src/disk.c" 1
	movw (%edi), %ES
# 0 "" 2
#NO_APP
	movzwl	8(%edi), %ecx
#APP
# 644 "src/disk.c" 1
	movb %dl, %ES:47(%ecx)
# 0 "" 2
#NO_APP
.LBE10497:
.LBB10498:
	.loc 23 646 0
#APP
# 646 "src/disk.c" 1
	movw (%edi), %ES
# 0 "" 2
#NO_APP
.LBB10499:
	movzwl	8(%edi), %edx
	movzbl	-18(%ebp), %ecx
.LVL2115:
#APP
# 646 "src/disk.c" 1
	movl %ecx, %ES:56(%edx)
# 0 "" 2
#NO_APP
	xorl	%ecx, %ecx
.LVL2116:
#APP
# 646 "src/disk.c" 1
	movl %ecx, %ES:60(%edx)
# 0 "" 2
#NO_APP
.LBE10499:
.LBE10498:
.LBB10500:
	.loc 23 648 0
	movzwl	8(%edi), %ebx
.LBB10501:
.LBB10502:
	.loc 6 98 0
#APP
# 98 "src/util.c" 1
	movw (%edi), %ES
# 0 "" 2
#NO_APP
	xorl	%edx, %edx
.LVL2117:
.LBB10503:
	.loc 6 102 0
	movl	-40(%ebp), %edi
.LVL2118:
.L1294:
#APP
# 102 "src/util.c" 1
	movb %ES:30(%edx,%ebx), %al
# 0 "" 2
#NO_APP
	movl	%eax, %esi
.LVL2119:
.LBE10503:
	addl	%esi, %ecx
.LVL2120:
	.loc 6 101 0
	incl	%edx
.LVL2121:
	cmpl	$35, %edx
	jne	.L1294
	movl	%edi, -40(%ebp)
.LBE10502:
.LBE10501:
	.loc 23 648 0
#APP
# 648 "src/disk.c" 1
	movw (%edi), %ES
# 0 "" 2
#NO_APP
	movzwl	8(%edi), %edx
.LVL2122:
	negl	%ecx
.LVL2123:
#APP
# 648 "src/disk.c" 1
	movb %cl, %ES:65(%edx)
# 0 "" 2
#NO_APP
.LBE10500:
.LBB10504:
.LBB10505:
	.loc 23 26 0
	cmpb	$0, 20(%edi)
.LVL2124:
.L1340:
	js	.L1295
.LBB10506:
	.loc 23 27 0
	movl	$64, %edx
.LVL2125:
#APP
# 27 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	xorl	%edx, %edx
#APP
# 27 "src/disk.c" 1
	movb %dl, %ES:65
# 0 "" 2
#NO_APP
	jmp	.L1296
.LVL2126:
.L1295:
.LBE10506:
.LBB10507:
	.loc 23 29 0
	movl	$64, %edx
.LVL2127:
#APP
# 29 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	xorl	%edx, %edx
#APP
# 29 "src/disk.c" 1
	movb %dl, %ES:116
# 0 "" 2
#NO_APP
.L1296:
.LBE10507:
.LBB10508:
.LBB10509:
	.loc 14 77 0
	movl	-40(%ebp), %edx
	movb	$0, 29(%edx)
.LBB10510:
.LBB10511:
	.loc 14 62 0
	andw	$-2, 36(%edx)
	jmp	.L1318
.LVL2128:
.L1208:
.LBE10511:
.LBE10510:
.LBE10509:
.LBE10508:
.LBE10505:
.LBE10504:
.LBE10408:
.LBE10407:
.LBB10512:
.LBB10513:
	.loc 23 658 0
	movl	-40(%ebp), %ebx
	movb	20(%ebx), %dl
	cmpb	$-33, %dl
	ja	.L1297
.L1345:
.LBB10514:
.LBB10515:
	.loc 23 26 0
	testb	%dl, %dl
.L1347:
	js	.L1298
.LBB10516:
	.loc 23 27 0
#APP
# 27 "src/disk.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
	movl	%esi, %eax
#APP
# 27 "src/disk.c" 1
	movb %al, %ES:65
# 0 "" 2
#NO_APP
	jmp	.L1309
.L1298:
.LBE10516:
.LBB10517:
	.loc 23 29 0
#APP
# 29 "src/disk.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
	movl	%esi, %edx
	jmp	.L1332
.L1297:
.LBE10517:
.LBE10515:
.LBE10514:
.LBB10518:
.LBB10519:
.LBB10520:
.LBB10521:
	.loc 14 60 0
	movl	-40(%ebp), %ebx
	orw	$1, 36(%ebx)
.LBE10521:
.LBE10520:
.LBE10519:
.LBE10518:
	.loc 23 665 0
	movb	$6, 29(%ebx)
	jmp	.L1318
.L1367:
.LBE10513:
.LBE10512:
.LBB10522:
.LBB10523:
	.loc 23 702 0
	movl	-40(%ebp), %esi
	movb	28(%esi), %dl
	cmpb	$3, %dl
	je	.L1302
	ja	.L1305
	decb	%dl
	jmp	.L1352
.L1305:
	cmpb	$4, %dl
	je	.L1303
	cmpb	$6, %dl
.L1352:
	jne	.L1300
	jmp	.L1304
.LVL2129:
.L1302:
.LBB10524:
.LBB10525:
.LBB10526:
.LBB10527:
	.loc 23 26 0
	movl	-40(%ebp), %edx
	cmpb	$0, 20(%edx)
	js	.L1308
.LBB10528:
	.loc 23 27 0
	movl	$64, %edx
#APP
# 27 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	xorl	%edx, %edx
#APP
# 27 "src/disk.c" 1
	movb %dl, %ES:65
# 0 "" 2
#NO_APP
	jmp	.L1309
.L1308:
.LBE10528:
.LBB10529:
	.loc 23 29 0
	movl	$64, %edx
#APP
# 29 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	xorl	%edx, %edx
.L1332:
#APP
# 29 "src/disk.c" 1
	movb %dl, %ES:116
# 0 "" 2
#NO_APP
.L1309:
.LBE10529:
.LBB10530:
.LBB10531:
	.loc 14 77 0
	movl	-40(%ebp), %ecx
	movb	$0, 29(%ecx)
.LBB10532:
.LBB10533:
	.loc 14 62 0
	andw	$-2, 36(%ecx)
	jmp	.L1318
.LVL2130:
.L1303:
.LBE10533:
.LBE10532:
.LBE10531:
.LBE10530:
.LBE10527:
.LBE10526:
.LBE10525:
.LBE10524:
.LBB10534:
.LBB10535:
.LBB10536:
.LBB10537:
	.loc 23 26 0
	movl	-40(%ebp), %ebx
	cmpb	$0, 20(%ebx)
	js	.L1310
.LBB10538:
	.loc 23 27 0
	movl	$64, %edx
#APP
# 27 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	xorl	%edx, %edx
#APP
# 27 "src/disk.c" 1
	movb %dl, %ES:65
# 0 "" 2
#NO_APP
	jmp	.L1311
.L1310:
.LBE10538:
.LBB10539:
	.loc 23 29 0
	movl	$64, %edx
#APP
# 29 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	xorl	%edx, %edx
#APP
# 29 "src/disk.c" 1
	movb %dl, %ES:116
# 0 "" 2
#NO_APP
.L1311:
.LBE10539:
.LBB10540:
.LBB10541:
	.loc 14 77 0
	movl	-40(%ebp), %esi
	movb	$0, 29(%esi)
.LBB10542:
.LBB10543:
	.loc 14 62 0
	andw	$-2, 36(%esi)
	jmp	.L1318
.LVL2131:
.L1304:
.LBE10543:
.LBE10542:
.LBE10541:
.LBE10540:
.LBE10537:
.LBE10536:
.LBE10535:
.LBE10534:
.LBB10544:
.LBB10545:
.LBB10546:
.LBB10547:
	.loc 23 26 0
	movl	-40(%ebp), %edi
.LVL2132:
	cmpb	$0, 20(%edi)
	js	.L1312
.LBB10548:
	.loc 23 27 0
	movl	$64, %edx
#APP
# 27 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	xorl	%edx, %edx
#APP
# 27 "src/disk.c" 1
	movb %dl, %ES:65
# 0 "" 2
#NO_APP
	jmp	.L1313
.L1312:
.LBE10548:
.LBB10549:
	.loc 23 29 0
	movl	$64, %edx
#APP
# 29 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	xorl	%edx, %edx
#APP
# 29 "src/disk.c" 1
	movb %dl, %ES:116
# 0 "" 2
#NO_APP
.L1313:
.LBE10549:
.LBB10550:
.LBB10551:
	.loc 14 77 0
	movl	-40(%ebp), %eax
	movb	$0, 29(%eax)
.LBB10552:
.LBB10553:
	.loc 14 62 0
	andw	$-2, 36(%eax)
	jmp	.L1318
.LVL2133:
.L1300:
.LBE10553:
.LBE10552:
.LBE10551:
.LBE10550:
.LBE10547:
.LBE10546:
.LBE10545:
.LBE10544:
.LBB10554:
.LBB10555:
.LBB10556:
.LBB10557:
	.loc 23 26 0
	movl	-40(%ebp), %edx
	cmpb	$0, 20(%edx)
	js	.L1314
.LBB10558:
	.loc 23 27 0
	movl	$64, %edx
#APP
# 27 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	movb	$1, %dl
#APP
# 27 "src/disk.c" 1
	movb %dl, %ES:65
# 0 "" 2
#NO_APP
	jmp	.L1315
.L1314:
.LBE10558:
.LBB10559:
	.loc 23 29 0
	movl	$64, %edx
#APP
# 29 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	movb	$1, %dl
#APP
# 29 "src/disk.c" 1
	movb %dl, %ES:116
# 0 "" 2
#NO_APP
.L1315:
.LBE10559:
.LBB10560:
.LBB10561:
.LBB10562:
.LBB10563:
	.loc 14 90 0
	movl	-40(%ebp), %ecx
	movb	$1, 29(%ecx)
.LBB10564:
.LBB10565:
	.loc 14 60 0
	orw	$1, 36(%ecx)
	jmp	.L1318
.L1184:
.LBE10565:
.LBE10564:
.LBE10563:
.LBE10562:
.LBE10561:
.LBE10560:
.LBE10557:
.LBE10556:
.LBE10555:
.LBE10554:
.LBE10523:
.LBE10522:
.LBB10566:
.LBB10567:
.LBB10568:
.LBB10569:
	.loc 23 40 0
	movl	-40(%ebp), %ebx
	cmpb	$0, 20(%ebx)
	js	.L1316
.LBB10570:
	.loc 23 41 0
	movl	$64, %edx
#APP
# 41 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	movb	$1, %dl
#APP
# 41 "src/disk.c" 1
	movb %dl, %ES:65
# 0 "" 2
#NO_APP
	jmp	.L1317
.L1316:
.LBE10570:
.LBB10571:
	.loc 23 43 0
	movl	$64, %edx
#APP
# 43 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	movb	$1, %dl
#APP
# 43 "src/disk.c" 1
	movb %dl, %ES:116
# 0 "" 2
#NO_APP
.L1317:
.LBE10571:
.LBB10572:
.LBB10573:
.LBB10574:
.LBB10575:
	.loc 14 90 0
	movl	-40(%ebp), %esi
	movb	$1, 29(%esi)
.LVL2134:
.L1324:
.LBB10576:
.LBB10577:
	.loc 14 60 0
	orw	$1, 36(%esi)
.LVL2135:
.L1318:
.LBE10577:
.LBE10576:
.LBE10575:
.LBE10574:
.LBE10573:
.LBE10572:
.LBE10569:
.LBE10568:
.LBE10567:
.LBE10566:
	.loc 23 753 0
	addl	$32, %esp
	popl	%ebx
.LVL2136:
	popl	%esi
.LVL2137:
	popl	%edi
.LVL2138:
	leave
	ret
	.cfi_endproc
.LFE2560:
	.size	disk_13.82387, .-disk_13.82387
	.section	.text.handle_legacy_disk.82458,"ax",@progbits
	.type	handle_legacy_disk.82458, @function
handle_legacy_disk.82458:
.LFB2562:
	.loc 23 782 0
	.cfi_startproc
.LVL2139:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.loc 23 789 0
	testb	%dl, %dl
	js	.L1370
	.cfi_offset 3, -8
.LBB10578:
.LBB10579:
.LBB10580:
	.loc 24 20 0
	cmpb	$15, %dl
	ja	.L1371
.LBB10581:
	.loc 24 22 0
	movzbl	%dl, %edx
.LVL2140:
#APP
# 22 "src/block.c" 1
	movl %CS:Drives+4(,%edx,4), %edx
# 0 "" 2
.LVL2141:
#NO_APP
.LBE10581:
	.loc 24 23 0
	testl	%edx, %edx
	je	.L1371
.LBE10580:
.LBE10579:
	.loc 23 791 0
	subl	$983040, %edx
.LVL2142:
	je	.L1371
.LBB10582:
.LBB10583:
	.loc 23 759 0
	cmpb	$22, 29(%eax)
	ja	.L1372
	movsbl	29(%eax),%ecx
	movl	$1, %ebx
	sall	%cl, %ebx
	andl	$6291775, %ebx
	jne	.L1384
.L1372:
.LBB10584:
.LBB10585:
.LBB10586:
.LBB10587:
	.loc 23 40 0
	cmpb	$0, 20(%eax)
	js	.L1374
.LBB10588:
	.loc 23 41 0
	movl	$64, %edx
.LVL2143:
#APP
# 41 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	movb	$1, %dl
#APP
# 41 "src/disk.c" 1
	movb %dl, %ES:65
# 0 "" 2
#NO_APP
	jmp	.L1380
.LVL2144:
.L1374:
.LBE10588:
.LBB10589:
	.loc 23 43 0
	movl	$64, %edx
.LVL2145:
#APP
# 43 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	movb	$1, %dl
#APP
# 43 "src/disk.c" 1
	movb %dl, %ES:116
# 0 "" 2
#NO_APP
	jmp	.L1380
.LVL2146:
.L1370:
.LBE10589:
.LBE10587:
.LBE10586:
.LBE10585:
.LBE10584:
.LBE10583:
.LBE10582:
.LBE10578:
	.loc 23 798 0
	cmpb	$-33, %dl
	jbe	.L1377
	.loc 23 799 0
	addl	$32, %edx
.LVL2147:
.LBB10590:
.LBB10591:
	.loc 24 20 0
	cmpb	$15, %dl
	ja	.L1371
.LBB10592:
	.loc 24 22 0
	movzbl	%dl, %edx
#APP
# 22 "src/block.c" 1
	movl %CS:Drives+132(,%edx,4), %edx
# 0 "" 2
.LVL2148:
#NO_APP
	jmp	.L1383
.LVL2149:
.L1377:
.LBE10592:
.LBE10591:
.LBE10590:
	.loc 23 801 0
	addl	$-128, %edx
.LVL2150:
.LBB10593:
.LBB10594:
	.loc 24 20 0
	cmpb	$15, %dl
	ja	.L1371
.LBB10595:
	.loc 24 22 0
	movzbl	%dl, %edx
#APP
# 22 "src/block.c" 1
	movl %CS:Drives+68(,%edx,4), %edx
# 0 "" 2
.LVL2151:
#NO_APP
.L1383:
.LBE10595:
	.loc 24 23 0
	testl	%edx, %edx
	je	.L1371
	.loc 24 25 0
	subl	$983040, %edx
.LVL2152:
.LBE10594:
.LBE10593:
	.loc 23 802 0
	testl	%edx, %edx
	je	.L1371
.LVL2153:
.L1384:
	.loc 23 810 0
	popl	%ebx
	.loc 23 804 0
	jmp	disk_13.82387
.LVL2154:
.L1371:
.LBB10596:
.LBB10597:
	.loc 23 26 0
	cmpb	$0, 20(%eax)
	js	.L1379
.LBB10598:
	.loc 23 27 0
	movl	$64, %edx
.LVL2155:
#APP
# 27 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	movb	$1, %dl
#APP
# 27 "src/disk.c" 1
	movb %dl, %ES:65
# 0 "" 2
#NO_APP
	jmp	.L1380
.LVL2156:
.L1379:
.LBE10598:
.LBB10599:
	.loc 23 29 0
	movl	$64, %edx
.LVL2157:
#APP
# 29 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	movb	$1, %dl
#APP
# 29 "src/disk.c" 1
	movb %dl, %ES:116
# 0 "" 2
#NO_APP
.L1380:
.LBE10599:
.LBB10600:
.LBB10601:
.LBB10602:
.LBB10603:
	.loc 14 90 0
	movb	$1, 29(%eax)
.LBB10604:
.LBB10605:
	.loc 14 60 0
	orw	$1, 36(%eax)
.LBE10605:
.LBE10604:
.LBE10603:
.LBE10602:
.LBE10601:
.LBE10600:
.LBE10597:
.LBE10596:
	.loc 23 810 0
	popl	%ebx
	ret
	.cfi_endproc
.LFE2562:
	.size	handle_legacy_disk.82458, .-handle_legacy_disk.82458
	.section	.text.handle_13,"ax",@progbits
.globl handle_13
	.type	handle_13, @function
handle_13:
.LFB2564:
	.loc 23 822 0
	.cfi_startproc
.LVL2158:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	pushl	%edi
	.cfi_def_cfa_offset 12
	pushl	%esi
	.cfi_def_cfa_offset 16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	subl	$8, %esp
	.cfi_def_cfa_offset 28
	.loc 23 824 0
	movb	20(%eax), %dl
	movb	%dl, 3(%esp)
.LBB10606:
	.loc 23 827 0
	movb	29(%eax), %cl
	movb	%cl, 7(%esp)
	cmpb	$75, %cl
	jne	.L1386
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 5, -8
.LBB10628:
.LBB10629:
.LBB10630:
.LBB10631:
	.loc 10 249 0
	movl	$64, %ecx
#APP
# 249 "src/biosvar.h" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB10632:
#APP
# 249 "src/biosvar.h" 1
	movw %ES:14, %si
# 0 "" 2
.LVL2159:
#NO_APP
.LBE10632:
.LBE10631:
.LBE10630:
.LBB10633:
	.loc 34 154 0
	movw	(%eax), %bx
#APP
# 154 "src/cdrom.c" 1
	movw %bx, %ES
# 0 "" 2
#NO_APP
	movzwl	8(%eax), %ecx
	movl	$19, %edi
	movl	%edi, %edx
#APP
# 154 "src/cdrom.c" 1
	movb %dl, %ES:(%ecx)
# 0 "" 2
#NO_APP
.LBE10633:
.LBB10634:
	.loc 34 155 0
#APP
# 155 "src/cdrom.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB10635:
#APP
# 155 "src/cdrom.c" 1
	movb %ES:317, %dl
# 0 "" 2
#NO_APP
.LBE10635:
#APP
# 155 "src/cdrom.c" 1
	movw %bx, %ES
# 0 "" 2
# 155 "src/cdrom.c" 1
	movb %dl, %ES:1(%ecx)
# 0 "" 2
#NO_APP
.LBE10634:
.LBB10636:
	.loc 34 156 0
#APP
# 156 "src/cdrom.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB10637:
#APP
# 156 "src/cdrom.c" 1
	movb %ES:318, %dl
# 0 "" 2
#NO_APP
.LBE10637:
#APP
# 156 "src/cdrom.c" 1
	movw %bx, %ES
# 0 "" 2
# 156 "src/cdrom.c" 1
	movb %dl, %ES:2(%ecx)
# 0 "" 2
#NO_APP
.LBE10636:
	.loc 34 158 0
#APP
# 158 "src/cdrom.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB10638:
#APP
# 158 "src/cdrom.c" 1
	movl %ES:302, %ebp
# 0 "" 2
.LVL2160:
#NO_APP
.LBE10638:
	.loc 34 160 0
	xorl	%edi, %edi
.LVL2161:
	testl	%ebp, %ebp
	je	.L1388
.LBB10639:
	.loc 34 161 0
#APP
# 161 "src/cdrom.c" 1
	movl %CS:-983020(%ebp), %edi
# 0 "" 2
.LVL2162:
#NO_APP
.L1388:
.LBE10639:
.LBB10640:
	.loc 34 162 0
#APP
# 162 "src/cdrom.c" 1
	movw %bx, %ES
# 0 "" 2
#NO_APP
	movl	%edi, %edx
	shrb	%dl
#APP
# 162 "src/cdrom.c" 1
	movb %dl, %ES:3(%ecx)
# 0 "" 2
#NO_APP
.LBE10640:
.LBB10641:
	.loc 34 163 0
#APP
# 163 "src/cdrom.c" 1
	movw %bx, %ES
# 0 "" 2
#NO_APP
	andl	$1, %edi
.LVL2163:
#APP
# 163 "src/cdrom.c" 1
	movw %di, %ES:8(%ecx)
# 0 "" 2
#NO_APP
.LBE10641:
.LBB10642:
	.loc 34 164 0
#APP
# 164 "src/cdrom.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB10643:
#APP
# 164 "src/cdrom.c" 1
	movl %ES:306, %edi
# 0 "" 2
.LVL2164:
#NO_APP
.LBE10643:
#APP
# 164 "src/cdrom.c" 1
	movw %bx, %ES
# 0 "" 2
# 164 "src/cdrom.c" 1
	movl %edi, %ES:4(%ecx)
# 0 "" 2
#NO_APP
.LBE10642:
.LBB10644:
	.loc 34 165 0
#APP
# 165 "src/cdrom.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB10645:
#APP
# 165 "src/cdrom.c" 1
	movw %ES:310, %di
# 0 "" 2
.LVL2165:
#NO_APP
.LBE10645:
#APP
# 165 "src/cdrom.c" 1
	movw %bx, %ES
# 0 "" 2
# 165 "src/cdrom.c" 1
	movw %di, %ES:10(%ecx)
# 0 "" 2
#NO_APP
.LBE10644:
.LBB10646:
	.loc 34 166 0
#APP
# 166 "src/cdrom.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB10647:
#APP
# 166 "src/cdrom.c" 1
	movw %ES:312, %di
# 0 "" 2
.LVL2166:
#NO_APP
.LBE10647:
#APP
# 166 "src/cdrom.c" 1
	movw %bx, %ES
# 0 "" 2
# 166 "src/cdrom.c" 1
	movw %di, %ES:12(%ecx)
# 0 "" 2
#NO_APP
.LBE10646:
.LBB10648:
	.loc 34 167 0
#APP
# 167 "src/cdrom.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB10649:
#APP
# 167 "src/cdrom.c" 1
	movw %ES:314, %di
# 0 "" 2
.LVL2167:
#NO_APP
.LBE10649:
#APP
# 167 "src/cdrom.c" 1
	movw %bx, %ES
# 0 "" 2
# 167 "src/cdrom.c" 1
	movw %di, %ES:14(%ecx)
# 0 "" 2
#NO_APP
.LBE10648:
.LBB10650:
	.loc 34 168 0
#APP
# 168 "src/cdrom.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB10651:
#APP
# 168 "src/cdrom.c" 1
	movw %ES:322, %di
# 0 "" 2
.LVL2168:
#NO_APP
.LBE10651:
#APP
# 168 "src/cdrom.c" 1
	movw %bx, %ES
# 0 "" 2
#NO_APP
	movl	%edi, %edx
.LVL2169:
#APP
# 168 "src/cdrom.c" 1
	movb %dl, %ES:16(%ecx)
# 0 "" 2
#NO_APP
.LBE10650:
.LBB10652:
	.loc 34 169 0
#APP
# 169 "src/cdrom.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB10653:
#APP
# 169 "src/cdrom.c" 1
	movw %ES:324, %di
# 0 "" 2
.LVL2170:
#NO_APP
.LBE10653:
#APP
# 169 "src/cdrom.c" 1
	movw %bx, %ES
# 0 "" 2
#NO_APP
	movl	%edi, %edx
.LVL2171:
#APP
# 169 "src/cdrom.c" 1
	movb %dl, %ES:17(%ecx)
# 0 "" 2
#NO_APP
.LBE10652:
.LBB10654:
	.loc 34 170 0
#APP
# 170 "src/cdrom.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
.LBB10655:
#APP
# 170 "src/cdrom.c" 1
	movw %ES:320, %di
# 0 "" 2
.LVL2172:
#NO_APP
.LBE10655:
#APP
# 170 "src/cdrom.c" 1
	movw %bx, %ES
# 0 "" 2
#NO_APP
	movl	%edi, %edx
.LVL2173:
#APP
# 170 "src/cdrom.c" 1
	movb %dl, %ES:18(%ecx)
# 0 "" 2
#NO_APP
.LBE10654:
	.loc 34 173 0
	cmpb	$0, 28(%eax)
	jne	.L1389
.LBB10656:
	.loc 34 175 0
#APP
# 175 "src/cdrom.c" 1
	movw %si, %ES
# 0 "" 2
#NO_APP
	xorl	%ecx, %ecx
#APP
# 175 "src/cdrom.c" 1
	movb %cl, %ES:316
# 0 "" 2
#NO_APP
.L1389:
.LBE10656:
.LBB10657:
.LBB10658:
	.loc 23 26 0
	cmpb	$0, 3(%esp)
	js	.L1390
.LBB10659:
	.loc 23 27 0
	movl	$64, %edx
#APP
# 27 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	xorl	%edx, %edx
#APP
# 27 "src/disk.c" 1
	movb %dl, %ES:65
# 0 "" 2
#NO_APP
	jmp	.L1391
.L1390:
.LBE10659:
.LBB10660:
	.loc 23 29 0
	movl	$64, %edx
#APP
# 29 "src/disk.c" 1
	movw %dx, %ES
# 0 "" 2
#NO_APP
	xorl	%edx, %edx
#APP
# 29 "src/disk.c" 1
	movb %dl, %ES:116
# 0 "" 2
#NO_APP
.L1391:
.LBE10660:
.LBB10661:
.LBB10662:
	.loc 14 77 0
	movb	$0, 29(%eax)
.LBB10663:
.LBB10664:
	.loc 14 62 0
	andw	$-2, 36(%eax)
.LBE10664:
.LBE10663:
.LBE10662:
.LBE10661:
.LBE10658:
.LBE10657:
.LBE10629:
.LBE10628:
	.loc 23 829 0
	jmp	.L1398
.LVL2174:
.L1386:
.LBB10625:
.LBB10626:
	.loc 10 249 0
	movl	$64, %ecx
#APP
# 249 "src/biosvar.h" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
.LBB10627:
#APP
# 249 "src/biosvar.h" 1
	movw %ES:14, %bx
# 0 "" 2
.LVL2175:
#NO_APP
.LBE10627:
.LBE10626:
.LBE10625:
	.loc 23 832 0
#APP
# 832 "src/disk.c" 1
	movw %bx, %ES
# 0 "" 2
#NO_APP
.LBB10624:
#APP
# 832 "src/disk.c" 1
	movb %ES:316, %dl
# 0 "" 2
#NO_APP
.LBE10624:
	testb	%dl, %dl
	je	.L1393
.LBB10607:
	.loc 23 833 0
#APP
# 833 "src/disk.c" 1
	movw %bx, %ES
# 0 "" 2
#NO_APP
.LBB10622:
#APP
# 833 "src/disk.c" 1
	movb %ES:318, %bl
# 0 "" 2
.LVL2176:
#NO_APP
.LBE10622:
	.loc 23 834 0
	cmpb	%bl, 3(%esp)
	jne	.L1394
.LBB10608:
.LBB10621:
	.loc 23 837 0
#APP
# 837 "src/disk.c" 1
	movl %CS:cdemu_drive_gf, %ebx
# 0 "" 2
.LVL2177:
#NO_APP
.LBE10621:
	.loc 23 838 0
	cmpb	$22, 7(%esp)
	jbe	.L1395
.LBB10609:
.LBB10610:
.LBB10611:
.LBB10612:
	.loc 23 40 0
	cmpb	$0, 3(%esp)
	js	.L1396
.LBB10613:
	.loc 23 41 0
#APP
# 41 "src/disk.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
	movb	$1, %dl
#APP
# 41 "src/disk.c" 1
	movb %dl, %ES:65
# 0 "" 2
#NO_APP
	jmp	.L1397
.L1396:
.LBE10613:
.LBB10614:
	.loc 23 43 0
#APP
# 43 "src/disk.c" 1
	movw %cx, %ES
# 0 "" 2
#NO_APP
	movb	$1, %dl
#APP
# 43 "src/disk.c" 1
	movb %dl, %ES:116
# 0 "" 2
#NO_APP
.L1397:
.LBE10614:
.LBB10615:
.LBB10616:
.LBB10617:
.LBB10618:
	.loc 14 90 0
	movb	$1, 29(%eax)
.LBB10619:
.LBB10620:
	.loc 14 60 0
	orw	$1, 36(%eax)
	jmp	.L1398
.L1395:
.LBE10620:
.LBE10619:
.LBE10618:
.LBE10617:
.LBE10616:
.LBE10615:
.LBE10612:
.LBE10611:
.LBE10610:
.LBE10609:
	.loc 23 843 0
	leal	-983040(%ebx), %edx
.LBE10608:
.LBE10607:
.LBE10606:
	.loc 23 852 0
	popl	%edi
	.cfi_def_cfa_offset 24
	popl	%ebp
	.cfi_def_cfa_offset 20
	popl	%ebx
.LVL2178:
	popl	%esi
	popl	%edi
	popl	%ebp
.LBB10666:
.LBB10665:
.LBB10623:
	.loc 23 843 0
	jmp	disk_13.82387
.LVL2179:
.L1394:
.LBE10623:
	.loc 23 846 0
	cmpb	$-33, 3(%esp)
	ja	.L1393
	xorb	3(%esp), %bl
.LVL2180:
	.loc 23 848 0
	cmpb	$-128, %bl
	sbbb	$0, 3(%esp)
.LVL2181:
.L1393:
.LBE10665:
.LBE10666:
	.loc 23 851 0
	movzbl	3(%esp), %edx
.LVL2182:
	.loc 23 852 0
	popl	%ebx
	.cfi_def_cfa_offset 16
.LVL2183:
	popl	%esi
	.cfi_def_cfa_offset 12
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	.loc 23 851 0
	jmp	handle_legacy_disk.82458
.LVL2184:
.L1398:
	.loc 23 852 0
	popl	%edx
	.cfi_def_cfa_offset 8
	popl	%ecx
	.cfi_def_cfa_offset 4
	popl	%ebx
.LVL2185:
	popl	%esi
.LVL2186:
	popl	%edi
	popl	%ebp
.LVL2187:
	ret
	.cfi_endproc
.LFE2564:
	.size	handle_13, .-handle_13
	.section	.text.handle_40,"ax",@progbits
.globl handle_40
	.type	handle_40, @function
handle_40:
.LFB2563:
	.loc 23 814 0
	.cfi_startproc
.LVL2188:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	movl	%eax, %ebx
	.cfi_offset 3, -8
.LBB10667:
.LBB10668:
	.loc 3 456 0
	pushl	$__func__.82485
	.cfi_def_cfa_offset 12
	pushl	$.LC8
	.cfi_def_cfa_offset 16
	.cfi_escape 0x2e,0x8
	call	__dprintf.1654
.LVL2189:
	popl	%eax
	.cfi_def_cfa_offset 12
	popl	%edx
	.cfi_def_cfa_offset 8
	.loc 3 457 0
	movl	%ebx, %eax
	.cfi_escape 0x2e,0x0
	call	dump_regs.10019
.LBE10668:
.LBE10667:
	.loc 23 816 0
	movzbl	20(%ebx), %edx
	movl	%ebx, %eax
	.loc 23 817 0
	popl	%ebx
.LVL2190:
	.loc 23 816 0
	jmp	handle_legacy_disk.82458
	.cfi_endproc
.LFE2563:
	.size	handle_40, .-handle_40
.globl BIOS_CONFIG_TABLE
	.section	.fixedaddr.0xe6f5,"aw",@progbits
	.type	BIOS_CONFIG_TABLE, @object
	.size	BIOS_CONFIG_TABLE, 10
BIOS_CONFIG_TABLE:
	.value	8
	.byte	-4
	.byte	0
	.byte	1
	.byte	116
	.byte	64
	.byte	0
	.byte	0
	.byte	0
.globl rmode_IDT_info
	.section	.data16.src/misc.c.132,"aw",@progbits
	.align 4
	.type	rmode_IDT_info, @object
	.size	rmode_IDT_info, 6
rmode_IDT_info:
	.value	1023
	.long	0
.globl pmode_IDT_info
	.section	.data16.src/misc.c.142,"aw",@progbits
	.align 4
	.type	pmode_IDT_info, @object
	.size	pmode_IDT_info, 6
pmode_IDT_info:
	.value	0
	.long	dummy_IDT+983040
.globl rombios32_gdt
	.section	.data16.src/misc.c.148,"aw",@progbits
	.align 8
	.type	rombios32_gdt, @object
	.size	rombios32_gdt, 56
rombios32_gdt:
	.long	0
	.long	0
	.long	65535
	.long	13605632
	.long	65535
	.long	13603584
	.long	65535
	.long	39695
	.long	65535
	.long	37632
	.long	65535
	.long	9411328
	.long	65535
	.long	9409280
.globl rombios32_gdt_48
	.section	.data16.src/misc.c.166,"aw",@progbits
	.align 4
	.type	rombios32_gdt_48, @object
	.size	rombios32_gdt_48, 6
rombios32_gdt_48:
	.value	55
	.long	rombios32_gdt+983040
.globl BiosCopyright
	.section	.fixedaddr.0xff00,"aw",@progbits
	.type	BiosCopyright, @object
	.size	BiosCopyright, 69
BiosCopyright:
	.string	"(c) 2002 MandrakeSoft S.A. Written by Kevin Lawton & the Bochs team."
.globl BiosDate
	.section	.fixedaddr.0xfff5,"aw",@progbits
	.type	BiosDate, @object
	.size	BiosDate, 9
BiosDate:
	.string	"06/23/99"
.globl BiosModelId
	.section	.fixedaddr.0xfffe,"aw",@progbits
	.type	BiosModelId, @object
	.size	BiosModelId, 1
BiosModelId:
	.byte	-4
	.section	.rodata.__func__.2092,"a",@progbits
	.align 4
	.type	__func__.2092, @object
	.size	__func__.2092, 10
__func__.2092:
	.string	"handle_75"
	.section	.rodata.__func__.2037,"a",@progbits
	.align 4
	.type	__func__.2037, @object
	.size	__func__.2037, 10
__func__.2037:
	.string	"handle_02"
	.section	.rodata.__func__.2025,"a",@progbits
	.align 4
	.type	__func__.2025, @object
	.size	__func__.2025, 10
__func__.2025:
	.string	"handle_05"
	.weak	Zones
	.section	.discard.var32flat.src/pmm.c.38,"aw",@progbits
	.align 4
	.type	Zones, @object
	.size	Zones, 20
Zones:
	.long	ZoneTmpLow
	.long	ZoneLow
	.long	ZoneFSeg
	.long	ZoneTmpHigh
	.long	ZoneHigh
.globl PMMHEADER
	.section	.data16.export.src/pmm.c.375,"aw",@progbits
	.align 16
	.type	PMMHEADER, @object
	.size	PMMHEADER, 16
PMMHEADER:
	.zero	4
	.byte	1
	.byte	16
	.zero	3
	.value	-4096
	.zero	5
.globl diskette_param_table2
	.section	.data16.src/floppy.c.28,"aw",@progbits
	.align 4
	.type	diskette_param_table2, @object
	.size	diskette_param_table2, 14
diskette_param_table2:
	.byte	-81
	.byte	2
	.byte	37
	.byte	2
	.byte	18
	.byte	27
	.byte	-1
	.byte	108
	.byte	-10
	.byte	15
	.byte	8
	.byte	79
	.byte	0
	.byte	4
.globl diskette_param_table
	.section	.fixedaddr.0xefc7,"aw",@progbits
	.type	diskette_param_table, @object
	.size	diskette_param_table, 11
diskette_param_table:
	.byte	-81
	.byte	2
	.byte	37
	.byte	2
	.byte	18
	.byte	27
	.byte	-1
	.byte	108
	.byte	-10
	.byte	15
	.byte	8
.globl FloppyInfo
	.section	.data16.src/floppy.c.70,"aw",@progbits
	.align 4
	.type	FloppyInfo, @object
	.size	FloppyInfo, 72
FloppyInfo:
	.value	0
	.value	0
	.value	0
	.byte	0
	.byte	0
	.value	2
	.value	40
	.value	9
	.byte	0
	.byte	37
	.value	2
	.value	80
	.value	15
	.byte	0
	.byte	37
	.value	2
	.value	80
	.value	9
	.byte	0
	.byte	23
	.value	2
	.value	80
	.value	18
	.byte	0
	.byte	23
	.value	2
	.value	80
	.value	36
	.byte	-52
	.byte	-41
	.value	1
	.value	40
	.value	8
	.byte	0
	.byte	39
	.value	1
	.value	40
	.value	9
	.byte	0
	.byte	39
	.value	2
	.value	40
	.value	8
	.byte	0
	.byte	39
	.section	.rodata.__func__.20205,"a",@progbits
	.align 4
	.type	__func__.20205, @object
	.size	__func__.20205, 10
__func__.20205:
	.string	"ata_reset"
	.section	.rodata.__func__.20137,"a",@progbits
	.align 4
	.type	__func__.20137, @object
	.size	__func__.20137, 10
__func__.20137:
	.string	"await_ide"
	.section	.data16.src/mouse.c.113,"aw",@progbits
	.align 4
	.type	sample_rates.24115, @object
	.size	sample_rates.24115, 7
sample_rates.24115:
	.byte	10
	.byte	20
	.byte	40
	.byte	60
	.byte	80
	.byte	100
	.byte	-56
	.section	.data16.src/kbd.c.280,"aw",@progbits
	.align 4
	.type	scan_to_scanascii.27268, @object
	.size	scan_to_scanascii.27268, 890
scan_to_scanascii.27268:
	.value	0
	.value	0
	.value	0
	.value	0
	.byte	0
	.zero	1
	.value	283
	.value	283
	.value	283
	.value	256
	.byte	0
	.zero	1
	.value	561
	.value	545
	.value	0
	.value	30720
	.byte	0
	.zero	1
	.value	818
	.value	832
	.value	768
	.value	30976
	.byte	0
	.zero	1
	.value	1075
	.value	1059
	.value	0
	.value	31232
	.byte	0
	.zero	1
	.value	1332
	.value	1316
	.value	0
	.value	31488
	.byte	0
	.zero	1
	.value	1589
	.value	1573
	.value	0
	.value	31744
	.byte	0
	.zero	1
	.value	1846
	.value	1886
	.value	1822
	.value	32000
	.byte	0
	.zero	1
	.value	2103
	.value	2086
	.value	0
	.value	32256
	.byte	0
	.zero	1
	.value	2360
	.value	2346
	.value	0
	.value	32512
	.byte	0
	.zero	1
	.value	2617
	.value	2600
	.value	0
	.value	-32768
	.byte	0
	.zero	1
	.value	2864
	.value	2857
	.value	0
	.value	-32512
	.byte	0
	.zero	1
	.value	3117
	.value	3167
	.value	3103
	.value	-32256
	.byte	0
	.zero	1
	.value	3389
	.value	3371
	.value	0
	.value	-32000
	.byte	0
	.zero	1
	.value	3592
	.value	3592
	.value	3711
	.value	0
	.byte	0
	.zero	1
	.value	3849
	.value	3840
	.value	0
	.value	0
	.byte	0
	.zero	1
	.value	4209
	.value	4177
	.value	4113
	.value	4096
	.byte	64
	.zero	1
	.value	4471
	.value	4439
	.value	4375
	.value	4352
	.byte	64
	.zero	1
	.value	4709
	.value	4677
	.value	4613
	.value	4608
	.byte	64
	.zero	1
	.value	4978
	.value	4946
	.value	4882
	.value	4864
	.byte	64
	.zero	1
	.value	5236
	.value	5204
	.value	5140
	.value	5120
	.byte	64
	.zero	1
	.value	5497
	.value	5465
	.value	5401
	.value	5376
	.byte	64
	.zero	1
	.value	5749
	.value	5717
	.value	5653
	.value	5632
	.byte	64
	.zero	1
	.value	5993
	.value	5961
	.value	5897
	.value	5888
	.byte	64
	.zero	1
	.value	6255
	.value	6223
	.value	6159
	.value	6144
	.byte	64
	.zero	1
	.value	6512
	.value	6480
	.value	6416
	.value	6400
	.byte	64
	.zero	1
	.value	6747
	.value	6779
	.value	6683
	.value	0
	.byte	0
	.zero	1
	.value	7005
	.value	7037
	.value	6941
	.value	0
	.byte	0
	.zero	1
	.value	7181
	.value	7181
	.value	7178
	.value	0
	.byte	0
	.zero	1
	.value	0
	.value	0
	.value	0
	.value	0
	.byte	0
	.zero	1
	.value	7777
	.value	7745
	.value	7681
	.value	7680
	.byte	64
	.zero	1
	.value	8051
	.value	8019
	.value	7955
	.value	7936
	.byte	64
	.zero	1
	.value	8292
	.value	8260
	.value	8196
	.value	8192
	.byte	64
	.zero	1
	.value	8550
	.value	8518
	.value	8454
	.value	8448
	.byte	64
	.zero	1
	.value	8807
	.value	8775
	.value	8711
	.value	8704
	.byte	64
	.zero	1
	.value	9064
	.value	9032
	.value	8968
	.value	8960
	.byte	64
	.zero	1
	.value	9322
	.value	9290
	.value	9226
	.value	9216
	.byte	64
	.zero	1
	.value	9579
	.value	9547
	.value	9483
	.value	9472
	.byte	64
	.zero	1
	.value	9836
	.value	9804
	.value	9740
	.value	9728
	.byte	64
	.zero	1
	.value	10043
	.value	10042
	.value	0
	.value	0
	.byte	0
	.zero	1
	.value	10279
	.value	10274
	.value	0
	.value	0
	.byte	0
	.zero	1
	.value	10592
	.value	10622
	.value	0
	.value	0
	.byte	0
	.zero	1
	.value	0
	.value	0
	.value	0
	.value	0
	.byte	0
	.zero	1
	.value	11100
	.value	11132
	.value	11036
	.value	0
	.byte	0
	.zero	1
	.value	11386
	.value	11354
	.value	11290
	.value	11264
	.byte	64
	.zero	1
	.value	11640
	.value	11608
	.value	11544
	.value	11520
	.byte	64
	.zero	1
	.value	11875
	.value	11843
	.value	11779
	.value	11776
	.byte	64
	.zero	1
	.value	12150
	.value	12118
	.value	12054
	.value	12032
	.byte	64
	.zero	1
	.value	12386
	.value	12354
	.value	12290
	.value	12288
	.byte	64
	.zero	1
	.value	12654
	.value	12622
	.value	12558
	.value	12544
	.byte	64
	.zero	1
	.value	12909
	.value	12877
	.value	12813
	.value	12800
	.byte	64
	.zero	1
	.value	13100
	.value	13116
	.value	0
	.value	0
	.byte	0
	.zero	1
	.value	13358
	.value	13374
	.value	0
	.value	0
	.byte	0
	.zero	1
	.value	13615
	.value	13631
	.value	0
	.value	0
	.byte	0
	.zero	1
	.value	0
	.value	0
	.value	0
	.value	0
	.byte	0
	.zero	1
	.value	14122
	.value	14122
	.value	0
	.value	0
	.byte	0
	.zero	1
	.value	0
	.value	0
	.value	0
	.value	0
	.byte	0
	.zero	1
	.value	14624
	.value	14624
	.value	14624
	.value	14624
	.byte	0
	.zero	1
	.value	0
	.value	0
	.value	0
	.value	0
	.byte	0
	.zero	1
	.value	15104
	.value	21504
	.value	24064
	.value	26624
	.byte	0
	.zero	1
	.value	15360
	.value	21760
	.value	24320
	.value	26880
	.byte	0
	.zero	1
	.value	15616
	.value	22016
	.value	24576
	.value	27136
	.byte	0
	.zero	1
	.value	15872
	.value	22272
	.value	24832
	.value	27392
	.byte	0
	.zero	1
	.value	16128
	.value	22528
	.value	25088
	.value	27648
	.byte	0
	.zero	1
	.value	16384
	.value	22784
	.value	25344
	.value	27904
	.byte	0
	.zero	1
	.value	16640
	.value	23040
	.value	25600
	.value	28160
	.byte	0
	.zero	1
	.value	16896
	.value	23296
	.value	25856
	.value	28416
	.byte	0
	.zero	1
	.value	17152
	.value	23552
	.value	26112
	.value	28672
	.byte	0
	.zero	1
	.value	17408
	.value	23808
	.value	26368
	.value	28928
	.byte	0
	.zero	1
	.value	0
	.value	0
	.value	0
	.value	0
	.byte	0
	.zero	1
	.value	0
	.value	0
	.value	0
	.value	0
	.byte	0
	.zero	1
	.value	18176
	.value	18231
	.value	30464
	.value	0
	.byte	32
	.zero	1
	.value	18432
	.value	18488
	.value	0
	.value	0
	.byte	32
	.zero	1
	.value	18688
	.value	18745
	.value	-31744
	.value	0
	.byte	32
	.zero	1
	.value	18989
	.value	18989
	.value	0
	.value	0
	.byte	0
	.zero	1
	.value	19200
	.value	19252
	.value	29440
	.value	0
	.byte	32
	.zero	1
	.value	19456
	.value	19509
	.value	0
	.value	0
	.byte	32
	.zero	1
	.value	19712
	.value	19766
	.value	29696
	.value	0
	.byte	32
	.zero	1
	.value	20011
	.value	20011
	.value	0
	.value	0
	.byte	0
	.zero	1
	.value	20224
	.value	20273
	.value	29952
	.value	0
	.byte	32
	.zero	1
	.value	20480
	.value	20530
	.value	0
	.value	0
	.byte	32
	.zero	1
	.value	20736
	.value	20787
	.value	30208
	.value	0
	.byte	32
	.zero	1
	.value	20992
	.value	21040
	.value	0
	.value	0
	.byte	32
	.zero	1
	.value	21248
	.value	21294
	.value	0
	.value	0
	.byte	32
	.zero	1
	.value	0
	.value	0
	.value	0
	.value	0
	.byte	0
	.zero	1
	.value	0
	.value	0
	.value	0
	.value	0
	.byte	0
	.zero	1
	.value	22108
	.value	22140
	.value	0
	.value	0
	.byte	0
	.zero	1
	.value	-31488
	.value	-30976
	.value	-30464
	.value	-29952
	.byte	0
	.zero	1
	.value	-31232
	.value	-30720
	.value	-30208
	.value	-29696
	.byte	0
	.zero	1
	.section	.rodata.__func__.42510,"a",@progbits
	.align 4
	.type	__func__.42510, @object
	.size	__func__.42510, 17
__func__.42510:
	.string	"i8042_wait_write"
	.section	.rodata.__func__.42613,"a",@progbits
	.align 4
	.type	__func__.42613, @object
	.size	__func__.42613, 13
__func__.42613:
	.string	"ps2_recvbyte"
	.section	.rodata.__func__.42492,"a",@progbits
	.align 4
	.type	__func__.42492, @object
	.size	__func__.42492, 16
__func__.42492:
	.string	"i8042_wait_read"
.globl PNPHEADER
	.section	.data16.export.src/pnpbios.c.31,"aw",@progbits
	.align 16
	.type	PNPHEADER, @object
	.size	PNPHEADER, 33
PNPHEADER:
	.long	1349406756
	.byte	16
	.byte	33
	.zero	9
	.value	-4096
	.zero	2
	.long	983040
	.zero	4
	.value	-4096
	.long	983040
.globl PIR_TABLE
	.section	.data16.export.src/pirtable.c.21,"aw",@progbits
	.align 16
	.type	PIR_TABLE, @object
	.size	PIR_TABLE, 128
PIR_TABLE:
	.zero	4
	.value	256
	.value	128
	.zero	1
	.byte	8
	.zero	2
	.long	305037446
	.zero	16
	.zero	1
	.byte	8
	.byte	96
	.value	-8456
	.byte	97
	.value	-8456
	.byte	98
	.value	-8456
	.byte	99
	.value	-8456
	.byte	0
	.zero	1
	.zero	1
	.byte	16
	.byte	97
	.value	-8456
	.byte	98
	.value	-8456
	.byte	99
	.value	-8456
	.byte	96
	.value	-8456
	.byte	1
	.zero	1
	.zero	1
	.byte	24
	.byte	98
	.value	-8456
	.byte	99
	.value	-8456
	.byte	96
	.value	-8456
	.byte	97
	.value	-8456
	.byte	2
	.zero	1
	.zero	1
	.byte	32
	.byte	99
	.value	-8456
	.byte	96
	.value	-8456
	.byte	97
	.value	-8456
	.byte	98
	.value	-8456
	.byte	3
	.zero	1
	.zero	1
	.byte	40
	.byte	96
	.value	-8456
	.byte	97
	.value	-8456
	.byte	98
	.value	-8456
	.byte	99
	.value	-8456
	.byte	4
	.zero	1
	.zero	1
	.byte	48
	.byte	97
	.value	-8456
	.byte	98
	.value	-8456
	.byte	99
	.value	-8456
	.byte	96
	.value	-8456
	.byte	5
	.zero	1
.globl BIOS32HEADER
	.section	.data16.export.src/pcibios.c.222,"aw",@progbits
	.align 16
	.type	BIOS32HEADER, @object
	.size	BIOS32HEADER, 16
BIOS32HEADER:
	.long	1597125471
	.zero	5
	.byte	1
	.zero	6
	.section	.rodata.__func__.64064,"a",@progbits
	.align 4
	.type	__func__.64064, @object
	.size	__func__.64064, 8
__func__.64064:
	.string	"wait_td"
	.section	.rodata.__func__.63839,"a",@progbits
	.align 4
	.type	__func__.63839, @object
	.size	__func__.63839, 14
__func__.63839:
	.string	"uhci_waittick"
	.section	.rodata.__func__.63738,"a",@progbits
	.align 4
	.type	__func__.63738, @object
	.size	__func__.63738, 15
__func__.63738:
	.string	"configure_uhci"
	.section	.rodata.__func__.66664,"a",@progbits
	.align 4
	.type	__func__.66664, @object
	.size	__func__.66664, 15
__func__.66664:
	.string	"configure_ohci"
	.section	.rodata.__func__.66618,"a",@progbits
	.align 4
	.type	__func__.66618, @object
	.size	__func__.66618, 11
__func__.66618:
	.string	"start_ohci"
	.section	.rodata.__func__.69725,"a",@progbits
	.align 4
	.type	__func__.69725, @object
	.size	__func__.69725, 13
__func__.69725:
	.string	"ehci_wait_td"
	.section	.rodata.__func__.69351,"a",@progbits
	.align 4
	.type	__func__.69351, @object
	.size	__func__.69351, 15
__func__.69351:
	.string	"configure_ehci"
	.section	.data16.src/usb-hid.c.112,"aw",@progbits
	.align 4
	.type	ModifierToScanCode.72627, @object
	.size	ModifierToScanCode.72627, 16
ModifierToScanCode.72627:
	.value	29
	.value	42
	.value	56
	.value	-8101
	.value	-8163
	.value	54
	.value	-8136
	.value	-8100
	.section	.data16.src/usb-hid.c.96,"aw",@progbits
	.align 4
	.type	KeyToScanCode.72626, @object
	.size	KeyToScanCode.72626, 200
KeyToScanCode.72626:
	.value	0
	.value	0
	.value	0
	.value	0
	.value	30
	.value	48
	.value	46
	.value	32
	.value	18
	.value	33
	.value	34
	.value	35
	.value	23
	.value	36
	.value	37
	.value	38
	.value	50
	.value	49
	.value	24
	.value	25
	.value	16
	.value	19
	.value	31
	.value	20
	.value	22
	.value	47
	.value	17
	.value	45
	.value	21
	.value	44
	.value	2
	.value	3
	.value	4
	.value	5
	.value	6
	.value	7
	.value	8
	.value	9
	.value	10
	.value	11
	.value	28
	.value	1
	.value	14
	.value	15
	.value	57
	.value	12
	.value	13
	.value	26
	.value	27
	.value	43
	.value	0
	.value	39
	.value	40
	.value	41
	.value	51
	.value	52
	.value	53
	.value	58
	.value	59
	.value	60
	.value	61
	.value	62
	.value	63
	.value	64
	.value	65
	.value	66
	.value	67
	.value	68
	.value	87
	.value	88
	.value	-8137
	.value	70
	.value	-7907
	.value	-8110
	.value	-8121
	.value	-8119
	.value	-8109
	.value	-8113
	.value	-8111
	.value	-8115
	.value	-8117
	.value	-8112
	.value	-8120
	.value	69
	.value	-8139
	.value	55
	.value	74
	.value	78
	.value	-8164
	.value	79
	.value	80
	.value	81
	.value	75
	.value	76
	.value	77
	.value	71
	.value	72
	.value	73
	.value	82
	.value	83
	.section	.rodata.__func__.80340,"a",@progbits
	.align 4
	.type	__func__.80340, @object
	.size	__func__.80340, 10
__func__.80340:
	.string	"disk_1305"
	.section	.rodata.__func__.82485,"a",@progbits
	.align 4
	.type	__func__.82485, @object
	.size	__func__.82485, 10
__func__.82485:
	.string	"handle_40"
.globl vgafont8
	.section	.fixedaddr.0xfa6e,"aw",@progbits
	.type	vgafont8, @object
	.size	vgafont8, 1024
vgafont8:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	126
	.byte	-127
	.byte	-91
	.byte	-127
	.byte	-67
	.byte	-103
	.byte	-127
	.byte	126
	.byte	126
	.byte	-1
	.byte	-37
	.byte	-1
	.byte	-61
	.byte	-25
	.byte	-1
	.byte	126
	.byte	108
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	124
	.byte	56
	.byte	16
	.byte	0
	.byte	16
	.byte	56
	.byte	124
	.byte	-2
	.byte	124
	.byte	56
	.byte	16
	.byte	0
	.byte	56
	.byte	124
	.byte	56
	.byte	-2
	.byte	-2
	.byte	124
	.byte	56
	.byte	124
	.byte	16
	.byte	16
	.byte	56
	.byte	124
	.byte	-2
	.byte	124
	.byte	56
	.byte	124
	.byte	0
	.byte	0
	.byte	24
	.byte	60
	.byte	60
	.byte	24
	.byte	0
	.byte	0
	.byte	-1
	.byte	-1
	.byte	-25
	.byte	-61
	.byte	-61
	.byte	-25
	.byte	-1
	.byte	-1
	.byte	0
	.byte	60
	.byte	102
	.byte	66
	.byte	66
	.byte	102
	.byte	60
	.byte	0
	.byte	-1
	.byte	-61
	.byte	-103
	.byte	-67
	.byte	-67
	.byte	-103
	.byte	-61
	.byte	-1
	.byte	15
	.byte	7
	.byte	15
	.byte	125
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	120
	.byte	60
	.byte	102
	.byte	102
	.byte	102
	.byte	60
	.byte	24
	.byte	126
	.byte	24
	.byte	63
	.byte	51
	.byte	63
	.byte	48
	.byte	48
	.byte	112
	.byte	-16
	.byte	-32
	.byte	127
	.byte	99
	.byte	127
	.byte	99
	.byte	99
	.byte	103
	.byte	-26
	.byte	-64
	.byte	-103
	.byte	90
	.byte	60
	.byte	-25
	.byte	-25
	.byte	60
	.byte	90
	.byte	-103
	.byte	-128
	.byte	-32
	.byte	-8
	.byte	-2
	.byte	-8
	.byte	-32
	.byte	-128
	.byte	0
	.byte	2
	.byte	14
	.byte	62
	.byte	-2
	.byte	62
	.byte	14
	.byte	2
	.byte	0
	.byte	24
	.byte	60
	.byte	126
	.byte	24
	.byte	24
	.byte	126
	.byte	60
	.byte	24
	.byte	102
	.byte	102
	.byte	102
	.byte	102
	.byte	102
	.byte	0
	.byte	102
	.byte	0
	.byte	127
	.byte	-37
	.byte	-37
	.byte	123
	.byte	27
	.byte	27
	.byte	27
	.byte	0
	.byte	62
	.byte	99
	.byte	56
	.byte	108
	.byte	108
	.byte	56
	.byte	-52
	.byte	120
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	126
	.byte	126
	.byte	126
	.byte	0
	.byte	24
	.byte	60
	.byte	126
	.byte	24
	.byte	126
	.byte	60
	.byte	24
	.byte	-1
	.byte	24
	.byte	60
	.byte	126
	.byte	24
	.byte	24
	.byte	24
	.byte	24
	.byte	0
	.byte	24
	.byte	24
	.byte	24
	.byte	24
	.byte	126
	.byte	60
	.byte	24
	.byte	0
	.byte	0
	.byte	24
	.byte	12
	.byte	-2
	.byte	12
	.byte	24
	.byte	0
	.byte	0
	.byte	0
	.byte	48
	.byte	96
	.byte	-2
	.byte	96
	.byte	48
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	-64
	.byte	-64
	.byte	-64
	.byte	-2
	.byte	0
	.byte	0
	.byte	0
	.byte	36
	.byte	102
	.byte	-1
	.byte	102
	.byte	36
	.byte	0
	.byte	0
	.byte	0
	.byte	24
	.byte	60
	.byte	126
	.byte	-1
	.byte	-1
	.byte	0
	.byte	0
	.byte	0
	.byte	-1
	.byte	-1
	.byte	126
	.byte	60
	.byte	24
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	48
	.byte	120
	.byte	120
	.byte	48
	.byte	48
	.byte	0
	.byte	48
	.byte	0
	.byte	108
	.byte	108
	.byte	108
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	108
	.byte	108
	.byte	-2
	.byte	108
	.byte	-2
	.byte	108
	.byte	108
	.byte	0
	.byte	48
	.byte	124
	.byte	-64
	.byte	120
	.byte	12
	.byte	-8
	.byte	48
	.byte	0
	.byte	0
	.byte	-58
	.byte	-52
	.byte	24
	.byte	48
	.byte	102
	.byte	-58
	.byte	0
	.byte	56
	.byte	108
	.byte	56
	.byte	118
	.byte	-36
	.byte	-52
	.byte	118
	.byte	0
	.byte	96
	.byte	96
	.byte	-64
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	24
	.byte	48
	.byte	96
	.byte	96
	.byte	96
	.byte	48
	.byte	24
	.byte	0
	.byte	96
	.byte	48
	.byte	24
	.byte	24
	.byte	24
	.byte	48
	.byte	96
	.byte	0
	.byte	0
	.byte	102
	.byte	60
	.byte	-1
	.byte	60
	.byte	102
	.byte	0
	.byte	0
	.byte	0
	.byte	48
	.byte	48
	.byte	-4
	.byte	48
	.byte	48
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	48
	.byte	48
	.byte	96
	.byte	0
	.byte	0
	.byte	0
	.byte	-4
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	48
	.byte	48
	.byte	0
	.byte	6
	.byte	12
	.byte	24
	.byte	48
	.byte	96
	.byte	-64
	.byte	-128
	.byte	0
	.byte	124
	.byte	-58
	.byte	-50
	.byte	-34
	.byte	-10
	.byte	-26
	.byte	124
	.byte	0
	.byte	48
	.byte	112
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	-4
	.byte	0
	.byte	120
	.byte	-52
	.byte	12
	.byte	56
	.byte	96
	.byte	-52
	.byte	-4
	.byte	0
	.byte	120
	.byte	-52
	.byte	12
	.byte	56
	.byte	12
	.byte	-52
	.byte	120
	.byte	0
	.byte	28
	.byte	60
	.byte	108
	.byte	-52
	.byte	-2
	.byte	12
	.byte	30
	.byte	0
	.byte	-4
	.byte	-64
	.byte	-8
	.byte	12
	.byte	12
	.byte	-52
	.byte	120
	.byte	0
	.byte	56
	.byte	96
	.byte	-64
	.byte	-8
	.byte	-52
	.byte	-52
	.byte	120
	.byte	0
	.byte	-4
	.byte	-52
	.byte	12
	.byte	24
	.byte	48
	.byte	48
	.byte	48
	.byte	0
	.byte	120
	.byte	-52
	.byte	-52
	.byte	120
	.byte	-52
	.byte	-52
	.byte	120
	.byte	0
	.byte	120
	.byte	-52
	.byte	-52
	.byte	124
	.byte	12
	.byte	24
	.byte	112
	.byte	0
	.byte	0
	.byte	48
	.byte	48
	.byte	0
	.byte	0
	.byte	48
	.byte	48
	.byte	0
	.byte	0
	.byte	48
	.byte	48
	.byte	0
	.byte	0
	.byte	48
	.byte	48
	.byte	96
	.byte	24
	.byte	48
	.byte	96
	.byte	-64
	.byte	96
	.byte	48
	.byte	24
	.byte	0
	.byte	0
	.byte	0
	.byte	-4
	.byte	0
	.byte	0
	.byte	-4
	.byte	0
	.byte	0
	.byte	96
	.byte	48
	.byte	24
	.byte	12
	.byte	24
	.byte	48
	.byte	96
	.byte	0
	.byte	120
	.byte	-52
	.byte	12
	.byte	24
	.byte	48
	.byte	0
	.byte	48
	.byte	0
	.byte	124
	.byte	-58
	.byte	-34
	.byte	-34
	.byte	-34
	.byte	-64
	.byte	120
	.byte	0
	.byte	48
	.byte	120
	.byte	-52
	.byte	-52
	.byte	-4
	.byte	-52
	.byte	-52
	.byte	0
	.byte	-4
	.byte	102
	.byte	102
	.byte	124
	.byte	102
	.byte	102
	.byte	-4
	.byte	0
	.byte	60
	.byte	102
	.byte	-64
	.byte	-64
	.byte	-64
	.byte	102
	.byte	60
	.byte	0
	.byte	-8
	.byte	108
	.byte	102
	.byte	102
	.byte	102
	.byte	108
	.byte	-8
	.byte	0
	.byte	-2
	.byte	98
	.byte	104
	.byte	120
	.byte	104
	.byte	98
	.byte	-2
	.byte	0
	.byte	-2
	.byte	98
	.byte	104
	.byte	120
	.byte	104
	.byte	96
	.byte	-16
	.byte	0
	.byte	60
	.byte	102
	.byte	-64
	.byte	-64
	.byte	-50
	.byte	102
	.byte	62
	.byte	0
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	-4
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	0
	.byte	120
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	120
	.byte	0
	.byte	30
	.byte	12
	.byte	12
	.byte	12
	.byte	-52
	.byte	-52
	.byte	120
	.byte	0
	.byte	-26
	.byte	102
	.byte	108
	.byte	120
	.byte	108
	.byte	102
	.byte	-26
	.byte	0
	.byte	-16
	.byte	96
	.byte	96
	.byte	96
	.byte	98
	.byte	102
	.byte	-2
	.byte	0
	.byte	-58
	.byte	-18
	.byte	-2
	.byte	-2
	.byte	-42
	.byte	-58
	.byte	-58
	.byte	0
	.byte	-58
	.byte	-26
	.byte	-10
	.byte	-34
	.byte	-50
	.byte	-58
	.byte	-58
	.byte	0
	.byte	56
	.byte	108
	.byte	-58
	.byte	-58
	.byte	-58
	.byte	108
	.byte	56
	.byte	0
	.byte	-4
	.byte	102
	.byte	102
	.byte	124
	.byte	96
	.byte	96
	.byte	-16
	.byte	0
	.byte	120
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	-36
	.byte	120
	.byte	28
	.byte	0
	.byte	-4
	.byte	102
	.byte	102
	.byte	124
	.byte	108
	.byte	102
	.byte	-26
	.byte	0
	.byte	120
	.byte	-52
	.byte	-32
	.byte	112
	.byte	28
	.byte	-52
	.byte	120
	.byte	0
	.byte	-4
	.byte	-76
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	120
	.byte	0
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	-4
	.byte	0
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	120
	.byte	48
	.byte	0
	.byte	-58
	.byte	-58
	.byte	-58
	.byte	-42
	.byte	-2
	.byte	-18
	.byte	-58
	.byte	0
	.byte	-58
	.byte	-58
	.byte	108
	.byte	56
	.byte	56
	.byte	108
	.byte	-58
	.byte	0
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	120
	.byte	48
	.byte	48
	.byte	120
	.byte	0
	.byte	-2
	.byte	-58
	.byte	-116
	.byte	24
	.byte	50
	.byte	102
	.byte	-2
	.byte	0
	.byte	120
	.byte	96
	.byte	96
	.byte	96
	.byte	96
	.byte	96
	.byte	120
	.byte	0
	.byte	-64
	.byte	96
	.byte	48
	.byte	24
	.byte	12
	.byte	6
	.byte	2
	.byte	0
	.byte	120
	.byte	24
	.byte	24
	.byte	24
	.byte	24
	.byte	24
	.byte	120
	.byte	0
	.byte	16
	.byte	56
	.byte	108
	.byte	-58
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	-1
	.byte	48
	.byte	48
	.byte	24
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	120
	.byte	12
	.byte	124
	.byte	-52
	.byte	118
	.byte	0
	.byte	-32
	.byte	96
	.byte	96
	.byte	124
	.byte	102
	.byte	102
	.byte	-36
	.byte	0
	.byte	0
	.byte	0
	.byte	120
	.byte	-52
	.byte	-64
	.byte	-52
	.byte	120
	.byte	0
	.byte	28
	.byte	12
	.byte	12
	.byte	124
	.byte	-52
	.byte	-52
	.byte	118
	.byte	0
	.byte	0
	.byte	0
	.byte	120
	.byte	-52
	.byte	-4
	.byte	-64
	.byte	120
	.byte	0
	.byte	56
	.byte	108
	.byte	96
	.byte	-16
	.byte	96
	.byte	96
	.byte	-16
	.byte	0
	.byte	0
	.byte	0
	.byte	118
	.byte	-52
	.byte	-52
	.byte	124
	.byte	12
	.byte	-8
	.byte	-32
	.byte	96
	.byte	108
	.byte	118
	.byte	102
	.byte	102
	.byte	-26
	.byte	0
	.byte	48
	.byte	0
	.byte	112
	.byte	48
	.byte	48
	.byte	48
	.byte	120
	.byte	0
	.byte	12
	.byte	0
	.byte	12
	.byte	12
	.byte	12
	.byte	-52
	.byte	-52
	.byte	120
	.byte	-32
	.byte	96
	.byte	102
	.byte	108
	.byte	120
	.byte	108
	.byte	-26
	.byte	0
	.byte	112
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	120
	.byte	0
	.byte	0
	.byte	0
	.byte	-52
	.byte	-2
	.byte	-2
	.byte	-42
	.byte	-58
	.byte	0
	.byte	0
	.byte	0
	.byte	-8
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	0
	.byte	0
	.byte	0
	.byte	120
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	120
	.byte	0
	.byte	0
	.byte	0
	.byte	-36
	.byte	102
	.byte	102
	.byte	124
	.byte	96
	.byte	-16
	.byte	0
	.byte	0
	.byte	118
	.byte	-52
	.byte	-52
	.byte	124
	.byte	12
	.byte	30
	.byte	0
	.byte	0
	.byte	-36
	.byte	118
	.byte	102
	.byte	96
	.byte	-16
	.byte	0
	.byte	0
	.byte	0
	.byte	124
	.byte	-64
	.byte	120
	.byte	12
	.byte	-8
	.byte	0
	.byte	16
	.byte	48
	.byte	124
	.byte	48
	.byte	48
	.byte	52
	.byte	24
	.byte	0
	.byte	0
	.byte	0
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	118
	.byte	0
	.byte	0
	.byte	0
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	120
	.byte	48
	.byte	0
	.byte	0
	.byte	0
	.byte	-58
	.byte	-42
	.byte	-2
	.byte	-2
	.byte	108
	.byte	0
	.byte	0
	.byte	0
	.byte	-58
	.byte	108
	.byte	56
	.byte	108
	.byte	-58
	.byte	0
	.byte	0
	.byte	0
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	124
	.byte	12
	.byte	-8
	.byte	0
	.byte	0
	.byte	-4
	.byte	-104
	.byte	48
	.byte	100
	.byte	-4
	.byte	0
	.byte	28
	.byte	48
	.byte	48
	.byte	-32
	.byte	48
	.byte	48
	.byte	28
	.byte	0
	.byte	24
	.byte	24
	.byte	24
	.byte	0
	.byte	24
	.byte	24
	.byte	24
	.byte	0
	.byte	-32
	.byte	48
	.byte	48
	.byte	28
	.byte	48
	.byte	48
	.byte	-32
	.byte	0
	.byte	118
	.byte	-36
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	16
	.byte	56
	.byte	108
	.byte	-58
	.byte	-58
	.byte	-2
	.byte	0
.globl Drives
	.section	.data16.src/block.c.15,"aw",@progbits
	.align 4
	.type	Drives, @object
	.size	Drives, 196
Drives:
	.zero	196
.globl cdemu_drive_gf
	.section	.data16.src/cdrom.c.109,"aw",@progbits
	.align 4
	.type	cdemu_drive_gf, @object
	.size	cdemu_drive_gf, 4
cdemu_drive_gf:
	.zero	4
.globl MainThread
	.section	.data16.src/stacks.c.127,"aw",@progbits
	.align 4
	.type	MainThread, @object
	.size	MainThread, -1
MainThread:
	.zero	12
.globl RamSize
	.section	.data16.src/misc.c.14,"aw",@progbits
	.align 4
	.type	RamSize, @object
	.size	RamSize, 4
RamSize:
	.zero	4
.globl CountCPUs
	.section	.data16.src/smp.c.35,"aw",@progbits
	.align 4
	.type	CountCPUs, @object
	.size	CountCPUs, 4
CountCPUs:
	.zero	4
.globl MaxCountCPUs
	.section	.data16.src/smp.c.36,"aw",@progbits
	.align 4
	.type	MaxCountCPUs, @object
	.size	MaxCountCPUs, 4
MaxCountCPUs:
	.zero	4
.globl VGAbdf
	.section	.data16.src/vgahooks.c.16,"aw",@progbits
	.align 4
	.type	VGAbdf, @object
	.size	VGAbdf, 4
VGAbdf:
	.zero	4
	.weak	ZoneLow
	.section	.discard.var32flat.src/pmm.c.34,"aw",@progbits
	.align 4
	.type	ZoneLow, @object
	.size	ZoneLow, -1
ZoneLow:
	.zero	12
	.weak	ZoneHigh
	.align 4
	.type	ZoneHigh, @object
	.size	ZoneHigh, -1
ZoneHigh:
	.zero	12
	.weak	ZoneFSeg
	.section	.discard.var32flat.src/pmm.c.35,"aw",@progbits
	.align 4
	.type	ZoneFSeg, @object
	.size	ZoneFSeg, -1
ZoneFSeg:
	.zero	12
	.weak	ZoneTmpLow
	.section	.discard.var32flat.src/pmm.c.36,"aw",@progbits
	.align 4
	.type	ZoneTmpLow, @object
	.size	ZoneTmpLow, -1
ZoneTmpLow:
	.zero	12
	.weak	ZoneTmpHigh
	.align 4
	.type	ZoneTmpHigh, @object
	.size	ZoneTmpHigh, -1
ZoneTmpHigh:
	.zero	12
.globl BiosChecksum
	.section	.fixedaddr.0xffff,"aw",@progbits
	.type	BiosChecksum, @object
	.size	BiosChecksum, 1
BiosChecksum:
	.zero	1
.globl BiosTableSpace
	.section	.data16.src/misc.c.18,"aw",@progbits
	.align 16
	.type	BiosTableSpace, @object
	.size	BiosTableSpace, 8192
BiosTableSpace:
	.zero	8192
.globl dummy_IDT
	.section	.data16.src/misc.c.139,"aw",@progbits
	.type	dummy_IDT, @object
	.size	dummy_IDT, 1
dummy_IDT:
	.zero	1
.globl InitVectors
	.section	.fixedaddr.0xfef3,"aw",@progbits
	.type	InitVectors, @object
	.size	InitVectors, 13
InitVectors:
	.zero	13
.globl VideoParams
	.section	.fixedaddr.0xf0a4,"aw",@progbits
	.type	VideoParams, @object
	.size	VideoParams, 88
VideoParams:
	.zero	88
.globl e820_list
	.section	.data16.src/system.c.294,"aw",@progbits
	.align 4
	.type	e820_list, @object
	.size	e820_list, 640
e820_list:
	.zero	640
.globl e820_count
	.section	.data16.src/system.c.295,"aw",@progbits
	.align 4
	.type	e820_count, @object
	.size	e820_count, 4
e820_count:
	.zero	4
	.weak	PMMAllocs
	.section	.discard.var32flat.src/pmm.c.186,"aw",@progbits
	.align 4
	.type	PMMAllocs, @object
	.size	PMMAllocs, 4
PMMAllocs:
	.zero	4
.globl CanPreempt
	.section	.data16.src/stacks.c.128,"aw",@progbits
	.align 4
	.type	CanPreempt, @object
	.size	CanPreempt, 4
CanPreempt:
	.zero	4
.globl PirOffset
	.section	.data16.src/pirtable.c.12,"aw",@progbits
	.align 2
	.type	PirOffset, @object
	.size	PirOffset, 2
PirOffset:
	.zero	2
.globl BaudTable
	.section	.fixedaddr.0xe729,"aw",@progbits
	.type	BaudTable, @object
	.size	BaudTable, 16
BaudTable:
	.zero	16
.globl cpu_khz
	.section	.data16.src/clock.c.60,"aw",@progbits
	.align 4
	.type	cpu_khz, @object
	.size	cpu_khz, 4
cpu_khz:
	.zero	4
.globl smp_mtrr
	.section	.data16.src/smp.c.20,"aw",@progbits
	.align 4
	.type	smp_mtrr, @object
	.size	smp_mtrr, 192
smp_mtrr:
	.zero	192
.globl smp_mtrr_count
	.section	.data16.src/smp.c.21,"aw",@progbits
	.align 4
	.type	smp_mtrr_count, @object
	.size	smp_mtrr_count, 4
smp_mtrr_count:
	.zero	4
.globl CBmainboard
	.section	.data16.src/vgahooks.c.18,"aw",@progbits
	.align 4
	.type	CBmainboard, @object
	.size	CBmainboard, 4
CBmainboard:
	.zero	4
.globl keyboard_pipe
	.section	.data16.src/usb-hid.c.13,"aw",@progbits
	.align 4
	.type	keyboard_pipe, @object
	.size	keyboard_pipe, 4
keyboard_pipe:
	.zero	4
.globl OldFDPT
	.section	.fixedaddr.0xe401,"aw",@progbits
	.type	OldFDPT, @object
	.size	OldFDPT, 16
OldFDPT:
	.zero	16
	.text
.Letext0:
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST4:
	.long	.LVL6
	.long	.LVL7
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST5:
	.long	.LFB79
	.long	.LFE79
	.value	0x2
	.byte	0x74
	.sleb128 16
	.long	0x0
	.long	0x0
.LLST6:
	.long	.LVL8
	.long	.LVL12
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST7:
	.long	.LVL9
	.long	.LVL10
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST8:
	.long	.LFB146
	.long	.LFE146
	.value	0x2
	.byte	0x74
	.sleb128 16
	.long	0x0
	.long	0x0
.LLST9:
	.long	.LVL15
	.long	.LVL23
	.value	0x1
	.byte	0x51
	.long	.LVL31
	.long	.LFE146
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST10:
	.long	.LVL14
	.long	.LVL20
	.value	0x1
	.byte	0x53
	.long	.LVL22
	.long	.LVL25
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST11:
	.long	.LVL15
	.long	.LVL17
	.value	0x1
	.byte	0x57
	.long	.LVL18
	.long	.LVL19
	.value	0x1
	.byte	0x57
	.long	.LVL22
	.long	.LVL28
	.value	0x1
	.byte	0x57
	.long	.LVL30
	.long	.LVL33
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST12:
	.long	.LVL15
	.long	.LVL16
	.value	0x1
	.byte	0x57
	.long	.LVL17
	.long	.LVL28
	.value	0x1
	.byte	0x57
	.long	.LVL30
	.long	.LVL33
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST13:
	.long	.LVL21
	.long	.LVL27
	.value	0x1
	.byte	0x56
	.long	.LVL30
	.long	.LVL32
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST14:
	.long	.LVL28
	.long	.LVL29
	.value	0x1
	.byte	0x57
	.long	.LVL31
	.long	.LVL33
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST15:
	.long	.LVL26
	.long	.LVL28
	.value	0x1
	.byte	0x57
	.long	.LVL29
	.long	.LVL33
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST16:
	.long	.LFB147
	.long	.LFE147
	.value	0x2
	.byte	0x74
	.sleb128 16
	.long	0x0
	.long	0x0
.LLST17:
	.long	.LVL34
	.long	.LVL40
	.value	0x1
	.byte	0x50
	.long	.LVL41
	.long	.LVL42
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST18:
	.long	.LVL35
	.long	.LVL40
	.value	0x1
	.byte	0x51
	.long	.LVL41
	.long	.LFE147
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST19:
	.long	.LVL36
	.long	.LVL43
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST20:
	.long	.LVL36
	.long	.LVL45
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST21:
	.long	.LVL37
	.long	.LVL38
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST22:
	.long	.LVL38
	.long	.LVL41
	.value	0x1
	.byte	0x56
	.long	.LVL42
	.long	.LVL44
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST23:
	.long	.LVL39
	.long	.LVL40
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST24:
	.long	.LFB573
	.long	.LFE573
	.value	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
.LLST25:
	.long	.LVL46
	.long	.LVL48
	.value	0x1
	.byte	0x50
	.long	.LVL48
	.long	.LVL63
	.value	0x1
	.byte	0x53
	.long	.LVL65
	.long	.LVL79
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST26:
	.long	.LVL46
	.long	.LVL50
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST27:
	.long	.LVL62
	.long	.LVL66
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST28:
	.long	.LVL47
	.long	.LVL80
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST29:
	.long	.LVL53
	.long	.LVL82
	.value	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
.LLST30:
	.long	.LVL48
	.long	.LVL51
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST31:
	.long	.LVL52
	.long	.LVL81
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST32:
	.long	.LVL55
	.long	.LVL56
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST33:
	.long	.LVL60
	.long	.LVL63
	.value	0x1
	.byte	0x50
	.long	.LVL65
	.long	.LVL68
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST34:
	.long	.LVL58
	.long	.LVL59
	.value	0x1
	.byte	0x50
	.long	.LVL61
	.long	.LVL63
	.value	0x1
	.byte	0x50
	.long	.LVL65
	.long	.LVL68
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST35:
	.long	.LVL57
	.long	.LVL58
	.value	0x1
	.byte	0x50
	.long	.LVL59
	.long	.LVL60
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST36:
	.long	.LVL70
	.long	.LVL71
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST37:
	.long	.LVL68
	.long	.LVL69
	.value	0x1
	.byte	0x50
	.long	.LVL72
	.long	.LVL73
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST38:
	.long	.LVL67
	.long	.LVL68
	.value	0x1
	.byte	0x50
	.long	.LVL69
	.long	.LVL70
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST39:
	.long	.LVL74
	.long	.LVL75
	.value	0x1
	.byte	0x51
	.long	.LVL76
	.long	.LFE573
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST40:
	.long	.LVL77
	.long	.LVL78
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST41:
	.long	.LFB574
	.long	.LFE574
	.value	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
.LLST42:
	.long	.LVL83
	.long	.LVL89
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST43:
	.long	.LVL83
	.long	.LVL87
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST44:
	.long	.LVL83
	.long	.LVL84
	.value	0x1
	.byte	0x51
	.long	.LVL84
	.long	.LVL103
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST45:
	.long	.LVL83
	.long	.LVL93
	.value	0x2
	.byte	0x91
	.sleb128 0
	.long	.LVL93
	.long	.LVL94
	.value	0x1
	.byte	0x52
	.long	.LVL101
	.long	.LFE574
	.value	0x2
	.byte	0x91
	.sleb128 0
	.long	0x0
	.long	0x0
.LLST46:
	.long	.LVL85
	.long	.LVL90
	.value	0x1
	.byte	0x51
	.long	.LVL91
	.long	.LVL94
	.value	0x1
	.byte	0x51
	.long	.LVL101
	.long	.LVL102
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST47:
	.long	.LVL86
	.long	.LVL87
	.value	0x1
	.byte	0x56
	.long	.LVL87
	.long	.LVL88
	.value	0x1
	.byte	0x52
	.long	.LVL92
	.long	.LVL99
	.value	0x1
	.byte	0x56
	.long	.LVL101
	.long	.LVL104
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST48:
	.long	.LVL95
	.long	.LVL96
	.value	0x1
	.byte	0x52
	.long	.LVL101
	.long	.LFE574
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST49:
	.long	.LVL97
	.long	.LVL98
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST50:
	.long	.LVL100
	.long	.LVL101
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST51:
	.long	.LFB578
	.long	.LFE578
	.value	0x2
	.byte	0x74
	.sleb128 28
	.long	0x0
	.long	0x0
.LLST52:
	.long	.LVL105
	.long	.LVL106
	.value	0x1
	.byte	0x50
	.long	.LVL106
	.long	.LVL124
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST53:
	.long	.LVL108
	.long	.LVL111
	.value	0x1
	.byte	0x50
	.long	.LVL122
	.long	.LVL123
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST54:
	.long	.LVL106
	.long	.LVL111
	.value	0x1
	.byte	0x50
	.long	.LVL122
	.long	.LVL123
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST55:
	.long	.LVL107
	.long	.LVL113
	.value	0x1
	.byte	0x51
	.long	.LVL122
	.long	.LFE578
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST56:
	.long	.LVL110
	.long	.LVL112
	.value	0x1
	.byte	0x52
	.long	.LVL122
	.long	.LFE578
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST57:
	.long	.LVL114
	.long	.LVL116
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST58:
	.long	.LVL117
	.long	.LVL118
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST59:
	.long	.LVL119
	.long	.LVL120
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST60:
	.long	.LFB579
	.long	.LFE579
	.value	0x2
	.byte	0x74
	.sleb128 16
	.long	0x0
	.long	0x0
.LLST61:
	.long	.LVL125
	.long	.LVL126
	.value	0x1
	.byte	0x50
	.long	.LVL126
	.long	.LVL135
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST62:
	.long	.LVL125
	.long	.LVL128
	.value	0x1
	.byte	0x52
	.long	.LVL128
	.long	.LVL136
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST63:
	.long	.LVL125
	.long	.LVL134
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST64:
	.long	.LVL127
	.long	.LVL131
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST65:
	.long	.LVL129
	.long	.LVL130
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST66:
	.long	.LVL132
	.long	.LVL133
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST67:
	.long	.LFB585
	.long	.LFE585
	.value	0x2
	.byte	0x74
	.sleb128 32
	.long	0x0
	.long	0x0
.LLST68:
	.long	.LVL137
	.long	.LVL138
	.value	0x1
	.byte	0x50
	.long	.LVL138
	.long	.LVL192
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST69:
	.long	.LVL139
	.long	.LVL140
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST70:
	.long	.LVL149
	.long	.LVL156
	.value	0x2
	.byte	0x91
	.sleb128 -19
	.long	.LVL170
	.long	.LVL171
	.value	0x2
	.byte	0x91
	.sleb128 -19
	.long	.LVL178
	.long	.LVL179
	.value	0x2
	.byte	0x91
	.sleb128 -19
	.long	.LVL190
	.long	.LFE585
	.value	0x2
	.byte	0x91
	.sleb128 -19
	.long	0x0
	.long	0x0
.LLST71:
	.long	.LVL150
	.long	.LVL156
	.value	0x2
	.byte	0x91
	.sleb128 -18
	.long	.LVL170
	.long	.LVL171
	.value	0x2
	.byte	0x91
	.sleb128 -18
	.long	.LVL178
	.long	.LVL179
	.value	0x2
	.byte	0x91
	.sleb128 -18
	.long	.LVL190
	.long	.LFE585
	.value	0x2
	.byte	0x91
	.sleb128 -18
	.long	0x0
	.long	0x0
.LLST72:
	.long	.LVL147
	.long	.LVL156
	.value	0x2
	.byte	0x91
	.sleb128 -17
	.long	.LVL170
	.long	.LVL171
	.value	0x2
	.byte	0x91
	.sleb128 -17
	.long	.LVL178
	.long	.LVL179
	.value	0x2
	.byte	0x91
	.sleb128 -17
	.long	.LVL190
	.long	.LFE585
	.value	0x2
	.byte	0x91
	.sleb128 -17
	.long	0x0
	.long	0x0
.LLST73:
	.long	.LVL148
	.long	.LVL152
	.value	0x1
	.byte	0x57
	.long	.LVL154
	.long	.LVL156
	.value	0x1
	.byte	0x57
	.long	.LVL178
	.long	.LVL179
	.value	0x1
	.byte	0x57
	.long	.LVL190
	.long	.LVL193
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST74:
	.long	.LVL146
	.long	.LVL152
	.value	0x1
	.byte	0x57
	.long	.LVL154
	.long	.LVL156
	.value	0x1
	.byte	0x57
	.long	.LVL178
	.long	.LVL179
	.value	0x1
	.byte	0x57
	.long	.LVL190
	.long	.LVL193
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST75:
	.long	.LVL163
	.long	.LVL171
	.value	0x2
	.byte	0x91
	.sleb128 -17
	.long	.LVL178
	.long	.LVL179
	.value	0x2
	.byte	0x91
	.sleb128 -17
	.long	.LVL190
	.long	.LFE585
	.value	0x2
	.byte	0x91
	.sleb128 -17
	.long	0x0
	.long	0x0
.LLST76:
	.long	.LVL164
	.long	.LVL171
	.value	0x2
	.byte	0x91
	.sleb128 -18
	.long	.LVL178
	.long	.LVL179
	.value	0x2
	.byte	0x91
	.sleb128 -18
	.long	.LVL190
	.long	.LFE585
	.value	0x2
	.byte	0x91
	.sleb128 -18
	.long	0x0
	.long	0x0
.LLST77:
	.long	.LVL161
	.long	.LVL171
	.value	0x2
	.byte	0x91
	.sleb128 -19
	.long	.LVL178
	.long	.LVL179
	.value	0x2
	.byte	0x91
	.sleb128 -19
	.long	.LVL190
	.long	.LFE585
	.value	0x2
	.byte	0x91
	.sleb128 -19
	.long	0x0
	.long	0x0
.LLST78:
	.long	.LVL162
	.long	.LVL168
	.value	0x1
	.byte	0x57
	.long	.LVL178
	.long	.LVL179
	.value	0x1
	.byte	0x57
	.long	.LVL190
	.long	.LVL193
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST79:
	.long	.LVL160
	.long	.LVL168
	.value	0x1
	.byte	0x57
	.long	.LVL178
	.long	.LVL179
	.value	0x1
	.byte	0x57
	.long	.LVL190
	.long	.LVL193
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST80:
	.long	.LVL141
	.long	.LVL142
	.value	0x1
	.byte	0x53
	.long	.LVL143
	.long	.LVL144
	.value	0x1
	.byte	0x53
	.long	.LVL144
	.long	.LVL145
	.value	0x1
	.byte	0x50
	.long	.LVL145
	.long	.LVL151
	.value	0x1
	.byte	0x53
	.long	.LVL151
	.long	.LVL153
	.value	0x1
	.byte	0x50
	.long	.LVL153
	.long	.LVL154
	.value	0x1
	.byte	0x53
	.long	.LVL154
	.long	.LVL155
	.value	0x1
	.byte	0x50
	.long	.LVL155
	.long	.LVL156
	.value	0x1
	.byte	0x53
	.long	.LVL157
	.long	.LVL158
	.value	0x1
	.byte	0x53
	.long	.LVL158
	.long	.LVL159
	.value	0x1
	.byte	0x50
	.long	.LVL159
	.long	.LVL165
	.value	0x1
	.byte	0x53
	.long	.LVL165
	.long	.LVL166
	.value	0x1
	.byte	0x50
	.long	.LVL166
	.long	.LVL167
	.value	0x1
	.byte	0x53
	.long	.LVL167
	.long	.LVL169
	.value	0x1
	.byte	0x50
	.long	.LVL169
	.long	.LVL171
	.value	0x1
	.byte	0x53
	.long	.LVL172
	.long	.LVL173
	.value	0x1
	.byte	0x53
	.long	.LVL173
	.long	.LVL174
	.value	0x1
	.byte	0x50
	.long	.LVL174
	.long	.LVL179
	.value	0x1
	.byte	0x53
	.long	.LVL180
	.long	.LVL181
	.value	0x1
	.byte	0x53
	.long	.LVL181
	.long	.LVL182
	.value	0x1
	.byte	0x50
	.long	.LVL182
	.long	.LVL186
	.value	0x1
	.byte	0x53
	.long	.LVL186
	.long	.LVL187
	.value	0x1
	.byte	0x50
	.long	.LVL187
	.long	.LVL189
	.value	0x1
	.byte	0x53
	.long	.LVL190
	.long	.LVL191
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST81:
	.long	.LVL177
	.long	.LVL178
	.value	0x2
	.byte	0x91
	.sleb128 -17
	.long	.LVL190
	.long	.LFE585
	.value	0x2
	.byte	0x91
	.sleb128 -17
	.long	0x0
	.long	0x0
.LLST82:
	.long	.LVL175
	.long	.LVL176
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST83:
	.long	.LVL182
	.long	.LVL184
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST84:
	.long	.LVL185
	.long	.LVL188
	.value	0x1
	.byte	0x57
	.long	.LVL190
	.long	.LVL193
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST85:
	.long	.LVL183
	.long	.LVL188
	.value	0x1
	.byte	0x57
	.long	.LVL190
	.long	.LVL193
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST86:
	.long	.LFB586
	.long	.LFE586
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST87:
	.long	.LVL194
	.long	.LVL195
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST88:
	.long	.LVL196
	.long	.LVL197
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST89:
	.long	.LVL198
	.long	.LVL199
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST90:
	.long	.LVL199
	.long	.LVL200
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST91:
	.long	.LVL201
	.long	.LVL203
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST92:
	.long	.LFB1098
	.long	.LFE1098
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST93:
	.long	.LVL204
	.long	.LVL205
	.value	0x1
	.byte	0x50
	.long	.LVL205
	.long	.LVL206
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST94:
	.long	.LVL208
	.long	.LVL211
	.value	0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
.LLST95:
	.long	.LFB787
	.long	.LFE787
	.value	0x2
	.byte	0x74
	.sleb128 16
	.long	0x0
	.long	0x0
.LLST96:
	.long	.LVL213
	.long	.LVL227
	.value	0x1
	.byte	0x50
	.long	.LVL229
	.long	.LFE787
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST97:
	.long	.LVL214
	.long	.LVL229
	.value	0x1
	.byte	0x56
	.long	.LVL229
	.long	.LVL231
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST98:
	.long	.LVL219
	.long	.LVL220
	.value	0x1
	.byte	0x52
	.long	.LVL229
	.long	.LFE787
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST99:
	.long	.LVL226
	.long	.LVL230
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST100:
	.long	.LVL215
	.long	.LVL217
	.value	0x1
	.byte	0x52
	.long	.LVL219
	.long	.LFE787
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST101:
	.long	.LVL216
	.long	.LVL218
	.value	0x1
	.byte	0x51
	.long	.LVL229
	.long	.LFE787
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST102:
	.long	.LVL221
	.long	.LVL222
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST103:
	.long	.LVL223
	.long	.LVL224
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST104:
	.long	.LVL225
	.long	.LVL226
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST105:
	.long	.LVL228
	.long	.LVL229
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST106:
	.long	.LFB854
	.long	.LFE854
	.value	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
.LLST107:
	.long	.LVL232
	.long	.LVL241
	.value	0x1
	.byte	0x50
	.long	.LVL248
	.long	.LFE854
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST108:
	.long	.LVL232
	.long	.LVL242
	.value	0x1
	.byte	0x52
	.long	.LVL248
	.long	.LFE854
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST109:
	.long	.LVL232
	.long	.LVL236
	.value	0x1
	.byte	0x51
	.long	.LVL237
	.long	.LVL238
	.value	0x1
	.byte	0x51
	.long	.LVL248
	.long	.LFE854
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST110:
	.long	.LVL244
	.long	.LVL251
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST111:
	.long	.LVL236
	.long	.LVL237
	.value	0x1
	.byte	0x51
	.long	.LVL238
	.long	.LVL239
	.value	0x1
	.byte	0x51
	.long	.LVL239
	.long	.LVL249
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST112:
	.long	.LVL233
	.long	.LVL234
	.value	0x1
	.byte	0x53
	.long	.LVL248
	.long	.LVL251
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST113:
	.long	.LVL233
	.long	.LVL250
	.value	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
.LLST114:
	.long	.LVL235
	.long	.LVL240
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST115:
	.long	.LVL243
	.long	.LVL247
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST116:
	.long	.LFB932
	.long	.LFE932
	.value	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
.LLST117:
	.long	.LVL252
	.long	.LVL253
	.value	0x1
	.byte	0x50
	.long	.LVL253
	.long	.LVL256
	.value	0x1
	.byte	0x51
	.long	.LVL259
	.long	.LVL260
	.value	0x1
	.byte	0x51
	.long	.LVL261
	.long	.LVL262
	.value	0x1
	.byte	0x51
	.long	.LVL266
	.long	.LFE932
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST118:
	.long	.LVL252
	.long	.LVL253
	.value	0x1
	.byte	0x52
	.long	.LVL253
	.long	.LVL268
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST119:
	.long	.LVL254
	.long	.LVL255
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST120:
	.long	.LVL257
	.long	.LVL258
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST121:
	.long	.LVL263
	.long	.LVL264
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST122:
	.long	.LVL265
	.long	.LVL267
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST123:
	.long	.LFB1010
	.long	.LFE1010
	.value	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
.LLST124:
	.long	.LVL269
	.long	.LVL270
	.value	0x1
	.byte	0x50
	.long	.LVL270
	.long	.LVL317
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST125:
	.long	.LVL271
	.long	.LVL275
	.value	0x1
	.byte	0x56
	.long	.LVL306
	.long	.LVL308
	.value	0x1
	.byte	0x56
	.long	.LVL314
	.long	.LVL318
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST126:
	.long	.LVL274
	.long	.LVL275
	.value	0x1
	.byte	0x50
	.long	.LVL314
	.long	.LVL315
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST127:
	.long	.LVL272
	.long	.LVL273
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST128:
	.long	.LVL276
	.long	.LVL290
	.value	0x1
	.byte	0x51
	.long	.LVL306
	.long	.LVL307
	.value	0x1
	.byte	0x51
	.long	.LVL308
	.long	.LVL310
	.value	0x1
	.byte	0x51
	.long	.LVL316
	.long	.LFE1010
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST129:
	.long	.LVL279
	.long	.LVL280
	.value	0x1
	.byte	0x56
	.long	.LVL281
	.long	.LVL282
	.value	0x1
	.byte	0x56
	.long	.LVL288
	.long	.LVL290
	.value	0x1
	.byte	0x56
	.long	.LVL316
	.long	.LVL318
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST130:
	.long	.LVL277
	.long	.LVL278
	.value	0x1
	.byte	0x50
	.long	.LVL284
	.long	.LVL288
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST131:
	.long	.LVL277
	.long	.LVL278
	.value	0x1
	.byte	0x50
	.long	.LVL283
	.long	.LVL288
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST132:
	.long	.LVL277
	.long	.LVL285
	.value	0x1
	.byte	0x57
	.long	.LVL286
	.long	.LVL287
	.value	0x1
	.byte	0x57
	.long	.LVL289
	.long	.LVL290
	.value	0x1
	.byte	0x57
	.long	.LVL309
	.long	.LVL310
	.value	0x1
	.byte	0x57
	.long	.LVL316
	.long	.LVL319
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST133:
	.long	.LVL291
	.long	.LVL304
	.value	0x1
	.byte	0x56
	.long	.LVL306
	.long	.LVL307
	.value	0x1
	.byte	0x56
	.long	.LVL310
	.long	.LVL312
	.value	0x1
	.byte	0x56
	.long	.LVL316
	.long	.LVL318
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST134:
	.long	.LVL294
	.long	.LVL295
	.value	0x1
	.byte	0x51
	.long	.LVL303
	.long	.LFE1010
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST135:
	.long	.LVL292
	.long	.LVL293
	.value	0x1
	.byte	0x50
	.long	.LVL299
	.long	.LVL304
	.value	0x1
	.byte	0x50
	.long	.LVL316
	.long	.LFE1010
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST136:
	.long	.LVL292
	.long	.LVL293
	.value	0x1
	.byte	0x50
	.long	.LVL298
	.long	.LVL304
	.value	0x1
	.byte	0x50
	.long	.LVL316
	.long	.LFE1010
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST137:
	.long	.LVL296
	.long	.LVL297
	.value	0x1
	.byte	0x50
	.long	.LVL303
	.long	.LVL304
	.value	0x1
	.byte	0x50
	.long	.LVL316
	.long	.LFE1010
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST138:
	.long	.LVL292
	.long	.LVL300
	.value	0x1
	.byte	0x57
	.long	.LVL301
	.long	.LVL302
	.value	0x1
	.byte	0x57
	.long	.LVL303
	.long	.LVL304
	.value	0x1
	.byte	0x57
	.long	.LVL311
	.long	.LVL312
	.value	0x1
	.byte	0x57
	.long	.LVL316
	.long	.LVL319
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST139:
	.long	.LVL305
	.long	.LVL307
	.value	0x1
	.byte	0x51
	.long	.LVL312
	.long	.LFE1010
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST140:
	.long	.LVL313
	.long	.LVL315
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST141:
	.long	.LFB1018
	.long	.LFE1018
	.value	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
.LLST142:
	.long	.LVL320
	.long	.LVL321
	.value	0x1
	.byte	0x50
	.long	.LVL321
	.long	.LVL348
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST143:
	.long	.LVL322
	.long	.LVL323
	.value	0x1
	.byte	0x57
	.long	.LVL334
	.long	.LVL339
	.value	0x1
	.byte	0x57
	.long	.LVL347
	.long	.LVL350
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST144:
	.long	.LVL337
	.long	.LVL338
	.value	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
.LLST145:
	.long	.LVL323
	.long	.LVL329
	.value	0x1
	.byte	0x50
	.long	.LVL345
	.long	.LVL346
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST146:
	.long	.LVL323
	.long	.LVL324
	.value	0x1
	.byte	0x55
	.long	.LVL325
	.long	.LVL330
	.value	0x1
	.byte	0x55
	.long	.LVL345
	.long	.LVL351
	.value	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
.LLST147:
	.long	.LVL323
	.long	.LVL330
	.value	0x1
	.byte	0x55
	.long	.LVL345
	.long	.LVL351
	.value	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
.LLST148:
	.long	.LVL323
	.long	.LVL326
	.value	0x1
	.byte	0x56
	.long	.LVL327
	.long	.LVL328
	.value	0x1
	.byte	0x56
	.long	.LVL336
	.long	.LVL340
	.value	0x1
	.byte	0x56
	.long	.LVL345
	.long	.LVL349
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST149:
	.long	.LVL331
	.long	.LVL332
	.value	0x1
	.byte	0x56
	.long	.LVL334
	.long	.LVL335
	.value	0x1
	.byte	0x56
	.long	.LVL340
	.long	.LVL349
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST150:
	.long	.LVL341
	.long	.LVL342
	.value	0x1
	.byte	0x57
	.long	.LVL343
	.long	.LVL350
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST151:
	.long	.LVL333
	.long	.LVL335
	.value	0x1
	.byte	0x50
	.long	.LVL344
	.long	.LVL345
	.value	0x1
	.byte	0x50
	.long	.LVL347
	.long	.LFE1018
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST152:
	.long	.LFB1105
	.long	.LFE1105
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST153:
	.long	.LVL352
	.long	.LVL354
	.value	0x1
	.byte	0x50
	.long	.LVL357
	.long	.LVL358
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST154:
	.long	.LVL355
	.long	.LVL356
	.value	0x1
	.byte	0x50
	.long	.LVL357
	.long	.LVL358
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST155:
	.long	.LFB1130
	.long	.LFE1130
	.value	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
.LLST156:
	.long	.LVL359
	.long	.LVL363
	.value	0x1
	.byte	0x52
	.long	.LVL363
	.long	.LVL365
	.value	0x1
	.byte	0x52
	.long	.LVL382
	.long	.LFE1130
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST157:
	.long	.LVL360
	.long	.LVL362
	.value	0x1
	.byte	0x50
	.long	.LVL363
	.long	.LVL364
	.value	0x1
	.byte	0x50
	.long	.LVL382
	.long	.LVL383
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST158:
	.long	.LVL362
	.long	.LVL364
	.value	0x1
	.byte	0x50
	.long	.LVL382
	.long	.LVL383
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST159:
	.long	.LVL363
	.long	.LVL367
	.value	0x1
	.byte	0x51
	.long	.LVL380
	.long	.LFE1130
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST160:
	.long	.LVL365
	.long	.LVL366
	.value	0x1
	.byte	0x52
	.long	.LVL382
	.long	.LFE1130
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST161:
	.long	.LVL366
	.long	.LVL370
	.value	0x1
	.byte	0x52
	.long	.LVL380
	.long	.LVL381
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST162:
	.long	.LVL369
	.long	.LVL380
	.value	0x1
	.byte	0x55
	.long	.LVL382
	.long	.LVL384
	.value	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
.LLST163:
	.long	.LVL368
	.long	.LVL375
	.value	0x1
	.byte	0x51
	.long	.LVL382
	.long	.LFE1130
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST164:
	.long	.LVL367
	.long	.LVL368
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST165:
	.long	.LVL371
	.long	.LVL372
	.value	0x1
	.byte	0x52
	.long	.LVL382
	.long	.LFE1130
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST166:
	.long	.LVL373
	.long	.LVL377
	.value	0x1
	.byte	0x52
	.long	.LVL382
	.long	.LFE1130
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST167:
	.long	.LVL378
	.long	.LVL379
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST168:
	.long	.LVL374
	.long	.LVL376
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST169:
	.long	.LVL375
	.long	.LVL378
	.value	0x1
	.byte	0x51
	.long	.LVL382
	.long	.LFE1130
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST170:
	.long	.LFB1829
	.long	.LFE1829
	.value	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
.LLST171:
	.long	.LVL385
	.long	.LVL386
	.value	0x1
	.byte	0x50
	.long	.LVL386
	.long	.LVL439
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST172:
	.long	.LVL388
	.long	.LVL389
	.value	0x1
	.byte	0x50
	.long	.LVL390
	.long	.LVL391
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST173:
	.long	.LVL387
	.long	.LVL392
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	.LVL435
	.long	.LVL436
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	.LVL438
	.long	.LFE1829
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0x0
	.long	0x0
.LLST174:
	.long	.LVL393
	.long	.LVL403
	.value	0x1
	.byte	0x57
	.long	.LVL409
	.long	.LVL410
	.value	0x1
	.byte	0x57
	.long	.LVL413
	.long	.LVL414
	.value	0x1
	.byte	0x57
	.long	.LVL435
	.long	.LVL436
	.value	0x1
	.byte	0x57
	.long	.LVL437
	.long	.LVL441
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST175:
	.long	.LVL394
	.long	.LVL403
	.value	0x1
	.byte	0x56
	.long	.LVL409
	.long	.LVL410
	.value	0x1
	.byte	0x56
	.long	.LVL413
	.long	.LVL414
	.value	0x1
	.byte	0x56
	.long	.LVL435
	.long	.LVL436
	.value	0x1
	.byte	0x56
	.long	.LVL437
	.long	.LVL440
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST176:
	.long	.LVL396
	.long	.LVL397
	.value	0x1
	.byte	0x50
	.long	.LVL401
	.long	.LVL402
	.value	0x1
	.byte	0x51
	.long	.LVL402
	.long	.LVL403
	.value	0x1
	.byte	0x50
	.long	.LVL413
	.long	.LVL414
	.value	0x1
	.byte	0x50
	.long	.LVL437
	.long	.LVL438
	.value	0x1
	.byte	0x50
	.long	.LVL438
	.long	.LFE1829
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST177:
	.long	.LVL395
	.long	.LVL403
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	.LVL409
	.long	.LVL410
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	.LVL413
	.long	.LVL414
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	.LVL435
	.long	.LVL436
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	.LVL437
	.long	.LFE1829
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0x0
	.long	0x0
.LLST178:
	.long	.LVL398
	.long	.LVL399
	.value	0x1
	.byte	0x50
	.long	.LVL409
	.long	.LVL410
	.value	0x1
	.byte	0x50
	.long	.LVL435
	.long	.LVL436
	.value	0x1
	.byte	0x50
	.long	.LVL438
	.long	.LFE1829
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST179:
	.long	.LVL404
	.long	.LVL414
	.value	0x1
	.byte	0x56
	.long	.LVL435
	.long	.LVL436
	.value	0x1
	.byte	0x56
	.long	.LVL437
	.long	.LVL440
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST180:
	.long	.LVL405
	.long	.LVL414
	.value	0x1
	.byte	0x55
	.long	.LVL435
	.long	.LVL436
	.value	0x1
	.byte	0x55
	.long	.LVL437
	.long	.LVL442
	.value	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
.LLST181:
	.long	.LVL407
	.long	.LVL408
	.value	0x1
	.byte	0x50
	.long	.LVL412
	.long	.LVL413
	.value	0x1
	.byte	0x51
	.long	.LVL413
	.long	.LVL414
	.value	0x1
	.byte	0x50
	.long	.LVL437
	.long	.LVL438
	.value	0x1
	.byte	0x50
	.long	.LVL438
	.long	.LFE1829
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST182:
	.long	.LVL406
	.long	.LVL414
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	.LVL435
	.long	.LVL436
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	.LVL437
	.long	.LFE1829
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0x0
	.long	0x0
.LLST183:
	.long	.LVL415
	.long	.LVL416
	.value	0x1
	.byte	0x50
	.long	.LVL435
	.long	.LVL436
	.value	0x1
	.byte	0x50
	.long	.LVL438
	.long	.LFE1829
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST184:
	.long	.LVL417
	.long	.LVL418
	.value	0x1
	.byte	0x50
	.long	.LVL435
	.long	.LVL436
	.value	0x1
	.byte	0x50
	.long	.LVL438
	.long	.LFE1829
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST185:
	.long	.LVL419
	.long	.LVL420
	.value	0x1
	.byte	0x50
	.long	.LVL435
	.long	.LVL436
	.value	0x1
	.byte	0x50
	.long	.LVL438
	.long	.LFE1829
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST186:
	.long	.LVL423
	.long	.LVL429
	.value	0x1
	.byte	0x50
	.long	.LVL437
	.long	.LFE1829
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST187:
	.long	.LVL426
	.long	.LVL433
	.value	0x1
	.byte	0x51
	.long	.LVL437
	.long	.LFE1829
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST188:
	.long	.LVL421
	.long	.LVL422
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST189:
	.long	.LVL424
	.long	.LVL427
	.value	0x1
	.byte	0x57
	.long	.LVL437
	.long	.LVL441
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST190:
	.long	.LVL425
	.long	.LVL426
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST191:
	.long	.LVL427
	.long	.LVL433
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST192:
	.long	.LVL428
	.long	.LVL431
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST193:
	.long	.LVL429
	.long	.LVL434
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST194:
	.long	.LVL433
	.long	.LVL436
	.value	0x1
	.byte	0x51
	.long	.LVL438
	.long	.LFE1829
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST195:
	.long	.LVL433
	.long	.LVL436
	.value	0x1
	.byte	0x56
	.long	.LVL438
	.long	.LVL440
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST196:
	.long	.LVL433
	.long	.LVL436
	.value	0x1
	.byte	0x57
	.long	.LVL438
	.long	.LVL441
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST197:
	.long	.LVL434
	.long	.LVL436
	.value	0x1
	.byte	0x50
	.long	.LVL438
	.long	.LFE1829
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST198:
	.long	.LFB1119
	.long	.LFE1119
	.value	0x2
	.byte	0x74
	.sleb128 12
	.long	0x0
	.long	0x0
.LLST199:
	.long	.LVL443
	.long	.LVL444
	.value	0x1
	.byte	0x50
	.long	.LVL444
	.long	.LVL494
	.value	0x1
	.byte	0x53
	.long	.LVL495
	.long	.LVL497
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST200:
	.long	.LVL445
	.long	.LVL446
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST201:
	.long	.LVL446
	.long	.LVL447
	.value	0x1
	.byte	0x52
	.long	.LVL492
	.long	.LVL493
	.value	0x1
	.byte	0x52
	.long	.LVL496
	.long	.LFE1119
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST202:
	.long	.LVL448
	.long	.LVL449
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST203:
	.long	.LVL450
	.long	.LVL451
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST204:
	.long	.LVL452
	.long	.LVL453
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST205:
	.long	.LVL454
	.long	.LVL455
	.value	0x1
	.byte	0x52
	.long	.LVL491
	.long	.LVL493
	.value	0x1
	.byte	0x52
	.long	.LVL496
	.long	.LFE1119
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST206:
	.long	.LVL460
	.long	.LVL464
	.value	0x1
	.byte	0x52
	.long	.LVL478
	.long	.LVL479
	.value	0x1
	.byte	0x52
	.long	.LVL490
	.long	.LVL493
	.value	0x1
	.byte	0x52
	.long	.LVL496
	.long	.LFE1119
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST207:
	.long	.LVL456
	.long	.LVL457
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST208:
	.long	.LVL458
	.long	.LVL459
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST209:
	.long	.LVL465
	.long	.LVL466
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST210:
	.long	.LVL467
	.long	.LVL468
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST211:
	.long	.LVL469
	.long	.LVL470
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST212:
	.long	.LVL471
	.long	.LVL472
	.value	0x1
	.byte	0x50
	.long	.LVL492
	.long	.LVL493
	.value	0x1
	.byte	0x50
	.long	.LVL496
	.long	.LFE1119
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST213:
	.long	.LVL477
	.long	.LVL479
	.value	0x1
	.byte	0x52
	.long	.LVL490
	.long	.LVL493
	.value	0x1
	.byte	0x52
	.long	.LVL496
	.long	.LFE1119
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST214:
	.long	.LVL473
	.long	.LVL474
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST215:
	.long	.LVL475
	.long	.LVL476
	.value	0x1
	.byte	0x50
	.long	.LVL495
	.long	.LFE1119
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST216:
	.long	.LVL480
	.long	.LVL481
	.value	0x1
	.byte	0x56
	.long	.LVL481
	.long	.LVL482
	.value	0x1
	.byte	0x50
	.long	.LVL482
	.long	.LVL487
	.value	0x1
	.byte	0x56
	.long	.LVL492
	.long	.LVL493
	.value	0x1
	.byte	0x56
	.long	.LVL495
	.long	.LVL496
	.value	0x1
	.byte	0x50
	.long	.LVL496
	.long	.LVL498
	.value	0x1
	.byte	0x56
	.long	.LVL498
	.long	.LFE1119
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST217:
	.long	.LVL483
	.long	.LVL484
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST218:
	.long	.LVL485
	.long	.LVL486
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST219:
	.long	.LVL488
	.long	.LVL489
	.value	0x1
	.byte	0x52
	.long	.LVL492
	.long	.LVL493
	.value	0x1
	.byte	0x52
	.long	.LVL496
	.long	.LFE1119
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST221:
	.long	.LVL499
	.long	.LVL500
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST223:
	.long	.LVL501
	.long	.LVL502
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST224:
	.long	.LFB1976
	.long	.LFE1976
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST225:
	.long	.LVL503
	.long	.LVL504
	.value	0x1
	.byte	0x50
	.long	.LVL504
	.long	.LVL507
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST226:
	.long	.LVL505
	.long	.LVL506
	.value	0x1
	.byte	0x50
	.long	.LVL506
	.long	.LFE1976
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST227:
	.long	.LFB1968
	.long	.LFE1968
	.value	0x2
	.byte	0x74
	.sleb128 48
	.long	0x0
	.long	0x0
.LLST228:
	.long	.LVL508
	.long	.LVL509
	.value	0x1
	.byte	0x50
	.long	.LVL509
	.long	.LVL512
	.value	0x1
	.byte	0x51
	.long	.LVL524
	.long	.LVL534
	.value	0x1
	.byte	0x51
	.long	.LVL545
	.long	.LVL553
	.value	0x1
	.byte	0x51
	.long	.LVL561
	.long	.LFE1968
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST229:
	.long	.LVL508
	.long	.LVL510
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST230:
	.long	.LVL511
	.long	.LVL513
	.value	0x1
	.byte	0x50
	.long	.LVL524
	.long	.LVL525
	.value	0x1
	.byte	0x50
	.long	.LVL545
	.long	.LVL546
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST231:
	.long	.LVL514
	.long	.LVL523
	.value	0x1
	.byte	0x52
	.long	.LVL561
	.long	.LFE1968
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST232:
	.long	.LVL515
	.long	.LVL519
	.value	0x1
	.byte	0x51
	.long	.LVL561
	.long	.LFE1968
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST233:
	.long	.LVL516
	.long	.LVL520
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST234:
	.long	.LVL517
	.long	.LVL518
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST235:
	.long	.LVL522
	.long	.LVL524
	.value	0x1
	.byte	0x51
	.long	.LVL544
	.long	.LVL545
	.value	0x1
	.byte	0x51
	.long	.LVL562
	.long	.LFE1968
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST236:
	.long	.LVL522
	.long	.LVL524
	.value	0x1
	.byte	0x56
	.long	.LVL544
	.long	.LVL545
	.value	0x1
	.byte	0x56
	.long	.LVL562
	.long	.LVL564
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST237:
	.long	.LVL521
	.long	.LVL524
	.value	0x1
	.byte	0x57
	.long	.LVL544
	.long	.LVL545
	.value	0x1
	.byte	0x57
	.long	.LVL562
	.long	.LVL565
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST238:
	.long	.LVL533
	.long	.LVL545
	.value	0x1
	.byte	0x55
	.long	.LVL562
	.long	.LVL566
	.value	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
.LLST239:
	.long	.LVL526
	.long	.LVL538
	.value	0x1
	.byte	0x57
	.long	.LVL562
	.long	.LVL565
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST240:
	.long	.LVL527
	.long	.LVL531
	.value	0x1
	.byte	0x56
	.long	.LVL562
	.long	.LVL564
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST241:
	.long	.LVL528
	.long	.LVL542
	.value	0x1
	.byte	0x53
	.long	.LVL562
	.long	.LVL563
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST242:
	.long	.LVL529
	.long	.LVL530
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST243:
	.long	.LVL532
	.long	.LVL533
	.value	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
.LLST244:
	.long	.LVL535
	.long	.LVL536
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST245:
	.long	.LVL537
	.long	.LVL541
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST246:
	.long	.LVL539
	.long	.LVL545
	.value	0x1
	.byte	0x56
	.long	.LVL562
	.long	.LVL564
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST247:
	.long	.LVL538
	.long	.LVL545
	.value	0x1
	.byte	0x57
	.long	.LVL562
	.long	.LVL565
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST248:
	.long	.LVL540
	.long	.LVL543
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST249:
	.long	.LVL547
	.long	.LVL560
	.value	0x1
	.byte	0x52
	.long	.LVL561
	.long	.LFE1968
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST250:
	.long	.LVL548
	.long	.LVL549
	.value	0x1
	.byte	0x50
	.long	.LVL561
	.long	.LVL562
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST251:
	.long	.LVL550
	.long	.LVL551
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST252:
	.long	.LVL552
	.long	.LVL555
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST253:
	.long	.LVL554
	.long	.LVL556
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST254:
	.long	.LVL555
	.long	.LVL558
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST255:
	.long	.LVL556
	.long	.LVL559
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST256:
	.long	.LVL544
	.long	.LVL545
	.value	0x1
	.byte	0x56
	.long	.LVL558
	.long	.LVL561
	.value	0x1
	.byte	0x56
	.long	.LVL562
	.long	.LVL564
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST257:
	.long	.LVL544
	.long	.LVL545
	.value	0x1
	.byte	0x57
	.long	.LVL557
	.long	.LVL561
	.value	0x1
	.byte	0x57
	.long	.LVL562
	.long	.LVL565
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST258:
	.long	.LFB2646
	.long	.LFE2646
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST259:
	.long	.LVL567
	.long	.LVL568
	.value	0x1
	.byte	0x50
	.long	.LVL568
	.long	.LVL575
	.value	0x1
	.byte	0x51
	.long	.LVL577
	.long	.LFE2646
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST260:
	.long	.LVL569
	.long	.LVL571
	.value	0x1
	.byte	0x53
	.long	.LVL578
	.long	.LVL579
	.value	0x1
	.byte	0x53
	.long	.LVL580
	.long	.LVL581
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST261:
	.long	.LVL570
	.long	.LVL571
	.value	0x1
	.byte	0x50
	.long	.LVL578
	.long	.LVL579
	.value	0x1
	.byte	0x50
	.long	.LVL580
	.long	.LFE2646
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST262:
	.long	.LVL572
	.long	.LVL574
	.value	0x1
	.byte	0x53
	.long	.LVL578
	.long	.LVL579
	.value	0x1
	.byte	0x53
	.long	.LVL580
	.long	.LVL581
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST263:
	.long	.LVL573
	.long	.LVL574
	.value	0x1
	.byte	0x50
	.long	.LVL578
	.long	.LVL579
	.value	0x1
	.byte	0x50
	.long	.LVL580
	.long	.LFE2646
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST264:
	.long	.LVL575
	.long	.LVL577
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST265:
	.long	.LVL576
	.long	.LVL577
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST266:
	.long	.LFB2523
	.long	.LFE2523
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST267:
	.long	.LVL582
	.long	.LVL583
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST268:
	.long	.LVL582
	.long	.LVL591
	.value	0x1
	.byte	0x52
	.long	.LVL595
	.long	.LVL598
	.value	0x1
	.byte	0x52
	.long	.LVL621
	.long	.LFE2523
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST269:
	.long	.LVL582
	.long	.LVL592
	.value	0x1
	.byte	0x51
	.long	.LVL595
	.long	.LVL596
	.value	0x1
	.byte	0x51
	.long	.LVL621
	.long	.LFE2523
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST270:
	.long	.LVL583
	.long	.LVL584
	.value	0x1
	.byte	0x50
	.long	.LVL585
	.long	.LVL586
	.value	0x1
	.byte	0x50
	.long	.LVL587
	.long	.LVL589
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST271:
	.long	.LVL599
	.long	.LVL615
	.value	0x1
	.byte	0x53
	.long	.LVL621
	.long	.LVL622
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST272:
	.long	.LVL607
	.long	.LVL616
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST273:
	.long	.LVL602
	.long	.LVL611
	.value	0x1
	.byte	0x51
	.long	.LVL621
	.long	.LFE2523
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST274:
	.long	.LVL592
	.long	.LVL595
	.value	0x1
	.byte	0x51
	.long	.LVL596
	.long	.LVL602
	.value	0x1
	.byte	0x51
	.long	.LVL603
	.long	.LVL606
	.value	0x1
	.byte	0x51
	.long	.LVL621
	.long	.LFE2523
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST275:
	.long	.LVL593
	.long	.LVL595
	.value	0x1
	.byte	0x50
	.long	.LVL597
	.long	.LVL604
	.value	0x1
	.byte	0x50
	.long	.LVL606
	.long	.LVL608
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST276:
	.long	.LVL594
	.long	.LVL595
	.value	0x1
	.byte	0x52
	.long	.LVL598
	.long	.LVL605
	.value	0x1
	.byte	0x52
	.long	.LVL606
	.long	.LVL613
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST277:
	.long	.LVL589
	.long	.LVL590
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST278:
	.long	.LVL591
	.long	.LVL594
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST279:
	.long	.LVL614
	.long	.LVL619
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST280:
	.long	.LFB2524
	.long	.LFE2524
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST281:
	.long	.LVL623
	.long	.LVL624
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST282:
	.long	.LVL623
	.long	.LVL630
	.value	0x1
	.byte	0x52
	.long	.LVL639
	.long	.LVL640
	.value	0x1
	.byte	0x52
	.long	.LVL641
	.long	.LFE2524
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST283:
	.long	.LVL623
	.long	.LVL625
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST284:
	.long	.LVL626
	.long	.LVL633
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST285:
	.long	.LVL627
	.long	.LVL628
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST286:
	.long	.LVL629
	.long	.LVL631
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST287:
	.long	.LVL630
	.long	.LVL634
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST288:
	.long	.LVL635
	.long	.LVL637
	.value	0x1
	.byte	0x51
	.long	.LVL638
	.long	.LFE2524
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST289:
	.long	.LFB2525
	.long	.LFE2525
	.value	0x2
	.byte	0x74
	.sleb128 48
	.long	0x0
	.long	0x0
.LLST290:
	.long	.LVL642
	.long	.LVL644
	.value	0x1
	.byte	0x50
	.long	.LVL644
	.long	.LVL652
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST291:
	.long	.LVL642
	.long	.LVL643
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST292:
	.long	.LVL643
	.long	.LVL647
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST293:
	.long	.LVL647
	.long	.LVL648
	.value	0x1
	.byte	0x52
	.long	.LVL650
	.long	.LFE2525
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST294:
	.long	.LVL649
	.long	.LVL650
	.value	0x1
	.byte	0x50
	.long	.LVL651
	.long	.LFE2525
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST295:
	.long	.LFB2535
	.long	.LFE2535
	.value	0x2
	.byte	0x74
	.sleb128 48
	.long	0x0
	.long	0x0
.LLST296:
	.long	.LVL653
	.long	.LVL655
	.value	0x1
	.byte	0x50
	.long	.LVL655
	.long	.LVL663
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST297:
	.long	.LVL653
	.long	.LVL654
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST298:
	.long	.LVL654
	.long	.LVL658
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST299:
	.long	.LVL658
	.long	.LVL659
	.value	0x1
	.byte	0x52
	.long	.LVL661
	.long	.LFE2535
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST300:
	.long	.LVL660
	.long	.LVL661
	.value	0x1
	.byte	0x50
	.long	.LVL662
	.long	.LFE2535
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST301:
	.long	.LFB2549
	.long	.LFE2549
	.value	0x3
	.byte	0x74
	.sleb128 64
	.long	0x0
	.long	0x0
.LLST302:
	.long	.LVL664
	.long	.LVL665
	.value	0x1
	.byte	0x50
	.long	.LVL665
	.long	.LVL684
	.value	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
.LLST303:
	.long	.LVL664
	.long	.LVL666
	.value	0x1
	.byte	0x52
	.long	.LVL678
	.long	.LVL679
	.value	0x1
	.byte	0x52
	.long	.LVL683
	.long	.LFE2549
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST304:
	.long	.LVL667
	.long	.LVL672
	.value	0x1
	.byte	0x51
	.long	.LVL676
	.long	.LVL679
	.value	0x1
	.byte	0x51
	.long	.LVL683
	.long	.LFE2549
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST305:
	.long	.LVL668
	.long	.LVL669
	.value	0x1
	.byte	0x50
	.long	.LVL676
	.long	.LVL677
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST306:
	.long	.LVL670
	.long	.LVL671
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST307:
	.long	.LVL672
	.long	.LVL673
	.value	0x1
	.byte	0x50
	.long	.LVL674
	.long	.LVL675
	.value	0x1
	.byte	0x50
	.long	.LVL679
	.long	.LVL680
	.value	0x1
	.byte	0x50
	.long	.LVL681
	.long	.LVL682
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST310:
	.long	.LVL685
	.long	.LVL686
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST311:
	.long	.LFB2650
	.long	.LFE2650
	.value	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
.LLST312:
	.long	.LVL687
	.long	.LVL689
	.value	0x1
	.byte	0x50
	.long	.LVL690
	.long	.LVL691
	.value	0x1
	.byte	0x50
	.long	.LVL692
	.long	.LVL693
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST313:
	.long	.LFB2649
	.long	.LFE2649
	.value	0x2
	.byte	0x74
	.sleb128 36
	.long	0x0
	.long	0x0
.LLST314:
	.long	.LVL694
	.long	.LVL695
	.value	0x1
	.byte	0x50
	.long	.LVL695
	.long	.LVL697
	.value	0x1
	.byte	0x51
	.long	.LVL697
	.long	.LVL709
	.value	0x1
	.byte	0x56
	.long	.LVL709
	.long	.LVL710
	.value	0x1
	.byte	0x51
	.long	.LVL710
	.long	.LVL778
	.value	0x1
	.byte	0x56
	.long	.LVL778
	.long	.LVL779
	.value	0x1
	.byte	0x51
	.long	.LVL779
	.long	.LVL783
	.value	0x1
	.byte	0x56
	.long	.LVL783
	.long	.LVL784
	.value	0x1
	.byte	0x51
	.long	.LVL784
	.long	.LVL792
	.value	0x1
	.byte	0x56
	.long	.LVL792
	.long	.LFE2649
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST315:
	.long	.LVL694
	.long	.LVL695
	.value	0x1
	.byte	0x52
	.long	.LVL695
	.long	.LVL702
	.value	0x1
	.byte	0x53
	.long	.LVL708
	.long	.LVL721
	.value	0x1
	.byte	0x53
	.long	.LVL721
	.long	.LVL723
	.value	0x1
	.byte	0x57
	.long	.LVL723
	.long	.LVL774
	.value	0x1
	.byte	0x53
	.long	.LVL774
	.long	.LVL776
	.value	0x1
	.byte	0x51
	.long	.LVL776
	.long	.LVL795
	.value	0x1
	.byte	0x53
	.long	.LVL795
	.long	.LVL796
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST316:
	.long	.LVL699
	.long	.LVL700
	.value	0x1
	.byte	0x51
	.long	.LVL704
	.long	.LVL706
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST317:
	.long	.LVL698
	.long	.LVL703
	.value	0x1
	.byte	0x50
	.long	.LVL705
	.long	.LVL711
	.value	0x1
	.byte	0x50
	.long	.LVL712
	.long	.LVL713
	.value	0x1
	.byte	0x50
	.long	.LVL714
	.long	.LVL716
	.value	0x1
	.byte	0x50
	.long	.LVL717
	.long	.LVL718
	.value	0x1
	.byte	0x50
	.long	.LVL720
	.long	.LVL722
	.value	0x1
	.byte	0x50
	.long	.LVL724
	.long	.LVL725
	.value	0x1
	.byte	0x50
	.long	.LVL726
	.long	.LVL733
	.value	0x1
	.byte	0x50
	.long	.LVL737
	.long	.LVL738
	.value	0x1
	.byte	0x50
	.long	.LVL742
	.long	.LVL743
	.value	0x1
	.byte	0x50
	.long	.LVL747
	.long	.LVL748
	.value	0x1
	.byte	0x50
	.long	.LVL752
	.long	.LVL753
	.value	0x1
	.byte	0x50
	.long	.LVL757
	.long	.LVL758
	.value	0x1
	.byte	0x50
	.long	.LVL762
	.long	.LVL763
	.value	0x1
	.byte	0x50
	.long	.LVL767
	.long	.LVL768
	.value	0x1
	.byte	0x50
	.long	.LVL773
	.long	.LVL775
	.value	0x1
	.byte	0x50
	.long	.LVL776
	.long	.LVL777
	.value	0x1
	.byte	0x50
	.long	.LVL784
	.long	.LVL786
	.value	0x1
	.byte	0x50
	.long	.LVL791
	.long	.LVL792
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST318:
	.long	.LVL715
	.long	.LVL719
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST319:
	.long	.LVL779
	.long	.LVL783
	.value	0x1
	.byte	0x51
	.long	.LVL785
	.long	.LVL788
	.value	0x1
	.byte	0x51
	.long	.LVL789
	.long	.LVL791
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST320:
	.long	.LVL764
	.long	.LVL765
	.value	0x1
	.byte	0x50
	.long	.LVL766
	.long	.LVL768
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST321:
	.long	.LVL759
	.long	.LVL760
	.value	0x1
	.byte	0x50
	.long	.LVL761
	.long	.LVL763
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST322:
	.long	.LVL754
	.long	.LVL755
	.value	0x1
	.byte	0x50
	.long	.LVL756
	.long	.LVL758
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST323:
	.long	.LVL749
	.long	.LVL750
	.value	0x1
	.byte	0x50
	.long	.LVL751
	.long	.LVL753
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST324:
	.long	.LVL744
	.long	.LVL745
	.value	0x1
	.byte	0x50
	.long	.LVL746
	.long	.LVL748
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST325:
	.long	.LVL739
	.long	.LVL740
	.value	0x1
	.byte	0x50
	.long	.LVL741
	.long	.LVL743
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST326:
	.long	.LVL734
	.long	.LVL735
	.value	0x1
	.byte	0x50
	.long	.LVL736
	.long	.LVL738
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST327:
	.long	.LVL695
	.long	.LVL701
	.value	0x1
	.byte	0x57
	.long	.LVL727
	.long	.LVL729
	.value	0x1
	.byte	0x51
	.long	.LVL729
	.long	.LVL732
	.value	0x1
	.byte	0x57
	.long	.LVL732
	.long	.LVL773
	.value	0x1
	.byte	0x51
	.long	.LVL787
	.long	.LVL788
	.value	0x1
	.byte	0x51
	.long	.LVL788
	.long	.LVL789
	.value	0x1
	.byte	0x57
	.long	.LVL792
	.long	.LVL796
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST328:
	.long	.LVL695
	.long	.LVL696
	.value	0x1
	.byte	0x50
	.long	.LVL769
	.long	.LVL770
	.value	0x1
	.byte	0x50
	.long	.LVL771
	.long	.LVL773
	.value	0x1
	.byte	0x50
	.long	.LVL787
	.long	.LVL789
	.value	0x1
	.byte	0x50
	.long	.LVL793
	.long	.LVL794
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST329:
	.long	.LVL696
	.long	.LVL698
	.value	0x1
	.byte	0x50
	.long	.LVL792
	.long	.LVL793
	.value	0x1
	.byte	0x50
	.long	.LVL794
	.long	.LFE2649
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST330:
	.long	.LVL700
	.long	.LVL704
	.value	0x1
	.byte	0x51
	.long	.LVL706
	.long	.LVL707
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST331:
	.long	.LVL695
	.long	.LVL696
	.value	0x1
	.byte	0x50
	.long	.LVL777
	.long	.LVL780
	.value	0x1
	.byte	0x50
	.long	.LVL781
	.long	.LVL782
	.value	0x1
	.byte	0x50
	.long	.LVL793
	.long	.LVL794
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST332:
	.long	.LVL695
	.long	.LVL696
	.value	0x1
	.byte	0x50
	.long	.LVL785
	.long	.LVL791
	.value	0x1
	.byte	0x50
	.long	.LVL793
	.long	.LVL794
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST335:
	.long	.LFB145
	.long	.LFE145
	.value	0x3
	.byte	0x74
	.sleb128 80
	.long	0x0
	.long	0x0
.LLST336:
	.long	.LVL799
	.long	.LVL803
	.value	0x1
	.byte	0x50
	.long	.LVL803
	.long	.LVL857
	.value	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
.LLST337:
	.long	.LVL799
	.long	.LVL800
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST338:
	.long	.LVL799
	.long	.LVL801
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST339:
	.long	.LVL806
	.long	.LVL807
	.value	0x1
	.byte	0x53
	.long	.LVL807
	.long	.LVL808
	.value	0x1
	.byte	0x50
	.long	.LVL808
	.long	.LVL811
	.value	0x1
	.byte	0x53
	.long	.LVL814
	.long	.LVL854
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST340:
	.long	.LVL836
	.long	.LVL840
	.value	0x1
	.byte	0x50
	.long	.LVL847
	.long	.LVL851
	.value	0x1
	.byte	0x50
	.long	.LVL852
	.long	.LVL853
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST341:
	.long	.LVL801
	.long	.LVL809
	.value	0x1
	.byte	0x51
	.long	.LVL815
	.long	.LVL817
	.value	0x1
	.byte	0x51
	.long	.LVL829
	.long	.LVL832
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST342:
	.long	.LVL803
	.long	.LVL805
	.value	0x1
	.byte	0x50
	.long	.LVL805
	.long	.LVL806
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST343:
	.long	.LVL802
	.long	.LVL806
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST344:
	.long	.LVL804
	.long	.LVL812
	.value	0x1
	.byte	0x56
	.long	.LVL815
	.long	.LVL819
	.value	0x1
	.byte	0x56
	.long	.LVL829
	.long	.LVL831
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST345:
	.long	.LVL809
	.long	.LVL817
	.value	0x1
	.byte	0x51
	.long	.LVL829
	.long	.LVL832
	.value	0x1
	.byte	0x51
	.long	.LVL851
	.long	.LFE145
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST346:
	.long	.LVL811
	.long	.LVL813
	.value	0x1
	.byte	0x53
	.long	.LVL813
	.long	.LVL854
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST347:
	.long	.LVL810
	.long	.LVL816
	.value	0x1
	.byte	0x52
	.long	.LVL829
	.long	.LVL830
	.value	0x1
	.byte	0x52
	.long	.LVL851
	.long	.LFE145
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST348:
	.long	.LVL812
	.long	.LVL819
	.value	0x1
	.byte	0x56
	.long	.LVL829
	.long	.LVL831
	.value	0x1
	.byte	0x56
	.long	.LVL851
	.long	.LVL855
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST349:
	.long	.LVL818
	.long	.LVL824
	.value	0x1
	.byte	0x50
	.long	.LVL829
	.long	.LVL833
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST350:
	.long	.LVL820
	.long	.LVL821
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST351:
	.long	.LVL819
	.long	.LVL823
	.value	0x1
	.byte	0x56
	.long	.LVL829
	.long	.LVL831
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST352:
	.long	.LVL821
	.long	.LVL822
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST353:
	.long	.LVL824
	.long	.LVL825
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST354:
	.long	.LVL826
	.long	.LVL834
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST355:
	.long	.LVL827
	.long	.LVL828
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST356:
	.long	.LVL831
	.long	.LVL839
	.value	0x1
	.byte	0x56
	.long	.LVL847
	.long	.LVL848
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST357:
	.long	.LVL833
	.long	.LVL840
	.value	0x1
	.byte	0x50
	.long	.LVL847
	.long	.LVL851
	.value	0x1
	.byte	0x50
	.long	.LVL852
	.long	.LVL853
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST358:
	.long	.LVL832
	.long	.LVL838
	.value	0x1
	.byte	0x51
	.long	.LVL847
	.long	.LVL849
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST359:
	.long	.LVL835
	.long	.LVL841
	.value	0x1
	.byte	0x57
	.long	.LVL847
	.long	.LVL851
	.value	0x1
	.byte	0x57
	.long	.LVL852
	.long	.LVL856
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST360:
	.long	.LVL838
	.long	.LVL847
	.value	0x1
	.byte	0x50
	.long	.LVL851
	.long	.LVL852
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST361:
	.long	.LVL837
	.long	.LVL846
	.value	0x1
	.byte	0x52
	.long	.LVL851
	.long	.LFE145
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST362:
	.long	.LVL838
	.long	.LVL842
	.value	0x1
	.byte	0x57
	.long	.LVL843
	.long	.LVL845
	.value	0x1
	.byte	0x57
	.long	.LVL851
	.long	.LVL856
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST363:
	.long	.LVL838
	.long	.LVL841
	.value	0x1
	.byte	0x57
	.long	.LVL842
	.long	.LVL847
	.value	0x1
	.byte	0x57
	.long	.LVL851
	.long	.LVL856
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST364:
	.long	.LVL846
	.long	.LVL847
	.value	0x1
	.byte	0x52
	.long	.LVL851
	.long	.LFE145
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST365:
	.long	.LVL850
	.long	.LVL851
	.value	0x1
	.byte	0x51
	.long	.LVL852
	.long	.LFE145
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST366:
	.long	.LFB156
	.long	.LFE156
	.value	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
.LLST367:
	.long	.LVL858
	.long	.LVL860
	.value	0x1
	.byte	0x50
	.long	.LVL860
	.long	.LVL867
	.value	0x1
	.byte	0x53
	.long	.LVL868
	.long	.LVL870
	.value	0x1
	.byte	0x53
	.long	.LVL897
	.long	.LVL903
	.value	0x1
	.byte	0x53
	.long	.LVL906
	.long	.LVL914
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST368:
	.long	.LVL859
	.long	.LVL860
	.value	0x1
	.byte	0x56
	.long	.LVL860
	.long	.LVL861
	.value	0x1
	.byte	0x50
	.long	.LVL862
	.long	.LVL886
	.value	0x1
	.byte	0x56
	.long	.LVL887
	.long	.LVL888
	.value	0x1
	.byte	0x56
	.long	.LVL896
	.long	.LVL913
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST369:
	.long	.LVL865
	.long	.LVL884
	.value	0x1
	.byte	0x55
	.long	.LVL896
	.long	.LVL897
	.value	0x1
	.byte	0x55
	.long	.LVL911
	.long	.LVL916
	.value	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
.LLST370:
	.long	.LVL866
	.long	.LVL868
	.value	0x1
	.byte	0x57
	.long	.LVL869
	.long	.LVL897
	.value	0x1
	.byte	0x57
	.long	.LVL911
	.long	.LVL915
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST371:
	.long	.LVL867
	.long	.LVL868
	.value	0x1
	.byte	0x53
	.long	.LVL870
	.long	.LVL897
	.value	0x1
	.byte	0x53
	.long	.LVL911
	.long	.LVL914
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST372:
	.long	.LVL884
	.long	.LVL897
	.value	0x1
	.byte	0x55
	.long	.LVL911
	.long	.LVL916
	.value	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
.LLST373:
	.long	.LVL886
	.long	.LVL897
	.value	0x1
	.byte	0x56
	.long	.LVL911
	.long	.LVL913
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST374:
	.long	.LVL872
	.long	.LVL873
	.value	0x1
	.byte	0x52
	.long	.LVL876
	.long	.LVL877
	.value	0x1
	.byte	0x52
	.long	.LVL896
	.long	.LVL897
	.value	0x1
	.byte	0x52
	.long	.LVL911
	.long	.LFE156
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST375:
	.long	.LVL875
	.long	.LVL877
	.value	0x1
	.byte	0x52
	.long	.LVL896
	.long	.LVL897
	.value	0x1
	.byte	0x52
	.long	.LVL911
	.long	.LFE156
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST376:
	.long	.LVL863
	.long	.LVL864
	.value	0x1
	.byte	0x50
	.long	.LVL871
	.long	.LVL873
	.value	0x1
	.byte	0x50
	.long	.LVL874
	.long	.LVL877
	.value	0x1
	.byte	0x50
	.long	.LVL878
	.long	.LVL880
	.value	0x1
	.byte	0x52
	.long	.LVL880
	.long	.LVL882
	.value	0x1
	.byte	0x50
	.long	.LVL882
	.long	.LVL883
	.value	0x1
	.byte	0x52
	.long	.LVL892
	.long	.LVL895
	.value	0x1
	.byte	0x50
	.long	.LVL896
	.long	.LVL897
	.value	0x1
	.byte	0x50
	.long	.LVL899
	.long	.LVL900
	.value	0x1
	.byte	0x50
	.long	.LVL907
	.long	.LVL908
	.value	0x1
	.byte	0x50
	.long	.LVL911
	.long	.LVL912
	.value	0x1
	.byte	0x50
	.long	.LVL912
	.long	.LFE156
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST377:
	.long	.LVL879
	.long	.LVL880
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST378:
	.long	.LVL881
	.long	.LVL883
	.value	0x1
	.byte	0x51
	.long	.LVL911
	.long	.LFE156
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST379:
	.long	.LVL885
	.long	.LVL889
	.value	0x1
	.byte	0x51
	.long	.LVL890
	.long	.LVL891
	.value	0x1
	.byte	0x51
	.long	.LVL893
	.long	.LVL894
	.value	0x1
	.byte	0x51
	.long	.LVL896
	.long	.LVL897
	.value	0x1
	.byte	0x51
	.long	.LVL911
	.long	.LFE156
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST380:
	.long	.LVL898
	.long	.LVL907
	.value	0x1
	.byte	0x51
	.long	.LVL911
	.long	.LFE156
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST381:
	.long	.LVL901
	.long	.LVL904
	.value	0x1
	.byte	0x50
	.long	.LVL905
	.long	.LVL907
	.value	0x1
	.byte	0x50
	.long	.LVL911
	.long	.LVL912
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST382:
	.long	.LVL902
	.long	.LVL907
	.value	0x1
	.byte	0x53
	.long	.LVL911
	.long	.LVL914
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST383:
	.long	.LVL904
	.long	.LVL905
	.value	0x1
	.byte	0x50
	.long	.LVL911
	.long	.LVL912
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST384:
	.long	.LVL909
	.long	.LVL910
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST385:
	.long	.LFB325
	.long	.LFE325
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST386:
	.long	.LVL917
	.long	.LVL918
	.value	0x1
	.byte	0x50
	.long	.LVL918
	.long	.LVL919
	.value	0x1
	.byte	0x53
	.long	.LVL919
	.long	.LVL920
	.value	0x1
	.byte	0x50
	.long	.LVL920
	.long	.LVL923
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST387:
	.long	.LVL920
	.long	.LVL922
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST388:
	.long	.LFB75
	.long	.LFE75
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST389:
	.long	.LVL924
	.long	.LVL925
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST390:
	.long	.LFB870
	.long	.LFE870
	.value	0x2
	.byte	0x74
	.sleb128 44
	.long	0x0
	.long	0x0
.LLST391:
	.long	.LVL926
	.long	.LVL930
	.value	0x1
	.byte	0x50
	.long	.LVL932
	.long	.LVL933
	.value	0x1
	.byte	0x50
	.long	.LVL935
	.long	.LVL984
	.value	0x1
	.byte	0x50
	.long	.LVL985
	.long	.LVL987
	.value	0x1
	.byte	0x50
	.long	.LVL989
	.long	.LVL990
	.value	0x1
	.byte	0x50
	.long	.LVL990
	.long	.LVL991
	.value	0x1
	.byte	0x57
	.long	.LVL997
	.long	.LVL998
	.value	0x1
	.byte	0x50
	.long	.LVL999
	.long	.LVL1002
	.value	0x1
	.byte	0x50
	.long	.LVL1006
	.long	.LVL1007
	.value	0x1
	.byte	0x50
	.long	.LVL1012
	.long	.LVL1013
	.value	0x1
	.byte	0x50
	.long	.LVL1016
	.long	.LVL1022
	.value	0x1
	.byte	0x50
	.long	.LVL1024
	.long	.LFE870
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST392:
	.long	.LVL936
	.long	.LVL938
	.value	0x1
	.byte	0x52
	.long	.LVL941
	.long	.LVL942
	.value	0x1
	.byte	0x52
	.long	.LVL943
	.long	.LVL944
	.value	0x1
	.byte	0x52
	.long	.LVL945
	.long	.LVL946
	.value	0x1
	.byte	0x52
	.long	.LVL947
	.long	.LVL948
	.value	0x1
	.byte	0x52
	.long	.LVL949
	.long	.LVL953
	.value	0x1
	.byte	0x52
	.long	.LVL954
	.long	.LVL958
	.value	0x1
	.byte	0x52
	.long	.LVL959
	.long	.LVL963
	.value	0x1
	.byte	0x52
	.long	.LVL964
	.long	.LVL968
	.value	0x1
	.byte	0x52
	.long	.LVL970
	.long	.LVL971
	.value	0x1
	.byte	0x52
	.long	.LVL975
	.long	.LVL976
	.value	0x1
	.byte	0x52
	.long	.LVL1020
	.long	.LVL1023
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST393:
	.long	.LVL937
	.long	.LVL938
	.value	0x1
	.byte	0x56
	.long	.LVL939
	.long	.LVL940
	.value	0x1
	.byte	0x56
	.long	.LVL952
	.long	.LVL953
	.value	0x1
	.byte	0x56
	.long	.LVL957
	.long	.LVL958
	.value	0x1
	.byte	0x56
	.long	.LVL962
	.long	.LVL963
	.value	0x1
	.byte	0x56
	.long	.LVL967
	.long	.LVL968
	.value	0x1
	.byte	0x56
	.long	.LVL969
	.long	.LVL971
	.value	0x1
	.byte	0x56
	.long	.LVL972
	.long	.LVL973
	.value	0x1
	.byte	0x56
	.long	.LVL974
	.long	.LVL976
	.value	0x1
	.byte	0x56
	.long	.LVL977
	.long	.LVL978
	.value	0x1
	.byte	0x56
	.long	.LVL1020
	.long	.LVL1026
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST394:
	.long	.LVL931
	.long	.LVL932
	.value	0x1
	.byte	0x53
	.long	.LVL950
	.long	.LVL951
	.value	0x1
	.byte	0x53
	.long	.LVL955
	.long	.LVL956
	.value	0x1
	.byte	0x53
	.long	.LVL960
	.long	.LVL961
	.value	0x1
	.byte	0x53
	.long	.LVL965
	.long	.LVL966
	.value	0x1
	.byte	0x53
	.long	.LVL979
	.long	.LVL980
	.value	0x1
	.byte	0x53
	.long	.LVL981
	.long	.LVL982
	.value	0x1
	.byte	0x53
	.long	.LVL1020
	.long	.LVL1025
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST395:
	.long	.LVL927
	.long	.LVL933
	.value	0x1
	.byte	0x52
	.long	.LVL935
	.long	.LVL936
	.value	0x1
	.byte	0x52
	.long	.LVL938
	.long	.LVL941
	.value	0x1
	.byte	0x52
	.long	.LVL942
	.long	.LVL943
	.value	0x1
	.byte	0x52
	.long	.LVL944
	.long	.LVL945
	.value	0x1
	.byte	0x52
	.long	.LVL946
	.long	.LVL947
	.value	0x1
	.byte	0x52
	.long	.LVL948
	.long	.LVL949
	.value	0x1
	.byte	0x52
	.long	.LVL953
	.long	.LVL954
	.value	0x1
	.byte	0x52
	.long	.LVL958
	.long	.LVL959
	.value	0x1
	.byte	0x52
	.long	.LVL963
	.long	.LVL964
	.value	0x1
	.byte	0x52
	.long	.LVL968
	.long	.LVL970
	.value	0x1
	.byte	0x52
	.long	.LVL971
	.long	.LVL975
	.value	0x1
	.byte	0x52
	.long	.LVL976
	.long	.LVL983
	.value	0x1
	.byte	0x52
	.long	.LVL985
	.long	.LVL987
	.value	0x1
	.byte	0x52
	.long	.LVL989
	.long	.LVL1014
	.value	0x1
	.byte	0x52
	.long	.LVL1016
	.long	.LVL1023
	.value	0x1
	.byte	0x52
	.long	.LVL1024
	.long	.LFE870
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST396:
	.long	.LVL928
	.long	.LVL934
	.value	0x1
	.byte	0x56
	.long	.LVL935
	.long	.LVL937
	.value	0x1
	.byte	0x56
	.long	.LVL938
	.long	.LVL939
	.value	0x1
	.byte	0x56
	.long	.LVL940
	.long	.LVL952
	.value	0x1
	.byte	0x56
	.long	.LVL953
	.long	.LVL957
	.value	0x1
	.byte	0x56
	.long	.LVL958
	.long	.LVL962
	.value	0x1
	.byte	0x56
	.long	.LVL963
	.long	.LVL967
	.value	0x1
	.byte	0x56
	.long	.LVL968
	.long	.LVL969
	.value	0x1
	.byte	0x56
	.long	.LVL971
	.long	.LVL972
	.value	0x1
	.byte	0x56
	.long	.LVL973
	.long	.LVL974
	.value	0x1
	.byte	0x56
	.long	.LVL976
	.long	.LVL977
	.value	0x1
	.byte	0x56
	.long	.LVL978
	.long	.LVL1026
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST397:
	.long	.LVL929
	.long	.LVL931
	.value	0x1
	.byte	0x53
	.long	.LVL932
	.long	.LVL950
	.value	0x1
	.byte	0x53
	.long	.LVL951
	.long	.LVL955
	.value	0x1
	.byte	0x53
	.long	.LVL956
	.long	.LVL960
	.value	0x1
	.byte	0x53
	.long	.LVL961
	.long	.LVL965
	.value	0x1
	.byte	0x53
	.long	.LVL966
	.long	.LVL979
	.value	0x1
	.byte	0x53
	.long	.LVL980
	.long	.LVL981
	.value	0x1
	.byte	0x53
	.long	.LVL982
	.long	.LVL988
	.value	0x1
	.byte	0x53
	.long	.LVL989
	.long	.LVL1021
	.value	0x1
	.byte	0x53
	.long	.LVL1024
	.long	.LVL1025
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST398:
	.long	.LVL1000
	.long	.LVL1001
	.value	0x1
	.byte	0x51
	.long	.LVL1011
	.long	.LVL1015
	.value	0x1
	.byte	0x51
	.long	.LVL1016
	.long	.LVL1019
	.value	0x1
	.byte	0x51
	.long	.LVL1020
	.long	.LFE870
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST399:
	.long	.LVL992
	.long	.LVL1000
	.value	0x1
	.byte	0x51
	.long	.LVL1001
	.long	.LVL1011
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST400:
	.long	.LVL993
	.long	.LVL994
	.value	0x1
	.byte	0x50
	.long	.LVL1010
	.long	.LVL1012
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST401:
	.long	.LVL995
	.long	.LVL996
	.value	0x1
	.byte	0x50
	.long	.LVL1010
	.long	.LVL1012
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST402:
	.long	.LVL998
	.long	.LVL999
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST403:
	.long	.LVL1002
	.long	.LVL1003
	.value	0x1
	.byte	0x50
	.long	.LVL1004
	.long	.LVL1005
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST404:
	.long	.LVL1003
	.long	.LVL1004
	.value	0x1
	.byte	0x50
	.long	.LVL1010
	.long	.LVL1012
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST405:
	.long	.LVL1005
	.long	.LVL1006
	.value	0x1
	.byte	0x50
	.long	.LVL1010
	.long	.LVL1012
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST406:
	.long	.LVL1007
	.long	.LVL1008
	.value	0x1
	.byte	0x50
	.long	.LVL1009
	.long	.LVL1010
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST407:
	.long	.LVL1008
	.long	.LVL1009
	.value	0x1
	.byte	0x50
	.long	.LVL1010
	.long	.LVL1012
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST408:
	.long	.LVL1010
	.long	.LVL1012
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST409:
	.long	.LVL1017
	.long	.LVL1027
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST410:
	.long	.LFB871
	.long	.LFE871
	.value	0x2
	.byte	0x74
	.sleb128 16
	.long	0x0
	.long	0x0
.LLST411:
	.long	.LVL1028
	.long	.LVL1029
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST412:
	.long	.LVL1030
	.long	.LVL1033
	.value	0x1
	.byte	0x50
	.long	.LVL1033
	.long	.LFE871
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST413:
	.long	.LVL1030
	.long	.LVL1033
	.value	0x1
	.byte	0x51
	.long	.LVL1033
	.long	.LFE871
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST414:
	.long	.LFB2276
	.long	.LFE2276
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST415:
	.long	.LVL1034
	.long	.LVL1035
	.value	0x1
	.byte	0x50
	.long	.LVL1035
	.long	.LVL1038
	.value	0x1
	.byte	0x53
	.long	.LVL1039
	.long	.LVL1042
	.value	0x1
	.byte	0x53
	.long	.LVL1042
	.long	.LVL1043
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST416:
	.long	.LVL1036
	.long	.LVL1037
	.value	0x1
	.byte	0x50
	.long	.LVL1039
	.long	.LVL1041
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST417:
	.long	.LFB2279
	.long	.LFE2279
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST418:
	.long	.LVL1044
	.long	.LVL1045
	.value	0x1
	.byte	0x50
	.long	.LVL1045
	.long	.LVL1103
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST419:
	.long	.LVL1046
	.long	.LVL1102
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST420:
	.long	.LVL1085
	.long	.LVL1104
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST421:
	.long	.LVL1047
	.long	.LVL1050
	.value	0x1
	.byte	0x50
	.long	.LVL1053
	.long	.LVL1065
	.value	0x1
	.byte	0x50
	.long	.LVL1070
	.long	.LVL1076
	.value	0x1
	.byte	0x50
	.long	.LVL1083
	.long	.LVL1084
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST422:
	.long	.LVL1047
	.long	.LVL1052
	.value	0x1
	.byte	0x51
	.long	.LVL1053
	.long	.LVL1059
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST423:
	.long	.LVL1047
	.long	.LVL1048
	.value	0x1
	.byte	0x50
	.long	.LVL1050
	.long	.LVL1051
	.value	0x1
	.byte	0x50
	.long	.LVL1053
	.long	.LVL1054
	.value	0x1
	.byte	0x50
	.long	.LVL1058
	.long	.LVL1065
	.value	0x1
	.byte	0x50
	.long	.LVL1070
	.long	.LVL1076
	.value	0x1
	.byte	0x50
	.long	.LVL1083
	.long	.LVL1084
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST424:
	.long	.LVL1060
	.long	.LVL1065
	.value	0x1
	.byte	0x52
	.long	.LVL1065
	.long	.LVL1066
	.value	0x1
	.byte	0x50
	.long	.LVL1068
	.long	.LVL1070
	.value	0x1
	.byte	0x50
	.long	.LVL1070
	.long	.LVL1071
	.value	0x1
	.byte	0x52
	.long	.LVL1071
	.long	.LVL1076
	.value	0x1
	.byte	0x50
	.long	.LVL1083
	.long	.LVL1084
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST425:
	.long	.LVL1063
	.long	.LVL1067
	.value	0x1
	.byte	0x57
	.long	.LVL1068
	.long	.LVL1074
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST426:
	.long	.LVL1071
	.long	.LVL1076
	.value	0x1
	.byte	0x52
	.long	.LVL1076
	.long	.LVL1077
	.value	0x1
	.byte	0x50
	.long	.LVL1081
	.long	.LVL1083
	.value	0x1
	.byte	0x50
	.long	.LVL1083
	.long	.LVL1086
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST427:
	.long	.LVL1074
	.long	.LVL1080
	.value	0x1
	.byte	0x57
	.long	.LVL1081
	.long	.LVL1085
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST428:
	.long	.LVL1077
	.long	.LVL1079
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST429:
	.long	.LVL1085
	.long	.LVL1087
	.value	0x1
	.byte	0x52
	.long	.LVL1087
	.long	.LVL1088
	.value	0x1
	.byte	0x50
	.long	.LVL1091
	.long	.LVL1097
	.value	0x1
	.byte	0x52
	.long	.LVL1098
	.long	.LVL1101
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST430:
	.long	.LVL1088
	.long	.LVL1090
	.value	0x1
	.byte	0x50
	.long	.LVL1091
	.long	.LVL1093
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST431:
	.long	.LVL1095
	.long	.LVL1097
	.value	0x1
	.byte	0x50
	.long	.LVL1099
	.long	.LVL1100
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST432:
	.long	.LFB1120
	.long	.LFE1120
	.value	0x2
	.byte	0x74
	.sleb128 16
	.long	0x0
	.long	0x0
.LLST433:
	.long	.LVL1111
	.long	.LVL1112
	.value	0x1
	.byte	0x50
	.long	.LVL1114
	.long	.LVL1116
	.value	0x1
	.byte	0x50
	.long	.LVL1119
	.long	.LVL1120
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST434:
	.long	.LVL1120
	.long	.LVL1122
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST435:
	.long	.LVL1106
	.long	.LVL1107
	.value	0x1
	.byte	0x50
	.long	.LVL1109
	.long	.LVL1110
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST436:
	.long	.LVL1105
	.long	.LVL1106
	.value	0x1
	.byte	0x50
	.long	.LVL1109
	.long	.LVL1110
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST437:
	.long	.LVL1107
	.long	.LVL1108
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST438:
	.long	.LVL1110
	.long	.LVL1111
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST439:
	.long	.LVL1113
	.long	.LVL1114
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST440:
	.long	.LVL1112
	.long	.LVL1113
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST441:
	.long	.LVL1115
	.long	.LVL1121
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST442:
	.long	.LVL1117
	.long	.LVL1118
	.value	0x1
	.byte	0x50
	.long	.LVL1119
	.long	.LVL1120
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST443:
	.long	.LFB665
	.long	.LFE665
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST444:
	.long	.LVL1123
	.long	.LVL1125
	.value	0x1
	.byte	0x50
	.long	.LVL1125
	.long	.LVL1126
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST445:
	.long	.LVL1124
	.long	.LVL1131
	.value	0x1
	.byte	0x51
	.long	.LVL1132
	.long	.LFE665
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST446:
	.long	.LVL1127
	.long	.LVL1128
	.value	0x1
	.byte	0x50
	.long	.LVL1129
	.long	.LVL1130
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST447:
	.long	.LFB675
	.long	.LFE675
	.value	0x2
	.byte	0x74
	.sleb128 56
	.long	0x0
	.long	0x0
.LLST448:
	.long	.LVL1133
	.long	.LVL1134
	.value	0x1
	.byte	0x50
	.long	.LVL1134
	.long	.LVL1163
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST449:
	.long	.LVL1133
	.long	.LVL1136
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST450:
	.long	.LVL1133
	.long	.LVL1137
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST451:
	.long	.LVL1138
	.long	.LVL1152
	.value	0x1
	.byte	0x55
	.long	.LVL1153
	.long	.LVL1158
	.value	0x1
	.byte	0x55
	.long	.LVL1160
	.long	.LVL1166
	.value	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
.LLST452:
	.long	.LVL1151
	.long	.LVL1155
	.value	0x1
	.byte	0x50
	.long	.LVL1159
	.long	.LVL1162
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST453:
	.long	.LVL1135
	.long	.LVL1139
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST454:
	.long	.LVL1137
	.long	.LVL1140
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST455:
	.long	.LVL1142
	.long	.LVL1144
	.value	0x1
	.byte	0x51
	.long	.LVL1147
	.long	.LVL1150
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST456:
	.long	.LVL1143
	.long	.LVL1144
	.value	0x1
	.byte	0x56
	.long	.LVL1147
	.long	.LVL1156
	.value	0x1
	.byte	0x56
	.long	.LVL1157
	.long	.LVL1164
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST457:
	.long	.LVL1148
	.long	.LVL1149
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST458:
	.long	.LVL1146
	.long	.LVL1150
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST459:
	.long	.LVL1141
	.long	.LVL1145
	.value	0x1
	.byte	0x57
	.long	.LVL1147
	.long	.LVL1165
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST460:
	.long	.LFB668
	.long	.LFE668
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST461:
	.long	.LVL1167
	.long	.LVL1169
	.value	0x1
	.byte	0x50
	.long	.LVL1169
	.long	.LVL1175
	.value	0x1
	.byte	0x51
	.long	.LVL1175
	.long	.LVL1178
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST462:
	.long	.LVL1168
	.long	.LVL1170
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST463:
	.long	.LVL1172
	.long	.LVL1176
	.value	0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
.LLST464:
	.long	.LFB672
	.long	.LFE672
	.value	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
.LLST465:
	.long	.LVL1179
	.long	.LVL1182
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST466:
	.long	.LVL1179
	.long	.LVL1180
	.value	0x1
	.byte	0x52
	.long	.LVL1180
	.long	.LVL1193
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST467:
	.long	.LVL1184
	.long	.LVL1185
	.value	0x1
	.byte	0x50
	.long	.LVL1188
	.long	.LVL1189
	.value	0x1
	.byte	0x50
	.long	.LVL1190
	.long	.LVL1191
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST468:
	.long	.LVL1186
	.long	.LVL1194
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST469:
	.long	.LVL1180
	.long	.LVL1183
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST470:
	.long	.LVL1181
	.long	.LVL1192
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST471:
	.long	.LFB680
	.long	.LFE680
	.value	0x3
	.byte	0x75
	.sleb128 -4
	.byte	0x6
	.long	0x0
	.long	0x0
.LLST472:
	.long	.LVL1195
	.long	.LVL1196
	.value	0x1
	.byte	0x50
	.long	.LVL1196
	.long	.LVL1224
	.value	0x1
	.byte	0x53
	.long	.LVL1226
	.long	.LFE680
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST473:
	.long	.LVL1195
	.long	.LVL1197
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST474:
	.long	.LVL1197
	.long	.LVL1201
	.value	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	.LVL1203
	.long	.LVL1204
	.value	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x51
	.byte	0x93
	.uleb128 0x4
	.long	.LVL1204
	.long	.LVL1206
	.value	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
.LLST475:
	.long	.LVL1214
	.long	.LVL1215
	.value	0x1
	.byte	0x51
	.long	.LVL1215
	.long	.LVL1216
	.value	0x1
	.byte	0x50
	.long	.LVL1216
	.long	.LVL1217
	.value	0x1
	.byte	0x51
	.long	.LVL1218
	.long	.LVL1219
	.value	0x1
	.byte	0x51
	.long	.LVL1219
	.long	.LVL1220
	.value	0x1
	.byte	0x50
	.long	.LVL1220
	.long	.LVL1221
	.value	0x1
	.byte	0x51
	.long	.LVL1221
	.long	.LVL1222
	.value	0x1
	.byte	0x50
	.long	.LVL1222
	.long	.LVL1227
	.value	0x1
	.byte	0x51
	.long	.LVL1228
	.long	.LFE680
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST476:
	.long	.LVL1198
	.long	.LVL1200
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST477:
	.long	.LVL1207
	.long	.LVL1213
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST478:
	.long	.LVL1210
	.long	.LVL1211
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST479:
	.long	.LVL1209
	.long	.LVL1216
	.value	0x1
	.byte	0x56
	.long	.LVL1216
	.long	.LVL1217
	.value	0x1
	.byte	0x50
	.long	.LVL1223
	.long	.LVL1225
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST480:
	.long	.LVL1208
	.long	.LVL1212
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST481:
	.long	.LFB671
	.long	.LFE671
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST482:
	.long	.LVL1229
	.long	.LVL1231
	.value	0x1
	.byte	0x50
	.long	.LVL1267
	.long	.LVL1268
	.value	0x1
	.byte	0x50
	.long	.LVL1273
	.long	.LVL1274
	.value	0x1
	.byte	0x50
	.long	.LVL1275
	.long	.LVL1276
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST483:
	.long	.LVL1230
	.long	.LVL1255
	.value	0x1
	.byte	0x56
	.long	.LVL1263
	.long	.LVL1264
	.value	0x1
	.byte	0x56
	.long	.LVL1265
	.long	.LVL1278
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST484:
	.long	.LVL1244
	.long	.LVL1246
	.value	0x1
	.byte	0x50
	.long	.LVL1248
	.long	.LVL1249
	.value	0x1
	.byte	0x50
	.long	.LVL1251
	.long	.LVL1252
	.value	0x1
	.byte	0x50
	.long	.LVL1265
	.long	.LVL1266
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST485:
	.long	.LVL1231
	.long	.LVL1234
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST486:
	.long	.LVL1232
	.long	.LVL1245
	.value	0x1
	.byte	0x57
	.long	.LVL1251
	.long	.LVL1258
	.value	0x1
	.byte	0x57
	.long	.LVL1265
	.long	.LVL1267
	.value	0x1
	.byte	0x57
	.long	.LVL1275
	.long	.LVL1279
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST487:
	.long	.LVL1233
	.long	.LVL1267
	.value	0x1
	.byte	0x53
	.long	.LVL1275
	.long	.LVL1277
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST488:
	.long	.LVL1234
	.long	.LVL1235
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST489:
	.long	.LVL1236
	.long	.LVL1238
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST490:
	.long	.LVL1237
	.long	.LVL1240
	.value	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	.LVL1241
	.long	.LVL1242
	.value	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
.LLST491:
	.long	.LVL1245
	.long	.LVL1247
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST492:
	.long	.LVL1249
	.long	.LVL1250
	.value	0x1
	.byte	0x50
	.long	.LVL1253
	.long	.LVL1254
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST493:
	.long	.LVL1254
	.long	.LVL1256
	.value	0x1
	.byte	0x50
	.long	.LVL1265
	.long	.LVL1266
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST494:
	.long	.LVL1258
	.long	.LVL1267
	.value	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.long	.LVL1275
	.long	.LVL1278
	.value	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
.LLST495:
	.long	.LVL1255
	.long	.LVL1257
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST496:
	.long	.LVL1261
	.long	.LVL1262
	.value	0x1
	.byte	0x50
	.long	.LVL1265
	.long	.LVL1266
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST497:
	.long	.LVL1271
	.long	.LVL1272
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST498:
	.long	.LVL1268
	.long	.LVL1271
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST499:
	.long	.LVL1269
	.long	.LVL1270
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST500:
	.long	.LFB1330
	.long	.LFE1330
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST501:
	.long	.LVL1280
	.long	.LVL1285
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST502:
	.long	.LVL1281
	.long	.LVL1282
	.value	0x1
	.byte	0x50
	.long	.LVL1283
	.long	.LVL1284
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST503:
	.long	.LFB1333
	.long	.LFE1333
	.value	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
.LLST504:
	.long	.LVL1286
	.long	.LVL1288
	.value	0x1
	.byte	0x50
	.long	.LVL1288
	.long	.LVL1292
	.value	0x1
	.byte	0x53
	.long	.LVL1306
	.long	.LVL1311
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST505:
	.long	.LVL1286
	.long	.LVL1289
	.value	0x1
	.byte	0x52
	.long	.LVL1289
	.long	.LVL1312
	.value	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
.LLST506:
	.long	.LVL1290
	.long	.LVL1291
	.value	0x1
	.byte	0x57
	.long	.LVL1291
	.long	.LVL1292
	.value	0x1
	.byte	0x50
	.long	.LVL1292
	.long	.LVL1294
	.value	0x1
	.byte	0x57
	.long	.LVL1294
	.long	.LVL1295
	.value	0x1
	.byte	0x50
	.long	.LVL1295
	.long	.LVL1303
	.value	0x1
	.byte	0x57
	.long	.LVL1303
	.long	.LVL1304
	.value	0x1
	.byte	0x50
	.long	.LVL1304
	.long	.LVL1307
	.value	0x1
	.byte	0x57
	.long	.LVL1307
	.long	.LVL1308
	.value	0x1
	.byte	0x50
	.long	.LVL1308
	.long	.LVL1310
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST507:
	.long	.LVL1287
	.long	.LVL1309
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST508:
	.long	.LVL1293
	.long	.LVL1311
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST509:
	.long	.LVL1297
	.long	.LVL1300
	.value	0x1
	.byte	0x52
	.long	.LVL1301
	.long	.LVL1302
	.value	0x1
	.byte	0x52
	.long	.LVL1304
	.long	.LFE1333
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST510:
	.long	.LVL1298
	.long	.LVL1299
	.value	0x1
	.byte	0x50
	.long	.LVL1304
	.long	.LVL1305
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST511:
	.long	.LVL1297
	.long	.LVL1298
	.value	0x1
	.byte	0x50
	.long	.LVL1305
	.long	.LVL1307
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST512:
	.long	.LFB1336
	.long	.LFE1336
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST513:
	.long	.LVL1313
	.long	.LVL1315
	.value	0x1
	.byte	0x50
	.long	.LVL1315
	.long	.LVL1334
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST514:
	.long	.LVL1313
	.long	.LVL1316
	.value	0x1
	.byte	0x52
	.long	.LVL1316
	.long	.LVL1333
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST515:
	.long	.LVL1313
	.long	.LVL1314
	.value	0x1
	.byte	0x51
	.long	.LVL1314
	.long	.LVL1332
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST516:
	.long	.LVL1314
	.long	.LVL1319
	.value	0x1
	.byte	0x51
	.long	.LVL1326
	.long	.LVL1328
	.value	0x1
	.byte	0x51
	.long	.LVL1329
	.long	.LVL1330
	.value	0x1
	.byte	0x51
	.long	.LVL1331
	.long	.LFE1336
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST517:
	.long	.LVL1317
	.long	.LVL1318
	.value	0x1
	.byte	0x50
	.long	.LVL1326
	.long	.LVL1327
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST518:
	.long	.LVL1318
	.long	.LVL1320
	.value	0x1
	.byte	0x50
	.long	.LVL1321
	.long	.LVL1322
	.value	0x1
	.byte	0x50
	.long	.LVL1323
	.long	.LVL1325
	.value	0x1
	.byte	0x50
	.long	.LVL1330
	.long	.LVL1331
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST519:
	.long	.LFB1337
	.long	.LFE1337
	.value	0x2
	.byte	0x74
	.sleb128 16
	.long	0x0
	.long	0x0
.LLST520:
	.long	.LVL1335
	.long	.LVL1338
	.value	0x1
	.byte	0x50
	.long	.LVL1338
	.long	.LVL1340
	.value	0x1
	.byte	0x53
	.long	.LVL1340
	.long	.LVL1341
	.value	0x1
	.byte	0x50
	.long	.LVL1341
	.long	.LVL1350
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST521:
	.long	.LVL1335
	.long	.LVL1336
	.value	0x1
	.byte	0x52
	.long	.LVL1336
	.long	.LVL1352
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST522:
	.long	.LVL1335
	.long	.LVL1336
	.value	0x1
	.byte	0x51
	.long	.LVL1336
	.long	.LVL1351
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST523:
	.long	.LVL1339
	.long	.LVL1340
	.value	0x1
	.byte	0x50
	.long	.LVL1342
	.long	.LVL1343
	.value	0x1
	.byte	0x50
	.long	.LVL1344
	.long	.LVL1345
	.value	0x1
	.byte	0x50
	.long	.LVL1346
	.long	.LVL1347
	.value	0x1
	.byte	0x50
	.long	.LVL1348
	.long	.LVL1349
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST524:
	.long	.LVL1337
	.long	.LVL1340
	.value	0x2
	.byte	0x74
	.sleb128 3
	.long	.LVL1344
	.long	.LFE1337
	.value	0x2
	.byte	0x74
	.sleb128 3
	.long	0x0
	.long	0x0
.LLST525:
	.long	.LFB1338
	.long	.LFE1338
	.value	0x2
	.byte	0x74
	.sleb128 36
	.long	0x0
	.long	0x0
.LLST526:
	.long	.LVL1353
	.long	.LVL1354
	.value	0x1
	.byte	0x50
	.long	.LVL1354
	.long	.LVL1414
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST527:
	.long	.LVL1353
	.long	.LVL1360
	.value	0x1
	.byte	0x52
	.long	.LVL1360
	.long	.LVL1391
	.value	0x1
	.byte	0x57
	.long	.LVL1392
	.long	.LVL1394
	.value	0x1
	.byte	0x52
	.long	.LVL1408
	.long	.LVL1415
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST528:
	.long	.LVL1353
	.long	.LVL1361
	.value	0x1
	.byte	0x51
	.long	.LVL1361
	.long	.LVL1413
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST529:
	.long	.LVL1410
	.long	.LVL1412
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST530:
	.long	.LVL1359
	.long	.LVL1364
	.value	0x2
	.byte	0x74
	.sleb128 14
	.long	.LVL1364
	.long	.LVL1365
	.value	0x2
	.byte	0x91
	.sleb128 -22
	.long	.LVL1365
	.long	.LVL1366
	.value	0x2
	.byte	0x74
	.sleb128 14
	.long	.LVL1366
	.long	.LFE1338
	.value	0x2
	.byte	0x91
	.sleb128 -22
	.long	0x0
	.long	0x0
.LLST531:
	.long	.LVL1362
	.long	.LVL1363
	.value	0x1
	.byte	0x51
	.long	.LVL1363
	.long	.LVL1367
	.value	0x1
	.byte	0x50
	.long	.LVL1367
	.long	.LVL1368
	.value	0x1
	.byte	0x51
	.long	.LVL1369
	.long	.LVL1370
	.value	0x1
	.byte	0x51
	.long	.LVL1370
	.long	.LVL1371
	.value	0x1
	.byte	0x50
	.long	.LVL1372
	.long	.LVL1373
	.value	0x1
	.byte	0x50
	.long	.LVL1374
	.long	.LVL1375
	.value	0x1
	.byte	0x51
	.long	.LVL1375
	.long	.LVL1376
	.value	0x1
	.byte	0x50
	.long	.LVL1377
	.long	.LVL1379
	.value	0x1
	.byte	0x50
	.long	.LVL1380
	.long	.LVL1381
	.value	0x1
	.byte	0x50
	.long	.LVL1382
	.long	.LVL1383
	.value	0x1
	.byte	0x51
	.long	.LVL1383
	.long	.LVL1384
	.value	0x1
	.byte	0x50
	.long	.LVL1384
	.long	.LVL1385
	.value	0x1
	.byte	0x51
	.long	.LVL1386
	.long	.LVL1387
	.value	0x1
	.byte	0x51
	.long	.LVL1387
	.long	.LVL1388
	.value	0x1
	.byte	0x50
	.long	.LVL1388
	.long	.LVL1390
	.value	0x1
	.byte	0x51
	.long	.LVL1390
	.long	.LVL1391
	.value	0x1
	.byte	0x50
	.long	.LVL1391
	.long	.LVL1393
	.value	0x1
	.byte	0x51
	.long	.LVL1395
	.long	.LVL1397
	.value	0x1
	.byte	0x55
	.long	.LVL1397
	.long	.LVL1399
	.value	0x1
	.byte	0x50
	.long	.LVL1399
	.long	.LVL1400
	.value	0x1
	.byte	0x55
	.long	.LVL1400
	.long	.LVL1401
	.value	0x1
	.byte	0x51
	.long	.LVL1401
	.long	.LVL1404
	.value	0x1
	.byte	0x50
	.long	.LVL1404
	.long	.LVL1405
	.value	0x1
	.byte	0x55
	.long	.LVL1405
	.long	.LVL1406
	.value	0x1
	.byte	0x51
	.long	.LVL1406
	.long	.LVL1408
	.value	0x1
	.byte	0x50
	.long	.LVL1408
	.long	.LVL1409
	.value	0x1
	.byte	0x51
	.long	.LVL1409
	.long	.LVL1411
	.value	0x1
	.byte	0x55
	.long	.LVL1411
	.long	.LFE1338
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST532:
	.long	.LVL1355
	.long	.LVL1356
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST533:
	.long	.LVL1356
	.long	.LVL1358
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST534:
	.long	.LVL1396
	.long	.LVL1415
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST535:
	.long	.LFB786
	.long	.LFE786
	.value	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
.LLST536:
	.long	.LVL1416
	.long	.LVL1417
	.value	0x1
	.byte	0x50
	.long	.LVL1417
	.long	.LVL1463
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST537:
	.long	.LVL1418
	.long	.LVL1422
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST538:
	.long	.LVL1419
	.long	.LVL1423
	.value	0x1
	.byte	0x50
	.long	.LVL1446
	.long	.LVL1447
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST539:
	.long	.LVL1424
	.long	.LVL1429
	.value	0x1
	.byte	0x52
	.long	.LVL1461
	.long	.LFE786
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST540:
	.long	.LVL1426
	.long	.LVL1430
	.value	0x1
	.byte	0x50
	.long	.LVL1446
	.long	.LVL1447
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST541:
	.long	.LVL1425
	.long	.LVL1426
	.value	0x1
	.byte	0x50
	.long	.LVL1461
	.long	.LFE786
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST542:
	.long	.LVL1432
	.long	.LVL1433
	.value	0x2
	.byte	0x74
	.sleb128 3
	.long	.LVL1446
	.long	.LVL1450
	.value	0x2
	.byte	0x74
	.sleb128 3
	.long	.LVL1459
	.long	.LVL1460
	.value	0x2
	.byte	0x74
	.sleb128 3
	.long	.LVL1461
	.long	.LFE786
	.value	0x2
	.byte	0x74
	.sleb128 3
	.long	0x0
	.long	0x0
.LLST543:
	.long	.LVL1431
	.long	.LVL1433
	.value	0x1
	.byte	0x50
	.long	.LVL1446
	.long	.LVL1447
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST544:
	.long	.LVL1434
	.long	.LVL1435
	.value	0x2
	.byte	0x74
	.sleb128 3
	.long	.LVL1446
	.long	.LVL1450
	.value	0x2
	.byte	0x74
	.sleb128 3
	.long	.LVL1459
	.long	.LVL1460
	.value	0x2
	.byte	0x74
	.sleb128 3
	.long	.LVL1461
	.long	.LFE786
	.value	0x2
	.byte	0x74
	.sleb128 3
	.long	0x0
	.long	0x0
.LLST545:
	.long	.LVL1436
	.long	.LVL1437
	.value	0x1
	.byte	0x50
	.long	.LVL1449
	.long	.LVL1450
	.value	0x1
	.byte	0x50
	.long	.LVL1461
	.long	.LFE786
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST546:
	.long	.LVL1438
	.long	.LVL1441
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST547:
	.long	.LVL1439
	.long	.LVL1440
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST548:
	.long	.LVL1442
	.long	.LVL1443
	.value	0x1
	.byte	0x50
	.long	.LVL1449
	.long	.LVL1450
	.value	0x1
	.byte	0x50
	.long	.LVL1461
	.long	.LFE786
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST549:
	.long	.LVL1444
	.long	.LVL1445
	.value	0x1
	.byte	0x50
	.long	.LVL1449
	.long	.LVL1450
	.value	0x1
	.byte	0x50
	.long	.LVL1461
	.long	.LFE786
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST550:
	.long	.LVL1448
	.long	.LVL1450
	.value	0x1
	.byte	0x50
	.long	.LVL1459
	.long	.LVL1460
	.value	0x1
	.byte	0x50
	.long	.LVL1461
	.long	.LFE786
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST551:
	.long	.LVL1451
	.long	.LVL1460
	.value	0x1
	.byte	0x57
	.long	.LVL1462
	.long	.LVL1465
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST552:
	.long	.LVL1452
	.long	.LVL1460
	.value	0x1
	.byte	0x56
	.long	.LVL1462
	.long	.LVL1464
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST553:
	.long	.LVL1454
	.long	.LVL1457
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST554:
	.long	.LFB2439
	.long	.LFE2439
	.value	0x3
	.byte	0x75
	.sleb128 -4
	.byte	0x6
	.long	0x0
	.long	0x0
.LLST555:
	.long	.LVL1466
	.long	.LVL1467
	.value	0x1
	.byte	0x50
	.long	.LVL1467
	.long	.LVL1474
	.value	0x1
	.byte	0x52
	.long	.LVL1475
	.long	.LVL1529
	.value	0x1
	.byte	0x52
	.long	.LVL1530
	.long	.LFE2439
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST556:
	.long	.LVL1472
	.long	.LVL1473
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST557:
	.long	.LVL1484
	.long	.LVL1485
	.value	0x1
	.byte	0x51
	.long	.LVL1539
	.long	.LFE2439
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST558:
	.long	.LVL1486
	.long	.LVL1490
	.value	0x1
	.byte	0x51
	.long	.LVL1539
	.long	.LFE2439
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST559:
	.long	.LVL1491
	.long	.LVL1492
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST560:
	.long	.LVL1487
	.long	.LVL1489
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST561:
	.long	.LVL1488
	.long	.LVL1491
	.value	0x1
	.byte	0x53
	.long	.LVL1539
	.long	.LVL1541
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST562:
	.long	.LVL1476
	.long	.LVL1477
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST563:
	.long	.LVL1478
	.long	.LVL1481
	.value	0x1
	.byte	0x53
	.long	.LVL1539
	.long	.LVL1541
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST564:
	.long	.LVL1479
	.long	.LVL1482
	.value	0x1
	.byte	0x51
	.long	.LVL1539
	.long	.LFE2439
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST565:
	.long	.LVL1480
	.long	.LVL1483
	.value	0x1
	.byte	0x56
	.long	.LVL1493
	.long	.LVL1494
	.value	0x1
	.byte	0x56
	.long	.LVL1539
	.long	.LVL1542
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST566:
	.long	.LVL1495
	.long	.LVL1506
	.value	0x2
	.byte	0x75
	.sleb128 -25
	.long	.LVL1538
	.long	.LFE2439
	.value	0x2
	.byte	0x75
	.sleb128 -25
	.long	0x0
	.long	0x0
.LLST567:
	.long	.LVL1498
	.long	.LVL1501
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST568:
	.long	.LVL1496
	.long	.LVL1497
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST569:
	.long	.LVL1499
	.long	.LVL1502
	.value	0x1
	.byte	0x53
	.long	.LVL1505
	.long	.LVL1506
	.value	0x1
	.byte	0x53
	.long	.LVL1539
	.long	.LVL1541
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST570:
	.long	.LVL1500
	.long	.LVL1503
	.value	0x1
	.byte	0x51
	.long	.LVL1505
	.long	.LVL1506
	.value	0x1
	.byte	0x51
	.long	.LVL1539
	.long	.LFE2439
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST571:
	.long	.LVL1501
	.long	.LVL1504
	.value	0x1
	.byte	0x56
	.long	.LVL1505
	.long	.LVL1506
	.value	0x1
	.byte	0x56
	.long	.LVL1539
	.long	.LVL1542
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST572:
	.long	.LVL1468
	.long	.LVL1471
	.value	0x1
	.byte	0x56
	.long	.LVL1507
	.long	.LVL1520
	.value	0x1
	.byte	0x56
	.long	.LVL1539
	.long	.LVL1542
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST573:
	.long	.LVL1508
	.long	.LVL1516
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST574:
	.long	.LVL1468
	.long	.LVL1471
	.value	0x1
	.byte	0x51
	.long	.LVL1517
	.long	.LVL1520
	.value	0x1
	.byte	0x51
	.long	.LVL1539
	.long	.LFE2439
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST575:
	.long	.LVL1510
	.long	.LVL1511
	.value	0x6
	.byte	0x51
	.byte	0x93
	.uleb128 0x4
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
.LLST576:
	.long	.LVL1511
	.long	.LVL1514
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST577:
	.long	.LVL1469
	.long	.LVL1470
	.value	0x1
	.byte	0x50
	.long	.LVL1519
	.long	.LVL1520
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST578:
	.long	.LVL1468
	.long	.LVL1469
	.value	0x1
	.byte	0x50
	.long	.LVL1518
	.long	.LVL1519
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST579:
	.long	.LVL1521
	.long	.LVL1522
	.value	0x1
	.byte	0x50
	.long	.LVL1539
	.long	.LFE2439
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST580:
	.long	.LVL1523
	.long	.LVL1526
	.value	0x1
	.byte	0x56
	.long	.LVL1540
	.long	.LVL1542
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST581:
	.long	.LVL1525
	.long	.LVL1526
	.value	0x6
	.byte	0x51
	.byte	0x93
	.uleb128 0x4
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.long	.LVL1540
	.long	.LVL1541
	.value	0x6
	.byte	0x51
	.byte	0x93
	.uleb128 0x4
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
.LLST582:
	.long	.LVL1527
	.long	.LVL1528
	.value	0x1
	.byte	0x50
	.long	.LVL1539
	.long	.LFE2439
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST583:
	.long	.LVL1531
	.long	.LVL1532
	.value	0x1
	.byte	0x50
	.long	.LVL1533
	.long	.LVL1534
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST584:
	.long	.LVL1535
	.long	.LVL1537
	.value	0x1
	.byte	0x51
	.long	.LVL1539
	.long	.LFE2439
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST585:
	.long	.LVL1536
	.long	.LVL1537
	.value	0x1
	.byte	0x56
	.long	.LVL1539
	.long	.LVL1542
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST586:
	.long	.LVL1536
	.long	.LVL1537
	.value	0x1
	.byte	0x57
	.long	.LVL1539
	.long	.LVL1543
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST587:
	.long	.LFB869
	.long	.LFE869
	.value	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
.LLST588:
	.long	.LVL1544
	.long	.LVL1545
	.value	0x1
	.byte	0x50
	.long	.LVL1545
	.long	.LVL1579
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST589:
	.long	.LVL1549
	.long	.LVL1553
	.value	0x1
	.byte	0x52
	.long	.LVL1554
	.long	.LVL1558
	.value	0x1
	.byte	0x52
	.long	.LVL1567
	.long	.LVL1568
	.value	0x1
	.byte	0x52
	.long	.LVL1571
	.long	.LVL1572
	.value	0x1
	.byte	0x52
	.long	.LVL1573
	.long	.LVL1574
	.value	0x1
	.byte	0x52
	.long	.LVL1576
	.long	.LFE869
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST590:
	.long	.LVL1548
	.long	.LVL1552
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST591:
	.long	.LVL1547
	.long	.LVL1557
	.value	0x1
	.byte	0x57
	.long	.LVL1567
	.long	.LVL1578
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST592:
	.long	.LVL1555
	.long	.LVL1556
	.value	0x1
	.byte	0x50
	.long	.LVL1577
	.long	.LFE869
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST593:
	.long	.LVL1559
	.long	.LVL1562
	.value	0x1
	.byte	0x50
	.long	.LVL1562
	.long	.LVL1563
	.value	0x1
	.byte	0x51
	.long	.LVL1563
	.long	.LVL1567
	.value	0x1
	.byte	0x50
	.long	.LVL1577
	.long	.LFE869
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST594:
	.long	.LVL1560
	.long	.LVL1564
	.value	0x1
	.byte	0x55
	.long	.LVL1566
	.long	.LVL1567
	.value	0x1
	.byte	0x55
	.long	.LVL1577
	.long	.LVL1580
	.value	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
.LLST595:
	.long	.LVL1561
	.long	.LVL1565
	.value	0x1
	.byte	0x52
	.long	.LVL1566
	.long	.LVL1567
	.value	0x1
	.byte	0x52
	.long	.LVL1577
	.long	.LFE869
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST596:
	.long	.LVL1569
	.long	.LVL1570
	.value	0x1
	.byte	0x50
	.long	.LVL1577
	.long	.LFE869
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST597:
	.long	.LVL1574
	.long	.LVL1575
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST599:
	.long	.LVL1581
	.long	.LVL1582
	.value	0x1
	.byte	0x50
	.long	.LVL1583
	.long	.LVL1587
	.value	0x1
	.byte	0x50
	.long	.LVL1587
	.long	.LVL1588
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST600:
	.long	.LVL1584
	.long	.LVL1585
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST601:
	.long	.LVL1585
	.long	.LVL1587
	.value	0x1
	.byte	0x52
	.long	.LVL1587
	.long	.LFE1341
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST603:
	.long	.LVL1589
	.long	.LVL1590
	.value	0x1
	.byte	0x50
	.long	.LVL1591
	.long	.LVL1595
	.value	0x1
	.byte	0x50
	.long	.LVL1595
	.long	.LVL1596
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST604:
	.long	.LVL1592
	.long	.LVL1595
	.value	0x1
	.byte	0x51
	.long	.LVL1595
	.long	.LFE1342
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST605:
	.long	.LVL1593
	.long	.LVL1595
	.value	0x1
	.byte	0x52
	.long	.LVL1595
	.long	.LFE1342
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST606:
	.long	.LFB1472
	.long	.LFE1472
	.value	0x2
	.byte	0x74
	.sleb128 12
	.long	0x0
	.long	0x0
.LLST607:
	.long	.LVL1597
	.long	.LVL1598
	.value	0x1
	.byte	0x50
	.long	.LVL1598
	.long	.LFE1472
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST608:
	.long	.LFB1531
	.long	.LFE1531
	.value	0x2
	.byte	0x74
	.sleb128 12
	.long	0x0
	.long	0x0
.LLST609:
	.long	.LVL1599
	.long	.LVL1601
	.value	0x1
	.byte	0x50
	.long	.LVL1601
	.long	.LVL1606
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST610:
	.long	.LVL1600
	.long	.LVL1601
	.value	0x1
	.byte	0x56
	.long	.LVL1601
	.long	.LVL1602
	.value	0x1
	.byte	0x50
	.long	.LVL1603
	.long	.LVL1607
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST611:
	.long	.LVL1604
	.long	.LVL1605
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST612:
	.long	.LFB2045
	.long	.LFE2045
	.value	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
.LLST613:
	.long	.LVL1608
	.long	.LVL1610
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST614:
	.long	.LVL1609
	.long	.LVL1614
	.value	0x1
	.byte	0x57
	.long	.LVL1616
	.long	.LFE2045
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST615:
	.long	.LVL1611
	.long	.LVL1615
	.value	0x1
	.byte	0x55
	.long	.LVL1616
	.long	.LFE2045
	.value	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
.LLST616:
	.long	.LVL1621
	.long	.LVL1623
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST617:
	.long	.LVL1612
	.long	.LVL1613
	.value	0x1
	.byte	0x50
	.long	.LVL1616
	.long	.LVL1617
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST618:
	.long	.LVL1618
	.long	.LVL1619
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST619:
	.long	.LVL1620
	.long	.LVL1622
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST620:
	.long	.LFB2053
	.long	.LFE2053
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST621:
	.long	.LVL1624
	.long	.LVL1626
	.value	0x1
	.byte	0x50
	.long	.LVL1626
	.long	.LVL1633
	.value	0x1
	.byte	0x51
	.long	.LVL1634
	.long	.LVL1636
	.value	0x1
	.byte	0x51
	.long	.LVL1638
	.long	.LFE2053
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST622:
	.long	.LVL1628
	.long	.LVL1637
	.value	0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.long	.LVL1638
	.long	.LVL1639
	.value	0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
.LLST623:
	.long	.LVL1631
	.long	.LVL1632
	.value	0x1
	.byte	0x52
	.long	.LVL1635
	.long	.LVL1636
	.value	0x1
	.byte	0x52
	.long	.LVL1638
	.long	.LFE2053
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST624:
	.long	.LVL1625
	.long	.LVL1628
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST625:
	.long	.LFB2054
	.long	.LFE2054
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST626:
	.long	.LVL1641
	.long	.LVL1650
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST627:
	.long	.LVL1641
	.long	.LVL1642
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST628:
	.long	.LVL1641
	.long	.LVL1643
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST629:
	.long	.LVL1648
	.long	.LVL1660
	.value	0x1
	.byte	0x52
	.long	.LVL1675
	.long	.LVL1680
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST630:
	.long	.LVL1652
	.long	.LVL1689
	.value	0x1
	.byte	0x53
	.long	.LVL1699
	.long	.LVL1700
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST631:
	.long	.LVL1658
	.long	.LVL1686
	.value	0x1
	.byte	0x57
	.long	.LVL1699
	.long	.LVL1702
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST632:
	.long	.LVL1644
	.long	.LVL1645
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST633:
	.long	.LVL1646
	.long	.LVL1655
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST634:
	.long	.LVL1647
	.long	.LVL1648
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST635:
	.long	.LVL1651
	.long	.LVL1653
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST636:
	.long	.LVL1653
	.long	.LVL1656
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST637:
	.long	.LVL1655
	.long	.LVL1657
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST638:
	.long	.LVL1659
	.long	.LVL1660
	.value	0x1
	.byte	0x52
	.long	.LVL1661
	.long	.LVL1663
	.value	0x1
	.byte	0x52
	.long	.LVL1672
	.long	.LVL1680
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST639:
	.long	.LVL1664
	.long	.LVL1666
	.value	0x1
	.byte	0x50
	.long	.LVL1683
	.long	.LVL1684
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST640:
	.long	.LVL1659
	.long	.LVL1662
	.value	0x1
	.byte	0x50
	.long	.LVL1666
	.long	.LVL1667
	.value	0x1
	.byte	0x50
	.long	.LVL1668
	.long	.LVL1676
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST641:
	.long	.LVL1669
	.long	.LVL1670
	.value	0x1
	.byte	0x56
	.long	.LVL1671
	.long	.LVL1673
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST642:
	.long	.LVL1679
	.long	.LVL1680
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST643:
	.long	.LVL1677
	.long	.LVL1678
	.value	0x1
	.byte	0x50
	.long	.LVL1681
	.long	.LVL1682
	.value	0x1
	.byte	0x50
	.long	.LVL1683
	.long	.LVL1684
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST644:
	.long	.LVL1685
	.long	.LVL1687
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST645:
	.long	.LVL1688
	.long	.LVL1696
	.value	0x1
	.byte	0x51
	.long	.LVL1697
	.long	.LFE2054
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST646:
	.long	.LVL1691
	.long	.LVL1700
	.value	0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
.LLST647:
	.long	.LVL1689
	.long	.LVL1690
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST648:
	.long	.LVL1694
	.long	.LVL1695
	.value	0x1
	.byte	0x50
	.long	.LVL1698
	.long	.LVL1699
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST649:
	.long	.LFB2124
	.long	.LFE2124
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST650:
	.long	.LVL1703
	.long	.LVL1704
	.value	0x1
	.byte	0x50
	.long	.LVL1704
	.long	.LVL1727
	.value	0x1
	.byte	0x53
	.long	.LVL1729
	.long	.LVL1731
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST651:
	.long	.LVL1711
	.long	.LVL1713
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST652:
	.long	.LVL1705
	.long	.LVL1706
	.value	0x1
	.byte	0x50
	.long	.LVL1707
	.long	.LVL1709
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST653:
	.long	.LVL1710
	.long	.LVL1712
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST654:
	.long	.LVL1726
	.long	.LVL1729
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST655:
	.long	.LVL1722
	.long	.LVL1723
	.value	0x1
	.byte	0x50
	.long	.LVL1725
	.long	.LVL1728
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST656:
	.long	.LVL1714
	.long	.LVL1716
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST657:
	.long	.LVL1715
	.long	.LVL1718
	.value	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	.LVL1719
	.long	.LVL1720
	.value	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
.LLST658:
	.long	.LVL1724
	.long	.LVL1725
	.value	0x1
	.byte	0x52
	.long	.LVL1729
	.long	.LVL1730
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST659:
	.long	.LFB2200
	.long	.LFE2200
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST660:
	.long	.LVL1732
	.long	.LVL1734
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST661:
	.long	.LVL1733
	.long	.LVL1739
	.value	0x1
	.byte	0x53
	.long	.LVL1740
	.long	.LFE2200
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST662:
	.long	.LVL1737
	.long	.LVL1738
	.value	0x1
	.byte	0x52
	.long	.LVL1740
	.long	.LVL1749
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST663:
	.long	.LVL1743
	.long	.LVL1745
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST664:
	.long	.LVL1735
	.long	.LVL1736
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST665:
	.long	.LVL1741
	.long	.LVL1744
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST666:
	.long	.LVL1746
	.long	.LVL1748
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST667:
	.long	.LFB2209
	.long	.LFE2209
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST668:
	.long	.LVL1750
	.long	.LVL1752
	.value	0x1
	.byte	0x50
	.long	.LVL1752
	.long	.LVL1759
	.value	0x1
	.byte	0x51
	.long	.LVL1760
	.long	.LVL1762
	.value	0x1
	.byte	0x51
	.long	.LVL1763
	.long	.LFE2209
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST669:
	.long	.LVL1754
	.long	.LVL1764
	.value	0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
.LLST670:
	.long	.LVL1757
	.long	.LVL1758
	.value	0x1
	.byte	0x52
	.long	.LVL1761
	.long	.LVL1762
	.value	0x1
	.byte	0x52
	.long	.LVL1763
	.long	.LFE2209
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST671:
	.long	.LVL1751
	.long	.LVL1754
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST672:
	.long	.LFB2210
	.long	.LFE2210
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST673:
	.long	.LVL1766
	.long	.LVL1768
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST674:
	.long	.LVL1766
	.long	.LVL1771
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST675:
	.long	.LVL1766
	.long	.LVL1773
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST676:
	.long	.LVL1767
	.long	.LVL1784
	.value	0x1
	.byte	0x57
	.long	.LVL1798
	.long	.LVL1805
	.value	0x1
	.byte	0x57
	.long	.LVL1806
	.long	.LVL1809
	.value	0x1
	.byte	0x57
	.long	.LVL1820
	.long	.LVL1823
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST677:
	.long	.LVL1781
	.long	.LVL1808
	.value	0x1
	.byte	0x53
	.long	.LVL1820
	.long	.LVL1822
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST678:
	.long	.LVL1768
	.long	.LVL1770
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST679:
	.long	.LVL1772
	.long	.LVL1786
	.value	0x1
	.byte	0x50
	.long	.LVL1798
	.long	.LVL1801
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST680:
	.long	.LVL1774
	.long	.LVL1775
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST681:
	.long	.LVL1777
	.long	.LVL1778
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST682:
	.long	.LVL1779
	.long	.LVL1780
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST683:
	.long	.LVL1783
	.long	.LVL1784
	.value	0x1
	.byte	0x57
	.long	.LVL1785
	.long	.LVL1799
	.value	0x1
	.byte	0x57
	.long	.LVL1805
	.long	.LVL1806
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST684:
	.long	.LVL1787
	.long	.LVL1789
	.value	0x1
	.byte	0x50
	.long	.LVL1805
	.long	.LVL1807
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST685:
	.long	.LVL1783
	.long	.LVL1786
	.value	0x1
	.byte	0x50
	.long	.LVL1791
	.long	.LVL1792
	.value	0x1
	.byte	0x50
	.long	.LVL1795
	.long	.LVL1801
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST686:
	.long	.LVL1790
	.long	.LVL1791
	.value	0x1
	.byte	0x50
	.long	.LVL1792
	.long	.LVL1795
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST687:
	.long	.LVL1788
	.long	.LVL1797
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST688:
	.long	.LVL1802
	.long	.LVL1803
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST689:
	.long	.LVL1800
	.long	.LVL1801
	.value	0x1
	.byte	0x50
	.long	.LVL1804
	.long	.LVL1805
	.value	0x1
	.byte	0x50
	.long	.LVL1806
	.long	.LVL1807
	.value	0x1
	.byte	0x50
	.long	.LVL1820
	.long	.LVL1821
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST690:
	.long	.LVL1810
	.long	.LVL1812
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST691:
	.long	.LVL1811
	.long	.LVL1816
	.value	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	.LVL1817
	.long	.LVL1818
	.value	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
.LLST692:
	.long	.LVL1814
	.long	.LVL1822
	.value	0x6
	.byte	0x51
	.byte	0x93
	.uleb128 0x4
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
.LLST694:
	.long	.LFB1895
	.long	.LFE1895
	.value	0x3
	.byte	0x74
	.sleb128 104
	.long	0x0
	.long	0x0
.LLST695:
	.long	.LVL1824
	.long	.LVL1825
	.value	0x1
	.byte	0x50
	.long	.LVL1825
	.long	.LVL1886
	.value	0x1
	.byte	0x53
	.long	.LVL1890
	.long	.LFE1895
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST696:
	.long	.LVL1825
	.long	.LVL1827
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST697:
	.long	.LVL1827
	.long	.LVL1828
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST698:
	.long	.LVL1829
	.long	.LVL1835
	.value	0x1
	.byte	0x55
	.long	.LVL1836
	.long	.LVL1837
	.value	0x1
	.byte	0x55
	.long	.LVL1859
	.long	.LVL1889
	.value	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
.LLST699:
	.long	.LVL1873
	.long	.LVL1874
	.value	0x1
	.byte	0x50
	.long	.LVL1875
	.long	.LVL1876
	.value	0x1
	.byte	0x50
	.long	.LVL1878
	.long	.LVL1880
	.value	0x1
	.byte	0x50
	.long	.LVL1881
	.long	.LVL1882
	.value	0x1
	.byte	0x50
	.long	.LVL1884
	.long	.LVL1885
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST700:
	.long	.LVL1861
	.long	.LVL1872
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST701:
	.long	.LVL1862
	.long	.LVL1864
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST702:
	.long	.LVL1866
	.long	.LVL1871
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST703:
	.long	.LVL1868
	.long	.LVL1883
	.value	0x1
	.byte	0x56
	.long	.LVL1884
	.long	.LVL1887
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST704:
	.long	.LVL1867
	.long	.LVL1883
	.value	0x1
	.byte	0x57
	.long	.LVL1884
	.long	.LVL1888
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST705:
	.long	.LVL1865
	.long	.LVL1869
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST706:
	.long	.LVL1869
	.long	.LVL1870
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST707:
	.long	.LVL1876
	.long	.LVL1877
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST708:
	.long	.LVL1839
	.long	.LVL1840
	.value	0x1
	.byte	0x51
	.long	.LVL1840
	.long	.LVL1841
	.value	0x1
	.byte	0x50
	.long	.LVL1841
	.long	.LVL1842
	.value	0x1
	.byte	0x51
	.long	.LVL1843
	.long	.LVL1844
	.value	0x1
	.byte	0x51
	.long	.LVL1844
	.long	.LVL1845
	.value	0x1
	.byte	0x50
	.long	.LVL1845
	.long	.LVL1846
	.value	0x1
	.byte	0x51
	.long	.LVL1846
	.long	.LVL1847
	.value	0x1
	.byte	0x50
	.long	.LVL1847
	.long	.LVL1849
	.value	0x1
	.byte	0x51
	.long	.LVL1849
	.long	.LVL1850
	.value	0x1
	.byte	0x50
	.long	.LVL1852
	.long	.LVL1853
	.value	0x1
	.byte	0x51
	.long	.LVL1854
	.long	.LVL1856
	.value	0x1
	.byte	0x51
	.long	.LVL1857
	.long	.LVL1859
	.value	0x1
	.byte	0x51
	.long	.LVL1884
	.long	.LVL1893
	.value	0x1
	.byte	0x51
	.long	.LVL1898
	.long	.LVL1899
	.value	0x1
	.byte	0x51
	.long	.LVL1899
	.long	.LFE1895
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST709:
	.long	.LVL1851
	.long	.LVL1853
	.value	0x1
	.byte	0x50
	.long	.LVL1857
	.long	.LVL1858
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST710:
	.long	.LVL1833
	.long	.LVL1835
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST711:
	.long	.LVL1832
	.long	.LVL1838
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST712:
	.long	.LVL1831
	.long	.LVL1833
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST713:
	.long	.LVL1891
	.long	.LVL1892
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST714:
	.long	.LVL1893
	.long	.LVL1897
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST715:
	.long	.LVL1849
	.long	.LVL1859
	.value	0x1
	.byte	0x56
	.long	.LVL1884
	.long	.LVL1887
	.value	0x1
	.byte	0x56
	.long	.LVL1894
	.long	.LFE1895
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST716:
	.long	.LVL1895
	.long	.LVL1896
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST717:
	.long	.LVL1830
	.long	.LVL1831
	.value	0x1
	.byte	0x50
	.long	.LVL1859
	.long	.LVL1860
	.value	0x1
	.byte	0x50
	.long	.LVL1883
	.long	.LVL1884
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST719:
	.long	.LVL1900
	.long	.LVL1902
	.value	0x1
	.byte	0x50
	.long	.LVL1902
	.long	.LVL1904
	.value	0x1
	.byte	0x50
	.long	.LVL1904
	.long	.LVL1906
	.value	0x1
	.byte	0x50
	.long	.LVL1906
	.long	.LVL1908
	.value	0x1
	.byte	0x50
	.long	.LVL1908
	.long	.LVL1910
	.value	0x1
	.byte	0x50
	.long	.LVL1910
	.long	.LVL1913
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST720:
	.long	.LVL1901
	.long	.LVL1902
	.value	0x1
	.byte	0x52
	.long	.LVL1902
	.long	.LVL1903
	.value	0x1
	.byte	0x52
	.long	.LVL1904
	.long	.LVL1905
	.value	0x1
	.byte	0x52
	.long	.LVL1906
	.long	.LVL1907
	.value	0x1
	.byte	0x52
	.long	.LVL1908
	.long	.LVL1909
	.value	0x1
	.byte	0x52
	.long	.LVL1910
	.long	.LVL1911
	.value	0x1
	.byte	0x52
	.long	.LVL1912
	.long	.LFE488
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST721:
	.long	.LFB489
	.long	.LFE489
	.value	0x2
	.byte	0x74
	.sleb128 40
	.long	0x0
	.long	0x0
.LLST722:
	.long	.LVL1914
	.long	.LVL1915
	.value	0x1
	.byte	0x50
	.long	.LVL1915
	.long	.LVL1926
	.value	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
.LLST723:
	.long	.LVL1914
	.long	.LVL1921
	.value	0x1
	.byte	0x52
	.long	.LVL1921
	.long	.LVL1923
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST724:
	.long	.LVL1915
	.long	.LVL1919
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST725:
	.long	.LVL1916
	.long	.LVL1921
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST726:
	.long	.LVL1917
	.long	.LVL1924
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST727:
	.long	.LVL1918
	.long	.LVL1925
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST728:
	.long	.LVL1919
	.long	.LVL1920
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST729:
	.long	.LFB1255
	.long	.LFE1255
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST730:
	.long	.LVL1927
	.long	.LVL1928
	.value	0x1
	.byte	0x50
	.long	.LVL1928
	.long	.LVL1954
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST731:
	.long	.LVL1929
	.long	.LVL1930
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST732:
	.long	.LVL1931
	.long	.LVL1932
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST733:
	.long	.LVL1933
	.long	.LVL1934
	.value	0x1
	.byte	0x50
	.long	.LVL1939
	.long	.LVL1942
	.value	0x1
	.byte	0x50
	.long	.LVL1945
	.long	.LVL1946
	.value	0x1
	.byte	0x50
	.long	.LVL1947
	.long	.LVL1948
	.value	0x1
	.byte	0x50
	.long	.LVL1952
	.long	.LVL1953
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST734:
	.long	.LVL1935
	.long	.LVL1936
	.value	0x1
	.byte	0x50
	.long	.LVL1937
	.long	.LVL1938
	.value	0x1
	.byte	0x50
	.long	.LVL1944
	.long	.LVL1945
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST735:
	.long	.LVL1940
	.long	.LVL1943
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST736:
	.long	.LVL1949
	.long	.LVL1955
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST737:
	.long	.LVL1950
	.long	.LVL1956
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST738:
	.long	.LFB2530
	.long	.LFE2530
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST739:
	.long	.LVL1957
	.long	.LVL1958
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST740:
	.long	.LVL1957
	.long	.LVL1958
	.value	0x1
	.byte	0x52
	.long	.LVL1958
	.long	.LVL1976
	.value	0x1
	.byte	0x53
	.long	.LVL1986
	.long	.LVL1987
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST741:
	.long	.LVL1962
	.long	.LVL1964
	.value	0x1
	.byte	0x51
	.long	.LVL1965
	.long	.LVL1973
	.value	0x1
	.byte	0x51
	.long	.LVL1974
	.long	.LVL1981
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST742:
	.long	.LVL1963
	.long	.LVL1964
	.value	0x1
	.byte	0x57
	.long	.LVL1966
	.long	.LVL1979
	.value	0x1
	.byte	0x57
	.long	.LVL1986
	.long	.LVL1989
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST743:
	.long	.LVL1968
	.long	.LVL1970
	.value	0x1
	.byte	0x52
	.long	.LVL1971
	.long	.LVL1972
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST744:
	.long	.LVL1969
	.long	.LVL1975
	.value	0x1
	.byte	0x56
	.long	.LVL1975
	.long	.LVL1977
	.value	0x1
	.byte	0x50
	.long	.LVL1986
	.long	.LVL1988
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST745:
	.long	.LVL1959
	.long	.LVL1960
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST746:
	.long	.LVL1961
	.long	.LVL1964
	.value	0x1
	.byte	0x50
	.long	.LVL1966
	.long	.LVL1967
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST747:
	.long	.LVL1978
	.long	.LVL1984
	.value	0x1
	.byte	0x52
	.long	.LVL1985
	.long	.LFE2530
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST748:
	.long	.LFB2560
	.long	.LFE2560
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST749:
	.long	.LVL1990
	.long	.LVL1991
	.value	0x1
	.byte	0x50
	.long	.LVL2118
	.long	.LVL2128
	.value	0x1
	.byte	0x57
	.long	.LVL2135
	.long	.LVL2138
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST750:
	.long	.LVL1990
	.long	.LVL1992
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST751:
	.long	.LVL1993
	.long	.LVL1994
	.value	0x1
	.byte	0x52
	.long	.LVL1995
	.long	.LVL1996
	.value	0x1
	.byte	0x52
	.long	.LVL2134
	.long	.LFE2560
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST752:
	.long	.LVL1997
	.long	.LVL2025
	.value	0x1
	.byte	0x56
	.long	.LVL2026
	.long	.LVL2027
	.value	0x1
	.byte	0x56
	.long	.LVL2046
	.long	.LVL2047
	.value	0x1
	.byte	0x56
	.long	.LVL2135
	.long	.LVL2137
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST753:
	.long	.LVL2001
	.long	.LVL2003
	.value	0x1
	.byte	0x57
	.long	.LVL2004
	.long	.LVL2007
	.value	0x1
	.byte	0x57
	.long	.LVL2007
	.long	.LVL2028
	.value	0x1
	.byte	0x53
	.long	.LVL2046
	.long	.LVL2047
	.value	0x1
	.byte	0x53
	.long	.LVL2135
	.long	.LVL2136
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST754:
	.long	.LVL2002
	.long	.LVL2003
	.value	0x1
	.byte	0x50
	.long	.LVL2005
	.long	.LVL2021
	.value	0x1
	.byte	0x50
	.long	.LVL2022
	.long	.LVL2030
	.value	0x1
	.byte	0x50
	.long	.LVL2135
	.long	.LFE2560
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST755:
	.long	.LVL2008
	.long	.LVL2017
	.value	0x1
	.byte	0x51
	.long	.LVL2018
	.long	.LVL2020
	.value	0x1
	.byte	0x51
	.long	.LVL2022
	.long	.LVL2030
	.value	0x1
	.byte	0x51
	.long	.LVL2135
	.long	.LFE2560
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST756:
	.long	.LVL1998
	.long	.LVL1999
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST757:
	.long	.LVL2000
	.long	.LVL2003
	.value	0x1
	.byte	0x56
	.long	.LVL2006
	.long	.LVL2025
	.value	0x1
	.byte	0x56
	.long	.LVL2026
	.long	.LVL2027
	.value	0x1
	.byte	0x56
	.long	.LVL2046
	.long	.LVL2047
	.value	0x1
	.byte	0x56
	.long	.LVL2135
	.long	.LVL2137
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST758:
	.long	.LVL2009
	.long	.LVL2010
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST759:
	.long	.LVL2011
	.long	.LVL2013
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST760:
	.long	.LVL2014
	.long	.LVL2016
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST761:
	.long	.LVL2023
	.long	.LVL2024
	.value	0x1
	.byte	0x52
	.long	.LVL2026
	.long	.LVL2029
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST762:
	.long	.LVL2034
	.long	.LVL2037
	.value	0x1
	.byte	0x51
	.long	.LVL2038
	.long	.LVL2044
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST763:
	.long	.LVL2035
	.long	.LVL2037
	.value	0x1
	.byte	0x53
	.long	.LVL2039
	.long	.LVL2045
	.value	0x1
	.byte	0x53
	.long	.LVL2135
	.long	.LVL2136
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST764:
	.long	.LVL2036
	.long	.LVL2037
	.value	0x1
	.byte	0x52
	.long	.LVL2040
	.long	.LVL2041
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST765:
	.long	.LVL2041
	.long	.LVL2045
	.value	0x1
	.byte	0x52
	.long	.LVL2135
	.long	.LFE2560
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST766:
	.long	.LVL2031
	.long	.LVL2032
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST767:
	.long	.LVL2033
	.long	.LVL2036
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST768:
	.long	.LVL2048
	.long	.LVL2054
	.value	0x1
	.byte	0x50
	.long	.LVL2134
	.long	.LFE2560
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST769:
	.long	.LVL2049
	.long	.LVL2055
	.value	0x1
	.byte	0x51
	.long	.LVL2134
	.long	.LFE2560
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST770:
	.long	.LVL2050
	.long	.LVL2051
	.value	0x1
	.byte	0x56
	.long	.LVL2052
	.long	.LVL2053
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST771:
	.long	.LVL2053
	.long	.LVL2056
	.value	0x1
	.byte	0x56
	.long	.LVL2069
	.long	.LVL2071
	.value	0x1
	.byte	0x56
	.long	.LVL2135
	.long	.LVL2137
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST772:
	.long	.LVL2057
	.long	.LVL2065
	.value	0x1
	.byte	0x53
	.long	.LVL2124
	.long	.LVL2128
	.value	0x1
	.byte	0x53
	.long	.LVL2135
	.long	.LVL2136
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST773:
	.long	.LVL2058
	.long	.LVL2065
	.value	0x1
	.byte	0x51
	.long	.LVL2124
	.long	.LVL2128
	.value	0x1
	.byte	0x51
	.long	.LVL2135
	.long	.LFE2560
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST774:
	.long	.LVL2064
	.long	.LVL2065
	.value	0x1
	.byte	0x52
	.long	.LVL2124
	.long	.LVL2125
	.value	0x1
	.byte	0x52
	.long	.LVL2126
	.long	.LVL2127
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST775:
	.long	.LVL2059
	.long	.LVL2060
	.value	0x1
	.byte	0x52
	.long	.LVL2061
	.long	.LVL2062
	.value	0x1
	.byte	0x52
	.long	.LVL2063
	.long	.LVL2064
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST776:
	.long	.LVL2066
	.long	.LVL2070
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST777:
	.long	.LVL2067
	.long	.LVL2068
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST778:
	.long	.LVL2084
	.long	.LVL2104
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST779:
	.long	.LVL2088
	.long	.LVL2089
	.value	0x1
	.byte	0x53
	.long	.LVL2091
	.long	.LVL2100
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST780:
	.long	.LVL2100
	.long	.LVL2103
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST781:
	.long	.LVL2079
	.long	.LVL2080
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST782:
	.long	.LVL2076
	.long	.LVL2077
	.value	0x1
	.byte	0x56
	.long	.LVL2080
	.long	.LVL2081
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST783:
	.long	.LVL2075
	.long	.LVL2078
	.value	0x1
	.byte	0x57
	.long	.LVL2081
	.long	.LVL2087
	.value	0x1
	.byte	0x57
	.long	.LVL2131
	.long	.LVL2132
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST784:
	.long	.LVL2073
	.long	.LVL2074
	.value	0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.long	.LVL2082
	.long	.LVL2083
	.value	0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
.LLST785:
	.long	.LVL2086
	.long	.LVL2108
	.value	0x1
	.byte	0x56
	.long	.LVL2110
	.long	.LVL2112
	.value	0x1
	.byte	0x56
	.long	.LVL2129
	.long	.LVL2130
	.value	0x1
	.byte	0x56
	.long	.LVL2135
	.long	.LVL2137
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST786:
	.long	.LVL2115
	.long	.LVL2116
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST787:
	.long	.LVL2113
	.long	.LVL2114
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST788:
	.long	.LVL2087
	.long	.LVL2101
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST789:
	.long	.LVL2090
	.long	.LVL2093
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST790:
	.long	.LVL2093
	.long	.LVL2095
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST791:
	.long	.LVL2095
	.long	.LVL2098
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST792:
	.long	.LVL2101
	.long	.LVL2106
	.value	0x1
	.byte	0x57
	.long	.LVL2129
	.long	.LVL2130
	.value	0x1
	.byte	0x57
	.long	.LVL2135
	.long	.LVL2138
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST793:
	.long	.LVL2103
	.long	.LVL2105
	.value	0x1
	.byte	0x53
	.long	.LVL2129
	.long	.LVL2130
	.value	0x1
	.byte	0x53
	.long	.LVL2135
	.long	.LVL2136
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST794:
	.long	.LVL2107
	.long	.LVL2109
	.value	0x1
	.byte	0x53
	.long	.LVL2110
	.long	.LVL2111
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST795:
	.long	.LVL2117
	.long	.LVL2122
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST796:
	.long	.LVL2120
	.long	.LVL2123
	.value	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
.LLST797:
	.long	.LVL2119
	.long	.LVL2128
	.value	0x1
	.byte	0x56
	.long	.LVL2135
	.long	.LVL2137
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST798:
	.long	.LFB2562
	.long	.LFE2562
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST799:
	.long	.LVL2139
	.long	.LVL2154
	.value	0x1
	.byte	0x50
	.long	.LVL2154
	.long	.LFE2562
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST800:
	.long	.LVL2139
	.long	.LVL2141
	.value	0x1
	.byte	0x52
	.long	.LVL2146
	.long	.LVL2147
	.value	0x1
	.byte	0x52
	.long	.LVL2149
	.long	.LVL2150
	.value	0x1
	.byte	0x52
	.long	.LVL2154
	.long	.LVL2155
	.value	0x1
	.byte	0x52
	.long	.LVL2156
	.long	.LVL2157
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST801:
	.long	.LVL2152
	.long	.LVL2154
	.value	0x1
	.byte	0x52
	.long	.LVL2154
	.long	.LVL2155
	.value	0x1
	.byte	0x52
	.long	.LVL2156
	.long	.LVL2157
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST802:
	.long	.LVL2142
	.long	.LVL2143
	.value	0x1
	.byte	0x52
	.long	.LVL2144
	.long	.LVL2145
	.value	0x1
	.byte	0x52
	.long	.LVL2153
	.long	.LVL2154
	.value	0x1
	.byte	0x52
	.long	.LVL2154
	.long	.LVL2155
	.value	0x1
	.byte	0x52
	.long	.LVL2156
	.long	.LVL2157
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST803:
	.long	.LVL2141
	.long	.LVL2142
	.value	0x1
	.byte	0x52
	.long	.LVL2154
	.long	.LVL2155
	.value	0x1
	.byte	0x52
	.long	.LVL2156
	.long	.LVL2157
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST804:
	.long	.LVL2148
	.long	.LVL2149
	.value	0x1
	.byte	0x52
	.long	.LVL2151
	.long	.LVL2152
	.value	0x1
	.byte	0x52
	.long	.LVL2154
	.long	.LVL2155
	.value	0x1
	.byte	0x52
	.long	.LVL2156
	.long	.LVL2157
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST805:
	.long	.LVL2151
	.long	.LVL2152
	.value	0x1
	.byte	0x52
	.long	.LVL2154
	.long	.LVL2155
	.value	0x1
	.byte	0x52
	.long	.LVL2156
	.long	.LVL2157
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST807:
	.long	.LVL2158
	.long	.LVL2179
	.value	0x1
	.byte	0x50
	.long	.LVL2179
	.long	.LVL2184
	.value	0x1
	.byte	0x50
	.long	.LVL2184
	.long	.LFE2564
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST808:
	.long	.LVL2182
	.long	.LVL2184
	.value	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST809:
	.long	.LVL2175
	.long	.LVL2176
	.value	0x1
	.byte	0x53
	.long	.LVL2181
	.long	.LVL2183
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST810:
	.long	.LVL2177
	.long	.LVL2178
	.value	0x1
	.byte	0x53
	.long	.LVL2184
	.long	.LVL2185
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST811:
	.long	.LVL2176
	.long	.LVL2177
	.value	0x1
	.byte	0x53
	.long	.LVL2179
	.long	.LVL2180
	.value	0x1
	.byte	0x53
	.long	.LVL2181
	.long	.LVL2183
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST812:
	.long	.LVL2159
	.long	.LVL2174
	.value	0x1
	.byte	0x56
	.long	.LVL2184
	.long	.LVL2186
	.value	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST813:
	.long	.LVL2161
	.long	.LVL2162
	.value	0x1
	.byte	0x57
	.long	.LVL2162
	.long	.LVL2163
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST814:
	.long	.LVL2160
	.long	.LVL2174
	.value	0x1
	.byte	0x55
	.long	.LVL2184
	.long	.LVL2187
	.value	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
.LLST815:
	.long	.LVL2162
	.long	.LVL2163
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST816:
	.long	.LVL2164
	.long	.LVL2165
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST817:
	.long	.LVL2165
	.long	.LVL2166
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST818:
	.long	.LVL2166
	.long	.LVL2167
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST819:
	.long	.LVL2167
	.long	.LVL2168
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST820:
	.long	.LVL2168
	.long	.LVL2169
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST821:
	.long	.LVL2170
	.long	.LVL2171
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST822:
	.long	.LVL2172
	.long	.LVL2173
	.value	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST823:
	.long	.LFB2563
	.long	.LFE2563
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST824:
	.long	.LVL2188
	.long	.LVL2189
	.value	0x1
	.byte	0x50
	.long	.LVL2189
	.long	.LVL2190
	.value	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
	.file 35 "src/types.h"
	.file 36 "src/disk.h"
	.file 37 "/usr/lib/gcc/x86_64-redhat-linux/4.4.0/include/stdarg.h"
	.file 38 "src/ata.h"
	.file 39 "src/smp.c"
	.file 40 "src/pci.h"
	.file 41 "src/pirtable.c"
	.file 42 "src/blockcmd.h"
	.file 43 "src/usb-uhci.h"
	.file 44 "src/usb.h"
	.file 45 "src/usb-hid.h"
	.file 46 "src/usb-ohci.h"
	.file 47 "src/usb-ehci.h"
	.file 48 "src/usb-msc.h"
	.file 49 "src/memmap.h"
	.file 50 "src/pic.h"
	.file 51 "src/cmos.h"
	.file 52 "src/vgahooks.c"
	.file 53 "src/ramdisk.c"
	.file 54 "src/font.c"
	.section	.debug_info
	.long	0x2bbf3
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF1112
	.byte	0x1
	.long	.LASF1113
	.long	.LASF1114
	.long	0x0
	.long	0x0
	.long	.Ldebug_ranges0+0xa28
	.long	.Ldebug_line0
	.uleb128 0x2
	.string	"u8"
	.byte	0x23
	.byte	0x9
	.long	0x33
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF0
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF1
	.uleb128 0x2
	.string	"u16"
	.byte	0x23
	.byte	0xb
	.long	0x4c
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF3
	.uleb128 0x2
	.string	"u32"
	.byte	0x23
	.byte	0xd
	.long	0x65
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF4
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.string	"u64"
	.byte	0x23
	.byte	0xf
	.long	0x7e
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF5
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x5
	.byte	0x8
	.byte	0x23
	.byte	0x14
	.long	0xaf
	.uleb128 0x6
	.string	"hi"
	.byte	0x23
	.byte	0x14
	.long	0x5a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"lo"
	.byte	0x23
	.byte	0x14
	.long	0x5a
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x7
	.long	.LASF118
	.byte	0x8
	.byte	0x23
	.byte	0x13
	.long	0xcc
	.uleb128 0x8
	.long	0x8c
	.uleb128 0x9
	.string	"val"
	.byte	0x23
	.byte	0x15
	.long	0x73
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0x19
	.byte	0xbc
	.long	0xf1
	.uleb128 0xa
	.long	.LASF7
	.byte	0x19
	.byte	0xbd
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"seg"
	.byte	0x19
	.byte	0xbe
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0x19
	.byte	0xbb
	.long	0x10a
	.uleb128 0x8
	.long	0xcc
	.uleb128 0xc
	.long	.LASF8
	.byte	0x19
	.byte	0xc0
	.long	0x5a
	.byte	0x0
	.uleb128 0xd
	.long	.LASF33
	.byte	0x4
	.byte	0x19
	.byte	0xba
	.long	0x11f
	.uleb128 0xe
	.long	0xf1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0x143
	.uleb128 0x6
	.string	"di"
	.byte	0xe
	.byte	0x28
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF9
	.byte	0xe
	.byte	0x28
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0x184
	.uleb128 0xa
	.long	.LASF10
	.byte	0xe
	.byte	0x28
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF9
	.byte	0xe
	.byte	0x28
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF11
	.byte	0xe
	.byte	0x28
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF12
	.byte	0xe
	.byte	0x28
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0x1a2
	.uleb128 0x9
	.string	"edi"
	.byte	0xe
	.byte	0x28
	.long	0x5a
	.uleb128 0x8
	.long	0x11f
	.uleb128 0x8
	.long	0x143
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0x1c6
	.uleb128 0x6
	.string	"si"
	.byte	0xe
	.byte	0x29
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF13
	.byte	0xe
	.byte	0x29
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0x207
	.uleb128 0xa
	.long	.LASF14
	.byte	0xe
	.byte	0x29
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF13
	.byte	0xe
	.byte	0x29
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF15
	.byte	0xe
	.byte	0x29
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF16
	.byte	0xe
	.byte	0x29
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0x225
	.uleb128 0x9
	.string	"esi"
	.byte	0xe
	.byte	0x29
	.long	0x5a
	.uleb128 0x8
	.long	0x1a2
	.uleb128 0x8
	.long	0x1c6
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0x249
	.uleb128 0x6
	.string	"bp"
	.byte	0xe
	.byte	0x2a
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF17
	.byte	0xe
	.byte	0x2a
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0x28a
	.uleb128 0xa
	.long	.LASF18
	.byte	0xe
	.byte	0x2a
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF17
	.byte	0xe
	.byte	0x2a
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF19
	.byte	0xe
	.byte	0x2a
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF20
	.byte	0xe
	.byte	0x2a
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0x2a8
	.uleb128 0x9
	.string	"ebp"
	.byte	0xe
	.byte	0x2a
	.long	0x5a
	.uleb128 0x8
	.long	0x225
	.uleb128 0x8
	.long	0x249
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0x2cc
	.uleb128 0x6
	.string	"bx"
	.byte	0xe
	.byte	0x2b
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF21
	.byte	0xe
	.byte	0x2b
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0x30b
	.uleb128 0x6
	.string	"bl"
	.byte	0xe
	.byte	0x2b
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"bh"
	.byte	0xe
	.byte	0x2b
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF22
	.byte	0xe
	.byte	0x2b
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF23
	.byte	0xe
	.byte	0x2b
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0x329
	.uleb128 0x9
	.string	"ebx"
	.byte	0xe
	.byte	0x2b
	.long	0x5a
	.uleb128 0x8
	.long	0x2a8
	.uleb128 0x8
	.long	0x2cc
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0x34d
	.uleb128 0x6
	.string	"dx"
	.byte	0xe
	.byte	0x2c
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF24
	.byte	0xe
	.byte	0x2c
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0x38c
	.uleb128 0x6
	.string	"dl"
	.byte	0xe
	.byte	0x2c
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"dh"
	.byte	0xe
	.byte	0x2c
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF25
	.byte	0xe
	.byte	0x2c
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF26
	.byte	0xe
	.byte	0x2c
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0x3aa
	.uleb128 0x9
	.string	"edx"
	.byte	0xe
	.byte	0x2c
	.long	0x5a
	.uleb128 0x8
	.long	0x329
	.uleb128 0x8
	.long	0x34d
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0x3ce
	.uleb128 0x6
	.string	"cx"
	.byte	0xe
	.byte	0x2d
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF27
	.byte	0xe
	.byte	0x2d
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0x40d
	.uleb128 0x6
	.string	"cl"
	.byte	0xe
	.byte	0x2d
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"ch"
	.byte	0xe
	.byte	0x2d
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF28
	.byte	0xe
	.byte	0x2d
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF29
	.byte	0xe
	.byte	0x2d
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0x42b
	.uleb128 0x9
	.string	"ecx"
	.byte	0xe
	.byte	0x2d
	.long	0x5a
	.uleb128 0x8
	.long	0x3aa
	.uleb128 0x8
	.long	0x3ce
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0x44f
	.uleb128 0x6
	.string	"ax"
	.byte	0xe
	.byte	0x2e
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF30
	.byte	0xe
	.byte	0x2e
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0x48e
	.uleb128 0x6
	.string	"al"
	.byte	0xe
	.byte	0x2e
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"ah"
	.byte	0xe
	.byte	0x2e
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF31
	.byte	0xe
	.byte	0x2e
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF32
	.byte	0xe
	.byte	0x2e
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0x4ac
	.uleb128 0x9
	.string	"eax"
	.byte	0xe
	.byte	0x2e
	.long	0x5a
	.uleb128 0x8
	.long	0x42b
	.uleb128 0x8
	.long	0x44f
	.byte	0x0
	.uleb128 0xd
	.long	.LASF34
	.byte	0x26
	.byte	0xe
	.byte	0x25
	.long	0x527
	.uleb128 0x6
	.string	"ds"
	.byte	0xe
	.byte	0x26
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"es"
	.byte	0xe
	.byte	0x27
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xe
	.long	0x184
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xe
	.long	0x207
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xe
	.long	0x28a
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xe
	.long	0x30b
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xe
	.long	0x38c
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xe
	.long	0x40d
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xe
	.long	0x48e
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.long	.LASF35
	.byte	0xe
	.byte	0x2f
	.long	0x10a
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xa
	.long	.LASF36
	.byte	0xe
	.byte	0x30
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xf
	.long	0x29
	.long	0x537
	.uleb128 0x10
	.long	0x537
	.byte	0x3
	.byte	0x0
	.uleb128 0x11
	.byte	0x4
	.byte	0x7
	.uleb128 0x12
	.byte	0x4
	.uleb128 0x13
	.byte	0x4
	.long	0x542
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF37
	.uleb128 0xd
	.long	.LASF38
	.byte	0xbc
	.byte	0xa
	.byte	0x21
	.long	0x90b
	.uleb128 0xa
	.long	.LASF39
	.byte	0xa
	.byte	0x23
	.long	0x90b
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF40
	.byte	0xa
	.byte	0x24
	.long	0x91b
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF41
	.byte	0xa
	.byte	0x25
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF42
	.byte	0xa
	.byte	0x27
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF43
	.byte	0xa
	.byte	0x28
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0xa
	.long	.LASF44
	.byte	0xa
	.byte	0x29
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x13
	.uleb128 0xa
	.long	.LASF45
	.byte	0xa
	.byte	0x2a
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x15
	.uleb128 0xa
	.long	.LASF46
	.byte	0xa
	.byte	0x2b
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x16
	.uleb128 0xa
	.long	.LASF47
	.byte	0xa
	.byte	0x2c
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x17
	.uleb128 0xa
	.long	.LASF48
	.byte	0xa
	.byte	0x2d
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF49
	.byte	0xa
	.byte	0x2e
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF50
	.byte	0xa
	.byte	0x2f
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF51
	.byte	0xa
	.byte	0x30
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.long	.LASF52
	.byte	0xa
	.byte	0x32
	.long	0x92b
	.byte	0x2
	.byte	0x23
	.uleb128 0x1e
	.uleb128 0xa
	.long	.LASF53
	.byte	0xa
	.byte	0x33
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x3e
	.uleb128 0xa
	.long	.LASF54
	.byte	0xa
	.byte	0x34
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x3f
	.uleb128 0xa
	.long	.LASF55
	.byte	0xa
	.byte	0x36
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0xa
	.long	.LASF56
	.byte	0xa
	.byte	0x37
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x41
	.uleb128 0xa
	.long	.LASF57
	.byte	0xa
	.byte	0x38
	.long	0x93b
	.byte	0x2
	.byte	0x23
	.uleb128 0x42
	.uleb128 0xa
	.long	.LASF58
	.byte	0xa
	.byte	0x39
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x49
	.uleb128 0xa
	.long	.LASF59
	.byte	0xa
	.byte	0x3a
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.uleb128 0xa
	.long	.LASF60
	.byte	0xa
	.byte	0x3b
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0xa
	.long	.LASF61
	.byte	0xa
	.byte	0x3c
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x4e
	.uleb128 0xa
	.long	.LASF62
	.byte	0xa
	.byte	0x3e
	.long	0x94b
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0xa
	.long	.LASF63
	.byte	0xa
	.byte	0x40
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0xa
	.long	.LASF64
	.byte	0xa
	.byte	0x41
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x62
	.uleb128 0xa
	.long	.LASF65
	.byte	0xa
	.byte	0x42
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x63
	.uleb128 0xa
	.long	.LASF66
	.byte	0xa
	.byte	0x43
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x65
	.uleb128 0xa
	.long	.LASF67
	.byte	0xa
	.byte	0x44
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x66
	.uleb128 0xa
	.long	.LASF68
	.byte	0xa
	.byte	0x45
	.long	0x10a
	.byte	0x2
	.byte	0x23
	.uleb128 0x67
	.uleb128 0xa
	.long	.LASF69
	.byte	0xa
	.byte	0x46
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x6b
	.uleb128 0xa
	.long	.LASF70
	.byte	0xa
	.byte	0x47
	.long	0x5a
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.uleb128 0xa
	.long	.LASF71
	.byte	0xa
	.byte	0x49
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0xa
	.long	.LASF72
	.byte	0xa
	.byte	0x4a
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x71
	.uleb128 0xa
	.long	.LASF73
	.byte	0xa
	.byte	0x4b
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x72
	.uleb128 0xa
	.long	.LASF74
	.byte	0xa
	.byte	0x4c
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0xa
	.long	.LASF75
	.byte	0xa
	.byte	0x4d
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x75
	.uleb128 0xa
	.long	.LASF76
	.byte	0xa
	.byte	0x4e
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x76
	.uleb128 0xa
	.long	.LASF77
	.byte	0xa
	.byte	0x4f
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x77
	.uleb128 0xa
	.long	.LASF78
	.byte	0xa
	.byte	0x50
	.long	0x527
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0xa
	.long	.LASF79
	.byte	0xa
	.byte	0x51
	.long	0x527
	.byte	0x2
	.byte	0x23
	.uleb128 0x7c
	.uleb128 0xa
	.long	.LASF80
	.byte	0xa
	.byte	0x53
	.long	0x41
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0xa
	.long	.LASF81
	.byte	0xa
	.byte	0x54
	.long	0x41
	.byte	0x3
	.byte	0x23
	.uleb128 0x82
	.uleb128 0xa
	.long	.LASF82
	.byte	0xa
	.byte	0x55
	.long	0x29
	.byte	0x3
	.byte	0x23
	.uleb128 0x84
	.uleb128 0xa
	.long	.LASF83
	.byte	0xa
	.byte	0x56
	.long	0x41
	.byte	0x3
	.byte	0x23
	.uleb128 0x85
	.uleb128 0xa
	.long	.LASF84
	.byte	0xa
	.byte	0x57
	.long	0x29
	.byte	0x3
	.byte	0x23
	.uleb128 0x87
	.uleb128 0xa
	.long	.LASF85
	.byte	0xa
	.byte	0x58
	.long	0x29
	.byte	0x3
	.byte	0x23
	.uleb128 0x88
	.uleb128 0xa
	.long	.LASF86
	.byte	0xa
	.byte	0x59
	.long	0x29
	.byte	0x3
	.byte	0x23
	.uleb128 0x89
	.uleb128 0xa
	.long	.LASF87
	.byte	0xa
	.byte	0x5a
	.long	0x29
	.byte	0x3
	.byte	0x23
	.uleb128 0x8a
	.uleb128 0xa
	.long	.LASF88
	.byte	0xa
	.byte	0x5b
	.long	0x29
	.byte	0x3
	.byte	0x23
	.uleb128 0x8b
	.uleb128 0xa
	.long	.LASF89
	.byte	0xa
	.byte	0x5c
	.long	0x29
	.byte	0x3
	.byte	0x23
	.uleb128 0x8c
	.uleb128 0xa
	.long	.LASF90
	.byte	0xa
	.byte	0x5d
	.long	0x29
	.byte	0x3
	.byte	0x23
	.uleb128 0x8d
	.uleb128 0xa
	.long	.LASF91
	.byte	0xa
	.byte	0x5e
	.long	0x29
	.byte	0x3
	.byte	0x23
	.uleb128 0x8e
	.uleb128 0xa
	.long	.LASF92
	.byte	0xa
	.byte	0x5f
	.long	0x29
	.byte	0x3
	.byte	0x23
	.uleb128 0x8f
	.uleb128 0xa
	.long	.LASF93
	.byte	0xa
	.byte	0x61
	.long	0x527
	.byte	0x3
	.byte	0x23
	.uleb128 0x90
	.uleb128 0xa
	.long	.LASF94
	.byte	0xa
	.byte	0x62
	.long	0x95b
	.byte	0x3
	.byte	0x23
	.uleb128 0x94
	.uleb128 0xa
	.long	.LASF95
	.byte	0xa
	.byte	0x63
	.long	0x29
	.byte	0x3
	.byte	0x23
	.uleb128 0x96
	.uleb128 0xa
	.long	.LASF96
	.byte	0xa
	.byte	0x64
	.long	0x29
	.byte	0x3
	.byte	0x23
	.uleb128 0x97
	.uleb128 0xa
	.long	.LASF97
	.byte	0xa
	.byte	0x65
	.long	0x10a
	.byte	0x3
	.byte	0x23
	.uleb128 0x98
	.uleb128 0xa
	.long	.LASF98
	.byte	0xa
	.byte	0x66
	.long	0x5a
	.byte	0x3
	.byte	0x23
	.uleb128 0x9c
	.uleb128 0xa
	.long	.LASF99
	.byte	0xa
	.byte	0x68
	.long	0x29
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0xa
	.long	.LASF100
	.byte	0xa
	.byte	0x69
	.long	0x93b
	.byte	0x3
	.byte	0x23
	.uleb128 0xa1
	.uleb128 0xa
	.long	.LASF101
	.byte	0xa
	.byte	0x6a
	.long	0x10a
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0xa
	.long	.LASF102
	.byte	0xa
	.byte	0x6b
	.long	0x527
	.byte	0x3
	.byte	0x23
	.uleb128 0xac
	.uleb128 0xa
	.long	.LASF103
	.byte	0xa
	.byte	0x6d
	.long	0x96b
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0xa
	.long	.LASF104
	.byte	0xa
	.byte	0x6e
	.long	0x41
	.byte	0x3
	.byte	0x23
	.uleb128 0xba
	.byte	0x0
	.uleb128 0xf
	.long	0x41
	.long	0x91b
	.uleb128 0x10
	.long	0x537
	.byte	0x3
	.byte	0x0
	.uleb128 0xf
	.long	0x41
	.long	0x92b
	.uleb128 0x10
	.long	0x537
	.byte	0x2
	.byte	0x0
	.uleb128 0xf
	.long	0x29
	.long	0x93b
	.uleb128 0x10
	.long	0x537
	.byte	0x1f
	.byte	0x0
	.uleb128 0xf
	.long	0x29
	.long	0x94b
	.uleb128 0x10
	.long	0x537
	.byte	0x6
	.byte	0x0
	.uleb128 0xf
	.long	0x41
	.long	0x95b
	.uleb128 0x10
	.long	0x537
	.byte	0x7
	.byte	0x0
	.uleb128 0xf
	.long	0x29
	.long	0x96b
	.uleb128 0x10
	.long	0x537
	.byte	0x1
	.byte	0x0
	.uleb128 0xf
	.long	0x29
	.long	0x97b
	.uleb128 0x10
	.long	0x537
	.byte	0x9
	.byte	0x0
	.uleb128 0xf
	.long	0x29
	.long	0x98b
	.uleb128 0x10
	.long	0x537
	.byte	0xc
	.byte	0x0
	.uleb128 0x14
	.long	.LASF105
	.byte	0xa
	.byte	0xa
	.value	0x13e
	.long	0xa20
	.uleb128 0x15
	.long	.LASF106
	.byte	0xa
	.value	0x13f
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x15
	.long	.LASF107
	.byte	0xa
	.value	0x140
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x15
	.long	.LASF108
	.byte	0xa
	.value	0x141
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x15
	.long	.LASF109
	.byte	0xa
	.value	0x142
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x15
	.long	.LASF110
	.byte	0xa
	.value	0x143
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x15
	.long	.LASF111
	.byte	0xa
	.value	0x143
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x15
	.long	.LASF112
	.byte	0xa
	.value	0x143
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x15
	.long	.LASF113
	.byte	0xa
	.value	0x143
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x15
	.long	.LASF114
	.byte	0xa
	.value	0x143
	.long	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.byte	0x0
	.uleb128 0xd
	.long	.LASF115
	.byte	0x6
	.byte	0x8
	.byte	0xab
	.long	0xa49
	.uleb128 0xa
	.long	.LASF116
	.byte	0x8
	.byte	0xac
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF117
	.byte	0x8
	.byte	0xad
	.long	0x5a
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x2
	.string	"u8"
	.byte	0x23
	.byte	0x9
	.long	0x33
	.uleb128 0x2
	.string	"u16"
	.byte	0x23
	.byte	0xb
	.long	0x4c
	.uleb128 0x2
	.string	"u32"
	.byte	0x23
	.byte	0xd
	.long	0x65
	.uleb128 0x2
	.string	"u64"
	.byte	0x23
	.byte	0xf
	.long	0x7e
	.uleb128 0x5
	.byte	0x8
	.byte	0x23
	.byte	0x14
	.long	0xa97
	.uleb128 0x6
	.string	"hi"
	.byte	0x23
	.byte	0x14
	.long	0xa5e
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"lo"
	.byte	0x23
	.byte	0x14
	.long	0xa5e
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x7
	.long	.LASF118
	.byte	0x8
	.byte	0x23
	.byte	0x13
	.long	0xab4
	.uleb128 0x8
	.long	0xa74
	.uleb128 0x9
	.string	"val"
	.byte	0x23
	.byte	0x15
	.long	0xa69
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0x19
	.byte	0xbc
	.long	0xad9
	.uleb128 0xa
	.long	.LASF7
	.byte	0x19
	.byte	0xbd
	.long	0xa53
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"seg"
	.byte	0x19
	.byte	0xbe
	.long	0xa53
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0x19
	.byte	0xbb
	.long	0xaf2
	.uleb128 0x8
	.long	0xab4
	.uleb128 0xc
	.long	.LASF8
	.byte	0x19
	.byte	0xc0
	.long	0xa5e
	.byte	0x0
	.uleb128 0xd
	.long	.LASF33
	.byte	0x4
	.byte	0x19
	.byte	0xba
	.long	0xb07
	.uleb128 0xe
	.long	0xad9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0xf
	.long	0xa49
	.long	0xb17
	.uleb128 0x10
	.long	0x537
	.byte	0x3
	.byte	0x0
	.uleb128 0xf
	.long	0xa49
	.long	0xb27
	.uleb128 0x10
	.long	0x537
	.byte	0x7
	.byte	0x0
	.uleb128 0xd
	.long	.LASF119
	.byte	0x24
	.byte	0x24
	.byte	0x97
	.long	0xbc0
	.uleb128 0xa
	.long	.LASF120
	.byte	0x24
	.byte	0xb0
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF121
	.byte	0x24
	.byte	0xb1
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF122
	.byte	0x24
	.byte	0xb2
	.long	0xbc6
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF123
	.byte	0x24
	.byte	0xb3
	.long	0xa69
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF124
	.byte	0x24
	.byte	0xb4
	.long	0x53c
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF125
	.byte	0x24
	.byte	0xb5
	.long	0xa5e
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.long	.LASF126
	.byte	0x24
	.byte	0xb6
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF127
	.byte	0x24
	.byte	0xb9
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF128
	.byte	0x24
	.byte	0xba
	.long	0xa53
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF129
	.byte	0x24
	.byte	0xbb
	.long	0xbc6
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0xb27
	.uleb128 0xd
	.long	.LASF130
	.byte	0x6
	.byte	0x24
	.byte	0xa9
	.long	0xbfd
	.uleb128 0xa
	.long	.LASF131
	.byte	0x24
	.byte	0xaa
	.long	0xa53
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF132
	.byte	0x24
	.byte	0xab
	.long	0xa53
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.string	"spt"
	.byte	0x24
	.byte	0xac
	.long	0xa53
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xd
	.long	.LASF38
	.byte	0xbc
	.byte	0xa
	.byte	0x21
	.long	0xfbf
	.uleb128 0xa
	.long	.LASF39
	.byte	0xa
	.byte	0x23
	.long	0xfbf
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF40
	.byte	0xa
	.byte	0x24
	.long	0xfcf
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF41
	.byte	0xa
	.byte	0x25
	.long	0xa53
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF42
	.byte	0xa
	.byte	0x27
	.long	0xa53
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF43
	.byte	0xa
	.byte	0x28
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0xa
	.long	.LASF44
	.byte	0xa
	.byte	0x29
	.long	0xa53
	.byte	0x2
	.byte	0x23
	.uleb128 0x13
	.uleb128 0xa
	.long	.LASF45
	.byte	0xa
	.byte	0x2a
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x15
	.uleb128 0xa
	.long	.LASF46
	.byte	0xa
	.byte	0x2b
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x16
	.uleb128 0xa
	.long	.LASF47
	.byte	0xa
	.byte	0x2c
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x17
	.uleb128 0xa
	.long	.LASF48
	.byte	0xa
	.byte	0x2d
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF49
	.byte	0xa
	.byte	0x2e
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF50
	.byte	0xa
	.byte	0x2f
	.long	0xa53
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF51
	.byte	0xa
	.byte	0x30
	.long	0xa53
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.long	.LASF52
	.byte	0xa
	.byte	0x32
	.long	0xfdf
	.byte	0x2
	.byte	0x23
	.uleb128 0x1e
	.uleb128 0xa
	.long	.LASF53
	.byte	0xa
	.byte	0x33
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x3e
	.uleb128 0xa
	.long	.LASF54
	.byte	0xa
	.byte	0x34
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x3f
	.uleb128 0xa
	.long	.LASF55
	.byte	0xa
	.byte	0x36
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0xa
	.long	.LASF56
	.byte	0xa
	.byte	0x37
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x41
	.uleb128 0xa
	.long	.LASF57
	.byte	0xa
	.byte	0x38
	.long	0xfef
	.byte	0x2
	.byte	0x23
	.uleb128 0x42
	.uleb128 0xa
	.long	.LASF58
	.byte	0xa
	.byte	0x39
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x49
	.uleb128 0xa
	.long	.LASF59
	.byte	0xa
	.byte	0x3a
	.long	0xa53
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.uleb128 0xa
	.long	.LASF60
	.byte	0xa
	.byte	0x3b
	.long	0xa53
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0xa
	.long	.LASF61
	.byte	0xa
	.byte	0x3c
	.long	0xa53
	.byte	0x2
	.byte	0x23
	.uleb128 0x4e
	.uleb128 0xa
	.long	.LASF62
	.byte	0xa
	.byte	0x3e
	.long	0xfff
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0xa
	.long	.LASF63
	.byte	0xa
	.byte	0x40
	.long	0xa53
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0xa
	.long	.LASF64
	.byte	0xa
	.byte	0x41
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x62
	.uleb128 0xa
	.long	.LASF65
	.byte	0xa
	.byte	0x42
	.long	0xa53
	.byte	0x2
	.byte	0x23
	.uleb128 0x63
	.uleb128 0xa
	.long	.LASF66
	.byte	0xa
	.byte	0x43
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x65
	.uleb128 0xa
	.long	.LASF67
	.byte	0xa
	.byte	0x44
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x66
	.uleb128 0xa
	.long	.LASF68
	.byte	0xa
	.byte	0x45
	.long	0xaf2
	.byte	0x2
	.byte	0x23
	.uleb128 0x67
	.uleb128 0xa
	.long	.LASF69
	.byte	0xa
	.byte	0x46
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x6b
	.uleb128 0xa
	.long	.LASF70
	.byte	0xa
	.byte	0x47
	.long	0xa5e
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.uleb128 0xa
	.long	.LASF71
	.byte	0xa
	.byte	0x49
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0xa
	.long	.LASF72
	.byte	0xa
	.byte	0x4a
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x71
	.uleb128 0xa
	.long	.LASF73
	.byte	0xa
	.byte	0x4b
	.long	0xa53
	.byte	0x2
	.byte	0x23
	.uleb128 0x72
	.uleb128 0xa
	.long	.LASF74
	.byte	0xa
	.byte	0x4c
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0xa
	.long	.LASF75
	.byte	0xa
	.byte	0x4d
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x75
	.uleb128 0xa
	.long	.LASF76
	.byte	0xa
	.byte	0x4e
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x76
	.uleb128 0xa
	.long	.LASF77
	.byte	0xa
	.byte	0x4f
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x77
	.uleb128 0xa
	.long	.LASF78
	.byte	0xa
	.byte	0x50
	.long	0xb07
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0xa
	.long	.LASF79
	.byte	0xa
	.byte	0x51
	.long	0xb07
	.byte	0x2
	.byte	0x23
	.uleb128 0x7c
	.uleb128 0xa
	.long	.LASF80
	.byte	0xa
	.byte	0x53
	.long	0xa53
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0xa
	.long	.LASF81
	.byte	0xa
	.byte	0x54
	.long	0xa53
	.byte	0x3
	.byte	0x23
	.uleb128 0x82
	.uleb128 0xa
	.long	.LASF82
	.byte	0xa
	.byte	0x55
	.long	0xa49
	.byte	0x3
	.byte	0x23
	.uleb128 0x84
	.uleb128 0xa
	.long	.LASF83
	.byte	0xa
	.byte	0x56
	.long	0xa53
	.byte	0x3
	.byte	0x23
	.uleb128 0x85
	.uleb128 0xa
	.long	.LASF84
	.byte	0xa
	.byte	0x57
	.long	0xa49
	.byte	0x3
	.byte	0x23
	.uleb128 0x87
	.uleb128 0xa
	.long	.LASF85
	.byte	0xa
	.byte	0x58
	.long	0xa49
	.byte	0x3
	.byte	0x23
	.uleb128 0x88
	.uleb128 0xa
	.long	.LASF86
	.byte	0xa
	.byte	0x59
	.long	0xa49
	.byte	0x3
	.byte	0x23
	.uleb128 0x89
	.uleb128 0xa
	.long	.LASF87
	.byte	0xa
	.byte	0x5a
	.long	0xa49
	.byte	0x3
	.byte	0x23
	.uleb128 0x8a
	.uleb128 0xa
	.long	.LASF88
	.byte	0xa
	.byte	0x5b
	.long	0xa49
	.byte	0x3
	.byte	0x23
	.uleb128 0x8b
	.uleb128 0xa
	.long	.LASF89
	.byte	0xa
	.byte	0x5c
	.long	0xa49
	.byte	0x3
	.byte	0x23
	.uleb128 0x8c
	.uleb128 0xa
	.long	.LASF90
	.byte	0xa
	.byte	0x5d
	.long	0xa49
	.byte	0x3
	.byte	0x23
	.uleb128 0x8d
	.uleb128 0xa
	.long	.LASF91
	.byte	0xa
	.byte	0x5e
	.long	0xa49
	.byte	0x3
	.byte	0x23
	.uleb128 0x8e
	.uleb128 0xa
	.long	.LASF92
	.byte	0xa
	.byte	0x5f
	.long	0xa49
	.byte	0x3
	.byte	0x23
	.uleb128 0x8f
	.uleb128 0xa
	.long	.LASF93
	.byte	0xa
	.byte	0x61
	.long	0xb07
	.byte	0x3
	.byte	0x23
	.uleb128 0x90
	.uleb128 0xa
	.long	.LASF94
	.byte	0xa
	.byte	0x62
	.long	0x100f
	.byte	0x3
	.byte	0x23
	.uleb128 0x94
	.uleb128 0xa
	.long	.LASF95
	.byte	0xa
	.byte	0x63
	.long	0xa49
	.byte	0x3
	.byte	0x23
	.uleb128 0x96
	.uleb128 0xa
	.long	.LASF96
	.byte	0xa
	.byte	0x64
	.long	0xa49
	.byte	0x3
	.byte	0x23
	.uleb128 0x97
	.uleb128 0xa
	.long	.LASF97
	.byte	0xa
	.byte	0x65
	.long	0xaf2
	.byte	0x3
	.byte	0x23
	.uleb128 0x98
	.uleb128 0xa
	.long	.LASF98
	.byte	0xa
	.byte	0x66
	.long	0xa5e
	.byte	0x3
	.byte	0x23
	.uleb128 0x9c
	.uleb128 0xa
	.long	.LASF99
	.byte	0xa
	.byte	0x68
	.long	0xa49
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0xa
	.long	.LASF100
	.byte	0xa
	.byte	0x69
	.long	0xfef
	.byte	0x3
	.byte	0x23
	.uleb128 0xa1
	.uleb128 0xa
	.long	.LASF101
	.byte	0xa
	.byte	0x6a
	.long	0xaf2
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0xa
	.long	.LASF102
	.byte	0xa
	.byte	0x6b
	.long	0xb07
	.byte	0x3
	.byte	0x23
	.uleb128 0xac
	.uleb128 0xa
	.long	.LASF103
	.byte	0xa
	.byte	0x6d
	.long	0x101f
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0xa
	.long	.LASF104
	.byte	0xa
	.byte	0x6e
	.long	0xa53
	.byte	0x3
	.byte	0x23
	.uleb128 0xba
	.byte	0x0
	.uleb128 0xf
	.long	0xa53
	.long	0xfcf
	.uleb128 0x10
	.long	0x537
	.byte	0x3
	.byte	0x0
	.uleb128 0xf
	.long	0xa53
	.long	0xfdf
	.uleb128 0x10
	.long	0x537
	.byte	0x2
	.byte	0x0
	.uleb128 0xf
	.long	0xa49
	.long	0xfef
	.uleb128 0x10
	.long	0x537
	.byte	0x1f
	.byte	0x0
	.uleb128 0xf
	.long	0xa49
	.long	0xfff
	.uleb128 0x10
	.long	0x537
	.byte	0x6
	.byte	0x0
	.uleb128 0xf
	.long	0xa53
	.long	0x100f
	.uleb128 0x10
	.long	0x537
	.byte	0x7
	.byte	0x0
	.uleb128 0xf
	.long	0xa49
	.long	0x101f
	.uleb128 0x10
	.long	0x537
	.byte	0x1
	.byte	0x0
	.uleb128 0xf
	.long	0xa49
	.long	0x102f
	.uleb128 0x10
	.long	0x537
	.byte	0x9
	.byte	0x0
	.uleb128 0xd
	.long	.LASF133
	.byte	0x10
	.byte	0xa
	.byte	0x92
	.long	0x10e4
	.uleb128 0xa
	.long	.LASF134
	.byte	0xa
	.byte	0x93
	.long	0xa53
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF135
	.byte	0xa
	.byte	0x94
	.long	0xa53
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF136
	.byte	0xa
	.byte	0x95
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF137
	.byte	0xa
	.byte	0x96
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x6
	.string	"irq"
	.byte	0xa
	.byte	0x97
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xa
	.long	.LASF138
	.byte	0xa
	.byte	0x98
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x6
	.string	"dma"
	.byte	0xa
	.byte	0x99
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.string	"pio"
	.byte	0xa
	.byte	0x9a
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0xa
	.long	.LASF139
	.byte	0xa
	.byte	0x9b
	.long	0xa53
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xa
	.long	.LASF140
	.byte	0xa
	.byte	0x9c
	.long	0xa53
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF141
	.byte	0xa
	.byte	0x9d
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF142
	.byte	0xa
	.byte	0x9e
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xd
	.long	.LASF143
	.byte	0x18
	.byte	0xa
	.byte	0xa2
	.long	0x116f
	.uleb128 0xa
	.long	.LASF144
	.byte	0xa
	.byte	0xa3
	.long	0xbc0
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF145
	.byte	0xa
	.byte	0xa4
	.long	0xa5e
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF146
	.byte	0xa
	.byte	0xa5
	.long	0xa53
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF147
	.byte	0xa
	.byte	0xa6
	.long	0xa53
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xa
	.long	.LASF148
	.byte	0xa
	.byte	0xa7
	.long	0xa53
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF149
	.byte	0xa
	.byte	0xa8
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF150
	.byte	0xa
	.byte	0xa9
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.uleb128 0xa
	.long	.LASF151
	.byte	0xa
	.byte	0xaa
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF122
	.byte	0xa
	.byte	0xad
	.long	0xbc6
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.byte	0x0
	.uleb128 0xd
	.long	.LASF152
	.byte	0x10
	.byte	0xa
	.byte	0xb0
	.long	0x1224
	.uleb128 0xa
	.long	.LASF132
	.byte	0xa
	.byte	0xb1
	.long	0xa53
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF131
	.byte	0xa
	.byte	0xb2
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF153
	.byte	0xa
	.byte	0xb3
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0xa
	.long	.LASF154
	.byte	0xa
	.byte	0xb4
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF155
	.byte	0xa
	.byte	0xb5
	.long	0xa53
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0xa
	.long	.LASF140
	.byte	0xa
	.byte	0xb6
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0xa
	.long	.LASF156
	.byte	0xa
	.byte	0xb7
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF157
	.byte	0xa
	.byte	0xb8
	.long	0xa53
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0xa
	.long	.LASF158
	.byte	0xa
	.byte	0xb9
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0xb
	.uleb128 0xa
	.long	.LASF159
	.byte	0xa
	.byte	0xba
	.long	0xa53
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF123
	.byte	0xa
	.byte	0xbb
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF142
	.byte	0xa
	.byte	0xbc
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.byte	0x0
	.uleb128 0x5
	.byte	0x8
	.byte	0xa
	.byte	0xc1
	.long	0x1257
	.uleb128 0xa
	.long	.LASF160
	.byte	0xa
	.byte	0xc2
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF161
	.byte	0xa
	.byte	0xc3
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF162
	.byte	0xa
	.byte	0xc4
	.long	0x1257
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0xf
	.long	0xa49
	.long	0x1267
	.uleb128 0x10
	.long	0x537
	.byte	0x5
	.byte	0x0
	.uleb128 0xb
	.byte	0x8
	.byte	0xa
	.byte	0xc0
	.long	0x1280
	.uleb128 0x8
	.long	0x1224
	.uleb128 0xc
	.long	.LASF163
	.byte	0xa
	.byte	0xc6
	.long	0xa69
	.byte	0x0
	.uleb128 0xd
	.long	.LASF164
	.byte	0x8
	.byte	0xa
	.byte	0xbf
	.long	0x1295
	.uleb128 0xe
	.long	0x1267
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x16
	.long	.LASF165
	.value	0xb68
	.byte	0xa
	.byte	0xca
	.long	0x13a8
	.uleb128 0xa
	.long	.LASF106
	.byte	0xa
	.byte	0xcb
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF166
	.byte	0xa
	.byte	0xcc
	.long	0x13a8
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF167
	.byte	0xa
	.byte	0xcd
	.long	0xaf2
	.byte	0x2
	.byte	0x23
	.uleb128 0x22
	.uleb128 0xa
	.long	.LASF168
	.byte	0xa
	.byte	0xce
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x26
	.uleb128 0xa
	.long	.LASF169
	.byte	0xa
	.byte	0xcf
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x27
	.uleb128 0xa
	.long	.LASF170
	.byte	0xa
	.byte	0xd0
	.long	0xb17
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0xa
	.long	.LASF171
	.byte	0xa
	.byte	0xd2
	.long	0x13b8
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0xa
	.long	.LASF172
	.byte	0xa
	.byte	0xd5
	.long	0x13c8
	.byte	0x2
	.byte	0x23
	.uleb128 0x3d
	.uleb128 0xa
	.long	.LASF173
	.byte	0xa
	.byte	0xd8
	.long	0x13d8
	.byte	0x2
	.byte	0x23
	.uleb128 0x5d
	.uleb128 0xa
	.long	.LASF174
	.byte	0xa
	.byte	0xdb
	.long	0xa49
	.byte	0x3
	.byte	0x23
	.uleb128 0x121
	.uleb128 0xa
	.long	.LASF175
	.byte	0xa
	.byte	0xdc
	.long	0x1280
	.byte	0x3
	.byte	0x23
	.uleb128 0x122
	.uleb128 0xa
	.long	.LASF176
	.byte	0xa
	.byte	0xde
	.long	0x6c
	.byte	0x3
	.byte	0x23
	.uleb128 0x12a
	.uleb128 0xa
	.long	.LASF177
	.byte	0xa
	.byte	0xe1
	.long	0x10e4
	.byte	0x3
	.byte	0x23
	.uleb128 0x12e
	.uleb128 0xa
	.long	.LASF178
	.byte	0xa
	.byte	0xe4
	.long	0x102f
	.byte	0x3
	.byte	0x23
	.uleb128 0x146
	.uleb128 0xa
	.long	.LASF179
	.byte	0xa
	.byte	0xe7
	.long	0x13e8
	.byte	0x3
	.byte	0x23
	.uleb128 0x156
	.uleb128 0xa
	.long	.LASF180
	.byte	0xa
	.byte	0xe9
	.long	0xa53
	.byte	0x3
	.byte	0x23
	.uleb128 0x166
	.uleb128 0xa
	.long	.LASF181
	.byte	0xa
	.byte	0xec
	.long	0x13f8
	.byte	0x3
	.byte	0x23
	.uleb128 0x168
	.uleb128 0xa
	.long	.LASF182
	.byte	0xa
	.byte	0xee
	.long	0x1409
	.byte	0x3
	.byte	0x23
	.uleb128 0x368
	.byte	0x0
	.uleb128 0xf
	.long	0xa49
	.long	0x13b8
	.uleb128 0x10
	.long	0x537
	.byte	0x20
	.byte	0x0
	.uleb128 0xf
	.long	0xa49
	.long	0x13c8
	.uleb128 0x10
	.long	0x537
	.byte	0xc
	.byte	0x0
	.uleb128 0xf
	.long	0x116f
	.long	0x13d8
	.uleb128 0x10
	.long	0x537
	.byte	0x1
	.byte	0x0
	.uleb128 0xf
	.long	0xa49
	.long	0x13e8
	.uleb128 0x10
	.long	0x537
	.byte	0xc3
	.byte	0x0
	.uleb128 0xf
	.long	0xa49
	.long	0x13f8
	.uleb128 0x10
	.long	0x537
	.byte	0xf
	.byte	0x0
	.uleb128 0xf
	.long	0xa49
	.long	0x1409
	.uleb128 0x17
	.long	0x537
	.value	0x1ff
	.byte	0x0
	.uleb128 0xf
	.long	0xa49
	.long	0x141a
	.uleb128 0x17
	.long	0x537
	.value	0x7ff
	.byte	0x0
	.uleb128 0x14
	.long	.LASF105
	.byte	0xa
	.byte	0xa
	.value	0x13e
	.long	0x14af
	.uleb128 0x15
	.long	.LASF106
	.byte	0xa
	.value	0x13f
	.long	0xa53
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x15
	.long	.LASF107
	.byte	0xa
	.value	0x140
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x15
	.long	.LASF108
	.byte	0xa
	.value	0x141
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x15
	.long	.LASF109
	.byte	0xa
	.value	0x142
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x15
	.long	.LASF110
	.byte	0xa
	.value	0x143
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x15
	.long	.LASF111
	.byte	0xa
	.value	0x143
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x15
	.long	.LASF112
	.byte	0xa
	.value	0x143
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x15
	.long	.LASF113
	.byte	0xa
	.value	0x143
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x15
	.long	.LASF114
	.byte	0xa
	.value	0x143
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.byte	0x0
	.uleb128 0x14
	.long	.LASF183
	.byte	0xc
	.byte	0x8
	.value	0x177
	.long	0x14e7
	.uleb128 0x6
	.string	"top"
	.byte	0x4
	.byte	0x1f
	.long	0xa5e
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF184
	.byte	0x4
	.byte	0x1f
	.long	0xa5e
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"cur"
	.byte	0x4
	.byte	0x1f
	.long	0xa5e
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0xd
	.long	.LASF185
	.byte	0x14
	.byte	0x4
	.byte	0xb2
	.long	0x153a
	.uleb128 0xa
	.long	.LASF163
	.byte	0x4
	.byte	0xb3
	.long	0x53a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF186
	.byte	0x4
	.byte	0xb4
	.long	0xa5e
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF187
	.byte	0x4
	.byte	0xb5
	.long	0xa5e
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF188
	.byte	0x4
	.byte	0xb6
	.long	0xa5e
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF189
	.byte	0x4
	.byte	0xb7
	.long	0x153a
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0x14e7
	.uleb128 0x14
	.long	.LASF190
	.byte	0x10
	.byte	0x4
	.value	0x168
	.long	0x15b7
	.uleb128 0x15
	.long	.LASF191
	.byte	0x4
	.value	0x169
	.long	0xa5e
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x15
	.long	.LASF192
	.byte	0x4
	.value	0x16a
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x15
	.long	.LASF116
	.byte	0x4
	.value	0x16b
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x15
	.long	.LASF142
	.byte	0x4
	.value	0x16c
	.long	0xa49
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x15
	.long	.LASF193
	.byte	0x4
	.value	0x16d
	.long	0xa53
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x15
	.long	.LASF194
	.byte	0x4
	.value	0x16e
	.long	0xa53
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0x15
	.long	.LASF140
	.byte	0x4
	.value	0x16f
	.long	0x15b7
	.byte	0x2
	.byte	0x23
	.uleb128 0xb
	.byte	0x0
	.uleb128 0xf
	.long	0xa49
	.long	0x15c7
	.uleb128 0x10
	.long	0x537
	.byte	0x4
	.byte	0x0
	.uleb128 0x2
	.string	"u8"
	.byte	0x23
	.byte	0x9
	.long	0x33
	.uleb128 0x2
	.string	"u16"
	.byte	0x23
	.byte	0xb
	.long	0x4c
	.uleb128 0x2
	.string	"u32"
	.byte	0x23
	.byte	0xd
	.long	0x65
	.uleb128 0x2
	.string	"u64"
	.byte	0x23
	.byte	0xf
	.long	0x7e
	.uleb128 0x5
	.byte	0x8
	.byte	0x23
	.byte	0x14
	.long	0x1615
	.uleb128 0x6
	.string	"hi"
	.byte	0x23
	.byte	0x14
	.long	0x15dc
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"lo"
	.byte	0x23
	.byte	0x14
	.long	0x15dc
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x7
	.long	.LASF118
	.byte	0x8
	.byte	0x23
	.byte	0x13
	.long	0x1632
	.uleb128 0x8
	.long	0x15f2
	.uleb128 0x9
	.string	"val"
	.byte	0x23
	.byte	0x15
	.long	0x15e7
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0x19
	.byte	0xbc
	.long	0x1657
	.uleb128 0xa
	.long	.LASF7
	.byte	0x19
	.byte	0xbd
	.long	0x15d1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"seg"
	.byte	0x19
	.byte	0xbe
	.long	0x15d1
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0x19
	.byte	0xbb
	.long	0x1670
	.uleb128 0x8
	.long	0x1632
	.uleb128 0xc
	.long	.LASF8
	.byte	0x19
	.byte	0xc0
	.long	0x15dc
	.byte	0x0
	.uleb128 0xd
	.long	.LASF33
	.byte	0x4
	.byte	0x19
	.byte	0xba
	.long	0x1685
	.uleb128 0xe
	.long	0x1657
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0xf
	.long	0x15c7
	.long	0x1695
	.uleb128 0x10
	.long	0x537
	.byte	0x3
	.byte	0x0
	.uleb128 0xf
	.long	0x15c7
	.long	0x16a5
	.uleb128 0x10
	.long	0x537
	.byte	0x7
	.byte	0x0
	.uleb128 0xd
	.long	.LASF119
	.byte	0x24
	.byte	0x24
	.byte	0x97
	.long	0x173e
	.uleb128 0xa
	.long	.LASF120
	.byte	0x24
	.byte	0xb0
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF121
	.byte	0x24
	.byte	0xb1
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF122
	.byte	0x24
	.byte	0xb2
	.long	0x1744
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF123
	.byte	0x24
	.byte	0xb3
	.long	0x15e7
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF124
	.byte	0x24
	.byte	0xb4
	.long	0x53c
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF125
	.byte	0x24
	.byte	0xb5
	.long	0x15dc
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.long	.LASF126
	.byte	0x24
	.byte	0xb6
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF127
	.byte	0x24
	.byte	0xb9
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF128
	.byte	0x24
	.byte	0xba
	.long	0x15d1
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF129
	.byte	0x24
	.byte	0xbb
	.long	0x1744
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0x16a5
	.uleb128 0xd
	.long	.LASF130
	.byte	0x6
	.byte	0x24
	.byte	0xa9
	.long	0x177b
	.uleb128 0xa
	.long	.LASF131
	.byte	0x24
	.byte	0xaa
	.long	0x15d1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF132
	.byte	0x24
	.byte	0xab
	.long	0x15d1
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.string	"spt"
	.byte	0x24
	.byte	0xac
	.long	0x15d1
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xd
	.long	.LASF38
	.byte	0xbc
	.byte	0xa
	.byte	0x21
	.long	0x1b3d
	.uleb128 0xa
	.long	.LASF39
	.byte	0xa
	.byte	0x23
	.long	0x1b3d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF40
	.byte	0xa
	.byte	0x24
	.long	0x1b4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF41
	.byte	0xa
	.byte	0x25
	.long	0x15d1
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF42
	.byte	0xa
	.byte	0x27
	.long	0x15d1
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF43
	.byte	0xa
	.byte	0x28
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0xa
	.long	.LASF44
	.byte	0xa
	.byte	0x29
	.long	0x15d1
	.byte	0x2
	.byte	0x23
	.uleb128 0x13
	.uleb128 0xa
	.long	.LASF45
	.byte	0xa
	.byte	0x2a
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x15
	.uleb128 0xa
	.long	.LASF46
	.byte	0xa
	.byte	0x2b
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x16
	.uleb128 0xa
	.long	.LASF47
	.byte	0xa
	.byte	0x2c
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x17
	.uleb128 0xa
	.long	.LASF48
	.byte	0xa
	.byte	0x2d
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF49
	.byte	0xa
	.byte	0x2e
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF50
	.byte	0xa
	.byte	0x2f
	.long	0x15d1
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF51
	.byte	0xa
	.byte	0x30
	.long	0x15d1
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.long	.LASF52
	.byte	0xa
	.byte	0x32
	.long	0x1b5d
	.byte	0x2
	.byte	0x23
	.uleb128 0x1e
	.uleb128 0xa
	.long	.LASF53
	.byte	0xa
	.byte	0x33
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x3e
	.uleb128 0xa
	.long	.LASF54
	.byte	0xa
	.byte	0x34
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x3f
	.uleb128 0xa
	.long	.LASF55
	.byte	0xa
	.byte	0x36
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0xa
	.long	.LASF56
	.byte	0xa
	.byte	0x37
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x41
	.uleb128 0xa
	.long	.LASF57
	.byte	0xa
	.byte	0x38
	.long	0x1b6d
	.byte	0x2
	.byte	0x23
	.uleb128 0x42
	.uleb128 0xa
	.long	.LASF58
	.byte	0xa
	.byte	0x39
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x49
	.uleb128 0xa
	.long	.LASF59
	.byte	0xa
	.byte	0x3a
	.long	0x15d1
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.uleb128 0xa
	.long	.LASF60
	.byte	0xa
	.byte	0x3b
	.long	0x15d1
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0xa
	.long	.LASF61
	.byte	0xa
	.byte	0x3c
	.long	0x15d1
	.byte	0x2
	.byte	0x23
	.uleb128 0x4e
	.uleb128 0xa
	.long	.LASF62
	.byte	0xa
	.byte	0x3e
	.long	0x1b7d
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0xa
	.long	.LASF63
	.byte	0xa
	.byte	0x40
	.long	0x15d1
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0xa
	.long	.LASF64
	.byte	0xa
	.byte	0x41
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x62
	.uleb128 0xa
	.long	.LASF65
	.byte	0xa
	.byte	0x42
	.long	0x15d1
	.byte	0x2
	.byte	0x23
	.uleb128 0x63
	.uleb128 0xa
	.long	.LASF66
	.byte	0xa
	.byte	0x43
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x65
	.uleb128 0xa
	.long	.LASF67
	.byte	0xa
	.byte	0x44
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x66
	.uleb128 0xa
	.long	.LASF68
	.byte	0xa
	.byte	0x45
	.long	0x1670
	.byte	0x2
	.byte	0x23
	.uleb128 0x67
	.uleb128 0xa
	.long	.LASF69
	.byte	0xa
	.byte	0x46
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x6b
	.uleb128 0xa
	.long	.LASF70
	.byte	0xa
	.byte	0x47
	.long	0x15dc
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.uleb128 0xa
	.long	.LASF71
	.byte	0xa
	.byte	0x49
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0xa
	.long	.LASF72
	.byte	0xa
	.byte	0x4a
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x71
	.uleb128 0xa
	.long	.LASF73
	.byte	0xa
	.byte	0x4b
	.long	0x15d1
	.byte	0x2
	.byte	0x23
	.uleb128 0x72
	.uleb128 0xa
	.long	.LASF74
	.byte	0xa
	.byte	0x4c
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0xa
	.long	.LASF75
	.byte	0xa
	.byte	0x4d
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x75
	.uleb128 0xa
	.long	.LASF76
	.byte	0xa
	.byte	0x4e
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x76
	.uleb128 0xa
	.long	.LASF77
	.byte	0xa
	.byte	0x4f
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x77
	.uleb128 0xa
	.long	.LASF78
	.byte	0xa
	.byte	0x50
	.long	0x1685
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0xa
	.long	.LASF79
	.byte	0xa
	.byte	0x51
	.long	0x1685
	.byte	0x2
	.byte	0x23
	.uleb128 0x7c
	.uleb128 0xa
	.long	.LASF80
	.byte	0xa
	.byte	0x53
	.long	0x15d1
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0xa
	.long	.LASF81
	.byte	0xa
	.byte	0x54
	.long	0x15d1
	.byte	0x3
	.byte	0x23
	.uleb128 0x82
	.uleb128 0xa
	.long	.LASF82
	.byte	0xa
	.byte	0x55
	.long	0x15c7
	.byte	0x3
	.byte	0x23
	.uleb128 0x84
	.uleb128 0xa
	.long	.LASF83
	.byte	0xa
	.byte	0x56
	.long	0x15d1
	.byte	0x3
	.byte	0x23
	.uleb128 0x85
	.uleb128 0xa
	.long	.LASF84
	.byte	0xa
	.byte	0x57
	.long	0x15c7
	.byte	0x3
	.byte	0x23
	.uleb128 0x87
	.uleb128 0xa
	.long	.LASF85
	.byte	0xa
	.byte	0x58
	.long	0x15c7
	.byte	0x3
	.byte	0x23
	.uleb128 0x88
	.uleb128 0xa
	.long	.LASF86
	.byte	0xa
	.byte	0x59
	.long	0x15c7
	.byte	0x3
	.byte	0x23
	.uleb128 0x89
	.uleb128 0xa
	.long	.LASF87
	.byte	0xa
	.byte	0x5a
	.long	0x15c7
	.byte	0x3
	.byte	0x23
	.uleb128 0x8a
	.uleb128 0xa
	.long	.LASF88
	.byte	0xa
	.byte	0x5b
	.long	0x15c7
	.byte	0x3
	.byte	0x23
	.uleb128 0x8b
	.uleb128 0xa
	.long	.LASF89
	.byte	0xa
	.byte	0x5c
	.long	0x15c7
	.byte	0x3
	.byte	0x23
	.uleb128 0x8c
	.uleb128 0xa
	.long	.LASF90
	.byte	0xa
	.byte	0x5d
	.long	0x15c7
	.byte	0x3
	.byte	0x23
	.uleb128 0x8d
	.uleb128 0xa
	.long	.LASF91
	.byte	0xa
	.byte	0x5e
	.long	0x15c7
	.byte	0x3
	.byte	0x23
	.uleb128 0x8e
	.uleb128 0xa
	.long	.LASF92
	.byte	0xa
	.byte	0x5f
	.long	0x15c7
	.byte	0x3
	.byte	0x23
	.uleb128 0x8f
	.uleb128 0xa
	.long	.LASF93
	.byte	0xa
	.byte	0x61
	.long	0x1685
	.byte	0x3
	.byte	0x23
	.uleb128 0x90
	.uleb128 0xa
	.long	.LASF94
	.byte	0xa
	.byte	0x62
	.long	0x1b8d
	.byte	0x3
	.byte	0x23
	.uleb128 0x94
	.uleb128 0xa
	.long	.LASF95
	.byte	0xa
	.byte	0x63
	.long	0x15c7
	.byte	0x3
	.byte	0x23
	.uleb128 0x96
	.uleb128 0xa
	.long	.LASF96
	.byte	0xa
	.byte	0x64
	.long	0x15c7
	.byte	0x3
	.byte	0x23
	.uleb128 0x97
	.uleb128 0xa
	.long	.LASF97
	.byte	0xa
	.byte	0x65
	.long	0x1670
	.byte	0x3
	.byte	0x23
	.uleb128 0x98
	.uleb128 0xa
	.long	.LASF98
	.byte	0xa
	.byte	0x66
	.long	0x15dc
	.byte	0x3
	.byte	0x23
	.uleb128 0x9c
	.uleb128 0xa
	.long	.LASF99
	.byte	0xa
	.byte	0x68
	.long	0x15c7
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0xa
	.long	.LASF100
	.byte	0xa
	.byte	0x69
	.long	0x1b6d
	.byte	0x3
	.byte	0x23
	.uleb128 0xa1
	.uleb128 0xa
	.long	.LASF101
	.byte	0xa
	.byte	0x6a
	.long	0x1670
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0xa
	.long	.LASF102
	.byte	0xa
	.byte	0x6b
	.long	0x1685
	.byte	0x3
	.byte	0x23
	.uleb128 0xac
	.uleb128 0xa
	.long	.LASF103
	.byte	0xa
	.byte	0x6d
	.long	0x1b9d
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0xa
	.long	.LASF104
	.byte	0xa
	.byte	0x6e
	.long	0x15d1
	.byte	0x3
	.byte	0x23
	.uleb128 0xba
	.byte	0x0
	.uleb128 0xf
	.long	0x15d1
	.long	0x1b4d
	.uleb128 0x10
	.long	0x537
	.byte	0x3
	.byte	0x0
	.uleb128 0xf
	.long	0x15d1
	.long	0x1b5d
	.uleb128 0x10
	.long	0x537
	.byte	0x2
	.byte	0x0
	.uleb128 0xf
	.long	0x15c7
	.long	0x1b6d
	.uleb128 0x10
	.long	0x537
	.byte	0x1f
	.byte	0x0
	.uleb128 0xf
	.long	0x15c7
	.long	0x1b7d
	.uleb128 0x10
	.long	0x537
	.byte	0x6
	.byte	0x0
	.uleb128 0xf
	.long	0x15d1
	.long	0x1b8d
	.uleb128 0x10
	.long	0x537
	.byte	0x7
	.byte	0x0
	.uleb128 0xf
	.long	0x15c7
	.long	0x1b9d
	.uleb128 0x10
	.long	0x537
	.byte	0x1
	.byte	0x0
	.uleb128 0xf
	.long	0x15c7
	.long	0x1bad
	.uleb128 0x10
	.long	0x537
	.byte	0x9
	.byte	0x0
	.uleb128 0xd
	.long	.LASF133
	.byte	0x10
	.byte	0xa
	.byte	0x92
	.long	0x1c62
	.uleb128 0xa
	.long	.LASF134
	.byte	0xa
	.byte	0x93
	.long	0x15d1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF135
	.byte	0xa
	.byte	0x94
	.long	0x15d1
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF136
	.byte	0xa
	.byte	0x95
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF137
	.byte	0xa
	.byte	0x96
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x6
	.string	"irq"
	.byte	0xa
	.byte	0x97
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xa
	.long	.LASF138
	.byte	0xa
	.byte	0x98
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x6
	.string	"dma"
	.byte	0xa
	.byte	0x99
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.string	"pio"
	.byte	0xa
	.byte	0x9a
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0xa
	.long	.LASF139
	.byte	0xa
	.byte	0x9b
	.long	0x15d1
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xa
	.long	.LASF140
	.byte	0xa
	.byte	0x9c
	.long	0x15d1
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF141
	.byte	0xa
	.byte	0x9d
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF142
	.byte	0xa
	.byte	0x9e
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xd
	.long	.LASF143
	.byte	0x18
	.byte	0xa
	.byte	0xa2
	.long	0x1ced
	.uleb128 0xa
	.long	.LASF144
	.byte	0xa
	.byte	0xa3
	.long	0x173e
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF145
	.byte	0xa
	.byte	0xa4
	.long	0x15dc
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF146
	.byte	0xa
	.byte	0xa5
	.long	0x15d1
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF147
	.byte	0xa
	.byte	0xa6
	.long	0x15d1
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xa
	.long	.LASF148
	.byte	0xa
	.byte	0xa7
	.long	0x15d1
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF149
	.byte	0xa
	.byte	0xa8
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF150
	.byte	0xa
	.byte	0xa9
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.uleb128 0xa
	.long	.LASF151
	.byte	0xa
	.byte	0xaa
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF122
	.byte	0xa
	.byte	0xad
	.long	0x1744
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.byte	0x0
	.uleb128 0xd
	.long	.LASF152
	.byte	0x10
	.byte	0xa
	.byte	0xb0
	.long	0x1da2
	.uleb128 0xa
	.long	.LASF132
	.byte	0xa
	.byte	0xb1
	.long	0x15d1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF131
	.byte	0xa
	.byte	0xb2
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF153
	.byte	0xa
	.byte	0xb3
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0xa
	.long	.LASF154
	.byte	0xa
	.byte	0xb4
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF155
	.byte	0xa
	.byte	0xb5
	.long	0x15d1
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0xa
	.long	.LASF140
	.byte	0xa
	.byte	0xb6
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0xa
	.long	.LASF156
	.byte	0xa
	.byte	0xb7
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF157
	.byte	0xa
	.byte	0xb8
	.long	0x15d1
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0xa
	.long	.LASF158
	.byte	0xa
	.byte	0xb9
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0xb
	.uleb128 0xa
	.long	.LASF159
	.byte	0xa
	.byte	0xba
	.long	0x15d1
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF123
	.byte	0xa
	.byte	0xbb
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF142
	.byte	0xa
	.byte	0xbc
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.byte	0x0
	.uleb128 0x5
	.byte	0x8
	.byte	0xa
	.byte	0xc1
	.long	0x1dd5
	.uleb128 0xa
	.long	.LASF160
	.byte	0xa
	.byte	0xc2
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF161
	.byte	0xa
	.byte	0xc3
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF162
	.byte	0xa
	.byte	0xc4
	.long	0x1dd5
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0xf
	.long	0x15c7
	.long	0x1de5
	.uleb128 0x10
	.long	0x537
	.byte	0x5
	.byte	0x0
	.uleb128 0xb
	.byte	0x8
	.byte	0xa
	.byte	0xc0
	.long	0x1dfe
	.uleb128 0x8
	.long	0x1da2
	.uleb128 0xc
	.long	.LASF163
	.byte	0xa
	.byte	0xc6
	.long	0x15e7
	.byte	0x0
	.uleb128 0xd
	.long	.LASF164
	.byte	0x8
	.byte	0xa
	.byte	0xbf
	.long	0x1e13
	.uleb128 0xe
	.long	0x1de5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x16
	.long	.LASF165
	.value	0xb68
	.byte	0xa
	.byte	0xca
	.long	0x1f26
	.uleb128 0xa
	.long	.LASF106
	.byte	0xa
	.byte	0xcb
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF166
	.byte	0xa
	.byte	0xcc
	.long	0x1f26
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF167
	.byte	0xa
	.byte	0xcd
	.long	0x1670
	.byte	0x2
	.byte	0x23
	.uleb128 0x22
	.uleb128 0xa
	.long	.LASF168
	.byte	0xa
	.byte	0xce
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x26
	.uleb128 0xa
	.long	.LASF169
	.byte	0xa
	.byte	0xcf
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x27
	.uleb128 0xa
	.long	.LASF170
	.byte	0xa
	.byte	0xd0
	.long	0x1695
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0xa
	.long	.LASF171
	.byte	0xa
	.byte	0xd2
	.long	0x1f36
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0xa
	.long	.LASF172
	.byte	0xa
	.byte	0xd5
	.long	0x1f46
	.byte	0x2
	.byte	0x23
	.uleb128 0x3d
	.uleb128 0xa
	.long	.LASF173
	.byte	0xa
	.byte	0xd8
	.long	0x1f56
	.byte	0x2
	.byte	0x23
	.uleb128 0x5d
	.uleb128 0xa
	.long	.LASF174
	.byte	0xa
	.byte	0xdb
	.long	0x15c7
	.byte	0x3
	.byte	0x23
	.uleb128 0x121
	.uleb128 0xa
	.long	.LASF175
	.byte	0xa
	.byte	0xdc
	.long	0x1dfe
	.byte	0x3
	.byte	0x23
	.uleb128 0x122
	.uleb128 0xa
	.long	.LASF176
	.byte	0xa
	.byte	0xde
	.long	0x6c
	.byte	0x3
	.byte	0x23
	.uleb128 0x12a
	.uleb128 0xa
	.long	.LASF177
	.byte	0xa
	.byte	0xe1
	.long	0x1c62
	.byte	0x3
	.byte	0x23
	.uleb128 0x12e
	.uleb128 0xa
	.long	.LASF178
	.byte	0xa
	.byte	0xe4
	.long	0x1bad
	.byte	0x3
	.byte	0x23
	.uleb128 0x146
	.uleb128 0xa
	.long	.LASF179
	.byte	0xa
	.byte	0xe7
	.long	0x1f66
	.byte	0x3
	.byte	0x23
	.uleb128 0x156
	.uleb128 0xa
	.long	.LASF180
	.byte	0xa
	.byte	0xe9
	.long	0x15d1
	.byte	0x3
	.byte	0x23
	.uleb128 0x166
	.uleb128 0xa
	.long	.LASF181
	.byte	0xa
	.byte	0xec
	.long	0x1f76
	.byte	0x3
	.byte	0x23
	.uleb128 0x168
	.uleb128 0xa
	.long	.LASF182
	.byte	0xa
	.byte	0xee
	.long	0x1f87
	.byte	0x3
	.byte	0x23
	.uleb128 0x368
	.byte	0x0
	.uleb128 0xf
	.long	0x15c7
	.long	0x1f36
	.uleb128 0x10
	.long	0x537
	.byte	0x20
	.byte	0x0
	.uleb128 0xf
	.long	0x15c7
	.long	0x1f46
	.uleb128 0x10
	.long	0x537
	.byte	0xc
	.byte	0x0
	.uleb128 0xf
	.long	0x1ced
	.long	0x1f56
	.uleb128 0x10
	.long	0x537
	.byte	0x1
	.byte	0x0
	.uleb128 0xf
	.long	0x15c7
	.long	0x1f66
	.uleb128 0x10
	.long	0x537
	.byte	0xc3
	.byte	0x0
	.uleb128 0xf
	.long	0x15c7
	.long	0x1f76
	.uleb128 0x10
	.long	0x537
	.byte	0xf
	.byte	0x0
	.uleb128 0xf
	.long	0x15c7
	.long	0x1f87
	.uleb128 0x17
	.long	0x537
	.value	0x1ff
	.byte	0x0
	.uleb128 0xf
	.long	0x15c7
	.long	0x1f98
	.uleb128 0x17
	.long	0x537
	.value	0x7ff
	.byte	0x0
	.uleb128 0x14
	.long	.LASF105
	.byte	0xa
	.byte	0xa
	.value	0x13e
	.long	0x202d
	.uleb128 0x15
	.long	.LASF106
	.byte	0xa
	.value	0x13f
	.long	0x15d1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x15
	.long	.LASF107
	.byte	0xa
	.value	0x140
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x15
	.long	.LASF108
	.byte	0xa
	.value	0x141
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x15
	.long	.LASF109
	.byte	0xa
	.value	0x142
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x15
	.long	.LASF110
	.byte	0xa
	.value	0x143
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x15
	.long	.LASF111
	.byte	0xa
	.value	0x143
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x15
	.long	.LASF112
	.byte	0xa
	.value	0x143
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x15
	.long	.LASF113
	.byte	0xa
	.value	0x143
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x15
	.long	.LASF114
	.byte	0xa
	.value	0x143
	.long	0x15c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.byte	0x0
	.uleb128 0xd
	.long	.LASF195
	.byte	0x4
	.byte	0x8
	.byte	0xd6
	.long	0x2048
	.uleb128 0xa
	.long	.LASF196
	.byte	0x8
	.byte	0xd6
	.long	0x15dc
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0xd
	.long	.LASF197
	.byte	0xc
	.byte	0x8
	.byte	0xd0
	.long	0x207f
	.uleb128 0xa
	.long	.LASF189
	.byte	0x12
	.byte	0x7a
	.long	0x207f
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF198
	.byte	0x12
	.byte	0x7b
	.long	0x53a
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF199
	.byte	0x12
	.byte	0x7c
	.long	0x2085
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0x2048
	.uleb128 0x13
	.byte	0x4
	.long	0x207f
	.uleb128 0x18
	.long	.LASF200
	.byte	0x25
	.byte	0x28
	.long	0x2096
	.uleb128 0x19
	.byte	0x4
	.long	.LASF1115
	.long	0x542
	.uleb128 0x18
	.long	.LASF201
	.byte	0x25
	.byte	0x66
	.long	0x208b
	.uleb128 0x2
	.string	"u8"
	.byte	0x23
	.byte	0x9
	.long	0x33
	.uleb128 0x2
	.string	"u16"
	.byte	0x23
	.byte	0xb
	.long	0x4c
	.uleb128 0x2
	.string	"u32"
	.byte	0x23
	.byte	0xd
	.long	0x65
	.uleb128 0x2
	.string	"s32"
	.byte	0x23
	.byte	0xe
	.long	0x6c
	.uleb128 0x2
	.string	"u64"
	.byte	0x23
	.byte	0xf
	.long	0x7e
	.uleb128 0x5
	.byte	0x8
	.byte	0x23
	.byte	0x14
	.long	0x2104
	.uleb128 0x6
	.string	"hi"
	.byte	0x23
	.byte	0x14
	.long	0x20c0
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"lo"
	.byte	0x23
	.byte	0x14
	.long	0x20c0
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x7
	.long	.LASF118
	.byte	0x8
	.byte	0x23
	.byte	0x13
	.long	0x2121
	.uleb128 0x8
	.long	0x20e1
	.uleb128 0x9
	.string	"val"
	.byte	0x23
	.byte	0x15
	.long	0x20d6
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0x19
	.byte	0xbc
	.long	0x2146
	.uleb128 0xa
	.long	.LASF7
	.byte	0x19
	.byte	0xbd
	.long	0x20b5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"seg"
	.byte	0x19
	.byte	0xbe
	.long	0x20b5
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0x19
	.byte	0xbb
	.long	0x215f
	.uleb128 0x8
	.long	0x2121
	.uleb128 0xc
	.long	.LASF8
	.byte	0x19
	.byte	0xc0
	.long	0x20c0
	.byte	0x0
	.uleb128 0xd
	.long	.LASF33
	.byte	0x4
	.byte	0x19
	.byte	0xba
	.long	0x2174
	.uleb128 0xe
	.long	0x2146
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0x2198
	.uleb128 0x6
	.string	"di"
	.byte	0xe
	.byte	0x28
	.long	0x20b5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF9
	.byte	0xe
	.byte	0x28
	.long	0x20b5
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0x21d9
	.uleb128 0xa
	.long	.LASF10
	.byte	0xe
	.byte	0x28
	.long	0x20ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF9
	.byte	0xe
	.byte	0x28
	.long	0x20ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF11
	.byte	0xe
	.byte	0x28
	.long	0x20ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF12
	.byte	0xe
	.byte	0x28
	.long	0x20ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0x21f7
	.uleb128 0x9
	.string	"edi"
	.byte	0xe
	.byte	0x28
	.long	0x20c0
	.uleb128 0x8
	.long	0x2174
	.uleb128 0x8
	.long	0x2198
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0x221b
	.uleb128 0x6
	.string	"si"
	.byte	0xe
	.byte	0x29
	.long	0x20b5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF13
	.byte	0xe
	.byte	0x29
	.long	0x20b5
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0x225c
	.uleb128 0xa
	.long	.LASF14
	.byte	0xe
	.byte	0x29
	.long	0x20ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF13
	.byte	0xe
	.byte	0x29
	.long	0x20ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF15
	.byte	0xe
	.byte	0x29
	.long	0x20ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF16
	.byte	0xe
	.byte	0x29
	.long	0x20ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0x227a
	.uleb128 0x9
	.string	"esi"
	.byte	0xe
	.byte	0x29
	.long	0x20c0
	.uleb128 0x8
	.long	0x21f7
	.uleb128 0x8
	.long	0x221b
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0x229e
	.uleb128 0x6
	.string	"bp"
	.byte	0xe
	.byte	0x2a
	.long	0x20b5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF17
	.byte	0xe
	.byte	0x2a
	.long	0x20b5
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0x22df
	.uleb128 0xa
	.long	.LASF18
	.byte	0xe
	.byte	0x2a
	.long	0x20ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF17
	.byte	0xe
	.byte	0x2a
	.long	0x20ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF19
	.byte	0xe
	.byte	0x2a
	.long	0x20ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF20
	.byte	0xe
	.byte	0x2a
	.long	0x20ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0x22fd
	.uleb128 0x9
	.string	"ebp"
	.byte	0xe
	.byte	0x2a
	.long	0x20c0
	.uleb128 0x8
	.long	0x227a
	.uleb128 0x8
	.long	0x229e
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0x2321
	.uleb128 0x6
	.string	"bx"
	.byte	0xe
	.byte	0x2b
	.long	0x20b5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF21
	.byte	0xe
	.byte	0x2b
	.long	0x20b5
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0x2360
	.uleb128 0x6
	.string	"bl"
	.byte	0xe
	.byte	0x2b
	.long	0x20ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"bh"
	.byte	0xe
	.byte	0x2b
	.long	0x20ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF22
	.byte	0xe
	.byte	0x2b
	.long	0x20ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF23
	.byte	0xe
	.byte	0x2b
	.long	0x20ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0x237e
	.uleb128 0x9
	.string	"ebx"
	.byte	0xe
	.byte	0x2b
	.long	0x20c0
	.uleb128 0x8
	.long	0x22fd
	.uleb128 0x8
	.long	0x2321
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0x23a2
	.uleb128 0x6
	.string	"dx"
	.byte	0xe
	.byte	0x2c
	.long	0x20b5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF24
	.byte	0xe
	.byte	0x2c
	.long	0x20b5
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0x23e1
	.uleb128 0x6
	.string	"dl"
	.byte	0xe
	.byte	0x2c
	.long	0x20ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"dh"
	.byte	0xe
	.byte	0x2c
	.long	0x20ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF25
	.byte	0xe
	.byte	0x2c
	.long	0x20ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF26
	.byte	0xe
	.byte	0x2c
	.long	0x20ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0x23ff
	.uleb128 0x9
	.string	"edx"
	.byte	0xe
	.byte	0x2c
	.long	0x20c0
	.uleb128 0x8
	.long	0x237e
	.uleb128 0x8
	.long	0x23a2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0x2423
	.uleb128 0x6
	.string	"cx"
	.byte	0xe
	.byte	0x2d
	.long	0x20b5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF27
	.byte	0xe
	.byte	0x2d
	.long	0x20b5
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0x2462
	.uleb128 0x6
	.string	"cl"
	.byte	0xe
	.byte	0x2d
	.long	0x20ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"ch"
	.byte	0xe
	.byte	0x2d
	.long	0x20ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF28
	.byte	0xe
	.byte	0x2d
	.long	0x20ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF29
	.byte	0xe
	.byte	0x2d
	.long	0x20ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0x2480
	.uleb128 0x9
	.string	"ecx"
	.byte	0xe
	.byte	0x2d
	.long	0x20c0
	.uleb128 0x8
	.long	0x23ff
	.uleb128 0x8
	.long	0x2423
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0x24a4
	.uleb128 0x6
	.string	"ax"
	.byte	0xe
	.byte	0x2e
	.long	0x20b5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF30
	.byte	0xe
	.byte	0x2e
	.long	0x20b5
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0x24e3
	.uleb128 0x6
	.string	"al"
	.byte	0xe
	.byte	0x2e
	.long	0x20ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"ah"
	.byte	0xe
	.byte	0x2e
	.long	0x20ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF31
	.byte	0xe
	.byte	0x2e
	.long	0x20ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF32
	.byte	0xe
	.byte	0x2e
	.long	0x20ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0x2501
	.uleb128 0x9
	.string	"eax"
	.byte	0xe
	.byte	0x2e
	.long	0x20c0
	.uleb128 0x8
	.long	0x2480
	.uleb128 0x8
	.long	0x24a4
	.byte	0x0
	.uleb128 0xd
	.long	.LASF34
	.byte	0x26
	.byte	0x8
	.byte	0xb1
	.long	0x257c
	.uleb128 0x6
	.string	"ds"
	.byte	0xe
	.byte	0x26
	.long	0x20b5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"es"
	.byte	0xe
	.byte	0x27
	.long	0x20b5
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xe
	.long	0x21d9
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xe
	.long	0x225c
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xe
	.long	0x22df
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xe
	.long	0x2360
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xe
	.long	0x23e1
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xe
	.long	0x2462
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xe
	.long	0x24e3
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.long	.LASF35
	.byte	0xe
	.byte	0x2f
	.long	0x215f
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xa
	.long	.LASF36
	.byte	0xe
	.byte	0x30
	.long	0x20b5
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.byte	0x0
	.uleb128 0x14
	.long	.LASF105
	.byte	0xa
	.byte	0xa
	.value	0x13e
	.long	0x2611
	.uleb128 0x15
	.long	.LASF106
	.byte	0xa
	.value	0x13f
	.long	0x20b5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x15
	.long	.LASF107
	.byte	0xa
	.value	0x140
	.long	0x20ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x15
	.long	.LASF108
	.byte	0xa
	.value	0x141
	.long	0x20ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x15
	.long	.LASF109
	.byte	0xa
	.value	0x142
	.long	0x20ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x15
	.long	.LASF110
	.byte	0xa
	.value	0x143
	.long	0x20ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x15
	.long	.LASF111
	.byte	0xa
	.value	0x143
	.long	0x20ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x15
	.long	.LASF112
	.byte	0xa
	.value	0x143
	.long	0x20ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x15
	.long	.LASF113
	.byte	0xa
	.value	0x143
	.long	0x20ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x15
	.long	.LASF114
	.byte	0xa
	.value	0x143
	.long	0x20ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.byte	0x0
	.uleb128 0xd
	.long	.LASF202
	.byte	0x4
	.byte	0x3
	.byte	0xf
	.long	0x262c
	.uleb128 0xa
	.long	.LASF203
	.byte	0x3
	.byte	0x10
	.long	0x2643
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1a
	.byte	0x1
	.long	0x263d
	.uleb128 0x1b
	.long	0x263d
	.uleb128 0x1b
	.long	0x542
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0x2611
	.uleb128 0x13
	.byte	0x4
	.long	0x262c
	.uleb128 0x2
	.string	"u8"
	.byte	0x23
	.byte	0x9
	.long	0x33
	.uleb128 0x2
	.string	"u16"
	.byte	0x23
	.byte	0xb
	.long	0x4c
	.uleb128 0x2
	.string	"u32"
	.byte	0x23
	.byte	0xd
	.long	0x65
	.uleb128 0x2
	.string	"u64"
	.byte	0x23
	.byte	0xf
	.long	0x7e
	.uleb128 0x18
	.long	.LASF204
	.byte	0x23
	.byte	0x11
	.long	0x265e
	.uleb128 0x5
	.byte	0x8
	.byte	0x23
	.byte	0x14
	.long	0x26a2
	.uleb128 0x6
	.string	"hi"
	.byte	0x23
	.byte	0x14
	.long	0x265e
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"lo"
	.byte	0x23
	.byte	0x14
	.long	0x265e
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x7
	.long	.LASF118
	.byte	0x8
	.byte	0x23
	.byte	0x13
	.long	0x26bf
	.uleb128 0x8
	.long	0x267f
	.uleb128 0x9
	.string	"val"
	.byte	0x23
	.byte	0x15
	.long	0x2669
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0x19
	.byte	0xbc
	.long	0x26e4
	.uleb128 0xa
	.long	.LASF7
	.byte	0x19
	.byte	0xbd
	.long	0x2653
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"seg"
	.byte	0x19
	.byte	0xbe
	.long	0x2653
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0x19
	.byte	0xbb
	.long	0x26fd
	.uleb128 0x8
	.long	0x26bf
	.uleb128 0xc
	.long	.LASF8
	.byte	0x19
	.byte	0xc0
	.long	0x265e
	.byte	0x0
	.uleb128 0xd
	.long	.LASF33
	.byte	0x4
	.byte	0x19
	.byte	0xba
	.long	0x2712
	.uleb128 0xe
	.long	0x26e4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0x2736
	.uleb128 0x6
	.string	"di"
	.byte	0xe
	.byte	0x28
	.long	0x2653
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF9
	.byte	0xe
	.byte	0x28
	.long	0x2653
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0x2777
	.uleb128 0xa
	.long	.LASF10
	.byte	0xe
	.byte	0x28
	.long	0x2649
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF9
	.byte	0xe
	.byte	0x28
	.long	0x2649
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF11
	.byte	0xe
	.byte	0x28
	.long	0x2649
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF12
	.byte	0xe
	.byte	0x28
	.long	0x2649
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0x2795
	.uleb128 0x9
	.string	"edi"
	.byte	0xe
	.byte	0x28
	.long	0x265e
	.uleb128 0x8
	.long	0x2712
	.uleb128 0x8
	.long	0x2736
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0x27b9
	.uleb128 0x6
	.string	"si"
	.byte	0xe
	.byte	0x29
	.long	0x2653
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF13
	.byte	0xe
	.byte	0x29
	.long	0x2653
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0x27fa
	.uleb128 0xa
	.long	.LASF14
	.byte	0xe
	.byte	0x29
	.long	0x2649
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF13
	.byte	0xe
	.byte	0x29
	.long	0x2649
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF15
	.byte	0xe
	.byte	0x29
	.long	0x2649
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF16
	.byte	0xe
	.byte	0x29
	.long	0x2649
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0x2818
	.uleb128 0x9
	.string	"esi"
	.byte	0xe
	.byte	0x29
	.long	0x265e
	.uleb128 0x8
	.long	0x2795
	.uleb128 0x8
	.long	0x27b9
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0x283c
	.uleb128 0x6
	.string	"bp"
	.byte	0xe
	.byte	0x2a
	.long	0x2653
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF17
	.byte	0xe
	.byte	0x2a
	.long	0x2653
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0x287d
	.uleb128 0xa
	.long	.LASF18
	.byte	0xe
	.byte	0x2a
	.long	0x2649
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF17
	.byte	0xe
	.byte	0x2a
	.long	0x2649
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF19
	.byte	0xe
	.byte	0x2a
	.long	0x2649
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF20
	.byte	0xe
	.byte	0x2a
	.long	0x2649
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0x289b
	.uleb128 0x9
	.string	"ebp"
	.byte	0xe
	.byte	0x2a
	.long	0x265e
	.uleb128 0x8
	.long	0x2818
	.uleb128 0x8
	.long	0x283c
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0x28bf
	.uleb128 0x6
	.string	"bx"
	.byte	0xe
	.byte	0x2b
	.long	0x2653
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF21
	.byte	0xe
	.byte	0x2b
	.long	0x2653
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0x28fe
	.uleb128 0x6
	.string	"bl"
	.byte	0xe
	.byte	0x2b
	.long	0x2649
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"bh"
	.byte	0xe
	.byte	0x2b
	.long	0x2649
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF22
	.byte	0xe
	.byte	0x2b
	.long	0x2649
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF23
	.byte	0xe
	.byte	0x2b
	.long	0x2649
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0x291c
	.uleb128 0x9
	.string	"ebx"
	.byte	0xe
	.byte	0x2b
	.long	0x265e
	.uleb128 0x8
	.long	0x289b
	.uleb128 0x8
	.long	0x28bf
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0x2940
	.uleb128 0x6
	.string	"dx"
	.byte	0xe
	.byte	0x2c
	.long	0x2653
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF24
	.byte	0xe
	.byte	0x2c
	.long	0x2653
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0x297f
	.uleb128 0x6
	.string	"dl"
	.byte	0xe
	.byte	0x2c
	.long	0x2649
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"dh"
	.byte	0xe
	.byte	0x2c
	.long	0x2649
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF25
	.byte	0xe
	.byte	0x2c
	.long	0x2649
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF26
	.byte	0xe
	.byte	0x2c
	.long	0x2649
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0x299d
	.uleb128 0x9
	.string	"edx"
	.byte	0xe
	.byte	0x2c
	.long	0x265e
	.uleb128 0x8
	.long	0x291c
	.uleb128 0x8
	.long	0x2940
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0x29c1
	.uleb128 0x6
	.string	"cx"
	.byte	0xe
	.byte	0x2d
	.long	0x2653
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF27
	.byte	0xe
	.byte	0x2d
	.long	0x2653
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0x2a00
	.uleb128 0x6
	.string	"cl"
	.byte	0xe
	.byte	0x2d
	.long	0x2649
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"ch"
	.byte	0xe
	.byte	0x2d
	.long	0x2649
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF28
	.byte	0xe
	.byte	0x2d
	.long	0x2649
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF29
	.byte	0xe
	.byte	0x2d
	.long	0x2649
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0x2a1e
	.uleb128 0x9
	.string	"ecx"
	.byte	0xe
	.byte	0x2d
	.long	0x265e
	.uleb128 0x8
	.long	0x299d
	.uleb128 0x8
	.long	0x29c1
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0x2a42
	.uleb128 0x6
	.string	"ax"
	.byte	0xe
	.byte	0x2e
	.long	0x2653
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF30
	.byte	0xe
	.byte	0x2e
	.long	0x2653
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0x2a81
	.uleb128 0x6
	.string	"al"
	.byte	0xe
	.byte	0x2e
	.long	0x2649
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"ah"
	.byte	0xe
	.byte	0x2e
	.long	0x2649
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF31
	.byte	0xe
	.byte	0x2e
	.long	0x2649
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF32
	.byte	0xe
	.byte	0x2e
	.long	0x2649
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0x2a9f
	.uleb128 0x9
	.string	"eax"
	.byte	0xe
	.byte	0x2e
	.long	0x265e
	.uleb128 0x8
	.long	0x2a1e
	.uleb128 0x8
	.long	0x2a42
	.byte	0x0
	.uleb128 0xd
	.long	.LASF34
	.byte	0x26
	.byte	0x8
	.byte	0xb1
	.long	0x2b1a
	.uleb128 0x6
	.string	"ds"
	.byte	0xe
	.byte	0x26
	.long	0x2653
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"es"
	.byte	0xe
	.byte	0x27
	.long	0x2653
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xe
	.long	0x2777
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xe
	.long	0x27fa
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xe
	.long	0x287d
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xe
	.long	0x28fe
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xe
	.long	0x297f
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xe
	.long	0x2a00
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xe
	.long	0x2a81
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.long	.LASF35
	.byte	0xe
	.byte	0x2f
	.long	0x26fd
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xa
	.long	.LASF36
	.byte	0xe
	.byte	0x30
	.long	0x2653
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.byte	0x0
	.uleb128 0x2
	.string	"u8"
	.byte	0x23
	.byte	0x9
	.long	0x33
	.uleb128 0x2
	.string	"u16"
	.byte	0x23
	.byte	0xb
	.long	0x4c
	.uleb128 0x2
	.string	"u32"
	.byte	0x23
	.byte	0xd
	.long	0x65
	.uleb128 0x2
	.string	"u64"
	.byte	0x23
	.byte	0xf
	.long	0x7e
	.uleb128 0x5
	.byte	0x8
	.byte	0x23
	.byte	0x14
	.long	0x2b68
	.uleb128 0x6
	.string	"hi"
	.byte	0x23
	.byte	0x14
	.long	0x2b2f
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"lo"
	.byte	0x23
	.byte	0x14
	.long	0x2b2f
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x7
	.long	.LASF118
	.byte	0x8
	.byte	0x23
	.byte	0x13
	.long	0x2b85
	.uleb128 0x8
	.long	0x2b45
	.uleb128 0x9
	.string	"val"
	.byte	0x23
	.byte	0x15
	.long	0x2b3a
	.byte	0x0
	.uleb128 0xd
	.long	.LASF205
	.byte	0x14
	.byte	0x24
	.byte	0x94
	.long	0x2bd8
	.uleb128 0x6
	.string	"lba"
	.byte	0x24
	.byte	0x95
	.long	0x2b3a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF206
	.byte	0x24
	.byte	0x96
	.long	0x53a
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF207
	.byte	0x24
	.byte	0x97
	.long	0x2c71
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF208
	.byte	0x24
	.byte	0x98
	.long	0x2b24
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF209
	.byte	0x24
	.byte	0x99
	.long	0x2b1a
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.byte	0x0
	.uleb128 0xd
	.long	.LASF119
	.byte	0x24
	.byte	0x24
	.byte	0x97
	.long	0x2c71
	.uleb128 0xa
	.long	.LASF120
	.byte	0x24
	.byte	0xb0
	.long	0x2b1a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF121
	.byte	0x24
	.byte	0xb1
	.long	0x2b1a
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF122
	.byte	0x24
	.byte	0xb2
	.long	0x2c77
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF123
	.byte	0x24
	.byte	0xb3
	.long	0x2b3a
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF124
	.byte	0x24
	.byte	0xb4
	.long	0x53c
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF125
	.byte	0x24
	.byte	0xb5
	.long	0x2b2f
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.long	.LASF126
	.byte	0x24
	.byte	0xb6
	.long	0x2b1a
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF127
	.byte	0x24
	.byte	0xb9
	.long	0x2b1a
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF128
	.byte	0x24
	.byte	0xba
	.long	0x2b24
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF129
	.byte	0x24
	.byte	0xbb
	.long	0x2c77
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0x2bd8
	.uleb128 0xd
	.long	.LASF130
	.byte	0x6
	.byte	0x24
	.byte	0xa9
	.long	0x2cae
	.uleb128 0xa
	.long	.LASF131
	.byte	0x24
	.byte	0xaa
	.long	0x2b24
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF132
	.byte	0x24
	.byte	0xab
	.long	0x2b24
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.string	"spt"
	.byte	0x24
	.byte	0xac
	.long	0x2b24
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xd
	.long	.LASF210
	.byte	0xc4
	.byte	0x24
	.byte	0xd0
	.long	0x2ce5
	.uleb128 0xa
	.long	.LASF211
	.byte	0x24
	.byte	0xd2
	.long	0x2b1a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF212
	.byte	0x24
	.byte	0xd3
	.long	0x2b1a
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF213
	.byte	0x24
	.byte	0xd4
	.long	0x2ce5
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xf
	.long	0x2c71
	.long	0x2cfb
	.uleb128 0x10
	.long	0x537
	.byte	0x2
	.uleb128 0x10
	.long	0x537
	.byte	0xf
	.byte	0x0
	.uleb128 0x14
	.long	.LASF105
	.byte	0xa
	.byte	0xa
	.value	0x13e
	.long	0x2d90
	.uleb128 0x15
	.long	.LASF106
	.byte	0xa
	.value	0x13f
	.long	0x2b24
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x15
	.long	.LASF107
	.byte	0xa
	.value	0x140
	.long	0x2b1a
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x15
	.long	.LASF108
	.byte	0xa
	.value	0x141
	.long	0x2b1a
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x15
	.long	.LASF109
	.byte	0xa
	.value	0x142
	.long	0x2b1a
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x15
	.long	.LASF110
	.byte	0xa
	.value	0x143
	.long	0x2b1a
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x15
	.long	.LASF111
	.byte	0xa
	.value	0x143
	.long	0x2b1a
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x15
	.long	.LASF112
	.byte	0xa
	.value	0x143
	.long	0x2b1a
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x15
	.long	.LASF113
	.byte	0xa
	.value	0x143
	.long	0x2b1a
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x15
	.long	.LASF114
	.byte	0xa
	.value	0x143
	.long	0x2b1a
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.byte	0x0
	.uleb128 0x2
	.string	"u8"
	.byte	0x23
	.byte	0x9
	.long	0x33
	.uleb128 0x2
	.string	"u16"
	.byte	0x23
	.byte	0xb
	.long	0x4c
	.uleb128 0x2
	.string	"u32"
	.byte	0x23
	.byte	0xd
	.long	0x65
	.uleb128 0x2
	.string	"u64"
	.byte	0x23
	.byte	0xf
	.long	0x7e
	.uleb128 0x5
	.byte	0x8
	.byte	0x23
	.byte	0x14
	.long	0x2dde
	.uleb128 0x6
	.string	"hi"
	.byte	0x23
	.byte	0x14
	.long	0x2da5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"lo"
	.byte	0x23
	.byte	0x14
	.long	0x2da5
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x7
	.long	.LASF118
	.byte	0x8
	.byte	0x23
	.byte	0x13
	.long	0x2dfb
	.uleb128 0x8
	.long	0x2dbb
	.uleb128 0x9
	.string	"val"
	.byte	0x23
	.byte	0x15
	.long	0x2db0
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0x19
	.byte	0xbc
	.long	0x2e20
	.uleb128 0xa
	.long	.LASF7
	.byte	0x19
	.byte	0xbd
	.long	0x2d9a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"seg"
	.byte	0x19
	.byte	0xbe
	.long	0x2d9a
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0x19
	.byte	0xbb
	.long	0x2e39
	.uleb128 0x8
	.long	0x2dfb
	.uleb128 0xc
	.long	.LASF8
	.byte	0x19
	.byte	0xc0
	.long	0x2da5
	.byte	0x0
	.uleb128 0xd
	.long	.LASF33
	.byte	0x4
	.byte	0x19
	.byte	0xba
	.long	0x2e4e
	.uleb128 0xe
	.long	0x2e20
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0xf
	.long	0x2d90
	.long	0x2e5e
	.uleb128 0x10
	.long	0x537
	.byte	0x3
	.byte	0x0
	.uleb128 0xd
	.long	.LASF214
	.byte	0xb
	.byte	0x24
	.byte	0x4d
	.long	0x2f05
	.uleb128 0xa
	.long	.LASF215
	.byte	0x24
	.byte	0x4e
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF216
	.byte	0x24
	.byte	0x4f
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF217
	.byte	0x24
	.byte	0x50
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF218
	.byte	0x24
	.byte	0x51
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0xa
	.long	.LASF123
	.byte	0x24
	.byte	0x52
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF219
	.byte	0x24
	.byte	0x53
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0xa
	.long	.LASF220
	.byte	0x24
	.byte	0x54
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xa
	.long	.LASF221
	.byte	0x24
	.byte	0x55
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0xa
	.long	.LASF222
	.byte	0x24
	.byte	0x56
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF223
	.byte	0x24
	.byte	0x57
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0xa
	.long	.LASF224
	.byte	0x24
	.byte	0x58
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.byte	0x0
	.uleb128 0xd
	.long	.LASF205
	.byte	0x14
	.byte	0x24
	.byte	0x94
	.long	0x2f58
	.uleb128 0x6
	.string	"lba"
	.byte	0x24
	.byte	0x95
	.long	0x2db0
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF206
	.byte	0x24
	.byte	0x96
	.long	0x53a
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF207
	.byte	0x24
	.byte	0x97
	.long	0x2ff1
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF208
	.byte	0x24
	.byte	0x98
	.long	0x2d9a
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF209
	.byte	0x24
	.byte	0x99
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.byte	0x0
	.uleb128 0xd
	.long	.LASF119
	.byte	0x24
	.byte	0x24
	.byte	0x97
	.long	0x2ff1
	.uleb128 0xa
	.long	.LASF120
	.byte	0x24
	.byte	0xb0
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF121
	.byte	0x24
	.byte	0xb1
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF122
	.byte	0x24
	.byte	0xb2
	.long	0x2ff7
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF123
	.byte	0x24
	.byte	0xb3
	.long	0x2db0
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF124
	.byte	0x24
	.byte	0xb4
	.long	0x53c
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF125
	.byte	0x24
	.byte	0xb5
	.long	0x2da5
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.long	.LASF126
	.byte	0x24
	.byte	0xb6
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF127
	.byte	0x24
	.byte	0xb9
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF128
	.byte	0x24
	.byte	0xba
	.long	0x2d9a
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF129
	.byte	0x24
	.byte	0xbb
	.long	0x2ff7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0x2f58
	.uleb128 0xd
	.long	.LASF130
	.byte	0x6
	.byte	0x24
	.byte	0xa9
	.long	0x302e
	.uleb128 0xa
	.long	.LASF131
	.byte	0x24
	.byte	0xaa
	.long	0x2d9a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF132
	.byte	0x24
	.byte	0xab
	.long	0x2d9a
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.string	"spt"
	.byte	0x24
	.byte	0xac
	.long	0x2d9a
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xd
	.long	.LASF210
	.byte	0xc4
	.byte	0x24
	.byte	0xd0
	.long	0x3065
	.uleb128 0xa
	.long	.LASF211
	.byte	0x24
	.byte	0xd2
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF212
	.byte	0x24
	.byte	0xd3
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF213
	.byte	0x24
	.byte	0xd4
	.long	0x3065
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xf
	.long	0x2ff1
	.long	0x307b
	.uleb128 0x10
	.long	0x537
	.byte	0x2
	.uleb128 0x10
	.long	0x537
	.byte	0xf
	.byte	0x0
	.uleb128 0xd
	.long	.LASF38
	.byte	0xbc
	.byte	0xa
	.byte	0x21
	.long	0x343d
	.uleb128 0xa
	.long	.LASF39
	.byte	0xa
	.byte	0x23
	.long	0x343d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF40
	.byte	0xa
	.byte	0x24
	.long	0x344d
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF41
	.byte	0xa
	.byte	0x25
	.long	0x2d9a
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF42
	.byte	0xa
	.byte	0x27
	.long	0x2d9a
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF43
	.byte	0xa
	.byte	0x28
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0xa
	.long	.LASF44
	.byte	0xa
	.byte	0x29
	.long	0x2d9a
	.byte	0x2
	.byte	0x23
	.uleb128 0x13
	.uleb128 0xa
	.long	.LASF45
	.byte	0xa
	.byte	0x2a
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x15
	.uleb128 0xa
	.long	.LASF46
	.byte	0xa
	.byte	0x2b
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x16
	.uleb128 0xa
	.long	.LASF47
	.byte	0xa
	.byte	0x2c
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x17
	.uleb128 0xa
	.long	.LASF48
	.byte	0xa
	.byte	0x2d
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF49
	.byte	0xa
	.byte	0x2e
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF50
	.byte	0xa
	.byte	0x2f
	.long	0x2d9a
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF51
	.byte	0xa
	.byte	0x30
	.long	0x2d9a
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.long	.LASF52
	.byte	0xa
	.byte	0x32
	.long	0x345d
	.byte	0x2
	.byte	0x23
	.uleb128 0x1e
	.uleb128 0xa
	.long	.LASF53
	.byte	0xa
	.byte	0x33
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x3e
	.uleb128 0xa
	.long	.LASF54
	.byte	0xa
	.byte	0x34
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x3f
	.uleb128 0xa
	.long	.LASF55
	.byte	0xa
	.byte	0x36
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0xa
	.long	.LASF56
	.byte	0xa
	.byte	0x37
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x41
	.uleb128 0xa
	.long	.LASF57
	.byte	0xa
	.byte	0x38
	.long	0x346d
	.byte	0x2
	.byte	0x23
	.uleb128 0x42
	.uleb128 0xa
	.long	.LASF58
	.byte	0xa
	.byte	0x39
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x49
	.uleb128 0xa
	.long	.LASF59
	.byte	0xa
	.byte	0x3a
	.long	0x2d9a
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.uleb128 0xa
	.long	.LASF60
	.byte	0xa
	.byte	0x3b
	.long	0x2d9a
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0xa
	.long	.LASF61
	.byte	0xa
	.byte	0x3c
	.long	0x2d9a
	.byte	0x2
	.byte	0x23
	.uleb128 0x4e
	.uleb128 0xa
	.long	.LASF62
	.byte	0xa
	.byte	0x3e
	.long	0x347d
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0xa
	.long	.LASF63
	.byte	0xa
	.byte	0x40
	.long	0x2d9a
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0xa
	.long	.LASF64
	.byte	0xa
	.byte	0x41
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x62
	.uleb128 0xa
	.long	.LASF65
	.byte	0xa
	.byte	0x42
	.long	0x2d9a
	.byte	0x2
	.byte	0x23
	.uleb128 0x63
	.uleb128 0xa
	.long	.LASF66
	.byte	0xa
	.byte	0x43
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x65
	.uleb128 0xa
	.long	.LASF67
	.byte	0xa
	.byte	0x44
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x66
	.uleb128 0xa
	.long	.LASF68
	.byte	0xa
	.byte	0x45
	.long	0x2e39
	.byte	0x2
	.byte	0x23
	.uleb128 0x67
	.uleb128 0xa
	.long	.LASF69
	.byte	0xa
	.byte	0x46
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x6b
	.uleb128 0xa
	.long	.LASF70
	.byte	0xa
	.byte	0x47
	.long	0x2da5
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.uleb128 0xa
	.long	.LASF71
	.byte	0xa
	.byte	0x49
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0xa
	.long	.LASF72
	.byte	0xa
	.byte	0x4a
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x71
	.uleb128 0xa
	.long	.LASF73
	.byte	0xa
	.byte	0x4b
	.long	0x2d9a
	.byte	0x2
	.byte	0x23
	.uleb128 0x72
	.uleb128 0xa
	.long	.LASF74
	.byte	0xa
	.byte	0x4c
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0xa
	.long	.LASF75
	.byte	0xa
	.byte	0x4d
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x75
	.uleb128 0xa
	.long	.LASF76
	.byte	0xa
	.byte	0x4e
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x76
	.uleb128 0xa
	.long	.LASF77
	.byte	0xa
	.byte	0x4f
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x77
	.uleb128 0xa
	.long	.LASF78
	.byte	0xa
	.byte	0x50
	.long	0x2e4e
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0xa
	.long	.LASF79
	.byte	0xa
	.byte	0x51
	.long	0x2e4e
	.byte	0x2
	.byte	0x23
	.uleb128 0x7c
	.uleb128 0xa
	.long	.LASF80
	.byte	0xa
	.byte	0x53
	.long	0x2d9a
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0xa
	.long	.LASF81
	.byte	0xa
	.byte	0x54
	.long	0x2d9a
	.byte	0x3
	.byte	0x23
	.uleb128 0x82
	.uleb128 0xa
	.long	.LASF82
	.byte	0xa
	.byte	0x55
	.long	0x2d90
	.byte	0x3
	.byte	0x23
	.uleb128 0x84
	.uleb128 0xa
	.long	.LASF83
	.byte	0xa
	.byte	0x56
	.long	0x2d9a
	.byte	0x3
	.byte	0x23
	.uleb128 0x85
	.uleb128 0xa
	.long	.LASF84
	.byte	0xa
	.byte	0x57
	.long	0x2d90
	.byte	0x3
	.byte	0x23
	.uleb128 0x87
	.uleb128 0xa
	.long	.LASF85
	.byte	0xa
	.byte	0x58
	.long	0x2d90
	.byte	0x3
	.byte	0x23
	.uleb128 0x88
	.uleb128 0xa
	.long	.LASF86
	.byte	0xa
	.byte	0x59
	.long	0x2d90
	.byte	0x3
	.byte	0x23
	.uleb128 0x89
	.uleb128 0xa
	.long	.LASF87
	.byte	0xa
	.byte	0x5a
	.long	0x2d90
	.byte	0x3
	.byte	0x23
	.uleb128 0x8a
	.uleb128 0xa
	.long	.LASF88
	.byte	0xa
	.byte	0x5b
	.long	0x2d90
	.byte	0x3
	.byte	0x23
	.uleb128 0x8b
	.uleb128 0xa
	.long	.LASF89
	.byte	0xa
	.byte	0x5c
	.long	0x2d90
	.byte	0x3
	.byte	0x23
	.uleb128 0x8c
	.uleb128 0xa
	.long	.LASF90
	.byte	0xa
	.byte	0x5d
	.long	0x2d90
	.byte	0x3
	.byte	0x23
	.uleb128 0x8d
	.uleb128 0xa
	.long	.LASF91
	.byte	0xa
	.byte	0x5e
	.long	0x2d90
	.byte	0x3
	.byte	0x23
	.uleb128 0x8e
	.uleb128 0xa
	.long	.LASF92
	.byte	0xa
	.byte	0x5f
	.long	0x2d90
	.byte	0x3
	.byte	0x23
	.uleb128 0x8f
	.uleb128 0xa
	.long	.LASF93
	.byte	0xa
	.byte	0x61
	.long	0x2e4e
	.byte	0x3
	.byte	0x23
	.uleb128 0x90
	.uleb128 0xa
	.long	.LASF94
	.byte	0xa
	.byte	0x62
	.long	0x348d
	.byte	0x3
	.byte	0x23
	.uleb128 0x94
	.uleb128 0xa
	.long	.LASF95
	.byte	0xa
	.byte	0x63
	.long	0x2d90
	.byte	0x3
	.byte	0x23
	.uleb128 0x96
	.uleb128 0xa
	.long	.LASF96
	.byte	0xa
	.byte	0x64
	.long	0x2d90
	.byte	0x3
	.byte	0x23
	.uleb128 0x97
	.uleb128 0xa
	.long	.LASF97
	.byte	0xa
	.byte	0x65
	.long	0x2e39
	.byte	0x3
	.byte	0x23
	.uleb128 0x98
	.uleb128 0xa
	.long	.LASF98
	.byte	0xa
	.byte	0x66
	.long	0x2da5
	.byte	0x3
	.byte	0x23
	.uleb128 0x9c
	.uleb128 0xa
	.long	.LASF99
	.byte	0xa
	.byte	0x68
	.long	0x2d90
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0xa
	.long	.LASF100
	.byte	0xa
	.byte	0x69
	.long	0x346d
	.byte	0x3
	.byte	0x23
	.uleb128 0xa1
	.uleb128 0xa
	.long	.LASF101
	.byte	0xa
	.byte	0x6a
	.long	0x2e39
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0xa
	.long	.LASF102
	.byte	0xa
	.byte	0x6b
	.long	0x2e4e
	.byte	0x3
	.byte	0x23
	.uleb128 0xac
	.uleb128 0xa
	.long	.LASF103
	.byte	0xa
	.byte	0x6d
	.long	0x349d
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0xa
	.long	.LASF104
	.byte	0xa
	.byte	0x6e
	.long	0x2d9a
	.byte	0x3
	.byte	0x23
	.uleb128 0xba
	.byte	0x0
	.uleb128 0xf
	.long	0x2d9a
	.long	0x344d
	.uleb128 0x10
	.long	0x537
	.byte	0x3
	.byte	0x0
	.uleb128 0xf
	.long	0x2d9a
	.long	0x345d
	.uleb128 0x10
	.long	0x537
	.byte	0x2
	.byte	0x0
	.uleb128 0xf
	.long	0x2d90
	.long	0x346d
	.uleb128 0x10
	.long	0x537
	.byte	0x1f
	.byte	0x0
	.uleb128 0xf
	.long	0x2d90
	.long	0x347d
	.uleb128 0x10
	.long	0x537
	.byte	0x6
	.byte	0x0
	.uleb128 0xf
	.long	0x2d9a
	.long	0x348d
	.uleb128 0x10
	.long	0x537
	.byte	0x7
	.byte	0x0
	.uleb128 0xf
	.long	0x2d90
	.long	0x349d
	.uleb128 0x10
	.long	0x537
	.byte	0x1
	.byte	0x0
	.uleb128 0xf
	.long	0x2d90
	.long	0x34ad
	.uleb128 0x10
	.long	0x537
	.byte	0x9
	.byte	0x0
	.uleb128 0x14
	.long	.LASF105
	.byte	0xa
	.byte	0xa
	.value	0x13e
	.long	0x3542
	.uleb128 0x15
	.long	.LASF106
	.byte	0xa
	.value	0x13f
	.long	0x2d9a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x15
	.long	.LASF107
	.byte	0xa
	.value	0x140
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x15
	.long	.LASF108
	.byte	0xa
	.value	0x141
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x15
	.long	.LASF109
	.byte	0xa
	.value	0x142
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x15
	.long	.LASF110
	.byte	0xa
	.value	0x143
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x15
	.long	.LASF111
	.byte	0xa
	.value	0x143
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x15
	.long	.LASF112
	.byte	0xa
	.value	0x143
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x15
	.long	.LASF113
	.byte	0xa
	.value	0x143
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x15
	.long	.LASF114
	.byte	0xa
	.value	0x143
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.byte	0x0
	.uleb128 0xd
	.long	.LASF225
	.byte	0x8
	.byte	0x5
	.byte	0x40
	.long	0x3579
	.uleb128 0x6
	.string	"chs"
	.byte	0x5
	.byte	0x41
	.long	0x2ff7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF226
	.byte	0x5
	.byte	0x42
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xa
	.long	.LASF227
	.byte	0x5
	.byte	0x43
	.long	0x2d90
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.byte	0x0
	.uleb128 0x2
	.string	"u8"
	.byte	0x23
	.byte	0x9
	.long	0x33
	.uleb128 0x2
	.string	"u16"
	.byte	0x23
	.byte	0xb
	.long	0x4c
	.uleb128 0x2
	.string	"u32"
	.byte	0x23
	.byte	0xd
	.long	0x65
	.uleb128 0x2
	.string	"u64"
	.byte	0x23
	.byte	0xf
	.long	0x7e
	.uleb128 0x5
	.byte	0x8
	.byte	0x23
	.byte	0x14
	.long	0x35c7
	.uleb128 0x6
	.string	"hi"
	.byte	0x23
	.byte	0x14
	.long	0x358e
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"lo"
	.byte	0x23
	.byte	0x14
	.long	0x358e
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x7
	.long	.LASF118
	.byte	0x8
	.byte	0x23
	.byte	0x13
	.long	0x35e4
	.uleb128 0x8
	.long	0x35a4
	.uleb128 0x9
	.string	"val"
	.byte	0x23
	.byte	0x15
	.long	0x3599
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0x19
	.byte	0xbc
	.long	0x3609
	.uleb128 0xa
	.long	.LASF7
	.byte	0x19
	.byte	0xbd
	.long	0x3583
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"seg"
	.byte	0x19
	.byte	0xbe
	.long	0x3583
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0x19
	.byte	0xbb
	.long	0x3622
	.uleb128 0x8
	.long	0x35e4
	.uleb128 0xc
	.long	.LASF8
	.byte	0x19
	.byte	0xc0
	.long	0x358e
	.byte	0x0
	.uleb128 0xd
	.long	.LASF33
	.byte	0x4
	.byte	0x19
	.byte	0xba
	.long	0x3637
	.uleb128 0xe
	.long	0x3609
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0xf
	.long	0x3579
	.long	0x3647
	.uleb128 0x10
	.long	0x537
	.byte	0x7
	.byte	0x0
	.uleb128 0xd
	.long	.LASF205
	.byte	0x14
	.byte	0x24
	.byte	0x94
	.long	0x369a
	.uleb128 0x6
	.string	"lba"
	.byte	0x24
	.byte	0x95
	.long	0x3599
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF206
	.byte	0x24
	.byte	0x96
	.long	0x53a
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF207
	.byte	0x24
	.byte	0x97
	.long	0x3733
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF208
	.byte	0x24
	.byte	0x98
	.long	0x3583
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF209
	.byte	0x24
	.byte	0x99
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.byte	0x0
	.uleb128 0xd
	.long	.LASF119
	.byte	0x24
	.byte	0x24
	.byte	0x97
	.long	0x3733
	.uleb128 0xa
	.long	.LASF120
	.byte	0x24
	.byte	0xb0
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF121
	.byte	0x24
	.byte	0xb1
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF122
	.byte	0x24
	.byte	0xb2
	.long	0x3739
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF123
	.byte	0x24
	.byte	0xb3
	.long	0x3599
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF124
	.byte	0x24
	.byte	0xb4
	.long	0x53c
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF125
	.byte	0x24
	.byte	0xb5
	.long	0x358e
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.long	.LASF126
	.byte	0x24
	.byte	0xb6
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF127
	.byte	0x24
	.byte	0xb9
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF128
	.byte	0x24
	.byte	0xba
	.long	0x3583
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF129
	.byte	0x24
	.byte	0xbb
	.long	0x3739
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0x369a
	.uleb128 0xd
	.long	.LASF130
	.byte	0x6
	.byte	0x24
	.byte	0xa9
	.long	0x3770
	.uleb128 0xa
	.long	.LASF131
	.byte	0x24
	.byte	0xaa
	.long	0x3583
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF132
	.byte	0x24
	.byte	0xab
	.long	0x3583
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.string	"spt"
	.byte	0x24
	.byte	0xac
	.long	0x3583
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xd
	.long	.LASF210
	.byte	0xc4
	.byte	0x24
	.byte	0xd0
	.long	0x37a7
	.uleb128 0xa
	.long	.LASF211
	.byte	0x24
	.byte	0xd2
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF212
	.byte	0x24
	.byte	0xd3
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF213
	.byte	0x24
	.byte	0xd4
	.long	0x37a7
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xf
	.long	0x3733
	.long	0x37bd
	.uleb128 0x10
	.long	0x537
	.byte	0x2
	.uleb128 0x10
	.long	0x537
	.byte	0xf
	.byte	0x0
	.uleb128 0xd
	.long	.LASF133
	.byte	0x10
	.byte	0xa
	.byte	0x92
	.long	0x3872
	.uleb128 0xa
	.long	.LASF134
	.byte	0xa
	.byte	0x93
	.long	0x3583
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF135
	.byte	0xa
	.byte	0x94
	.long	0x3583
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF136
	.byte	0xa
	.byte	0x95
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF137
	.byte	0xa
	.byte	0x96
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x6
	.string	"irq"
	.byte	0xa
	.byte	0x97
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xa
	.long	.LASF138
	.byte	0xa
	.byte	0x98
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x6
	.string	"dma"
	.byte	0xa
	.byte	0x99
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.string	"pio"
	.byte	0xa
	.byte	0x9a
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0xa
	.long	.LASF139
	.byte	0xa
	.byte	0x9b
	.long	0x3583
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xa
	.long	.LASF140
	.byte	0xa
	.byte	0x9c
	.long	0x3583
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF141
	.byte	0xa
	.byte	0x9d
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF142
	.byte	0xa
	.byte	0x9e
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xd
	.long	.LASF143
	.byte	0x18
	.byte	0xa
	.byte	0xa2
	.long	0x38fd
	.uleb128 0xa
	.long	.LASF144
	.byte	0xa
	.byte	0xa3
	.long	0x3733
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF145
	.byte	0xa
	.byte	0xa4
	.long	0x358e
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF146
	.byte	0xa
	.byte	0xa5
	.long	0x3583
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF147
	.byte	0xa
	.byte	0xa6
	.long	0x3583
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xa
	.long	.LASF148
	.byte	0xa
	.byte	0xa7
	.long	0x3583
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF149
	.byte	0xa
	.byte	0xa8
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF150
	.byte	0xa
	.byte	0xa9
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.uleb128 0xa
	.long	.LASF151
	.byte	0xa
	.byte	0xaa
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF122
	.byte	0xa
	.byte	0xad
	.long	0x3739
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.byte	0x0
	.uleb128 0xd
	.long	.LASF152
	.byte	0x10
	.byte	0xa
	.byte	0xb0
	.long	0x39b2
	.uleb128 0xa
	.long	.LASF132
	.byte	0xa
	.byte	0xb1
	.long	0x3583
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF131
	.byte	0xa
	.byte	0xb2
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF153
	.byte	0xa
	.byte	0xb3
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0xa
	.long	.LASF154
	.byte	0xa
	.byte	0xb4
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF155
	.byte	0xa
	.byte	0xb5
	.long	0x3583
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0xa
	.long	.LASF140
	.byte	0xa
	.byte	0xb6
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0xa
	.long	.LASF156
	.byte	0xa
	.byte	0xb7
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF157
	.byte	0xa
	.byte	0xb8
	.long	0x3583
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0xa
	.long	.LASF158
	.byte	0xa
	.byte	0xb9
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0xb
	.uleb128 0xa
	.long	.LASF159
	.byte	0xa
	.byte	0xba
	.long	0x3583
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF123
	.byte	0xa
	.byte	0xbb
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF142
	.byte	0xa
	.byte	0xbc
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.byte	0x0
	.uleb128 0x5
	.byte	0x8
	.byte	0xa
	.byte	0xc1
	.long	0x39e5
	.uleb128 0xa
	.long	.LASF160
	.byte	0xa
	.byte	0xc2
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF161
	.byte	0xa
	.byte	0xc3
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF162
	.byte	0xa
	.byte	0xc4
	.long	0x39e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0xf
	.long	0x3579
	.long	0x39f5
	.uleb128 0x10
	.long	0x537
	.byte	0x5
	.byte	0x0
	.uleb128 0xb
	.byte	0x8
	.byte	0xa
	.byte	0xc0
	.long	0x3a0e
	.uleb128 0x8
	.long	0x39b2
	.uleb128 0xc
	.long	.LASF163
	.byte	0xa
	.byte	0xc6
	.long	0x3599
	.byte	0x0
	.uleb128 0xd
	.long	.LASF164
	.byte	0x8
	.byte	0xa
	.byte	0xbf
	.long	0x3a23
	.uleb128 0xe
	.long	0x39f5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x16
	.long	.LASF165
	.value	0xb68
	.byte	0xa
	.byte	0xca
	.long	0x3b36
	.uleb128 0xa
	.long	.LASF106
	.byte	0xa
	.byte	0xcb
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF166
	.byte	0xa
	.byte	0xcc
	.long	0x3b36
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF167
	.byte	0xa
	.byte	0xcd
	.long	0x3622
	.byte	0x2
	.byte	0x23
	.uleb128 0x22
	.uleb128 0xa
	.long	.LASF168
	.byte	0xa
	.byte	0xce
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x26
	.uleb128 0xa
	.long	.LASF169
	.byte	0xa
	.byte	0xcf
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x27
	.uleb128 0xa
	.long	.LASF170
	.byte	0xa
	.byte	0xd0
	.long	0x3637
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0xa
	.long	.LASF171
	.byte	0xa
	.byte	0xd2
	.long	0x3b46
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0xa
	.long	.LASF172
	.byte	0xa
	.byte	0xd5
	.long	0x3b56
	.byte	0x2
	.byte	0x23
	.uleb128 0x3d
	.uleb128 0xa
	.long	.LASF173
	.byte	0xa
	.byte	0xd8
	.long	0x3b66
	.byte	0x2
	.byte	0x23
	.uleb128 0x5d
	.uleb128 0xa
	.long	.LASF174
	.byte	0xa
	.byte	0xdb
	.long	0x3579
	.byte	0x3
	.byte	0x23
	.uleb128 0x121
	.uleb128 0xa
	.long	.LASF175
	.byte	0xa
	.byte	0xdc
	.long	0x3a0e
	.byte	0x3
	.byte	0x23
	.uleb128 0x122
	.uleb128 0xa
	.long	.LASF176
	.byte	0xa
	.byte	0xde
	.long	0x6c
	.byte	0x3
	.byte	0x23
	.uleb128 0x12a
	.uleb128 0xa
	.long	.LASF177
	.byte	0xa
	.byte	0xe1
	.long	0x3872
	.byte	0x3
	.byte	0x23
	.uleb128 0x12e
	.uleb128 0xa
	.long	.LASF178
	.byte	0xa
	.byte	0xe4
	.long	0x37bd
	.byte	0x3
	.byte	0x23
	.uleb128 0x146
	.uleb128 0xa
	.long	.LASF179
	.byte	0xa
	.byte	0xe7
	.long	0x3b76
	.byte	0x3
	.byte	0x23
	.uleb128 0x156
	.uleb128 0xa
	.long	.LASF180
	.byte	0xa
	.byte	0xe9
	.long	0x3583
	.byte	0x3
	.byte	0x23
	.uleb128 0x166
	.uleb128 0xa
	.long	.LASF181
	.byte	0xa
	.byte	0xec
	.long	0x3b86
	.byte	0x3
	.byte	0x23
	.uleb128 0x168
	.uleb128 0xa
	.long	.LASF182
	.byte	0xa
	.byte	0xee
	.long	0x3b97
	.byte	0x3
	.byte	0x23
	.uleb128 0x368
	.byte	0x0
	.uleb128 0xf
	.long	0x3579
	.long	0x3b46
	.uleb128 0x10
	.long	0x537
	.byte	0x20
	.byte	0x0
	.uleb128 0xf
	.long	0x3579
	.long	0x3b56
	.uleb128 0x10
	.long	0x537
	.byte	0xc
	.byte	0x0
	.uleb128 0xf
	.long	0x38fd
	.long	0x3b66
	.uleb128 0x10
	.long	0x537
	.byte	0x1
	.byte	0x0
	.uleb128 0xf
	.long	0x3579
	.long	0x3b76
	.uleb128 0x10
	.long	0x537
	.byte	0xc3
	.byte	0x0
	.uleb128 0xf
	.long	0x3579
	.long	0x3b86
	.uleb128 0x10
	.long	0x537
	.byte	0xf
	.byte	0x0
	.uleb128 0xf
	.long	0x3579
	.long	0x3b97
	.uleb128 0x17
	.long	0x537
	.value	0x1ff
	.byte	0x0
	.uleb128 0xf
	.long	0x3579
	.long	0x3ba8
	.uleb128 0x17
	.long	0x537
	.value	0x7ff
	.byte	0x0
	.uleb128 0x14
	.long	.LASF105
	.byte	0xa
	.byte	0xa
	.value	0x13e
	.long	0x3c3d
	.uleb128 0x15
	.long	.LASF106
	.byte	0xa
	.value	0x13f
	.long	0x3583
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x15
	.long	.LASF107
	.byte	0xa
	.value	0x140
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x15
	.long	.LASF108
	.byte	0xa
	.value	0x141
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x15
	.long	.LASF109
	.byte	0xa
	.value	0x142
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x15
	.long	.LASF110
	.byte	0xa
	.value	0x143
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x15
	.long	.LASF111
	.byte	0xa
	.value	0x143
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x15
	.long	.LASF112
	.byte	0xa
	.value	0x143
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x15
	.long	.LASF113
	.byte	0xa
	.value	0x143
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x15
	.long	.LASF114
	.byte	0xa
	.value	0x143
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0x3c43
	.uleb128 0x1c
	.long	0x542
	.uleb128 0xd
	.long	.LASF228
	.byte	0xc
	.byte	0x26
	.byte	0x8
	.long	0x3ca9
	.uleb128 0xa
	.long	.LASF134
	.byte	0x26
	.byte	0x9
	.long	0x3583
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF135
	.byte	0x26
	.byte	0xa
	.long	0x3583
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF229
	.byte	0x26
	.byte	0xb
	.long	0x3583
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"irq"
	.byte	0x26
	.byte	0xc
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xa
	.long	.LASF230
	.byte	0x26
	.byte	0xd
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0xa
	.long	.LASF231
	.byte	0x26
	.byte	0xe
	.long	0x6c
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0xd
	.long	.LASF232
	.byte	0x2c
	.byte	0x26
	.byte	0x11
	.long	0x3ce0
	.uleb128 0xa
	.long	.LASF233
	.byte	0x26
	.byte	0x12
	.long	0x369a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF234
	.byte	0x26
	.byte	0x13
	.long	0x3ce0
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0xa
	.long	.LASF235
	.byte	0x26
	.byte	0x14
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0x3c48
	.uleb128 0xf
	.long	0x542
	.long	0x3cf6
	.uleb128 0x10
	.long	0x537
	.byte	0x7
	.byte	0x0
	.uleb128 0xf
	.long	0x542
	.long	0x3d06
	.uleb128 0x10
	.long	0x537
	.byte	0xf
	.byte	0x0
	.uleb128 0xd
	.long	.LASF236
	.byte	0xc
	.byte	0x1b
	.byte	0xae
	.long	0x3dbb
	.uleb128 0xa
	.long	.LASF237
	.byte	0x1b
	.byte	0xaf
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF148
	.byte	0x1b
	.byte	0xb0
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF238
	.byte	0x1b
	.byte	0xb1
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF239
	.byte	0x1b
	.byte	0xb2
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0xa
	.long	.LASF240
	.byte	0x1b
	.byte	0xb3
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF241
	.byte	0x1b
	.byte	0xb4
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0xa
	.long	.LASF209
	.byte	0x1b
	.byte	0xb5
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xa
	.long	.LASF111
	.byte	0x1b
	.byte	0xb7
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0xa
	.long	.LASF242
	.byte	0x1b
	.byte	0xb8
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF243
	.byte	0x1b
	.byte	0xb9
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0xa
	.long	.LASF244
	.byte	0x1b
	.byte	0xba
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xa
	.long	.LASF245
	.byte	0x1b
	.byte	0xbb
	.long	0x3579
	.byte	0x2
	.byte	0x23
	.uleb128 0xb
	.byte	0x0
	.uleb128 0x14
	.long	.LASF246
	.byte	0x8
	.byte	0x1b
	.value	0x175
	.long	0x3de7
	.uleb128 0x15
	.long	.LASF206
	.byte	0x1b
	.value	0x176
	.long	0x358e
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x15
	.long	.LASF208
	.byte	0x1b
	.value	0x177
	.long	0x358e
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x2
	.string	"u8"
	.byte	0x23
	.byte	0x9
	.long	0x33
	.uleb128 0x2
	.string	"u16"
	.byte	0x23
	.byte	0xb
	.long	0x4c
	.uleb128 0x2
	.string	"u32"
	.byte	0x23
	.byte	0xd
	.long	0x65
	.uleb128 0x2
	.string	"u64"
	.byte	0x23
	.byte	0xf
	.long	0x7e
	.uleb128 0x5
	.byte	0x8
	.byte	0x23
	.byte	0x14
	.long	0x3e35
	.uleb128 0x6
	.string	"hi"
	.byte	0x23
	.byte	0x14
	.long	0x3dfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"lo"
	.byte	0x23
	.byte	0x14
	.long	0x3dfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x7
	.long	.LASF118
	.byte	0x8
	.byte	0x23
	.byte	0x13
	.long	0x3e52
	.uleb128 0x8
	.long	0x3e12
	.uleb128 0x9
	.string	"val"
	.byte	0x23
	.byte	0x15
	.long	0x3e07
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0x19
	.byte	0xbc
	.long	0x3e77
	.uleb128 0xa
	.long	.LASF7
	.byte	0x19
	.byte	0xbd
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"seg"
	.byte	0x19
	.byte	0xbe
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0x19
	.byte	0xbb
	.long	0x3e90
	.uleb128 0x8
	.long	0x3e52
	.uleb128 0xc
	.long	.LASF8
	.byte	0x19
	.byte	0xc0
	.long	0x3dfc
	.byte	0x0
	.uleb128 0xd
	.long	.LASF33
	.byte	0x4
	.byte	0x19
	.byte	0xba
	.long	0x3ea5
	.uleb128 0xe
	.long	0x3e77
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0xf
	.long	0x3de7
	.long	0x3eb5
	.uleb128 0x10
	.long	0x537
	.byte	0x3
	.byte	0x0
	.uleb128 0xf
	.long	0x3de7
	.long	0x3ec5
	.uleb128 0x10
	.long	0x537
	.byte	0x7
	.byte	0x0
	.uleb128 0xd
	.long	.LASF119
	.byte	0x24
	.byte	0x24
	.byte	0x97
	.long	0x3f5e
	.uleb128 0xa
	.long	.LASF120
	.byte	0x24
	.byte	0xb0
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF121
	.byte	0x24
	.byte	0xb1
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF122
	.byte	0x24
	.byte	0xb2
	.long	0x3f64
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF123
	.byte	0x24
	.byte	0xb3
	.long	0x3e07
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF124
	.byte	0x24
	.byte	0xb4
	.long	0x53c
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF125
	.byte	0x24
	.byte	0xb5
	.long	0x3dfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.long	.LASF126
	.byte	0x24
	.byte	0xb6
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF127
	.byte	0x24
	.byte	0xb9
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF128
	.byte	0x24
	.byte	0xba
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF129
	.byte	0x24
	.byte	0xbb
	.long	0x3f64
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0x3ec5
	.uleb128 0xd
	.long	.LASF130
	.byte	0x6
	.byte	0x24
	.byte	0xa9
	.long	0x3f9b
	.uleb128 0xa
	.long	.LASF131
	.byte	0x24
	.byte	0xaa
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF132
	.byte	0x24
	.byte	0xab
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.string	"spt"
	.byte	0x24
	.byte	0xac
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xd
	.long	.LASF210
	.byte	0xc4
	.byte	0x24
	.byte	0xd0
	.long	0x3fd2
	.uleb128 0xa
	.long	.LASF211
	.byte	0x24
	.byte	0xd2
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF212
	.byte	0x24
	.byte	0xd3
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF213
	.byte	0x24
	.byte	0xd4
	.long	0x3fd2
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xf
	.long	0x3f5e
	.long	0x3fe8
	.uleb128 0x10
	.long	0x537
	.byte	0x2
	.uleb128 0x10
	.long	0x537
	.byte	0xf
	.byte	0x0
	.uleb128 0xd
	.long	.LASF38
	.byte	0xbc
	.byte	0xa
	.byte	0x21
	.long	0x43aa
	.uleb128 0xa
	.long	.LASF39
	.byte	0xa
	.byte	0x23
	.long	0x43aa
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF40
	.byte	0xa
	.byte	0x24
	.long	0x43ba
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF41
	.byte	0xa
	.byte	0x25
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF42
	.byte	0xa
	.byte	0x27
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF43
	.byte	0xa
	.byte	0x28
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0xa
	.long	.LASF44
	.byte	0xa
	.byte	0x29
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x13
	.uleb128 0xa
	.long	.LASF45
	.byte	0xa
	.byte	0x2a
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x15
	.uleb128 0xa
	.long	.LASF46
	.byte	0xa
	.byte	0x2b
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x16
	.uleb128 0xa
	.long	.LASF47
	.byte	0xa
	.byte	0x2c
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x17
	.uleb128 0xa
	.long	.LASF48
	.byte	0xa
	.byte	0x2d
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF49
	.byte	0xa
	.byte	0x2e
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF50
	.byte	0xa
	.byte	0x2f
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF51
	.byte	0xa
	.byte	0x30
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.long	.LASF52
	.byte	0xa
	.byte	0x32
	.long	0x43ca
	.byte	0x2
	.byte	0x23
	.uleb128 0x1e
	.uleb128 0xa
	.long	.LASF53
	.byte	0xa
	.byte	0x33
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x3e
	.uleb128 0xa
	.long	.LASF54
	.byte	0xa
	.byte	0x34
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x3f
	.uleb128 0xa
	.long	.LASF55
	.byte	0xa
	.byte	0x36
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0xa
	.long	.LASF56
	.byte	0xa
	.byte	0x37
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x41
	.uleb128 0xa
	.long	.LASF57
	.byte	0xa
	.byte	0x38
	.long	0x43da
	.byte	0x2
	.byte	0x23
	.uleb128 0x42
	.uleb128 0xa
	.long	.LASF58
	.byte	0xa
	.byte	0x39
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x49
	.uleb128 0xa
	.long	.LASF59
	.byte	0xa
	.byte	0x3a
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.uleb128 0xa
	.long	.LASF60
	.byte	0xa
	.byte	0x3b
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0xa
	.long	.LASF61
	.byte	0xa
	.byte	0x3c
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x4e
	.uleb128 0xa
	.long	.LASF62
	.byte	0xa
	.byte	0x3e
	.long	0x43ea
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0xa
	.long	.LASF63
	.byte	0xa
	.byte	0x40
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0xa
	.long	.LASF64
	.byte	0xa
	.byte	0x41
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x62
	.uleb128 0xa
	.long	.LASF65
	.byte	0xa
	.byte	0x42
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x63
	.uleb128 0xa
	.long	.LASF66
	.byte	0xa
	.byte	0x43
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x65
	.uleb128 0xa
	.long	.LASF67
	.byte	0xa
	.byte	0x44
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x66
	.uleb128 0xa
	.long	.LASF68
	.byte	0xa
	.byte	0x45
	.long	0x3e90
	.byte	0x2
	.byte	0x23
	.uleb128 0x67
	.uleb128 0xa
	.long	.LASF69
	.byte	0xa
	.byte	0x46
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x6b
	.uleb128 0xa
	.long	.LASF70
	.byte	0xa
	.byte	0x47
	.long	0x3dfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.uleb128 0xa
	.long	.LASF71
	.byte	0xa
	.byte	0x49
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0xa
	.long	.LASF72
	.byte	0xa
	.byte	0x4a
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x71
	.uleb128 0xa
	.long	.LASF73
	.byte	0xa
	.byte	0x4b
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x72
	.uleb128 0xa
	.long	.LASF74
	.byte	0xa
	.byte	0x4c
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0xa
	.long	.LASF75
	.byte	0xa
	.byte	0x4d
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x75
	.uleb128 0xa
	.long	.LASF76
	.byte	0xa
	.byte	0x4e
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x76
	.uleb128 0xa
	.long	.LASF77
	.byte	0xa
	.byte	0x4f
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x77
	.uleb128 0xa
	.long	.LASF78
	.byte	0xa
	.byte	0x50
	.long	0x3ea5
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0xa
	.long	.LASF79
	.byte	0xa
	.byte	0x51
	.long	0x3ea5
	.byte	0x2
	.byte	0x23
	.uleb128 0x7c
	.uleb128 0xa
	.long	.LASF80
	.byte	0xa
	.byte	0x53
	.long	0x3df1
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0xa
	.long	.LASF81
	.byte	0xa
	.byte	0x54
	.long	0x3df1
	.byte	0x3
	.byte	0x23
	.uleb128 0x82
	.uleb128 0xa
	.long	.LASF82
	.byte	0xa
	.byte	0x55
	.long	0x3de7
	.byte	0x3
	.byte	0x23
	.uleb128 0x84
	.uleb128 0xa
	.long	.LASF83
	.byte	0xa
	.byte	0x56
	.long	0x3df1
	.byte	0x3
	.byte	0x23
	.uleb128 0x85
	.uleb128 0xa
	.long	.LASF84
	.byte	0xa
	.byte	0x57
	.long	0x3de7
	.byte	0x3
	.byte	0x23
	.uleb128 0x87
	.uleb128 0xa
	.long	.LASF85
	.byte	0xa
	.byte	0x58
	.long	0x3de7
	.byte	0x3
	.byte	0x23
	.uleb128 0x88
	.uleb128 0xa
	.long	.LASF86
	.byte	0xa
	.byte	0x59
	.long	0x3de7
	.byte	0x3
	.byte	0x23
	.uleb128 0x89
	.uleb128 0xa
	.long	.LASF87
	.byte	0xa
	.byte	0x5a
	.long	0x3de7
	.byte	0x3
	.byte	0x23
	.uleb128 0x8a
	.uleb128 0xa
	.long	.LASF88
	.byte	0xa
	.byte	0x5b
	.long	0x3de7
	.byte	0x3
	.byte	0x23
	.uleb128 0x8b
	.uleb128 0xa
	.long	.LASF89
	.byte	0xa
	.byte	0x5c
	.long	0x3de7
	.byte	0x3
	.byte	0x23
	.uleb128 0x8c
	.uleb128 0xa
	.long	.LASF90
	.byte	0xa
	.byte	0x5d
	.long	0x3de7
	.byte	0x3
	.byte	0x23
	.uleb128 0x8d
	.uleb128 0xa
	.long	.LASF91
	.byte	0xa
	.byte	0x5e
	.long	0x3de7
	.byte	0x3
	.byte	0x23
	.uleb128 0x8e
	.uleb128 0xa
	.long	.LASF92
	.byte	0xa
	.byte	0x5f
	.long	0x3de7
	.byte	0x3
	.byte	0x23
	.uleb128 0x8f
	.uleb128 0xa
	.long	.LASF93
	.byte	0xa
	.byte	0x61
	.long	0x3ea5
	.byte	0x3
	.byte	0x23
	.uleb128 0x90
	.uleb128 0xa
	.long	.LASF94
	.byte	0xa
	.byte	0x62
	.long	0x43fa
	.byte	0x3
	.byte	0x23
	.uleb128 0x94
	.uleb128 0xa
	.long	.LASF95
	.byte	0xa
	.byte	0x63
	.long	0x3de7
	.byte	0x3
	.byte	0x23
	.uleb128 0x96
	.uleb128 0xa
	.long	.LASF96
	.byte	0xa
	.byte	0x64
	.long	0x3de7
	.byte	0x3
	.byte	0x23
	.uleb128 0x97
	.uleb128 0xa
	.long	.LASF97
	.byte	0xa
	.byte	0x65
	.long	0x3e90
	.byte	0x3
	.byte	0x23
	.uleb128 0x98
	.uleb128 0xa
	.long	.LASF98
	.byte	0xa
	.byte	0x66
	.long	0x3dfc
	.byte	0x3
	.byte	0x23
	.uleb128 0x9c
	.uleb128 0xa
	.long	.LASF99
	.byte	0xa
	.byte	0x68
	.long	0x3de7
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0xa
	.long	.LASF100
	.byte	0xa
	.byte	0x69
	.long	0x43da
	.byte	0x3
	.byte	0x23
	.uleb128 0xa1
	.uleb128 0xa
	.long	.LASF101
	.byte	0xa
	.byte	0x6a
	.long	0x3e90
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0xa
	.long	.LASF102
	.byte	0xa
	.byte	0x6b
	.long	0x3ea5
	.byte	0x3
	.byte	0x23
	.uleb128 0xac
	.uleb128 0xa
	.long	.LASF103
	.byte	0xa
	.byte	0x6d
	.long	0x440a
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0xa
	.long	.LASF104
	.byte	0xa
	.byte	0x6e
	.long	0x3df1
	.byte	0x3
	.byte	0x23
	.uleb128 0xba
	.byte	0x0
	.uleb128 0xf
	.long	0x3df1
	.long	0x43ba
	.uleb128 0x10
	.long	0x537
	.byte	0x3
	.byte	0x0
	.uleb128 0xf
	.long	0x3df1
	.long	0x43ca
	.uleb128 0x10
	.long	0x537
	.byte	0x2
	.byte	0x0
	.uleb128 0xf
	.long	0x3de7
	.long	0x43da
	.uleb128 0x10
	.long	0x537
	.byte	0x1f
	.byte	0x0
	.uleb128 0xf
	.long	0x3de7
	.long	0x43ea
	.uleb128 0x10
	.long	0x537
	.byte	0x6
	.byte	0x0
	.uleb128 0xf
	.long	0x3df1
	.long	0x43fa
	.uleb128 0x10
	.long	0x537
	.byte	0x7
	.byte	0x0
	.uleb128 0xf
	.long	0x3de7
	.long	0x440a
	.uleb128 0x10
	.long	0x537
	.byte	0x1
	.byte	0x0
	.uleb128 0xf
	.long	0x3de7
	.long	0x441a
	.uleb128 0x10
	.long	0x537
	.byte	0x9
	.byte	0x0
	.uleb128 0xd
	.long	.LASF133
	.byte	0x10
	.byte	0xa
	.byte	0x92
	.long	0x44cf
	.uleb128 0xa
	.long	.LASF134
	.byte	0xa
	.byte	0x93
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF135
	.byte	0xa
	.byte	0x94
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF136
	.byte	0xa
	.byte	0x95
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF137
	.byte	0xa
	.byte	0x96
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x6
	.string	"irq"
	.byte	0xa
	.byte	0x97
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xa
	.long	.LASF138
	.byte	0xa
	.byte	0x98
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x6
	.string	"dma"
	.byte	0xa
	.byte	0x99
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.string	"pio"
	.byte	0xa
	.byte	0x9a
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0xa
	.long	.LASF139
	.byte	0xa
	.byte	0x9b
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xa
	.long	.LASF140
	.byte	0xa
	.byte	0x9c
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF141
	.byte	0xa
	.byte	0x9d
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF142
	.byte	0xa
	.byte	0x9e
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xd
	.long	.LASF143
	.byte	0x18
	.byte	0xa
	.byte	0xa2
	.long	0x455a
	.uleb128 0xa
	.long	.LASF144
	.byte	0xa
	.byte	0xa3
	.long	0x3f5e
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF145
	.byte	0xa
	.byte	0xa4
	.long	0x3dfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF146
	.byte	0xa
	.byte	0xa5
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF147
	.byte	0xa
	.byte	0xa6
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xa
	.long	.LASF148
	.byte	0xa
	.byte	0xa7
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF149
	.byte	0xa
	.byte	0xa8
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF150
	.byte	0xa
	.byte	0xa9
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.uleb128 0xa
	.long	.LASF151
	.byte	0xa
	.byte	0xaa
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF122
	.byte	0xa
	.byte	0xad
	.long	0x3f64
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.byte	0x0
	.uleb128 0xd
	.long	.LASF152
	.byte	0x10
	.byte	0xa
	.byte	0xb0
	.long	0x460f
	.uleb128 0xa
	.long	.LASF132
	.byte	0xa
	.byte	0xb1
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF131
	.byte	0xa
	.byte	0xb2
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF153
	.byte	0xa
	.byte	0xb3
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0xa
	.long	.LASF154
	.byte	0xa
	.byte	0xb4
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF155
	.byte	0xa
	.byte	0xb5
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0xa
	.long	.LASF140
	.byte	0xa
	.byte	0xb6
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0xa
	.long	.LASF156
	.byte	0xa
	.byte	0xb7
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF157
	.byte	0xa
	.byte	0xb8
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0xa
	.long	.LASF158
	.byte	0xa
	.byte	0xb9
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0xb
	.uleb128 0xa
	.long	.LASF159
	.byte	0xa
	.byte	0xba
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF123
	.byte	0xa
	.byte	0xbb
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF142
	.byte	0xa
	.byte	0xbc
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.byte	0x0
	.uleb128 0x5
	.byte	0x8
	.byte	0xa
	.byte	0xc1
	.long	0x4642
	.uleb128 0xa
	.long	.LASF160
	.byte	0xa
	.byte	0xc2
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF161
	.byte	0xa
	.byte	0xc3
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF162
	.byte	0xa
	.byte	0xc4
	.long	0x4642
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0xf
	.long	0x3de7
	.long	0x4652
	.uleb128 0x10
	.long	0x537
	.byte	0x5
	.byte	0x0
	.uleb128 0xb
	.byte	0x8
	.byte	0xa
	.byte	0xc0
	.long	0x466b
	.uleb128 0x8
	.long	0x460f
	.uleb128 0xc
	.long	.LASF163
	.byte	0xa
	.byte	0xc6
	.long	0x3e07
	.byte	0x0
	.uleb128 0xd
	.long	.LASF164
	.byte	0x8
	.byte	0xa
	.byte	0xbf
	.long	0x4680
	.uleb128 0xe
	.long	0x4652
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x16
	.long	.LASF165
	.value	0xb68
	.byte	0xa
	.byte	0xca
	.long	0x4793
	.uleb128 0xa
	.long	.LASF106
	.byte	0xa
	.byte	0xcb
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF166
	.byte	0xa
	.byte	0xcc
	.long	0x4793
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF167
	.byte	0xa
	.byte	0xcd
	.long	0x3e90
	.byte	0x2
	.byte	0x23
	.uleb128 0x22
	.uleb128 0xa
	.long	.LASF168
	.byte	0xa
	.byte	0xce
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x26
	.uleb128 0xa
	.long	.LASF169
	.byte	0xa
	.byte	0xcf
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x27
	.uleb128 0xa
	.long	.LASF170
	.byte	0xa
	.byte	0xd0
	.long	0x3eb5
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0xa
	.long	.LASF171
	.byte	0xa
	.byte	0xd2
	.long	0x47a3
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0xa
	.long	.LASF172
	.byte	0xa
	.byte	0xd5
	.long	0x47b3
	.byte	0x2
	.byte	0x23
	.uleb128 0x3d
	.uleb128 0xa
	.long	.LASF173
	.byte	0xa
	.byte	0xd8
	.long	0x47c3
	.byte	0x2
	.byte	0x23
	.uleb128 0x5d
	.uleb128 0xa
	.long	.LASF174
	.byte	0xa
	.byte	0xdb
	.long	0x3de7
	.byte	0x3
	.byte	0x23
	.uleb128 0x121
	.uleb128 0xa
	.long	.LASF175
	.byte	0xa
	.byte	0xdc
	.long	0x466b
	.byte	0x3
	.byte	0x23
	.uleb128 0x122
	.uleb128 0xa
	.long	.LASF176
	.byte	0xa
	.byte	0xde
	.long	0x6c
	.byte	0x3
	.byte	0x23
	.uleb128 0x12a
	.uleb128 0xa
	.long	.LASF177
	.byte	0xa
	.byte	0xe1
	.long	0x44cf
	.byte	0x3
	.byte	0x23
	.uleb128 0x12e
	.uleb128 0xa
	.long	.LASF178
	.byte	0xa
	.byte	0xe4
	.long	0x441a
	.byte	0x3
	.byte	0x23
	.uleb128 0x146
	.uleb128 0xa
	.long	.LASF179
	.byte	0xa
	.byte	0xe7
	.long	0x47d3
	.byte	0x3
	.byte	0x23
	.uleb128 0x156
	.uleb128 0xa
	.long	.LASF180
	.byte	0xa
	.byte	0xe9
	.long	0x3df1
	.byte	0x3
	.byte	0x23
	.uleb128 0x166
	.uleb128 0xa
	.long	.LASF181
	.byte	0xa
	.byte	0xec
	.long	0x47e3
	.byte	0x3
	.byte	0x23
	.uleb128 0x168
	.uleb128 0xa
	.long	.LASF182
	.byte	0xa
	.byte	0xee
	.long	0x47f4
	.byte	0x3
	.byte	0x23
	.uleb128 0x368
	.byte	0x0
	.uleb128 0xf
	.long	0x3de7
	.long	0x47a3
	.uleb128 0x10
	.long	0x537
	.byte	0x20
	.byte	0x0
	.uleb128 0xf
	.long	0x3de7
	.long	0x47b3
	.uleb128 0x10
	.long	0x537
	.byte	0xc
	.byte	0x0
	.uleb128 0xf
	.long	0x455a
	.long	0x47c3
	.uleb128 0x10
	.long	0x537
	.byte	0x1
	.byte	0x0
	.uleb128 0xf
	.long	0x3de7
	.long	0x47d3
	.uleb128 0x10
	.long	0x537
	.byte	0xc3
	.byte	0x0
	.uleb128 0xf
	.long	0x3de7
	.long	0x47e3
	.uleb128 0x10
	.long	0x537
	.byte	0xf
	.byte	0x0
	.uleb128 0xf
	.long	0x3de7
	.long	0x47f4
	.uleb128 0x17
	.long	0x537
	.value	0x1ff
	.byte	0x0
	.uleb128 0xf
	.long	0x3de7
	.long	0x4805
	.uleb128 0x17
	.long	0x537
	.value	0x7ff
	.byte	0x0
	.uleb128 0x14
	.long	.LASF105
	.byte	0xa
	.byte	0xa
	.value	0x13e
	.long	0x489a
	.uleb128 0x15
	.long	.LASF106
	.byte	0xa
	.value	0x13f
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x15
	.long	.LASF107
	.byte	0xa
	.value	0x140
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x15
	.long	.LASF108
	.byte	0xa
	.value	0x141
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x15
	.long	.LASF109
	.byte	0xa
	.value	0x142
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x15
	.long	.LASF110
	.byte	0xa
	.value	0x143
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x15
	.long	.LASF111
	.byte	0xa
	.value	0x143
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x15
	.long	.LASF112
	.byte	0xa
	.value	0x143
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x15
	.long	.LASF113
	.byte	0xa
	.value	0x143
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x15
	.long	.LASF114
	.byte	0xa
	.value	0x143
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0x48be
	.uleb128 0x6
	.string	"di"
	.byte	0xe
	.byte	0x28
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF9
	.byte	0xe
	.byte	0x28
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0x48ff
	.uleb128 0xa
	.long	.LASF10
	.byte	0xe
	.byte	0x28
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF9
	.byte	0xe
	.byte	0x28
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF11
	.byte	0xe
	.byte	0x28
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF12
	.byte	0xe
	.byte	0x28
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0x491d
	.uleb128 0x9
	.string	"edi"
	.byte	0xe
	.byte	0x28
	.long	0x3dfc
	.uleb128 0x8
	.long	0x489a
	.uleb128 0x8
	.long	0x48be
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0x4941
	.uleb128 0x6
	.string	"si"
	.byte	0xe
	.byte	0x29
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF13
	.byte	0xe
	.byte	0x29
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0x4982
	.uleb128 0xa
	.long	.LASF14
	.byte	0xe
	.byte	0x29
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF13
	.byte	0xe
	.byte	0x29
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF15
	.byte	0xe
	.byte	0x29
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF16
	.byte	0xe
	.byte	0x29
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0x49a0
	.uleb128 0x9
	.string	"esi"
	.byte	0xe
	.byte	0x29
	.long	0x3dfc
	.uleb128 0x8
	.long	0x491d
	.uleb128 0x8
	.long	0x4941
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0x49c4
	.uleb128 0x6
	.string	"bp"
	.byte	0xe
	.byte	0x2a
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF17
	.byte	0xe
	.byte	0x2a
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0x4a05
	.uleb128 0xa
	.long	.LASF18
	.byte	0xe
	.byte	0x2a
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF17
	.byte	0xe
	.byte	0x2a
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF19
	.byte	0xe
	.byte	0x2a
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF20
	.byte	0xe
	.byte	0x2a
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0x4a23
	.uleb128 0x9
	.string	"ebp"
	.byte	0xe
	.byte	0x2a
	.long	0x3dfc
	.uleb128 0x8
	.long	0x49a0
	.uleb128 0x8
	.long	0x49c4
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0x4a47
	.uleb128 0x6
	.string	"bx"
	.byte	0xe
	.byte	0x2b
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF21
	.byte	0xe
	.byte	0x2b
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0x4a86
	.uleb128 0x6
	.string	"bl"
	.byte	0xe
	.byte	0x2b
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"bh"
	.byte	0xe
	.byte	0x2b
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF22
	.byte	0xe
	.byte	0x2b
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF23
	.byte	0xe
	.byte	0x2b
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0x4aa4
	.uleb128 0x9
	.string	"ebx"
	.byte	0xe
	.byte	0x2b
	.long	0x3dfc
	.uleb128 0x8
	.long	0x4a23
	.uleb128 0x8
	.long	0x4a47
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0x4ac8
	.uleb128 0x6
	.string	"dx"
	.byte	0xe
	.byte	0x2c
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF24
	.byte	0xe
	.byte	0x2c
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0x4b07
	.uleb128 0x6
	.string	"dl"
	.byte	0xe
	.byte	0x2c
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"dh"
	.byte	0xe
	.byte	0x2c
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF25
	.byte	0xe
	.byte	0x2c
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF26
	.byte	0xe
	.byte	0x2c
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0x4b25
	.uleb128 0x9
	.string	"edx"
	.byte	0xe
	.byte	0x2c
	.long	0x3dfc
	.uleb128 0x8
	.long	0x4aa4
	.uleb128 0x8
	.long	0x4ac8
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0x4b49
	.uleb128 0x6
	.string	"cx"
	.byte	0xe
	.byte	0x2d
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF27
	.byte	0xe
	.byte	0x2d
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0x4b88
	.uleb128 0x6
	.string	"cl"
	.byte	0xe
	.byte	0x2d
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"ch"
	.byte	0xe
	.byte	0x2d
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF28
	.byte	0xe
	.byte	0x2d
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF29
	.byte	0xe
	.byte	0x2d
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0x4ba6
	.uleb128 0x9
	.string	"ecx"
	.byte	0xe
	.byte	0x2d
	.long	0x3dfc
	.uleb128 0x8
	.long	0x4b25
	.uleb128 0x8
	.long	0x4b49
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0x4bca
	.uleb128 0x6
	.string	"ax"
	.byte	0xe
	.byte	0x2e
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF30
	.byte	0xe
	.byte	0x2e
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0x4c09
	.uleb128 0x6
	.string	"al"
	.byte	0xe
	.byte	0x2e
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"ah"
	.byte	0xe
	.byte	0x2e
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF31
	.byte	0xe
	.byte	0x2e
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF32
	.byte	0xe
	.byte	0x2e
	.long	0x3de7
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0x4c27
	.uleb128 0x9
	.string	"eax"
	.byte	0xe
	.byte	0x2e
	.long	0x3dfc
	.uleb128 0x8
	.long	0x4ba6
	.uleb128 0x8
	.long	0x4bca
	.byte	0x0
	.uleb128 0xd
	.long	.LASF34
	.byte	0x26
	.byte	0x24
	.byte	0x64
	.long	0x4ca2
	.uleb128 0x6
	.string	"ds"
	.byte	0xe
	.byte	0x26
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"es"
	.byte	0xe
	.byte	0x27
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xe
	.long	0x48ff
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xe
	.long	0x4982
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xe
	.long	0x4a05
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xe
	.long	0x4a86
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xe
	.long	0x4b07
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xe
	.long	0x4b88
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xe
	.long	0x4c09
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.long	.LASF35
	.byte	0xe
	.byte	0x2f
	.long	0x3e90
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xa
	.long	.LASF36
	.byte	0xe
	.byte	0x30
	.long	0x3df1
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.byte	0x0
	.uleb128 0x2
	.string	"u8"
	.byte	0x23
	.byte	0x9
	.long	0x33
	.uleb128 0x2
	.string	"u16"
	.byte	0x23
	.byte	0xb
	.long	0x4c
	.uleb128 0x2
	.string	"u32"
	.byte	0x23
	.byte	0xd
	.long	0x65
	.uleb128 0x2
	.string	"u64"
	.byte	0x23
	.byte	0xf
	.long	0x7e
	.uleb128 0x5
	.byte	0x8
	.byte	0x23
	.byte	0x14
	.long	0x4cf0
	.uleb128 0x6
	.string	"hi"
	.byte	0x23
	.byte	0x14
	.long	0x4cb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"lo"
	.byte	0x23
	.byte	0x14
	.long	0x4cb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x7
	.long	.LASF118
	.byte	0x8
	.byte	0x23
	.byte	0x13
	.long	0x4d0d
	.uleb128 0x8
	.long	0x4ccd
	.uleb128 0x9
	.string	"val"
	.byte	0x23
	.byte	0x15
	.long	0x4cc2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0x19
	.byte	0xbc
	.long	0x4d32
	.uleb128 0xa
	.long	.LASF7
	.byte	0x19
	.byte	0xbd
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"seg"
	.byte	0x19
	.byte	0xbe
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0x19
	.byte	0xbb
	.long	0x4d4b
	.uleb128 0x8
	.long	0x4d0d
	.uleb128 0xc
	.long	.LASF8
	.byte	0x19
	.byte	0xc0
	.long	0x4cb7
	.byte	0x0
	.uleb128 0xd
	.long	.LASF33
	.byte	0x4
	.byte	0x19
	.byte	0xba
	.long	0x4d60
	.uleb128 0xe
	.long	0x4d32
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0xf
	.long	0x4ca2
	.long	0x4d70
	.uleb128 0x10
	.long	0x537
	.byte	0x3
	.byte	0x0
	.uleb128 0xd
	.long	.LASF119
	.byte	0x24
	.byte	0x24
	.byte	0x97
	.long	0x4e09
	.uleb128 0xa
	.long	.LASF120
	.byte	0x24
	.byte	0xb0
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF121
	.byte	0x24
	.byte	0xb1
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF122
	.byte	0x24
	.byte	0xb2
	.long	0x4e0f
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF123
	.byte	0x24
	.byte	0xb3
	.long	0x4cc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF124
	.byte	0x24
	.byte	0xb4
	.long	0x53c
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF125
	.byte	0x24
	.byte	0xb5
	.long	0x4cb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.long	.LASF126
	.byte	0x24
	.byte	0xb6
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF127
	.byte	0x24
	.byte	0xb9
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF128
	.byte	0x24
	.byte	0xba
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF129
	.byte	0x24
	.byte	0xbb
	.long	0x4e0f
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0x4d70
	.uleb128 0xd
	.long	.LASF130
	.byte	0x6
	.byte	0x24
	.byte	0xa9
	.long	0x4e46
	.uleb128 0xa
	.long	.LASF131
	.byte	0x24
	.byte	0xaa
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF132
	.byte	0x24
	.byte	0xab
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.string	"spt"
	.byte	0x24
	.byte	0xac
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xd
	.long	.LASF210
	.byte	0xc4
	.byte	0x24
	.byte	0xd0
	.long	0x4e7d
	.uleb128 0xa
	.long	.LASF211
	.byte	0x24
	.byte	0xd2
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF212
	.byte	0x24
	.byte	0xd3
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF213
	.byte	0x24
	.byte	0xd4
	.long	0x4e7d
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xf
	.long	0x4e09
	.long	0x4e93
	.uleb128 0x10
	.long	0x537
	.byte	0x2
	.uleb128 0x10
	.long	0x537
	.byte	0xf
	.byte	0x0
	.uleb128 0xd
	.long	.LASF38
	.byte	0xbc
	.byte	0xa
	.byte	0x21
	.long	0x5255
	.uleb128 0xa
	.long	.LASF39
	.byte	0xa
	.byte	0x23
	.long	0x5255
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF40
	.byte	0xa
	.byte	0x24
	.long	0x5265
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF41
	.byte	0xa
	.byte	0x25
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF42
	.byte	0xa
	.byte	0x27
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF43
	.byte	0xa
	.byte	0x28
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0xa
	.long	.LASF44
	.byte	0xa
	.byte	0x29
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x13
	.uleb128 0xa
	.long	.LASF45
	.byte	0xa
	.byte	0x2a
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x15
	.uleb128 0xa
	.long	.LASF46
	.byte	0xa
	.byte	0x2b
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x16
	.uleb128 0xa
	.long	.LASF47
	.byte	0xa
	.byte	0x2c
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x17
	.uleb128 0xa
	.long	.LASF48
	.byte	0xa
	.byte	0x2d
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF49
	.byte	0xa
	.byte	0x2e
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF50
	.byte	0xa
	.byte	0x2f
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF51
	.byte	0xa
	.byte	0x30
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.long	.LASF52
	.byte	0xa
	.byte	0x32
	.long	0x5275
	.byte	0x2
	.byte	0x23
	.uleb128 0x1e
	.uleb128 0xa
	.long	.LASF53
	.byte	0xa
	.byte	0x33
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x3e
	.uleb128 0xa
	.long	.LASF54
	.byte	0xa
	.byte	0x34
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x3f
	.uleb128 0xa
	.long	.LASF55
	.byte	0xa
	.byte	0x36
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0xa
	.long	.LASF56
	.byte	0xa
	.byte	0x37
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x41
	.uleb128 0xa
	.long	.LASF57
	.byte	0xa
	.byte	0x38
	.long	0x5285
	.byte	0x2
	.byte	0x23
	.uleb128 0x42
	.uleb128 0xa
	.long	.LASF58
	.byte	0xa
	.byte	0x39
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x49
	.uleb128 0xa
	.long	.LASF59
	.byte	0xa
	.byte	0x3a
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.uleb128 0xa
	.long	.LASF60
	.byte	0xa
	.byte	0x3b
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0xa
	.long	.LASF61
	.byte	0xa
	.byte	0x3c
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x4e
	.uleb128 0xa
	.long	.LASF62
	.byte	0xa
	.byte	0x3e
	.long	0x5295
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0xa
	.long	.LASF63
	.byte	0xa
	.byte	0x40
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0xa
	.long	.LASF64
	.byte	0xa
	.byte	0x41
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x62
	.uleb128 0xa
	.long	.LASF65
	.byte	0xa
	.byte	0x42
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x63
	.uleb128 0xa
	.long	.LASF66
	.byte	0xa
	.byte	0x43
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x65
	.uleb128 0xa
	.long	.LASF67
	.byte	0xa
	.byte	0x44
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x66
	.uleb128 0xa
	.long	.LASF68
	.byte	0xa
	.byte	0x45
	.long	0x4d4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x67
	.uleb128 0xa
	.long	.LASF69
	.byte	0xa
	.byte	0x46
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x6b
	.uleb128 0xa
	.long	.LASF70
	.byte	0xa
	.byte	0x47
	.long	0x4cb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.uleb128 0xa
	.long	.LASF71
	.byte	0xa
	.byte	0x49
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0xa
	.long	.LASF72
	.byte	0xa
	.byte	0x4a
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x71
	.uleb128 0xa
	.long	.LASF73
	.byte	0xa
	.byte	0x4b
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x72
	.uleb128 0xa
	.long	.LASF74
	.byte	0xa
	.byte	0x4c
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0xa
	.long	.LASF75
	.byte	0xa
	.byte	0x4d
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x75
	.uleb128 0xa
	.long	.LASF76
	.byte	0xa
	.byte	0x4e
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x76
	.uleb128 0xa
	.long	.LASF77
	.byte	0xa
	.byte	0x4f
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x77
	.uleb128 0xa
	.long	.LASF78
	.byte	0xa
	.byte	0x50
	.long	0x4d60
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0xa
	.long	.LASF79
	.byte	0xa
	.byte	0x51
	.long	0x4d60
	.byte	0x2
	.byte	0x23
	.uleb128 0x7c
	.uleb128 0xa
	.long	.LASF80
	.byte	0xa
	.byte	0x53
	.long	0x4cac
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0xa
	.long	.LASF81
	.byte	0xa
	.byte	0x54
	.long	0x4cac
	.byte	0x3
	.byte	0x23
	.uleb128 0x82
	.uleb128 0xa
	.long	.LASF82
	.byte	0xa
	.byte	0x55
	.long	0x4ca2
	.byte	0x3
	.byte	0x23
	.uleb128 0x84
	.uleb128 0xa
	.long	.LASF83
	.byte	0xa
	.byte	0x56
	.long	0x4cac
	.byte	0x3
	.byte	0x23
	.uleb128 0x85
	.uleb128 0xa
	.long	.LASF84
	.byte	0xa
	.byte	0x57
	.long	0x4ca2
	.byte	0x3
	.byte	0x23
	.uleb128 0x87
	.uleb128 0xa
	.long	.LASF85
	.byte	0xa
	.byte	0x58
	.long	0x4ca2
	.byte	0x3
	.byte	0x23
	.uleb128 0x88
	.uleb128 0xa
	.long	.LASF86
	.byte	0xa
	.byte	0x59
	.long	0x4ca2
	.byte	0x3
	.byte	0x23
	.uleb128 0x89
	.uleb128 0xa
	.long	.LASF87
	.byte	0xa
	.byte	0x5a
	.long	0x4ca2
	.byte	0x3
	.byte	0x23
	.uleb128 0x8a
	.uleb128 0xa
	.long	.LASF88
	.byte	0xa
	.byte	0x5b
	.long	0x4ca2
	.byte	0x3
	.byte	0x23
	.uleb128 0x8b
	.uleb128 0xa
	.long	.LASF89
	.byte	0xa
	.byte	0x5c
	.long	0x4ca2
	.byte	0x3
	.byte	0x23
	.uleb128 0x8c
	.uleb128 0xa
	.long	.LASF90
	.byte	0xa
	.byte	0x5d
	.long	0x4ca2
	.byte	0x3
	.byte	0x23
	.uleb128 0x8d
	.uleb128 0xa
	.long	.LASF91
	.byte	0xa
	.byte	0x5e
	.long	0x4ca2
	.byte	0x3
	.byte	0x23
	.uleb128 0x8e
	.uleb128 0xa
	.long	.LASF92
	.byte	0xa
	.byte	0x5f
	.long	0x4ca2
	.byte	0x3
	.byte	0x23
	.uleb128 0x8f
	.uleb128 0xa
	.long	.LASF93
	.byte	0xa
	.byte	0x61
	.long	0x4d60
	.byte	0x3
	.byte	0x23
	.uleb128 0x90
	.uleb128 0xa
	.long	.LASF94
	.byte	0xa
	.byte	0x62
	.long	0x52a5
	.byte	0x3
	.byte	0x23
	.uleb128 0x94
	.uleb128 0xa
	.long	.LASF95
	.byte	0xa
	.byte	0x63
	.long	0x4ca2
	.byte	0x3
	.byte	0x23
	.uleb128 0x96
	.uleb128 0xa
	.long	.LASF96
	.byte	0xa
	.byte	0x64
	.long	0x4ca2
	.byte	0x3
	.byte	0x23
	.uleb128 0x97
	.uleb128 0xa
	.long	.LASF97
	.byte	0xa
	.byte	0x65
	.long	0x4d4b
	.byte	0x3
	.byte	0x23
	.uleb128 0x98
	.uleb128 0xa
	.long	.LASF98
	.byte	0xa
	.byte	0x66
	.long	0x4cb7
	.byte	0x3
	.byte	0x23
	.uleb128 0x9c
	.uleb128 0xa
	.long	.LASF99
	.byte	0xa
	.byte	0x68
	.long	0x4ca2
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0xa
	.long	.LASF100
	.byte	0xa
	.byte	0x69
	.long	0x5285
	.byte	0x3
	.byte	0x23
	.uleb128 0xa1
	.uleb128 0xa
	.long	.LASF101
	.byte	0xa
	.byte	0x6a
	.long	0x4d4b
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0xa
	.long	.LASF102
	.byte	0xa
	.byte	0x6b
	.long	0x4d60
	.byte	0x3
	.byte	0x23
	.uleb128 0xac
	.uleb128 0xa
	.long	.LASF103
	.byte	0xa
	.byte	0x6d
	.long	0x52b5
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0xa
	.long	.LASF104
	.byte	0xa
	.byte	0x6e
	.long	0x4cac
	.byte	0x3
	.byte	0x23
	.uleb128 0xba
	.byte	0x0
	.uleb128 0xf
	.long	0x4cac
	.long	0x5265
	.uleb128 0x10
	.long	0x537
	.byte	0x3
	.byte	0x0
	.uleb128 0xf
	.long	0x4cac
	.long	0x5275
	.uleb128 0x10
	.long	0x537
	.byte	0x2
	.byte	0x0
	.uleb128 0xf
	.long	0x4ca2
	.long	0x5285
	.uleb128 0x10
	.long	0x537
	.byte	0x1f
	.byte	0x0
	.uleb128 0xf
	.long	0x4ca2
	.long	0x5295
	.uleb128 0x10
	.long	0x537
	.byte	0x6
	.byte	0x0
	.uleb128 0xf
	.long	0x4cac
	.long	0x52a5
	.uleb128 0x10
	.long	0x537
	.byte	0x7
	.byte	0x0
	.uleb128 0xf
	.long	0x4ca2
	.long	0x52b5
	.uleb128 0x10
	.long	0x537
	.byte	0x1
	.byte	0x0
	.uleb128 0xf
	.long	0x4ca2
	.long	0x52c5
	.uleb128 0x10
	.long	0x537
	.byte	0x9
	.byte	0x0
	.uleb128 0x14
	.long	.LASF105
	.byte	0xa
	.byte	0xa
	.value	0x13e
	.long	0x535a
	.uleb128 0x15
	.long	.LASF106
	.byte	0xa
	.value	0x13f
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x15
	.long	.LASF107
	.byte	0xa
	.value	0x140
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x15
	.long	.LASF108
	.byte	0xa
	.value	0x141
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x15
	.long	.LASF109
	.byte	0xa
	.value	0x142
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x15
	.long	.LASF110
	.byte	0xa
	.value	0x143
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x15
	.long	.LASF111
	.byte	0xa
	.value	0x143
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x15
	.long	.LASF112
	.byte	0xa
	.value	0x143
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x15
	.long	.LASF113
	.byte	0xa
	.value	0x143
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x15
	.long	.LASF114
	.byte	0xa
	.value	0x143
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0x537e
	.uleb128 0x6
	.string	"di"
	.byte	0xe
	.byte	0x28
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF9
	.byte	0xe
	.byte	0x28
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0x53bf
	.uleb128 0xa
	.long	.LASF10
	.byte	0xe
	.byte	0x28
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF9
	.byte	0xe
	.byte	0x28
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF11
	.byte	0xe
	.byte	0x28
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF12
	.byte	0xe
	.byte	0x28
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0x53dd
	.uleb128 0x9
	.string	"edi"
	.byte	0xe
	.byte	0x28
	.long	0x4cb7
	.uleb128 0x8
	.long	0x535a
	.uleb128 0x8
	.long	0x537e
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0x5401
	.uleb128 0x6
	.string	"si"
	.byte	0xe
	.byte	0x29
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF13
	.byte	0xe
	.byte	0x29
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0x5442
	.uleb128 0xa
	.long	.LASF14
	.byte	0xe
	.byte	0x29
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF13
	.byte	0xe
	.byte	0x29
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF15
	.byte	0xe
	.byte	0x29
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF16
	.byte	0xe
	.byte	0x29
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0x5460
	.uleb128 0x9
	.string	"esi"
	.byte	0xe
	.byte	0x29
	.long	0x4cb7
	.uleb128 0x8
	.long	0x53dd
	.uleb128 0x8
	.long	0x5401
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0x5484
	.uleb128 0x6
	.string	"bp"
	.byte	0xe
	.byte	0x2a
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF17
	.byte	0xe
	.byte	0x2a
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0x54c5
	.uleb128 0xa
	.long	.LASF18
	.byte	0xe
	.byte	0x2a
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF17
	.byte	0xe
	.byte	0x2a
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF19
	.byte	0xe
	.byte	0x2a
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF20
	.byte	0xe
	.byte	0x2a
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0x54e3
	.uleb128 0x9
	.string	"ebp"
	.byte	0xe
	.byte	0x2a
	.long	0x4cb7
	.uleb128 0x8
	.long	0x5460
	.uleb128 0x8
	.long	0x5484
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0x5507
	.uleb128 0x6
	.string	"bx"
	.byte	0xe
	.byte	0x2b
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF21
	.byte	0xe
	.byte	0x2b
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0x5546
	.uleb128 0x6
	.string	"bl"
	.byte	0xe
	.byte	0x2b
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"bh"
	.byte	0xe
	.byte	0x2b
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF22
	.byte	0xe
	.byte	0x2b
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF23
	.byte	0xe
	.byte	0x2b
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0x5564
	.uleb128 0x9
	.string	"ebx"
	.byte	0xe
	.byte	0x2b
	.long	0x4cb7
	.uleb128 0x8
	.long	0x54e3
	.uleb128 0x8
	.long	0x5507
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0x5588
	.uleb128 0x6
	.string	"dx"
	.byte	0xe
	.byte	0x2c
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF24
	.byte	0xe
	.byte	0x2c
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0x55c7
	.uleb128 0x6
	.string	"dl"
	.byte	0xe
	.byte	0x2c
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"dh"
	.byte	0xe
	.byte	0x2c
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF25
	.byte	0xe
	.byte	0x2c
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF26
	.byte	0xe
	.byte	0x2c
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0x55e5
	.uleb128 0x9
	.string	"edx"
	.byte	0xe
	.byte	0x2c
	.long	0x4cb7
	.uleb128 0x8
	.long	0x5564
	.uleb128 0x8
	.long	0x5588
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0x5609
	.uleb128 0x6
	.string	"cx"
	.byte	0xe
	.byte	0x2d
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF27
	.byte	0xe
	.byte	0x2d
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0x5648
	.uleb128 0x6
	.string	"cl"
	.byte	0xe
	.byte	0x2d
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"ch"
	.byte	0xe
	.byte	0x2d
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF28
	.byte	0xe
	.byte	0x2d
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF29
	.byte	0xe
	.byte	0x2d
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0x5666
	.uleb128 0x9
	.string	"ecx"
	.byte	0xe
	.byte	0x2d
	.long	0x4cb7
	.uleb128 0x8
	.long	0x55e5
	.uleb128 0x8
	.long	0x5609
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0x568a
	.uleb128 0x6
	.string	"ax"
	.byte	0xe
	.byte	0x2e
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF30
	.byte	0xe
	.byte	0x2e
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0x56c9
	.uleb128 0x6
	.string	"al"
	.byte	0xe
	.byte	0x2e
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"ah"
	.byte	0xe
	.byte	0x2e
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF31
	.byte	0xe
	.byte	0x2e
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF32
	.byte	0xe
	.byte	0x2e
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0x56e7
	.uleb128 0x9
	.string	"eax"
	.byte	0xe
	.byte	0x2e
	.long	0x4cb7
	.uleb128 0x8
	.long	0x5666
	.uleb128 0x8
	.long	0x568a
	.byte	0x0
	.uleb128 0xd
	.long	.LASF34
	.byte	0x26
	.byte	0x24
	.byte	0x64
	.long	0x5762
	.uleb128 0x6
	.string	"ds"
	.byte	0xe
	.byte	0x26
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"es"
	.byte	0xe
	.byte	0x27
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xe
	.long	0x53bf
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xe
	.long	0x5442
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xe
	.long	0x54c5
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xe
	.long	0x5546
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xe
	.long	0x55c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xe
	.long	0x5648
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xe
	.long	0x56c9
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.long	.LASF35
	.byte	0xe
	.byte	0x2f
	.long	0x4d4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xa
	.long	.LASF36
	.byte	0xe
	.byte	0x30
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.byte	0x0
	.uleb128 0x14
	.long	.LASF247
	.byte	0xa
	.byte	0xb
	.value	0x112
	.long	0x57bb
	.uleb128 0x15
	.long	.LASF248
	.byte	0xb
	.value	0x113
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x15
	.long	.LASF249
	.byte	0xb
	.value	0x114
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x15
	.long	.LASF250
	.byte	0xb
	.value	0x115
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x1d
	.string	"alt"
	.byte	0xb
	.value	0x116
	.long	0x4cac
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x15
	.long	.LASF251
	.byte	0xb
	.value	0x117
	.long	0x4ca2
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x2
	.string	"u8"
	.byte	0x23
	.byte	0x9
	.long	0x33
	.uleb128 0x2
	.string	"u16"
	.byte	0x23
	.byte	0xb
	.long	0x4c
	.uleb128 0x2
	.string	"u32"
	.byte	0x23
	.byte	0xd
	.long	0x65
	.uleb128 0x2
	.string	"u8"
	.byte	0x23
	.byte	0x9
	.long	0x33
	.uleb128 0x2
	.string	"u16"
	.byte	0x23
	.byte	0xb
	.long	0x4c
	.uleb128 0x2
	.string	"u32"
	.byte	0x23
	.byte	0xd
	.long	0x65
	.uleb128 0x2
	.string	"u64"
	.byte	0x23
	.byte	0xf
	.long	0x7e
	.uleb128 0x5
	.byte	0x8
	.byte	0x23
	.byte	0x14
	.long	0x5829
	.uleb128 0x6
	.string	"hi"
	.byte	0x23
	.byte	0x14
	.long	0x57f0
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"lo"
	.byte	0x23
	.byte	0x14
	.long	0x57f0
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x7
	.long	.LASF118
	.byte	0x8
	.byte	0x23
	.byte	0x13
	.long	0x5846
	.uleb128 0x8
	.long	0x5806
	.uleb128 0x9
	.string	"val"
	.byte	0x23
	.byte	0x15
	.long	0x57fb
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0x19
	.byte	0xbc
	.long	0x586b
	.uleb128 0xa
	.long	.LASF7
	.byte	0x19
	.byte	0xbd
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"seg"
	.byte	0x19
	.byte	0xbe
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0x19
	.byte	0xbb
	.long	0x5884
	.uleb128 0x8
	.long	0x5846
	.uleb128 0xc
	.long	.LASF8
	.byte	0x19
	.byte	0xc0
	.long	0x57f0
	.byte	0x0
	.uleb128 0xd
	.long	.LASF33
	.byte	0x4
	.byte	0x19
	.byte	0xba
	.long	0x5899
	.uleb128 0xe
	.long	0x586b
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0xf
	.long	0x57db
	.long	0x58a9
	.uleb128 0x10
	.long	0x537
	.byte	0x3
	.byte	0x0
	.uleb128 0xd
	.long	.LASF119
	.byte	0x24
	.byte	0x24
	.byte	0x97
	.long	0x5942
	.uleb128 0xa
	.long	.LASF120
	.byte	0x24
	.byte	0xb0
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF121
	.byte	0x24
	.byte	0xb1
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF122
	.byte	0x24
	.byte	0xb2
	.long	0x5948
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF123
	.byte	0x24
	.byte	0xb3
	.long	0x57fb
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF124
	.byte	0x24
	.byte	0xb4
	.long	0x53c
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF125
	.byte	0x24
	.byte	0xb5
	.long	0x57f0
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.long	.LASF126
	.byte	0x24
	.byte	0xb6
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF127
	.byte	0x24
	.byte	0xb9
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF128
	.byte	0x24
	.byte	0xba
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF129
	.byte	0x24
	.byte	0xbb
	.long	0x5948
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0x58a9
	.uleb128 0xd
	.long	.LASF130
	.byte	0x6
	.byte	0x24
	.byte	0xa9
	.long	0x597f
	.uleb128 0xa
	.long	.LASF131
	.byte	0x24
	.byte	0xaa
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF132
	.byte	0x24
	.byte	0xab
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.string	"spt"
	.byte	0x24
	.byte	0xac
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xd
	.long	.LASF210
	.byte	0xc4
	.byte	0x24
	.byte	0xd0
	.long	0x59b6
	.uleb128 0xa
	.long	.LASF211
	.byte	0x24
	.byte	0xd2
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF212
	.byte	0x24
	.byte	0xd3
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF213
	.byte	0x24
	.byte	0xd4
	.long	0x59b6
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xf
	.long	0x5942
	.long	0x59cc
	.uleb128 0x10
	.long	0x537
	.byte	0x2
	.uleb128 0x10
	.long	0x537
	.byte	0xf
	.byte	0x0
	.uleb128 0xd
	.long	.LASF38
	.byte	0xbc
	.byte	0xa
	.byte	0x21
	.long	0x5d8e
	.uleb128 0xa
	.long	.LASF39
	.byte	0xa
	.byte	0x23
	.long	0x5d8e
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF40
	.byte	0xa
	.byte	0x24
	.long	0x5d9e
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF41
	.byte	0xa
	.byte	0x25
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF42
	.byte	0xa
	.byte	0x27
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF43
	.byte	0xa
	.byte	0x28
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0xa
	.long	.LASF44
	.byte	0xa
	.byte	0x29
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x13
	.uleb128 0xa
	.long	.LASF45
	.byte	0xa
	.byte	0x2a
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x15
	.uleb128 0xa
	.long	.LASF46
	.byte	0xa
	.byte	0x2b
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x16
	.uleb128 0xa
	.long	.LASF47
	.byte	0xa
	.byte	0x2c
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x17
	.uleb128 0xa
	.long	.LASF48
	.byte	0xa
	.byte	0x2d
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF49
	.byte	0xa
	.byte	0x2e
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF50
	.byte	0xa
	.byte	0x2f
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF51
	.byte	0xa
	.byte	0x30
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.long	.LASF52
	.byte	0xa
	.byte	0x32
	.long	0x5dae
	.byte	0x2
	.byte	0x23
	.uleb128 0x1e
	.uleb128 0xa
	.long	.LASF53
	.byte	0xa
	.byte	0x33
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x3e
	.uleb128 0xa
	.long	.LASF54
	.byte	0xa
	.byte	0x34
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x3f
	.uleb128 0xa
	.long	.LASF55
	.byte	0xa
	.byte	0x36
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0xa
	.long	.LASF56
	.byte	0xa
	.byte	0x37
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x41
	.uleb128 0xa
	.long	.LASF57
	.byte	0xa
	.byte	0x38
	.long	0x5dbe
	.byte	0x2
	.byte	0x23
	.uleb128 0x42
	.uleb128 0xa
	.long	.LASF58
	.byte	0xa
	.byte	0x39
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x49
	.uleb128 0xa
	.long	.LASF59
	.byte	0xa
	.byte	0x3a
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.uleb128 0xa
	.long	.LASF60
	.byte	0xa
	.byte	0x3b
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0xa
	.long	.LASF61
	.byte	0xa
	.byte	0x3c
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x4e
	.uleb128 0xa
	.long	.LASF62
	.byte	0xa
	.byte	0x3e
	.long	0x5dce
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0xa
	.long	.LASF63
	.byte	0xa
	.byte	0x40
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0xa
	.long	.LASF64
	.byte	0xa
	.byte	0x41
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x62
	.uleb128 0xa
	.long	.LASF65
	.byte	0xa
	.byte	0x42
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x63
	.uleb128 0xa
	.long	.LASF66
	.byte	0xa
	.byte	0x43
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x65
	.uleb128 0xa
	.long	.LASF67
	.byte	0xa
	.byte	0x44
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x66
	.uleb128 0xa
	.long	.LASF68
	.byte	0xa
	.byte	0x45
	.long	0x5884
	.byte	0x2
	.byte	0x23
	.uleb128 0x67
	.uleb128 0xa
	.long	.LASF69
	.byte	0xa
	.byte	0x46
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x6b
	.uleb128 0xa
	.long	.LASF70
	.byte	0xa
	.byte	0x47
	.long	0x57f0
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.uleb128 0xa
	.long	.LASF71
	.byte	0xa
	.byte	0x49
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0xa
	.long	.LASF72
	.byte	0xa
	.byte	0x4a
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x71
	.uleb128 0xa
	.long	.LASF73
	.byte	0xa
	.byte	0x4b
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x72
	.uleb128 0xa
	.long	.LASF74
	.byte	0xa
	.byte	0x4c
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0xa
	.long	.LASF75
	.byte	0xa
	.byte	0x4d
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x75
	.uleb128 0xa
	.long	.LASF76
	.byte	0xa
	.byte	0x4e
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x76
	.uleb128 0xa
	.long	.LASF77
	.byte	0xa
	.byte	0x4f
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x77
	.uleb128 0xa
	.long	.LASF78
	.byte	0xa
	.byte	0x50
	.long	0x5899
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0xa
	.long	.LASF79
	.byte	0xa
	.byte	0x51
	.long	0x5899
	.byte	0x2
	.byte	0x23
	.uleb128 0x7c
	.uleb128 0xa
	.long	.LASF80
	.byte	0xa
	.byte	0x53
	.long	0x57e5
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0xa
	.long	.LASF81
	.byte	0xa
	.byte	0x54
	.long	0x57e5
	.byte	0x3
	.byte	0x23
	.uleb128 0x82
	.uleb128 0xa
	.long	.LASF82
	.byte	0xa
	.byte	0x55
	.long	0x57db
	.byte	0x3
	.byte	0x23
	.uleb128 0x84
	.uleb128 0xa
	.long	.LASF83
	.byte	0xa
	.byte	0x56
	.long	0x57e5
	.byte	0x3
	.byte	0x23
	.uleb128 0x85
	.uleb128 0xa
	.long	.LASF84
	.byte	0xa
	.byte	0x57
	.long	0x57db
	.byte	0x3
	.byte	0x23
	.uleb128 0x87
	.uleb128 0xa
	.long	.LASF85
	.byte	0xa
	.byte	0x58
	.long	0x57db
	.byte	0x3
	.byte	0x23
	.uleb128 0x88
	.uleb128 0xa
	.long	.LASF86
	.byte	0xa
	.byte	0x59
	.long	0x57db
	.byte	0x3
	.byte	0x23
	.uleb128 0x89
	.uleb128 0xa
	.long	.LASF87
	.byte	0xa
	.byte	0x5a
	.long	0x57db
	.byte	0x3
	.byte	0x23
	.uleb128 0x8a
	.uleb128 0xa
	.long	.LASF88
	.byte	0xa
	.byte	0x5b
	.long	0x57db
	.byte	0x3
	.byte	0x23
	.uleb128 0x8b
	.uleb128 0xa
	.long	.LASF89
	.byte	0xa
	.byte	0x5c
	.long	0x57db
	.byte	0x3
	.byte	0x23
	.uleb128 0x8c
	.uleb128 0xa
	.long	.LASF90
	.byte	0xa
	.byte	0x5d
	.long	0x57db
	.byte	0x3
	.byte	0x23
	.uleb128 0x8d
	.uleb128 0xa
	.long	.LASF91
	.byte	0xa
	.byte	0x5e
	.long	0x57db
	.byte	0x3
	.byte	0x23
	.uleb128 0x8e
	.uleb128 0xa
	.long	.LASF92
	.byte	0xa
	.byte	0x5f
	.long	0x57db
	.byte	0x3
	.byte	0x23
	.uleb128 0x8f
	.uleb128 0xa
	.long	.LASF93
	.byte	0xa
	.byte	0x61
	.long	0x5899
	.byte	0x3
	.byte	0x23
	.uleb128 0x90
	.uleb128 0xa
	.long	.LASF94
	.byte	0xa
	.byte	0x62
	.long	0x5dde
	.byte	0x3
	.byte	0x23
	.uleb128 0x94
	.uleb128 0xa
	.long	.LASF95
	.byte	0xa
	.byte	0x63
	.long	0x57db
	.byte	0x3
	.byte	0x23
	.uleb128 0x96
	.uleb128 0xa
	.long	.LASF96
	.byte	0xa
	.byte	0x64
	.long	0x57db
	.byte	0x3
	.byte	0x23
	.uleb128 0x97
	.uleb128 0xa
	.long	.LASF97
	.byte	0xa
	.byte	0x65
	.long	0x5884
	.byte	0x3
	.byte	0x23
	.uleb128 0x98
	.uleb128 0xa
	.long	.LASF98
	.byte	0xa
	.byte	0x66
	.long	0x57f0
	.byte	0x3
	.byte	0x23
	.uleb128 0x9c
	.uleb128 0xa
	.long	.LASF99
	.byte	0xa
	.byte	0x68
	.long	0x57db
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0xa
	.long	.LASF100
	.byte	0xa
	.byte	0x69
	.long	0x5dbe
	.byte	0x3
	.byte	0x23
	.uleb128 0xa1
	.uleb128 0xa
	.long	.LASF101
	.byte	0xa
	.byte	0x6a
	.long	0x5884
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0xa
	.long	.LASF102
	.byte	0xa
	.byte	0x6b
	.long	0x5899
	.byte	0x3
	.byte	0x23
	.uleb128 0xac
	.uleb128 0xa
	.long	.LASF103
	.byte	0xa
	.byte	0x6d
	.long	0x5dee
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0xa
	.long	.LASF104
	.byte	0xa
	.byte	0x6e
	.long	0x57e5
	.byte	0x3
	.byte	0x23
	.uleb128 0xba
	.byte	0x0
	.uleb128 0xf
	.long	0x57e5
	.long	0x5d9e
	.uleb128 0x10
	.long	0x537
	.byte	0x3
	.byte	0x0
	.uleb128 0xf
	.long	0x57e5
	.long	0x5dae
	.uleb128 0x10
	.long	0x537
	.byte	0x2
	.byte	0x0
	.uleb128 0xf
	.long	0x57db
	.long	0x5dbe
	.uleb128 0x10
	.long	0x537
	.byte	0x1f
	.byte	0x0
	.uleb128 0xf
	.long	0x57db
	.long	0x5dce
	.uleb128 0x10
	.long	0x537
	.byte	0x6
	.byte	0x0
	.uleb128 0xf
	.long	0x57e5
	.long	0x5dde
	.uleb128 0x10
	.long	0x537
	.byte	0x7
	.byte	0x0
	.uleb128 0xf
	.long	0x57db
	.long	0x5dee
	.uleb128 0x10
	.long	0x537
	.byte	0x1
	.byte	0x0
	.uleb128 0xf
	.long	0x57db
	.long	0x5dfe
	.uleb128 0x10
	.long	0x537
	.byte	0x9
	.byte	0x0
	.uleb128 0xf
	.long	0x57db
	.long	0x5e0e
	.uleb128 0x10
	.long	0x537
	.byte	0xf
	.byte	0x0
	.uleb128 0x14
	.long	.LASF105
	.byte	0xa
	.byte	0xa
	.value	0x13e
	.long	0x5ea3
	.uleb128 0x15
	.long	.LASF106
	.byte	0xa
	.value	0x13f
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x15
	.long	.LASF107
	.byte	0xa
	.value	0x140
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x15
	.long	.LASF108
	.byte	0xa
	.value	0x141
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x15
	.long	.LASF109
	.byte	0xa
	.value	0x142
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x15
	.long	.LASF110
	.byte	0xa
	.value	0x143
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x15
	.long	.LASF111
	.byte	0xa
	.value	0x143
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x15
	.long	.LASF112
	.byte	0xa
	.value	0x143
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x15
	.long	.LASF113
	.byte	0xa
	.value	0x143
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x15
	.long	.LASF114
	.byte	0xa
	.value	0x143
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0x5ec7
	.uleb128 0x6
	.string	"di"
	.byte	0xe
	.byte	0x28
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF9
	.byte	0xe
	.byte	0x28
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0x5f08
	.uleb128 0xa
	.long	.LASF10
	.byte	0xe
	.byte	0x28
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF9
	.byte	0xe
	.byte	0x28
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF11
	.byte	0xe
	.byte	0x28
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF12
	.byte	0xe
	.byte	0x28
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0x5f26
	.uleb128 0x9
	.string	"edi"
	.byte	0xe
	.byte	0x28
	.long	0x57f0
	.uleb128 0x8
	.long	0x5ea3
	.uleb128 0x8
	.long	0x5ec7
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0x5f4a
	.uleb128 0x6
	.string	"si"
	.byte	0xe
	.byte	0x29
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF13
	.byte	0xe
	.byte	0x29
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0x5f8b
	.uleb128 0xa
	.long	.LASF14
	.byte	0xe
	.byte	0x29
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF13
	.byte	0xe
	.byte	0x29
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF15
	.byte	0xe
	.byte	0x29
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF16
	.byte	0xe
	.byte	0x29
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0x5fa9
	.uleb128 0x9
	.string	"esi"
	.byte	0xe
	.byte	0x29
	.long	0x57f0
	.uleb128 0x8
	.long	0x5f26
	.uleb128 0x8
	.long	0x5f4a
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0x5fcd
	.uleb128 0x6
	.string	"bp"
	.byte	0xe
	.byte	0x2a
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF17
	.byte	0xe
	.byte	0x2a
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0x600e
	.uleb128 0xa
	.long	.LASF18
	.byte	0xe
	.byte	0x2a
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF17
	.byte	0xe
	.byte	0x2a
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF19
	.byte	0xe
	.byte	0x2a
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF20
	.byte	0xe
	.byte	0x2a
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0x602c
	.uleb128 0x9
	.string	"ebp"
	.byte	0xe
	.byte	0x2a
	.long	0x57f0
	.uleb128 0x8
	.long	0x5fa9
	.uleb128 0x8
	.long	0x5fcd
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0x6050
	.uleb128 0x6
	.string	"bx"
	.byte	0xe
	.byte	0x2b
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF21
	.byte	0xe
	.byte	0x2b
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0x608f
	.uleb128 0x6
	.string	"bl"
	.byte	0xe
	.byte	0x2b
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"bh"
	.byte	0xe
	.byte	0x2b
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF22
	.byte	0xe
	.byte	0x2b
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF23
	.byte	0xe
	.byte	0x2b
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0x60ad
	.uleb128 0x9
	.string	"ebx"
	.byte	0xe
	.byte	0x2b
	.long	0x57f0
	.uleb128 0x8
	.long	0x602c
	.uleb128 0x8
	.long	0x6050
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0x60d1
	.uleb128 0x6
	.string	"dx"
	.byte	0xe
	.byte	0x2c
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF24
	.byte	0xe
	.byte	0x2c
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0x6110
	.uleb128 0x6
	.string	"dl"
	.byte	0xe
	.byte	0x2c
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"dh"
	.byte	0xe
	.byte	0x2c
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF25
	.byte	0xe
	.byte	0x2c
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF26
	.byte	0xe
	.byte	0x2c
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0x612e
	.uleb128 0x9
	.string	"edx"
	.byte	0xe
	.byte	0x2c
	.long	0x57f0
	.uleb128 0x8
	.long	0x60ad
	.uleb128 0x8
	.long	0x60d1
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0x6152
	.uleb128 0x6
	.string	"cx"
	.byte	0xe
	.byte	0x2d
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF27
	.byte	0xe
	.byte	0x2d
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0x6191
	.uleb128 0x6
	.string	"cl"
	.byte	0xe
	.byte	0x2d
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"ch"
	.byte	0xe
	.byte	0x2d
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF28
	.byte	0xe
	.byte	0x2d
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF29
	.byte	0xe
	.byte	0x2d
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0x61af
	.uleb128 0x9
	.string	"ecx"
	.byte	0xe
	.byte	0x2d
	.long	0x57f0
	.uleb128 0x8
	.long	0x612e
	.uleb128 0x8
	.long	0x6152
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0x61d3
	.uleb128 0x6
	.string	"ax"
	.byte	0xe
	.byte	0x2e
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF30
	.byte	0xe
	.byte	0x2e
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0x6212
	.uleb128 0x6
	.string	"al"
	.byte	0xe
	.byte	0x2e
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"ah"
	.byte	0xe
	.byte	0x2e
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF31
	.byte	0xe
	.byte	0x2e
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF32
	.byte	0xe
	.byte	0x2e
	.long	0x57db
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0x6230
	.uleb128 0x9
	.string	"eax"
	.byte	0xe
	.byte	0x2e
	.long	0x57f0
	.uleb128 0x8
	.long	0x61af
	.uleb128 0x8
	.long	0x61d3
	.byte	0x0
	.uleb128 0xd
	.long	.LASF34
	.byte	0x26
	.byte	0x24
	.byte	0x64
	.long	0x62ab
	.uleb128 0x6
	.string	"ds"
	.byte	0xe
	.byte	0x26
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"es"
	.byte	0xe
	.byte	0x27
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xe
	.long	0x5f08
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xe
	.long	0x5f8b
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xe
	.long	0x600e
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xe
	.long	0x608f
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xe
	.long	0x6110
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xe
	.long	0x6191
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xe
	.long	0x6212
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.long	.LASF35
	.byte	0xe
	.byte	0x2f
	.long	0x5884
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xa
	.long	.LASF36
	.byte	0xe
	.byte	0x30
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xd
	.long	.LASF252
	.byte	0x4
	.byte	0xd
	.byte	0xd
	.long	0x62d4
	.uleb128 0xa
	.long	.LASF253
	.byte	0xd
	.byte	0xe
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF254
	.byte	0xd
	.byte	0xe
	.long	0x57e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x2
	.string	"u8"
	.byte	0x23
	.byte	0x9
	.long	0x33
	.uleb128 0x2
	.string	"u16"
	.byte	0x23
	.byte	0xb
	.long	0x4c
	.uleb128 0x2
	.string	"u32"
	.byte	0x23
	.byte	0xd
	.long	0x65
	.uleb128 0x2
	.string	"u64"
	.byte	0x23
	.byte	0xf
	.long	0x7e
	.uleb128 0x5
	.byte	0x8
	.byte	0x23
	.byte	0x14
	.long	0x6322
	.uleb128 0x6
	.string	"hi"
	.byte	0x23
	.byte	0x14
	.long	0x62e9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"lo"
	.byte	0x23
	.byte	0x14
	.long	0x62e9
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x7
	.long	.LASF118
	.byte	0x8
	.byte	0x23
	.byte	0x13
	.long	0x633f
	.uleb128 0x8
	.long	0x62ff
	.uleb128 0x9
	.string	"val"
	.byte	0x23
	.byte	0x15
	.long	0x62f4
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0x19
	.byte	0xbc
	.long	0x6364
	.uleb128 0xa
	.long	.LASF7
	.byte	0x19
	.byte	0xbd
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"seg"
	.byte	0x19
	.byte	0xbe
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0x19
	.byte	0xbb
	.long	0x637d
	.uleb128 0x8
	.long	0x633f
	.uleb128 0xc
	.long	.LASF8
	.byte	0x19
	.byte	0xc0
	.long	0x62e9
	.byte	0x0
	.uleb128 0xd
	.long	.LASF33
	.byte	0x4
	.byte	0x19
	.byte	0xba
	.long	0x6392
	.uleb128 0xe
	.long	0x6364
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0xf
	.long	0x62d4
	.long	0x63a2
	.uleb128 0x10
	.long	0x537
	.byte	0x3
	.byte	0x0
	.uleb128 0xf
	.long	0x62d4
	.long	0x63b2
	.uleb128 0x10
	.long	0x537
	.byte	0x7
	.byte	0x0
	.uleb128 0xd
	.long	.LASF119
	.byte	0x24
	.byte	0x24
	.byte	0x97
	.long	0x644b
	.uleb128 0xa
	.long	.LASF120
	.byte	0x24
	.byte	0xb0
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF121
	.byte	0x24
	.byte	0xb1
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF122
	.byte	0x24
	.byte	0xb2
	.long	0x6451
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF123
	.byte	0x24
	.byte	0xb3
	.long	0x62f4
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF124
	.byte	0x24
	.byte	0xb4
	.long	0x53c
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF125
	.byte	0x24
	.byte	0xb5
	.long	0x62e9
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.long	.LASF126
	.byte	0x24
	.byte	0xb6
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF127
	.byte	0x24
	.byte	0xb9
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF128
	.byte	0x24
	.byte	0xba
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF129
	.byte	0x24
	.byte	0xbb
	.long	0x6451
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0x63b2
	.uleb128 0xd
	.long	.LASF130
	.byte	0x6
	.byte	0x24
	.byte	0xa9
	.long	0x6488
	.uleb128 0xa
	.long	.LASF131
	.byte	0x24
	.byte	0xaa
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF132
	.byte	0x24
	.byte	0xab
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.string	"spt"
	.byte	0x24
	.byte	0xac
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xd
	.long	.LASF210
	.byte	0xc4
	.byte	0x24
	.byte	0xd0
	.long	0x64bf
	.uleb128 0xa
	.long	.LASF211
	.byte	0x24
	.byte	0xd2
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF212
	.byte	0x24
	.byte	0xd3
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF213
	.byte	0x24
	.byte	0xd4
	.long	0x64bf
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xf
	.long	0x644b
	.long	0x64d5
	.uleb128 0x10
	.long	0x537
	.byte	0x2
	.uleb128 0x10
	.long	0x537
	.byte	0xf
	.byte	0x0
	.uleb128 0xd
	.long	.LASF38
	.byte	0xbc
	.byte	0xa
	.byte	0x21
	.long	0x6897
	.uleb128 0xa
	.long	.LASF39
	.byte	0xa
	.byte	0x23
	.long	0x6897
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF40
	.byte	0xa
	.byte	0x24
	.long	0x68a7
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF41
	.byte	0xa
	.byte	0x25
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF42
	.byte	0xa
	.byte	0x27
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF43
	.byte	0xa
	.byte	0x28
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0xa
	.long	.LASF44
	.byte	0xa
	.byte	0x29
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x13
	.uleb128 0xa
	.long	.LASF45
	.byte	0xa
	.byte	0x2a
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x15
	.uleb128 0xa
	.long	.LASF46
	.byte	0xa
	.byte	0x2b
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x16
	.uleb128 0xa
	.long	.LASF47
	.byte	0xa
	.byte	0x2c
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x17
	.uleb128 0xa
	.long	.LASF48
	.byte	0xa
	.byte	0x2d
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF49
	.byte	0xa
	.byte	0x2e
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF50
	.byte	0xa
	.byte	0x2f
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF51
	.byte	0xa
	.byte	0x30
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.long	.LASF52
	.byte	0xa
	.byte	0x32
	.long	0x68b7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1e
	.uleb128 0xa
	.long	.LASF53
	.byte	0xa
	.byte	0x33
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x3e
	.uleb128 0xa
	.long	.LASF54
	.byte	0xa
	.byte	0x34
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x3f
	.uleb128 0xa
	.long	.LASF55
	.byte	0xa
	.byte	0x36
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0xa
	.long	.LASF56
	.byte	0xa
	.byte	0x37
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x41
	.uleb128 0xa
	.long	.LASF57
	.byte	0xa
	.byte	0x38
	.long	0x68c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x42
	.uleb128 0xa
	.long	.LASF58
	.byte	0xa
	.byte	0x39
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x49
	.uleb128 0xa
	.long	.LASF59
	.byte	0xa
	.byte	0x3a
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.uleb128 0xa
	.long	.LASF60
	.byte	0xa
	.byte	0x3b
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0xa
	.long	.LASF61
	.byte	0xa
	.byte	0x3c
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x4e
	.uleb128 0xa
	.long	.LASF62
	.byte	0xa
	.byte	0x3e
	.long	0x68d7
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0xa
	.long	.LASF63
	.byte	0xa
	.byte	0x40
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0xa
	.long	.LASF64
	.byte	0xa
	.byte	0x41
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x62
	.uleb128 0xa
	.long	.LASF65
	.byte	0xa
	.byte	0x42
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x63
	.uleb128 0xa
	.long	.LASF66
	.byte	0xa
	.byte	0x43
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x65
	.uleb128 0xa
	.long	.LASF67
	.byte	0xa
	.byte	0x44
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x66
	.uleb128 0xa
	.long	.LASF68
	.byte	0xa
	.byte	0x45
	.long	0x637d
	.byte	0x2
	.byte	0x23
	.uleb128 0x67
	.uleb128 0xa
	.long	.LASF69
	.byte	0xa
	.byte	0x46
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x6b
	.uleb128 0xa
	.long	.LASF70
	.byte	0xa
	.byte	0x47
	.long	0x62e9
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.uleb128 0xa
	.long	.LASF71
	.byte	0xa
	.byte	0x49
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0xa
	.long	.LASF72
	.byte	0xa
	.byte	0x4a
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x71
	.uleb128 0xa
	.long	.LASF73
	.byte	0xa
	.byte	0x4b
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x72
	.uleb128 0xa
	.long	.LASF74
	.byte	0xa
	.byte	0x4c
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0xa
	.long	.LASF75
	.byte	0xa
	.byte	0x4d
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x75
	.uleb128 0xa
	.long	.LASF76
	.byte	0xa
	.byte	0x4e
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x76
	.uleb128 0xa
	.long	.LASF77
	.byte	0xa
	.byte	0x4f
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x77
	.uleb128 0xa
	.long	.LASF78
	.byte	0xa
	.byte	0x50
	.long	0x6392
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0xa
	.long	.LASF79
	.byte	0xa
	.byte	0x51
	.long	0x6392
	.byte	0x2
	.byte	0x23
	.uleb128 0x7c
	.uleb128 0xa
	.long	.LASF80
	.byte	0xa
	.byte	0x53
	.long	0x62de
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0xa
	.long	.LASF81
	.byte	0xa
	.byte	0x54
	.long	0x62de
	.byte	0x3
	.byte	0x23
	.uleb128 0x82
	.uleb128 0xa
	.long	.LASF82
	.byte	0xa
	.byte	0x55
	.long	0x62d4
	.byte	0x3
	.byte	0x23
	.uleb128 0x84
	.uleb128 0xa
	.long	.LASF83
	.byte	0xa
	.byte	0x56
	.long	0x62de
	.byte	0x3
	.byte	0x23
	.uleb128 0x85
	.uleb128 0xa
	.long	.LASF84
	.byte	0xa
	.byte	0x57
	.long	0x62d4
	.byte	0x3
	.byte	0x23
	.uleb128 0x87
	.uleb128 0xa
	.long	.LASF85
	.byte	0xa
	.byte	0x58
	.long	0x62d4
	.byte	0x3
	.byte	0x23
	.uleb128 0x88
	.uleb128 0xa
	.long	.LASF86
	.byte	0xa
	.byte	0x59
	.long	0x62d4
	.byte	0x3
	.byte	0x23
	.uleb128 0x89
	.uleb128 0xa
	.long	.LASF87
	.byte	0xa
	.byte	0x5a
	.long	0x62d4
	.byte	0x3
	.byte	0x23
	.uleb128 0x8a
	.uleb128 0xa
	.long	.LASF88
	.byte	0xa
	.byte	0x5b
	.long	0x62d4
	.byte	0x3
	.byte	0x23
	.uleb128 0x8b
	.uleb128 0xa
	.long	.LASF89
	.byte	0xa
	.byte	0x5c
	.long	0x62d4
	.byte	0x3
	.byte	0x23
	.uleb128 0x8c
	.uleb128 0xa
	.long	.LASF90
	.byte	0xa
	.byte	0x5d
	.long	0x62d4
	.byte	0x3
	.byte	0x23
	.uleb128 0x8d
	.uleb128 0xa
	.long	.LASF91
	.byte	0xa
	.byte	0x5e
	.long	0x62d4
	.byte	0x3
	.byte	0x23
	.uleb128 0x8e
	.uleb128 0xa
	.long	.LASF92
	.byte	0xa
	.byte	0x5f
	.long	0x62d4
	.byte	0x3
	.byte	0x23
	.uleb128 0x8f
	.uleb128 0xa
	.long	.LASF93
	.byte	0xa
	.byte	0x61
	.long	0x6392
	.byte	0x3
	.byte	0x23
	.uleb128 0x90
	.uleb128 0xa
	.long	.LASF94
	.byte	0xa
	.byte	0x62
	.long	0x68e7
	.byte	0x3
	.byte	0x23
	.uleb128 0x94
	.uleb128 0xa
	.long	.LASF95
	.byte	0xa
	.byte	0x63
	.long	0x62d4
	.byte	0x3
	.byte	0x23
	.uleb128 0x96
	.uleb128 0xa
	.long	.LASF96
	.byte	0xa
	.byte	0x64
	.long	0x62d4
	.byte	0x3
	.byte	0x23
	.uleb128 0x97
	.uleb128 0xa
	.long	.LASF97
	.byte	0xa
	.byte	0x65
	.long	0x637d
	.byte	0x3
	.byte	0x23
	.uleb128 0x98
	.uleb128 0xa
	.long	.LASF98
	.byte	0xa
	.byte	0x66
	.long	0x62e9
	.byte	0x3
	.byte	0x23
	.uleb128 0x9c
	.uleb128 0xa
	.long	.LASF99
	.byte	0xa
	.byte	0x68
	.long	0x62d4
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0xa
	.long	.LASF100
	.byte	0xa
	.byte	0x69
	.long	0x68c7
	.byte	0x3
	.byte	0x23
	.uleb128 0xa1
	.uleb128 0xa
	.long	.LASF101
	.byte	0xa
	.byte	0x6a
	.long	0x637d
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0xa
	.long	.LASF102
	.byte	0xa
	.byte	0x6b
	.long	0x6392
	.byte	0x3
	.byte	0x23
	.uleb128 0xac
	.uleb128 0xa
	.long	.LASF103
	.byte	0xa
	.byte	0x6d
	.long	0x68f7
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0xa
	.long	.LASF104
	.byte	0xa
	.byte	0x6e
	.long	0x62de
	.byte	0x3
	.byte	0x23
	.uleb128 0xba
	.byte	0x0
	.uleb128 0xf
	.long	0x62de
	.long	0x68a7
	.uleb128 0x10
	.long	0x537
	.byte	0x3
	.byte	0x0
	.uleb128 0xf
	.long	0x62de
	.long	0x68b7
	.uleb128 0x10
	.long	0x537
	.byte	0x2
	.byte	0x0
	.uleb128 0xf
	.long	0x62d4
	.long	0x68c7
	.uleb128 0x10
	.long	0x537
	.byte	0x1f
	.byte	0x0
	.uleb128 0xf
	.long	0x62d4
	.long	0x68d7
	.uleb128 0x10
	.long	0x537
	.byte	0x6
	.byte	0x0
	.uleb128 0xf
	.long	0x62de
	.long	0x68e7
	.uleb128 0x10
	.long	0x537
	.byte	0x7
	.byte	0x0
	.uleb128 0xf
	.long	0x62d4
	.long	0x68f7
	.uleb128 0x10
	.long	0x537
	.byte	0x1
	.byte	0x0
	.uleb128 0xf
	.long	0x62d4
	.long	0x6907
	.uleb128 0x10
	.long	0x537
	.byte	0x9
	.byte	0x0
	.uleb128 0xd
	.long	.LASF133
	.byte	0x10
	.byte	0xa
	.byte	0x92
	.long	0x69bc
	.uleb128 0xa
	.long	.LASF134
	.byte	0xa
	.byte	0x93
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF135
	.byte	0xa
	.byte	0x94
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF136
	.byte	0xa
	.byte	0x95
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF137
	.byte	0xa
	.byte	0x96
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x6
	.string	"irq"
	.byte	0xa
	.byte	0x97
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xa
	.long	.LASF138
	.byte	0xa
	.byte	0x98
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x6
	.string	"dma"
	.byte	0xa
	.byte	0x99
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.string	"pio"
	.byte	0xa
	.byte	0x9a
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0xa
	.long	.LASF139
	.byte	0xa
	.byte	0x9b
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xa
	.long	.LASF140
	.byte	0xa
	.byte	0x9c
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF141
	.byte	0xa
	.byte	0x9d
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF142
	.byte	0xa
	.byte	0x9e
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xd
	.long	.LASF143
	.byte	0x18
	.byte	0xa
	.byte	0xa2
	.long	0x6a47
	.uleb128 0xa
	.long	.LASF144
	.byte	0xa
	.byte	0xa3
	.long	0x644b
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF145
	.byte	0xa
	.byte	0xa4
	.long	0x62e9
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF146
	.byte	0xa
	.byte	0xa5
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF147
	.byte	0xa
	.byte	0xa6
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xa
	.long	.LASF148
	.byte	0xa
	.byte	0xa7
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF149
	.byte	0xa
	.byte	0xa8
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF150
	.byte	0xa
	.byte	0xa9
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.uleb128 0xa
	.long	.LASF151
	.byte	0xa
	.byte	0xaa
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF122
	.byte	0xa
	.byte	0xad
	.long	0x6451
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.byte	0x0
	.uleb128 0xd
	.long	.LASF152
	.byte	0x10
	.byte	0xa
	.byte	0xb0
	.long	0x6afc
	.uleb128 0xa
	.long	.LASF132
	.byte	0xa
	.byte	0xb1
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF131
	.byte	0xa
	.byte	0xb2
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF153
	.byte	0xa
	.byte	0xb3
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0xa
	.long	.LASF154
	.byte	0xa
	.byte	0xb4
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF155
	.byte	0xa
	.byte	0xb5
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0xa
	.long	.LASF140
	.byte	0xa
	.byte	0xb6
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0xa
	.long	.LASF156
	.byte	0xa
	.byte	0xb7
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF157
	.byte	0xa
	.byte	0xb8
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0xa
	.long	.LASF158
	.byte	0xa
	.byte	0xb9
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0xb
	.uleb128 0xa
	.long	.LASF159
	.byte	0xa
	.byte	0xba
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF123
	.byte	0xa
	.byte	0xbb
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF142
	.byte	0xa
	.byte	0xbc
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.byte	0x0
	.uleb128 0x5
	.byte	0x8
	.byte	0xa
	.byte	0xc1
	.long	0x6b2f
	.uleb128 0xa
	.long	.LASF160
	.byte	0xa
	.byte	0xc2
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF161
	.byte	0xa
	.byte	0xc3
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF162
	.byte	0xa
	.byte	0xc4
	.long	0x6b2f
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0xf
	.long	0x62d4
	.long	0x6b3f
	.uleb128 0x10
	.long	0x537
	.byte	0x5
	.byte	0x0
	.uleb128 0xb
	.byte	0x8
	.byte	0xa
	.byte	0xc0
	.long	0x6b58
	.uleb128 0x8
	.long	0x6afc
	.uleb128 0xc
	.long	.LASF163
	.byte	0xa
	.byte	0xc6
	.long	0x62f4
	.byte	0x0
	.uleb128 0xd
	.long	.LASF164
	.byte	0x8
	.byte	0xa
	.byte	0xbf
	.long	0x6b6d
	.uleb128 0xe
	.long	0x6b3f
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x16
	.long	.LASF165
	.value	0xb68
	.byte	0xa
	.byte	0xca
	.long	0x6c80
	.uleb128 0xa
	.long	.LASF106
	.byte	0xa
	.byte	0xcb
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF166
	.byte	0xa
	.byte	0xcc
	.long	0x6c80
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF167
	.byte	0xa
	.byte	0xcd
	.long	0x637d
	.byte	0x2
	.byte	0x23
	.uleb128 0x22
	.uleb128 0xa
	.long	.LASF168
	.byte	0xa
	.byte	0xce
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x26
	.uleb128 0xa
	.long	.LASF169
	.byte	0xa
	.byte	0xcf
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x27
	.uleb128 0xa
	.long	.LASF170
	.byte	0xa
	.byte	0xd0
	.long	0x63a2
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0xa
	.long	.LASF171
	.byte	0xa
	.byte	0xd2
	.long	0x6c90
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0xa
	.long	.LASF172
	.byte	0xa
	.byte	0xd5
	.long	0x6ca0
	.byte	0x2
	.byte	0x23
	.uleb128 0x3d
	.uleb128 0xa
	.long	.LASF173
	.byte	0xa
	.byte	0xd8
	.long	0x6cb0
	.byte	0x2
	.byte	0x23
	.uleb128 0x5d
	.uleb128 0xa
	.long	.LASF174
	.byte	0xa
	.byte	0xdb
	.long	0x62d4
	.byte	0x3
	.byte	0x23
	.uleb128 0x121
	.uleb128 0xa
	.long	.LASF175
	.byte	0xa
	.byte	0xdc
	.long	0x6b58
	.byte	0x3
	.byte	0x23
	.uleb128 0x122
	.uleb128 0xa
	.long	.LASF176
	.byte	0xa
	.byte	0xde
	.long	0x6c
	.byte	0x3
	.byte	0x23
	.uleb128 0x12a
	.uleb128 0xa
	.long	.LASF177
	.byte	0xa
	.byte	0xe1
	.long	0x69bc
	.byte	0x3
	.byte	0x23
	.uleb128 0x12e
	.uleb128 0xa
	.long	.LASF178
	.byte	0xa
	.byte	0xe4
	.long	0x6907
	.byte	0x3
	.byte	0x23
	.uleb128 0x146
	.uleb128 0xa
	.long	.LASF179
	.byte	0xa
	.byte	0xe7
	.long	0x6cc0
	.byte	0x3
	.byte	0x23
	.uleb128 0x156
	.uleb128 0xa
	.long	.LASF180
	.byte	0xa
	.byte	0xe9
	.long	0x62de
	.byte	0x3
	.byte	0x23
	.uleb128 0x166
	.uleb128 0xa
	.long	.LASF181
	.byte	0xa
	.byte	0xec
	.long	0x6cd0
	.byte	0x3
	.byte	0x23
	.uleb128 0x168
	.uleb128 0xa
	.long	.LASF182
	.byte	0xa
	.byte	0xee
	.long	0x6ce1
	.byte	0x3
	.byte	0x23
	.uleb128 0x368
	.byte	0x0
	.uleb128 0xf
	.long	0x62d4
	.long	0x6c90
	.uleb128 0x10
	.long	0x537
	.byte	0x20
	.byte	0x0
	.uleb128 0xf
	.long	0x62d4
	.long	0x6ca0
	.uleb128 0x10
	.long	0x537
	.byte	0xc
	.byte	0x0
	.uleb128 0xf
	.long	0x6a47
	.long	0x6cb0
	.uleb128 0x10
	.long	0x537
	.byte	0x1
	.byte	0x0
	.uleb128 0xf
	.long	0x62d4
	.long	0x6cc0
	.uleb128 0x10
	.long	0x537
	.byte	0xc3
	.byte	0x0
	.uleb128 0xf
	.long	0x62d4
	.long	0x6cd0
	.uleb128 0x10
	.long	0x537
	.byte	0xf
	.byte	0x0
	.uleb128 0xf
	.long	0x62d4
	.long	0x6ce1
	.uleb128 0x17
	.long	0x537
	.value	0x1ff
	.byte	0x0
	.uleb128 0xf
	.long	0x62d4
	.long	0x6cf2
	.uleb128 0x17
	.long	0x537
	.value	0x7ff
	.byte	0x0
	.uleb128 0x14
	.long	.LASF105
	.byte	0xa
	.byte	0xa
	.value	0x13e
	.long	0x6d87
	.uleb128 0x15
	.long	.LASF106
	.byte	0xa
	.value	0x13f
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x15
	.long	.LASF107
	.byte	0xa
	.value	0x140
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x15
	.long	.LASF108
	.byte	0xa
	.value	0x141
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x15
	.long	.LASF109
	.byte	0xa
	.value	0x142
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x15
	.long	.LASF110
	.byte	0xa
	.value	0x143
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x15
	.long	.LASF111
	.byte	0xa
	.value	0x143
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x15
	.long	.LASF112
	.byte	0xa
	.value	0x143
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x15
	.long	.LASF113
	.byte	0xa
	.value	0x143
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x15
	.long	.LASF114
	.byte	0xa
	.value	0x143
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0x6dab
	.uleb128 0x6
	.string	"di"
	.byte	0xe
	.byte	0x28
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF9
	.byte	0xe
	.byte	0x28
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0x6dec
	.uleb128 0xa
	.long	.LASF10
	.byte	0xe
	.byte	0x28
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF9
	.byte	0xe
	.byte	0x28
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF11
	.byte	0xe
	.byte	0x28
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF12
	.byte	0xe
	.byte	0x28
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0x6e0a
	.uleb128 0x9
	.string	"edi"
	.byte	0xe
	.byte	0x28
	.long	0x62e9
	.uleb128 0x8
	.long	0x6d87
	.uleb128 0x8
	.long	0x6dab
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0x6e2e
	.uleb128 0x6
	.string	"si"
	.byte	0xe
	.byte	0x29
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF13
	.byte	0xe
	.byte	0x29
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0x6e6f
	.uleb128 0xa
	.long	.LASF14
	.byte	0xe
	.byte	0x29
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF13
	.byte	0xe
	.byte	0x29
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF15
	.byte	0xe
	.byte	0x29
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF16
	.byte	0xe
	.byte	0x29
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0x6e8d
	.uleb128 0x9
	.string	"esi"
	.byte	0xe
	.byte	0x29
	.long	0x62e9
	.uleb128 0x8
	.long	0x6e0a
	.uleb128 0x8
	.long	0x6e2e
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0x6eb1
	.uleb128 0x6
	.string	"bp"
	.byte	0xe
	.byte	0x2a
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF17
	.byte	0xe
	.byte	0x2a
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0x6ef2
	.uleb128 0xa
	.long	.LASF18
	.byte	0xe
	.byte	0x2a
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF17
	.byte	0xe
	.byte	0x2a
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF19
	.byte	0xe
	.byte	0x2a
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF20
	.byte	0xe
	.byte	0x2a
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0x6f10
	.uleb128 0x9
	.string	"ebp"
	.byte	0xe
	.byte	0x2a
	.long	0x62e9
	.uleb128 0x8
	.long	0x6e8d
	.uleb128 0x8
	.long	0x6eb1
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0x6f34
	.uleb128 0x6
	.string	"bx"
	.byte	0xe
	.byte	0x2b
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF21
	.byte	0xe
	.byte	0x2b
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0x6f73
	.uleb128 0x6
	.string	"bl"
	.byte	0xe
	.byte	0x2b
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"bh"
	.byte	0xe
	.byte	0x2b
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF22
	.byte	0xe
	.byte	0x2b
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF23
	.byte	0xe
	.byte	0x2b
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0x6f91
	.uleb128 0x9
	.string	"ebx"
	.byte	0xe
	.byte	0x2b
	.long	0x62e9
	.uleb128 0x8
	.long	0x6f10
	.uleb128 0x8
	.long	0x6f34
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0x6fb5
	.uleb128 0x6
	.string	"dx"
	.byte	0xe
	.byte	0x2c
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF24
	.byte	0xe
	.byte	0x2c
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0x6ff4
	.uleb128 0x6
	.string	"dl"
	.byte	0xe
	.byte	0x2c
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"dh"
	.byte	0xe
	.byte	0x2c
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF25
	.byte	0xe
	.byte	0x2c
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF26
	.byte	0xe
	.byte	0x2c
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0x7012
	.uleb128 0x9
	.string	"edx"
	.byte	0xe
	.byte	0x2c
	.long	0x62e9
	.uleb128 0x8
	.long	0x6f91
	.uleb128 0x8
	.long	0x6fb5
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0x7036
	.uleb128 0x6
	.string	"cx"
	.byte	0xe
	.byte	0x2d
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF27
	.byte	0xe
	.byte	0x2d
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0x7075
	.uleb128 0x6
	.string	"cl"
	.byte	0xe
	.byte	0x2d
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"ch"
	.byte	0xe
	.byte	0x2d
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF28
	.byte	0xe
	.byte	0x2d
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF29
	.byte	0xe
	.byte	0x2d
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0x7093
	.uleb128 0x9
	.string	"ecx"
	.byte	0xe
	.byte	0x2d
	.long	0x62e9
	.uleb128 0x8
	.long	0x7012
	.uleb128 0x8
	.long	0x7036
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0x70b7
	.uleb128 0x6
	.string	"ax"
	.byte	0xe
	.byte	0x2e
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF30
	.byte	0xe
	.byte	0x2e
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0x70f6
	.uleb128 0x6
	.string	"al"
	.byte	0xe
	.byte	0x2e
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"ah"
	.byte	0xe
	.byte	0x2e
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF31
	.byte	0xe
	.byte	0x2e
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF32
	.byte	0xe
	.byte	0x2e
	.long	0x62d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0x7114
	.uleb128 0x9
	.string	"eax"
	.byte	0xe
	.byte	0x2e
	.long	0x62e9
	.uleb128 0x8
	.long	0x7093
	.uleb128 0x8
	.long	0x70b7
	.byte	0x0
	.uleb128 0xd
	.long	.LASF34
	.byte	0x26
	.byte	0x24
	.byte	0x64
	.long	0x718f
	.uleb128 0x6
	.string	"ds"
	.byte	0xe
	.byte	0x26
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"es"
	.byte	0xe
	.byte	0x27
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xe
	.long	0x6dec
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xe
	.long	0x6e6f
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xe
	.long	0x6ef2
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xe
	.long	0x6f73
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xe
	.long	0x6ff4
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xe
	.long	0x7075
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xe
	.long	0x70f6
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.long	.LASF35
	.byte	0xe
	.byte	0x2f
	.long	0x637d
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xa
	.long	.LASF36
	.byte	0xe
	.byte	0x30
	.long	0x62de
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.byte	0x0
	.uleb128 0x2
	.string	"u8"
	.byte	0x23
	.byte	0x9
	.long	0x33
	.uleb128 0x2
	.string	"u16"
	.byte	0x23
	.byte	0xb
	.long	0x4c
	.uleb128 0x2
	.string	"u8"
	.byte	0x23
	.byte	0x9
	.long	0x33
	.uleb128 0x2
	.string	"u16"
	.byte	0x23
	.byte	0xb
	.long	0x4c
	.uleb128 0x2
	.string	"u32"
	.byte	0x23
	.byte	0xd
	.long	0x65
	.uleb128 0x2
	.string	"u64"
	.byte	0x23
	.byte	0xf
	.long	0x7e
	.uleb128 0x5
	.byte	0x8
	.byte	0x23
	.byte	0x14
	.long	0x71f2
	.uleb128 0x6
	.string	"hi"
	.byte	0x23
	.byte	0x14
	.long	0x71b9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"lo"
	.byte	0x23
	.byte	0x14
	.long	0x71b9
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x7
	.long	.LASF118
	.byte	0x8
	.byte	0x23
	.byte	0x13
	.long	0x720f
	.uleb128 0x8
	.long	0x71cf
	.uleb128 0x9
	.string	"val"
	.byte	0x23
	.byte	0x15
	.long	0x71c4
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0x19
	.byte	0xbc
	.long	0x7234
	.uleb128 0xa
	.long	.LASF7
	.byte	0x19
	.byte	0xbd
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"seg"
	.byte	0x19
	.byte	0xbe
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0x19
	.byte	0xbb
	.long	0x724d
	.uleb128 0x8
	.long	0x720f
	.uleb128 0xc
	.long	.LASF8
	.byte	0x19
	.byte	0xc0
	.long	0x71b9
	.byte	0x0
	.uleb128 0xd
	.long	.LASF33
	.byte	0x4
	.byte	0x19
	.byte	0xba
	.long	0x7262
	.uleb128 0xe
	.long	0x7234
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0xf
	.long	0x71a4
	.long	0x7272
	.uleb128 0x10
	.long	0x537
	.byte	0x3
	.byte	0x0
	.uleb128 0xf
	.long	0x71a4
	.long	0x7282
	.uleb128 0x10
	.long	0x537
	.byte	0x7
	.byte	0x0
	.uleb128 0xd
	.long	.LASF205
	.byte	0x14
	.byte	0x24
	.byte	0x94
	.long	0x72d5
	.uleb128 0x6
	.string	"lba"
	.byte	0x24
	.byte	0x95
	.long	0x71c4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF206
	.byte	0x24
	.byte	0x96
	.long	0x53a
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF207
	.byte	0x24
	.byte	0x97
	.long	0x736e
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF208
	.byte	0x24
	.byte	0x98
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF209
	.byte	0x24
	.byte	0x99
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.byte	0x0
	.uleb128 0xd
	.long	.LASF119
	.byte	0x24
	.byte	0x24
	.byte	0x97
	.long	0x736e
	.uleb128 0xa
	.long	.LASF120
	.byte	0x24
	.byte	0xb0
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF121
	.byte	0x24
	.byte	0xb1
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF122
	.byte	0x24
	.byte	0xb2
	.long	0x7374
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF123
	.byte	0x24
	.byte	0xb3
	.long	0x71c4
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF124
	.byte	0x24
	.byte	0xb4
	.long	0x53c
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF125
	.byte	0x24
	.byte	0xb5
	.long	0x71b9
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.long	.LASF126
	.byte	0x24
	.byte	0xb6
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF127
	.byte	0x24
	.byte	0xb9
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF128
	.byte	0x24
	.byte	0xba
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF129
	.byte	0x24
	.byte	0xbb
	.long	0x7374
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0x72d5
	.uleb128 0xd
	.long	.LASF130
	.byte	0x6
	.byte	0x24
	.byte	0xa9
	.long	0x73ab
	.uleb128 0xa
	.long	.LASF131
	.byte	0x24
	.byte	0xaa
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF132
	.byte	0x24
	.byte	0xab
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.string	"spt"
	.byte	0x24
	.byte	0xac
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xd
	.long	.LASF210
	.byte	0xc4
	.byte	0x24
	.byte	0xd0
	.long	0x73e2
	.uleb128 0xa
	.long	.LASF211
	.byte	0x24
	.byte	0xd2
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF212
	.byte	0x24
	.byte	0xd3
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF213
	.byte	0x24
	.byte	0xd4
	.long	0x73e2
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xf
	.long	0x736e
	.long	0x73f8
	.uleb128 0x10
	.long	0x537
	.byte	0x2
	.uleb128 0x10
	.long	0x537
	.byte	0xf
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0x741c
	.uleb128 0x6
	.string	"di"
	.byte	0xe
	.byte	0x28
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF9
	.byte	0xe
	.byte	0x28
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0x745d
	.uleb128 0xa
	.long	.LASF10
	.byte	0xe
	.byte	0x28
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF9
	.byte	0xe
	.byte	0x28
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF11
	.byte	0xe
	.byte	0x28
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF12
	.byte	0xe
	.byte	0x28
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0x747b
	.uleb128 0x9
	.string	"edi"
	.byte	0xe
	.byte	0x28
	.long	0x71b9
	.uleb128 0x8
	.long	0x73f8
	.uleb128 0x8
	.long	0x741c
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0x749f
	.uleb128 0x6
	.string	"si"
	.byte	0xe
	.byte	0x29
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF13
	.byte	0xe
	.byte	0x29
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0x74e0
	.uleb128 0xa
	.long	.LASF14
	.byte	0xe
	.byte	0x29
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF13
	.byte	0xe
	.byte	0x29
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF15
	.byte	0xe
	.byte	0x29
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF16
	.byte	0xe
	.byte	0x29
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0x74fe
	.uleb128 0x9
	.string	"esi"
	.byte	0xe
	.byte	0x29
	.long	0x71b9
	.uleb128 0x8
	.long	0x747b
	.uleb128 0x8
	.long	0x749f
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0x7522
	.uleb128 0x6
	.string	"bp"
	.byte	0xe
	.byte	0x2a
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF17
	.byte	0xe
	.byte	0x2a
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0x7563
	.uleb128 0xa
	.long	.LASF18
	.byte	0xe
	.byte	0x2a
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF17
	.byte	0xe
	.byte	0x2a
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF19
	.byte	0xe
	.byte	0x2a
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF20
	.byte	0xe
	.byte	0x2a
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0x7581
	.uleb128 0x9
	.string	"ebp"
	.byte	0xe
	.byte	0x2a
	.long	0x71b9
	.uleb128 0x8
	.long	0x74fe
	.uleb128 0x8
	.long	0x7522
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0x75a5
	.uleb128 0x6
	.string	"bx"
	.byte	0xe
	.byte	0x2b
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF21
	.byte	0xe
	.byte	0x2b
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0x75e4
	.uleb128 0x6
	.string	"bl"
	.byte	0xe
	.byte	0x2b
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"bh"
	.byte	0xe
	.byte	0x2b
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF22
	.byte	0xe
	.byte	0x2b
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF23
	.byte	0xe
	.byte	0x2b
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0x7602
	.uleb128 0x9
	.string	"ebx"
	.byte	0xe
	.byte	0x2b
	.long	0x71b9
	.uleb128 0x8
	.long	0x7581
	.uleb128 0x8
	.long	0x75a5
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0x7626
	.uleb128 0x6
	.string	"dx"
	.byte	0xe
	.byte	0x2c
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF24
	.byte	0xe
	.byte	0x2c
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0x7665
	.uleb128 0x6
	.string	"dl"
	.byte	0xe
	.byte	0x2c
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"dh"
	.byte	0xe
	.byte	0x2c
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF25
	.byte	0xe
	.byte	0x2c
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF26
	.byte	0xe
	.byte	0x2c
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0x7683
	.uleb128 0x9
	.string	"edx"
	.byte	0xe
	.byte	0x2c
	.long	0x71b9
	.uleb128 0x8
	.long	0x7602
	.uleb128 0x8
	.long	0x7626
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0x76a7
	.uleb128 0x6
	.string	"cx"
	.byte	0xe
	.byte	0x2d
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF27
	.byte	0xe
	.byte	0x2d
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0x76e6
	.uleb128 0x6
	.string	"cl"
	.byte	0xe
	.byte	0x2d
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"ch"
	.byte	0xe
	.byte	0x2d
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF28
	.byte	0xe
	.byte	0x2d
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF29
	.byte	0xe
	.byte	0x2d
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0x7704
	.uleb128 0x9
	.string	"ecx"
	.byte	0xe
	.byte	0x2d
	.long	0x71b9
	.uleb128 0x8
	.long	0x7683
	.uleb128 0x8
	.long	0x76a7
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0x7728
	.uleb128 0x6
	.string	"ax"
	.byte	0xe
	.byte	0x2e
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF30
	.byte	0xe
	.byte	0x2e
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0x7767
	.uleb128 0x6
	.string	"al"
	.byte	0xe
	.byte	0x2e
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"ah"
	.byte	0xe
	.byte	0x2e
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF31
	.byte	0xe
	.byte	0x2e
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF32
	.byte	0xe
	.byte	0x2e
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0x7785
	.uleb128 0x9
	.string	"eax"
	.byte	0xe
	.byte	0x2e
	.long	0x71b9
	.uleb128 0x8
	.long	0x7704
	.uleb128 0x8
	.long	0x7728
	.byte	0x0
	.uleb128 0xd
	.long	.LASF34
	.byte	0x26
	.byte	0x24
	.byte	0x64
	.long	0x7800
	.uleb128 0x6
	.string	"ds"
	.byte	0xe
	.byte	0x26
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"es"
	.byte	0xe
	.byte	0x27
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xe
	.long	0x745d
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xe
	.long	0x74e0
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xe
	.long	0x7563
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xe
	.long	0x75e4
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xe
	.long	0x7665
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xe
	.long	0x76e6
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xe
	.long	0x7767
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.long	.LASF35
	.byte	0xe
	.byte	0x2f
	.long	0x724d
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xa
	.long	.LASF36
	.byte	0xe
	.byte	0x30
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xd
	.long	.LASF38
	.byte	0xbc
	.byte	0xa
	.byte	0x21
	.long	0x7bc2
	.uleb128 0xa
	.long	.LASF39
	.byte	0xa
	.byte	0x23
	.long	0x7bc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF40
	.byte	0xa
	.byte	0x24
	.long	0x7bd2
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF41
	.byte	0xa
	.byte	0x25
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF42
	.byte	0xa
	.byte	0x27
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF43
	.byte	0xa
	.byte	0x28
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0xa
	.long	.LASF44
	.byte	0xa
	.byte	0x29
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x13
	.uleb128 0xa
	.long	.LASF45
	.byte	0xa
	.byte	0x2a
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x15
	.uleb128 0xa
	.long	.LASF46
	.byte	0xa
	.byte	0x2b
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x16
	.uleb128 0xa
	.long	.LASF47
	.byte	0xa
	.byte	0x2c
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x17
	.uleb128 0xa
	.long	.LASF48
	.byte	0xa
	.byte	0x2d
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF49
	.byte	0xa
	.byte	0x2e
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF50
	.byte	0xa
	.byte	0x2f
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF51
	.byte	0xa
	.byte	0x30
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.long	.LASF52
	.byte	0xa
	.byte	0x32
	.long	0x7be2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1e
	.uleb128 0xa
	.long	.LASF53
	.byte	0xa
	.byte	0x33
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x3e
	.uleb128 0xa
	.long	.LASF54
	.byte	0xa
	.byte	0x34
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x3f
	.uleb128 0xa
	.long	.LASF55
	.byte	0xa
	.byte	0x36
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0xa
	.long	.LASF56
	.byte	0xa
	.byte	0x37
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x41
	.uleb128 0xa
	.long	.LASF57
	.byte	0xa
	.byte	0x38
	.long	0x7bf2
	.byte	0x2
	.byte	0x23
	.uleb128 0x42
	.uleb128 0xa
	.long	.LASF58
	.byte	0xa
	.byte	0x39
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x49
	.uleb128 0xa
	.long	.LASF59
	.byte	0xa
	.byte	0x3a
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.uleb128 0xa
	.long	.LASF60
	.byte	0xa
	.byte	0x3b
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0xa
	.long	.LASF61
	.byte	0xa
	.byte	0x3c
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x4e
	.uleb128 0xa
	.long	.LASF62
	.byte	0xa
	.byte	0x3e
	.long	0x7c02
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0xa
	.long	.LASF63
	.byte	0xa
	.byte	0x40
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0xa
	.long	.LASF64
	.byte	0xa
	.byte	0x41
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x62
	.uleb128 0xa
	.long	.LASF65
	.byte	0xa
	.byte	0x42
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x63
	.uleb128 0xa
	.long	.LASF66
	.byte	0xa
	.byte	0x43
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x65
	.uleb128 0xa
	.long	.LASF67
	.byte	0xa
	.byte	0x44
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x66
	.uleb128 0xa
	.long	.LASF68
	.byte	0xa
	.byte	0x45
	.long	0x724d
	.byte	0x2
	.byte	0x23
	.uleb128 0x67
	.uleb128 0xa
	.long	.LASF69
	.byte	0xa
	.byte	0x46
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x6b
	.uleb128 0xa
	.long	.LASF70
	.byte	0xa
	.byte	0x47
	.long	0x71b9
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.uleb128 0xa
	.long	.LASF71
	.byte	0xa
	.byte	0x49
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0xa
	.long	.LASF72
	.byte	0xa
	.byte	0x4a
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x71
	.uleb128 0xa
	.long	.LASF73
	.byte	0xa
	.byte	0x4b
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x72
	.uleb128 0xa
	.long	.LASF74
	.byte	0xa
	.byte	0x4c
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0xa
	.long	.LASF75
	.byte	0xa
	.byte	0x4d
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x75
	.uleb128 0xa
	.long	.LASF76
	.byte	0xa
	.byte	0x4e
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x76
	.uleb128 0xa
	.long	.LASF77
	.byte	0xa
	.byte	0x4f
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x77
	.uleb128 0xa
	.long	.LASF78
	.byte	0xa
	.byte	0x50
	.long	0x7262
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0xa
	.long	.LASF79
	.byte	0xa
	.byte	0x51
	.long	0x7262
	.byte	0x2
	.byte	0x23
	.uleb128 0x7c
	.uleb128 0xa
	.long	.LASF80
	.byte	0xa
	.byte	0x53
	.long	0x71ae
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0xa
	.long	.LASF81
	.byte	0xa
	.byte	0x54
	.long	0x71ae
	.byte	0x3
	.byte	0x23
	.uleb128 0x82
	.uleb128 0xa
	.long	.LASF82
	.byte	0xa
	.byte	0x55
	.long	0x71a4
	.byte	0x3
	.byte	0x23
	.uleb128 0x84
	.uleb128 0xa
	.long	.LASF83
	.byte	0xa
	.byte	0x56
	.long	0x71ae
	.byte	0x3
	.byte	0x23
	.uleb128 0x85
	.uleb128 0xa
	.long	.LASF84
	.byte	0xa
	.byte	0x57
	.long	0x71a4
	.byte	0x3
	.byte	0x23
	.uleb128 0x87
	.uleb128 0xa
	.long	.LASF85
	.byte	0xa
	.byte	0x58
	.long	0x71a4
	.byte	0x3
	.byte	0x23
	.uleb128 0x88
	.uleb128 0xa
	.long	.LASF86
	.byte	0xa
	.byte	0x59
	.long	0x71a4
	.byte	0x3
	.byte	0x23
	.uleb128 0x89
	.uleb128 0xa
	.long	.LASF87
	.byte	0xa
	.byte	0x5a
	.long	0x71a4
	.byte	0x3
	.byte	0x23
	.uleb128 0x8a
	.uleb128 0xa
	.long	.LASF88
	.byte	0xa
	.byte	0x5b
	.long	0x71a4
	.byte	0x3
	.byte	0x23
	.uleb128 0x8b
	.uleb128 0xa
	.long	.LASF89
	.byte	0xa
	.byte	0x5c
	.long	0x71a4
	.byte	0x3
	.byte	0x23
	.uleb128 0x8c
	.uleb128 0xa
	.long	.LASF90
	.byte	0xa
	.byte	0x5d
	.long	0x71a4
	.byte	0x3
	.byte	0x23
	.uleb128 0x8d
	.uleb128 0xa
	.long	.LASF91
	.byte	0xa
	.byte	0x5e
	.long	0x71a4
	.byte	0x3
	.byte	0x23
	.uleb128 0x8e
	.uleb128 0xa
	.long	.LASF92
	.byte	0xa
	.byte	0x5f
	.long	0x71a4
	.byte	0x3
	.byte	0x23
	.uleb128 0x8f
	.uleb128 0xa
	.long	.LASF93
	.byte	0xa
	.byte	0x61
	.long	0x7262
	.byte	0x3
	.byte	0x23
	.uleb128 0x90
	.uleb128 0xa
	.long	.LASF94
	.byte	0xa
	.byte	0x62
	.long	0x7c12
	.byte	0x3
	.byte	0x23
	.uleb128 0x94
	.uleb128 0xa
	.long	.LASF95
	.byte	0xa
	.byte	0x63
	.long	0x71a4
	.byte	0x3
	.byte	0x23
	.uleb128 0x96
	.uleb128 0xa
	.long	.LASF96
	.byte	0xa
	.byte	0x64
	.long	0x71a4
	.byte	0x3
	.byte	0x23
	.uleb128 0x97
	.uleb128 0xa
	.long	.LASF97
	.byte	0xa
	.byte	0x65
	.long	0x724d
	.byte	0x3
	.byte	0x23
	.uleb128 0x98
	.uleb128 0xa
	.long	.LASF98
	.byte	0xa
	.byte	0x66
	.long	0x71b9
	.byte	0x3
	.byte	0x23
	.uleb128 0x9c
	.uleb128 0xa
	.long	.LASF99
	.byte	0xa
	.byte	0x68
	.long	0x71a4
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0xa
	.long	.LASF100
	.byte	0xa
	.byte	0x69
	.long	0x7bf2
	.byte	0x3
	.byte	0x23
	.uleb128 0xa1
	.uleb128 0xa
	.long	.LASF101
	.byte	0xa
	.byte	0x6a
	.long	0x724d
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0xa
	.long	.LASF102
	.byte	0xa
	.byte	0x6b
	.long	0x7262
	.byte	0x3
	.byte	0x23
	.uleb128 0xac
	.uleb128 0xa
	.long	.LASF103
	.byte	0xa
	.byte	0x6d
	.long	0x7c22
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0xa
	.long	.LASF104
	.byte	0xa
	.byte	0x6e
	.long	0x71ae
	.byte	0x3
	.byte	0x23
	.uleb128 0xba
	.byte	0x0
	.uleb128 0xf
	.long	0x71ae
	.long	0x7bd2
	.uleb128 0x10
	.long	0x537
	.byte	0x3
	.byte	0x0
	.uleb128 0xf
	.long	0x71ae
	.long	0x7be2
	.uleb128 0x10
	.long	0x537
	.byte	0x2
	.byte	0x0
	.uleb128 0xf
	.long	0x71a4
	.long	0x7bf2
	.uleb128 0x10
	.long	0x537
	.byte	0x1f
	.byte	0x0
	.uleb128 0xf
	.long	0x71a4
	.long	0x7c02
	.uleb128 0x10
	.long	0x537
	.byte	0x6
	.byte	0x0
	.uleb128 0xf
	.long	0x71ae
	.long	0x7c12
	.uleb128 0x10
	.long	0x537
	.byte	0x7
	.byte	0x0
	.uleb128 0xf
	.long	0x71a4
	.long	0x7c22
	.uleb128 0x10
	.long	0x537
	.byte	0x1
	.byte	0x0
	.uleb128 0xf
	.long	0x71a4
	.long	0x7c32
	.uleb128 0x10
	.long	0x537
	.byte	0x9
	.byte	0x0
	.uleb128 0xd
	.long	.LASF133
	.byte	0x10
	.byte	0xa
	.byte	0x92
	.long	0x7ce7
	.uleb128 0xa
	.long	.LASF134
	.byte	0xa
	.byte	0x93
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF135
	.byte	0xa
	.byte	0x94
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF136
	.byte	0xa
	.byte	0x95
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF137
	.byte	0xa
	.byte	0x96
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x6
	.string	"irq"
	.byte	0xa
	.byte	0x97
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xa
	.long	.LASF138
	.byte	0xa
	.byte	0x98
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x6
	.string	"dma"
	.byte	0xa
	.byte	0x99
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.string	"pio"
	.byte	0xa
	.byte	0x9a
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0xa
	.long	.LASF139
	.byte	0xa
	.byte	0x9b
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xa
	.long	.LASF140
	.byte	0xa
	.byte	0x9c
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF141
	.byte	0xa
	.byte	0x9d
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF142
	.byte	0xa
	.byte	0x9e
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xd
	.long	.LASF143
	.byte	0x18
	.byte	0xa
	.byte	0xa2
	.long	0x7d72
	.uleb128 0xa
	.long	.LASF144
	.byte	0xa
	.byte	0xa3
	.long	0x736e
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF145
	.byte	0xa
	.byte	0xa4
	.long	0x71b9
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF146
	.byte	0xa
	.byte	0xa5
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF147
	.byte	0xa
	.byte	0xa6
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xa
	.long	.LASF148
	.byte	0xa
	.byte	0xa7
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF149
	.byte	0xa
	.byte	0xa8
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF150
	.byte	0xa
	.byte	0xa9
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.uleb128 0xa
	.long	.LASF151
	.byte	0xa
	.byte	0xaa
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF122
	.byte	0xa
	.byte	0xad
	.long	0x7374
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.byte	0x0
	.uleb128 0xd
	.long	.LASF152
	.byte	0x10
	.byte	0xa
	.byte	0xb0
	.long	0x7e27
	.uleb128 0xa
	.long	.LASF132
	.byte	0xa
	.byte	0xb1
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF131
	.byte	0xa
	.byte	0xb2
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF153
	.byte	0xa
	.byte	0xb3
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0xa
	.long	.LASF154
	.byte	0xa
	.byte	0xb4
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF155
	.byte	0xa
	.byte	0xb5
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0xa
	.long	.LASF140
	.byte	0xa
	.byte	0xb6
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0xa
	.long	.LASF156
	.byte	0xa
	.byte	0xb7
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF157
	.byte	0xa
	.byte	0xb8
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0xa
	.long	.LASF158
	.byte	0xa
	.byte	0xb9
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0xb
	.uleb128 0xa
	.long	.LASF159
	.byte	0xa
	.byte	0xba
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF123
	.byte	0xa
	.byte	0xbb
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF142
	.byte	0xa
	.byte	0xbc
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.byte	0x0
	.uleb128 0x5
	.byte	0x8
	.byte	0xa
	.byte	0xc1
	.long	0x7e5a
	.uleb128 0xa
	.long	.LASF160
	.byte	0xa
	.byte	0xc2
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF161
	.byte	0xa
	.byte	0xc3
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF162
	.byte	0xa
	.byte	0xc4
	.long	0x7e5a
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0xf
	.long	0x71a4
	.long	0x7e6a
	.uleb128 0x10
	.long	0x537
	.byte	0x5
	.byte	0x0
	.uleb128 0xb
	.byte	0x8
	.byte	0xa
	.byte	0xc0
	.long	0x7e83
	.uleb128 0x8
	.long	0x7e27
	.uleb128 0xc
	.long	.LASF163
	.byte	0xa
	.byte	0xc6
	.long	0x71c4
	.byte	0x0
	.uleb128 0xd
	.long	.LASF164
	.byte	0x8
	.byte	0xa
	.byte	0xbf
	.long	0x7e98
	.uleb128 0xe
	.long	0x7e6a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x16
	.long	.LASF165
	.value	0xb68
	.byte	0xa
	.byte	0xca
	.long	0x7fab
	.uleb128 0xa
	.long	.LASF106
	.byte	0xa
	.byte	0xcb
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF166
	.byte	0xa
	.byte	0xcc
	.long	0x7fab
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF167
	.byte	0xa
	.byte	0xcd
	.long	0x724d
	.byte	0x2
	.byte	0x23
	.uleb128 0x22
	.uleb128 0xa
	.long	.LASF168
	.byte	0xa
	.byte	0xce
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x26
	.uleb128 0xa
	.long	.LASF169
	.byte	0xa
	.byte	0xcf
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x27
	.uleb128 0xa
	.long	.LASF170
	.byte	0xa
	.byte	0xd0
	.long	0x7272
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0xa
	.long	.LASF171
	.byte	0xa
	.byte	0xd2
	.long	0x7fbb
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0xa
	.long	.LASF172
	.byte	0xa
	.byte	0xd5
	.long	0x7fcb
	.byte	0x2
	.byte	0x23
	.uleb128 0x3d
	.uleb128 0xa
	.long	.LASF173
	.byte	0xa
	.byte	0xd8
	.long	0x7fdb
	.byte	0x2
	.byte	0x23
	.uleb128 0x5d
	.uleb128 0xa
	.long	.LASF174
	.byte	0xa
	.byte	0xdb
	.long	0x71a4
	.byte	0x3
	.byte	0x23
	.uleb128 0x121
	.uleb128 0xa
	.long	.LASF175
	.byte	0xa
	.byte	0xdc
	.long	0x7e83
	.byte	0x3
	.byte	0x23
	.uleb128 0x122
	.uleb128 0xa
	.long	.LASF176
	.byte	0xa
	.byte	0xde
	.long	0x6c
	.byte	0x3
	.byte	0x23
	.uleb128 0x12a
	.uleb128 0xa
	.long	.LASF177
	.byte	0xa
	.byte	0xe1
	.long	0x7ce7
	.byte	0x3
	.byte	0x23
	.uleb128 0x12e
	.uleb128 0xa
	.long	.LASF178
	.byte	0xa
	.byte	0xe4
	.long	0x7c32
	.byte	0x3
	.byte	0x23
	.uleb128 0x146
	.uleb128 0xa
	.long	.LASF179
	.byte	0xa
	.byte	0xe7
	.long	0x7feb
	.byte	0x3
	.byte	0x23
	.uleb128 0x156
	.uleb128 0xa
	.long	.LASF180
	.byte	0xa
	.byte	0xe9
	.long	0x71ae
	.byte	0x3
	.byte	0x23
	.uleb128 0x166
	.uleb128 0xa
	.long	.LASF181
	.byte	0xa
	.byte	0xec
	.long	0x7ffb
	.byte	0x3
	.byte	0x23
	.uleb128 0x168
	.uleb128 0xa
	.long	.LASF182
	.byte	0xa
	.byte	0xee
	.long	0x800c
	.byte	0x3
	.byte	0x23
	.uleb128 0x368
	.byte	0x0
	.uleb128 0xf
	.long	0x71a4
	.long	0x7fbb
	.uleb128 0x10
	.long	0x537
	.byte	0x20
	.byte	0x0
	.uleb128 0xf
	.long	0x71a4
	.long	0x7fcb
	.uleb128 0x10
	.long	0x537
	.byte	0xc
	.byte	0x0
	.uleb128 0xf
	.long	0x7d72
	.long	0x7fdb
	.uleb128 0x10
	.long	0x537
	.byte	0x1
	.byte	0x0
	.uleb128 0xf
	.long	0x71a4
	.long	0x7feb
	.uleb128 0x10
	.long	0x537
	.byte	0xc3
	.byte	0x0
	.uleb128 0xf
	.long	0x71a4
	.long	0x7ffb
	.uleb128 0x10
	.long	0x537
	.byte	0xf
	.byte	0x0
	.uleb128 0xf
	.long	0x71a4
	.long	0x800c
	.uleb128 0x17
	.long	0x537
	.value	0x1ff
	.byte	0x0
	.uleb128 0xf
	.long	0x71a4
	.long	0x801d
	.uleb128 0x17
	.long	0x537
	.value	0x7ff
	.byte	0x0
	.uleb128 0x14
	.long	.LASF105
	.byte	0xa
	.byte	0xa
	.value	0x13e
	.long	0x80b2
	.uleb128 0x15
	.long	.LASF106
	.byte	0xa
	.value	0x13f
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x15
	.long	.LASF107
	.byte	0xa
	.value	0x140
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x15
	.long	.LASF108
	.byte	0xa
	.value	0x141
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x15
	.long	.LASF109
	.byte	0xa
	.value	0x142
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x15
	.long	.LASF110
	.byte	0xa
	.value	0x143
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x15
	.long	.LASF111
	.byte	0xa
	.value	0x143
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x15
	.long	.LASF112
	.byte	0xa
	.value	0x143
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x15
	.long	.LASF113
	.byte	0xa
	.value	0x143
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x15
	.long	.LASF114
	.byte	0xa
	.value	0x143
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.byte	0x0
	.uleb128 0xd
	.long	.LASF255
	.byte	0x14
	.byte	0x22
	.byte	0x82
	.long	0x8167
	.uleb128 0xa
	.long	.LASF106
	.byte	0x22
	.byte	0x83
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF150
	.byte	0x22
	.byte	0x84
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF256
	.byte	0x22
	.byte	0x85
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF257
	.byte	0x22
	.byte	0x86
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0xa
	.long	.LASF145
	.byte	0x22
	.byte	0x87
	.long	0x71b9
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF258
	.byte	0x22
	.byte	0x88
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF146
	.byte	0x22
	.byte	0x89
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xa
	.long	.LASF147
	.byte	0x22
	.byte	0x8a
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF148
	.byte	0x22
	.byte	0x8b
	.long	0x71ae
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF132
	.byte	0x22
	.byte	0x8c
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF123
	.byte	0x22
	.byte	0x8d
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x11
	.uleb128 0xa
	.long	.LASF131
	.byte	0x22
	.byte	0x8e
	.long	0x71a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.byte	0x0
	.uleb128 0x2
	.string	"u8"
	.byte	0x23
	.byte	0x9
	.long	0x33
	.uleb128 0x2
	.string	"u16"
	.byte	0x23
	.byte	0xb
	.long	0x4c
	.uleb128 0x2
	.string	"u32"
	.byte	0x23
	.byte	0xd
	.long	0x65
	.uleb128 0x2
	.string	"u64"
	.byte	0x23
	.byte	0xf
	.long	0x7e
	.uleb128 0x5
	.byte	0x8
	.byte	0x23
	.byte	0x14
	.long	0x81b5
	.uleb128 0x6
	.string	"hi"
	.byte	0x23
	.byte	0x14
	.long	0x817c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"lo"
	.byte	0x23
	.byte	0x14
	.long	0x817c
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x7
	.long	.LASF118
	.byte	0x8
	.byte	0x23
	.byte	0x13
	.long	0x81d2
	.uleb128 0x8
	.long	0x8192
	.uleb128 0x9
	.string	"val"
	.byte	0x23
	.byte	0x15
	.long	0x8187
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0x19
	.byte	0xbc
	.long	0x81f7
	.uleb128 0xa
	.long	.LASF7
	.byte	0x19
	.byte	0xbd
	.long	0x8171
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"seg"
	.byte	0x19
	.byte	0xbe
	.long	0x8171
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0x19
	.byte	0xbb
	.long	0x8210
	.uleb128 0x8
	.long	0x81d2
	.uleb128 0xc
	.long	.LASF8
	.byte	0x19
	.byte	0xc0
	.long	0x817c
	.byte	0x0
	.uleb128 0xd
	.long	.LASF33
	.byte	0x4
	.byte	0x19
	.byte	0xba
	.long	0x8225
	.uleb128 0xe
	.long	0x81f7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0xf
	.long	0x8167
	.long	0x8235
	.uleb128 0x10
	.long	0x537
	.byte	0x3
	.byte	0x0
	.uleb128 0xf
	.long	0x8167
	.long	0x8245
	.uleb128 0x10
	.long	0x537
	.byte	0x7
	.byte	0x0
	.uleb128 0xd
	.long	.LASF119
	.byte	0x24
	.byte	0x24
	.byte	0x97
	.long	0x82de
	.uleb128 0xa
	.long	.LASF120
	.byte	0x24
	.byte	0xb0
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF121
	.byte	0x24
	.byte	0xb1
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF122
	.byte	0x24
	.byte	0xb2
	.long	0x82e4
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF123
	.byte	0x24
	.byte	0xb3
	.long	0x8187
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF124
	.byte	0x24
	.byte	0xb4
	.long	0x53c
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF125
	.byte	0x24
	.byte	0xb5
	.long	0x817c
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.long	.LASF126
	.byte	0x24
	.byte	0xb6
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF127
	.byte	0x24
	.byte	0xb9
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF128
	.byte	0x24
	.byte	0xba
	.long	0x8171
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF129
	.byte	0x24
	.byte	0xbb
	.long	0x82e4
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0x8245
	.uleb128 0xd
	.long	.LASF130
	.byte	0x6
	.byte	0x24
	.byte	0xa9
	.long	0x831b
	.uleb128 0xa
	.long	.LASF131
	.byte	0x24
	.byte	0xaa
	.long	0x8171
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF132
	.byte	0x24
	.byte	0xab
	.long	0x8171
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.string	"spt"
	.byte	0x24
	.byte	0xac
	.long	0x8171
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xd
	.long	.LASF210
	.byte	0xc4
	.byte	0x24
	.byte	0xd0
	.long	0x8352
	.uleb128 0xa
	.long	.LASF211
	.byte	0x24
	.byte	0xd2
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF212
	.byte	0x24
	.byte	0xd3
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF213
	.byte	0x24
	.byte	0xd4
	.long	0x8352
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xf
	.long	0x82de
	.long	0x8368
	.uleb128 0x10
	.long	0x537
	.byte	0x2
	.uleb128 0x10
	.long	0x537
	.byte	0xf
	.byte	0x0
	.uleb128 0xd
	.long	.LASF38
	.byte	0xbc
	.byte	0xa
	.byte	0x21
	.long	0x872a
	.uleb128 0xa
	.long	.LASF39
	.byte	0xa
	.byte	0x23
	.long	0x872a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF40
	.byte	0xa
	.byte	0x24
	.long	0x873a
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF41
	.byte	0xa
	.byte	0x25
	.long	0x8171
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF42
	.byte	0xa
	.byte	0x27
	.long	0x8171
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF43
	.byte	0xa
	.byte	0x28
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0xa
	.long	.LASF44
	.byte	0xa
	.byte	0x29
	.long	0x8171
	.byte	0x2
	.byte	0x23
	.uleb128 0x13
	.uleb128 0xa
	.long	.LASF45
	.byte	0xa
	.byte	0x2a
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x15
	.uleb128 0xa
	.long	.LASF46
	.byte	0xa
	.byte	0x2b
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x16
	.uleb128 0xa
	.long	.LASF47
	.byte	0xa
	.byte	0x2c
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x17
	.uleb128 0xa
	.long	.LASF48
	.byte	0xa
	.byte	0x2d
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF49
	.byte	0xa
	.byte	0x2e
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF50
	.byte	0xa
	.byte	0x2f
	.long	0x8171
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF51
	.byte	0xa
	.byte	0x30
	.long	0x8171
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.long	.LASF52
	.byte	0xa
	.byte	0x32
	.long	0x874a
	.byte	0x2
	.byte	0x23
	.uleb128 0x1e
	.uleb128 0xa
	.long	.LASF53
	.byte	0xa
	.byte	0x33
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x3e
	.uleb128 0xa
	.long	.LASF54
	.byte	0xa
	.byte	0x34
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x3f
	.uleb128 0xa
	.long	.LASF55
	.byte	0xa
	.byte	0x36
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0xa
	.long	.LASF56
	.byte	0xa
	.byte	0x37
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x41
	.uleb128 0xa
	.long	.LASF57
	.byte	0xa
	.byte	0x38
	.long	0x875a
	.byte	0x2
	.byte	0x23
	.uleb128 0x42
	.uleb128 0xa
	.long	.LASF58
	.byte	0xa
	.byte	0x39
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x49
	.uleb128 0xa
	.long	.LASF59
	.byte	0xa
	.byte	0x3a
	.long	0x8171
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.uleb128 0xa
	.long	.LASF60
	.byte	0xa
	.byte	0x3b
	.long	0x8171
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0xa
	.long	.LASF61
	.byte	0xa
	.byte	0x3c
	.long	0x8171
	.byte	0x2
	.byte	0x23
	.uleb128 0x4e
	.uleb128 0xa
	.long	.LASF62
	.byte	0xa
	.byte	0x3e
	.long	0x876a
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0xa
	.long	.LASF63
	.byte	0xa
	.byte	0x40
	.long	0x8171
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0xa
	.long	.LASF64
	.byte	0xa
	.byte	0x41
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x62
	.uleb128 0xa
	.long	.LASF65
	.byte	0xa
	.byte	0x42
	.long	0x8171
	.byte	0x2
	.byte	0x23
	.uleb128 0x63
	.uleb128 0xa
	.long	.LASF66
	.byte	0xa
	.byte	0x43
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x65
	.uleb128 0xa
	.long	.LASF67
	.byte	0xa
	.byte	0x44
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x66
	.uleb128 0xa
	.long	.LASF68
	.byte	0xa
	.byte	0x45
	.long	0x8210
	.byte	0x2
	.byte	0x23
	.uleb128 0x67
	.uleb128 0xa
	.long	.LASF69
	.byte	0xa
	.byte	0x46
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x6b
	.uleb128 0xa
	.long	.LASF70
	.byte	0xa
	.byte	0x47
	.long	0x817c
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.uleb128 0xa
	.long	.LASF71
	.byte	0xa
	.byte	0x49
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0xa
	.long	.LASF72
	.byte	0xa
	.byte	0x4a
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x71
	.uleb128 0xa
	.long	.LASF73
	.byte	0xa
	.byte	0x4b
	.long	0x8171
	.byte	0x2
	.byte	0x23
	.uleb128 0x72
	.uleb128 0xa
	.long	.LASF74
	.byte	0xa
	.byte	0x4c
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0xa
	.long	.LASF75
	.byte	0xa
	.byte	0x4d
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x75
	.uleb128 0xa
	.long	.LASF76
	.byte	0xa
	.byte	0x4e
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x76
	.uleb128 0xa
	.long	.LASF77
	.byte	0xa
	.byte	0x4f
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x77
	.uleb128 0xa
	.long	.LASF78
	.byte	0xa
	.byte	0x50
	.long	0x8225
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0xa
	.long	.LASF79
	.byte	0xa
	.byte	0x51
	.long	0x8225
	.byte	0x2
	.byte	0x23
	.uleb128 0x7c
	.uleb128 0xa
	.long	.LASF80
	.byte	0xa
	.byte	0x53
	.long	0x8171
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0xa
	.long	.LASF81
	.byte	0xa
	.byte	0x54
	.long	0x8171
	.byte	0x3
	.byte	0x23
	.uleb128 0x82
	.uleb128 0xa
	.long	.LASF82
	.byte	0xa
	.byte	0x55
	.long	0x8167
	.byte	0x3
	.byte	0x23
	.uleb128 0x84
	.uleb128 0xa
	.long	.LASF83
	.byte	0xa
	.byte	0x56
	.long	0x8171
	.byte	0x3
	.byte	0x23
	.uleb128 0x85
	.uleb128 0xa
	.long	.LASF84
	.byte	0xa
	.byte	0x57
	.long	0x8167
	.byte	0x3
	.byte	0x23
	.uleb128 0x87
	.uleb128 0xa
	.long	.LASF85
	.byte	0xa
	.byte	0x58
	.long	0x8167
	.byte	0x3
	.byte	0x23
	.uleb128 0x88
	.uleb128 0xa
	.long	.LASF86
	.byte	0xa
	.byte	0x59
	.long	0x8167
	.byte	0x3
	.byte	0x23
	.uleb128 0x89
	.uleb128 0xa
	.long	.LASF87
	.byte	0xa
	.byte	0x5a
	.long	0x8167
	.byte	0x3
	.byte	0x23
	.uleb128 0x8a
	.uleb128 0xa
	.long	.LASF88
	.byte	0xa
	.byte	0x5b
	.long	0x8167
	.byte	0x3
	.byte	0x23
	.uleb128 0x8b
	.uleb128 0xa
	.long	.LASF89
	.byte	0xa
	.byte	0x5c
	.long	0x8167
	.byte	0x3
	.byte	0x23
	.uleb128 0x8c
	.uleb128 0xa
	.long	.LASF90
	.byte	0xa
	.byte	0x5d
	.long	0x8167
	.byte	0x3
	.byte	0x23
	.uleb128 0x8d
	.uleb128 0xa
	.long	.LASF91
	.byte	0xa
	.byte	0x5e
	.long	0x8167
	.byte	0x3
	.byte	0x23
	.uleb128 0x8e
	.uleb128 0xa
	.long	.LASF92
	.byte	0xa
	.byte	0x5f
	.long	0x8167
	.byte	0x3
	.byte	0x23
	.uleb128 0x8f
	.uleb128 0xa
	.long	.LASF93
	.byte	0xa
	.byte	0x61
	.long	0x8225
	.byte	0x3
	.byte	0x23
	.uleb128 0x90
	.uleb128 0xa
	.long	.LASF94
	.byte	0xa
	.byte	0x62
	.long	0x877a
	.byte	0x3
	.byte	0x23
	.uleb128 0x94
	.uleb128 0xa
	.long	.LASF95
	.byte	0xa
	.byte	0x63
	.long	0x8167
	.byte	0x3
	.byte	0x23
	.uleb128 0x96
	.uleb128 0xa
	.long	.LASF96
	.byte	0xa
	.byte	0x64
	.long	0x8167
	.byte	0x3
	.byte	0x23
	.uleb128 0x97
	.uleb128 0xa
	.long	.LASF97
	.byte	0xa
	.byte	0x65
	.long	0x8210
	.byte	0x3
	.byte	0x23
	.uleb128 0x98
	.uleb128 0xa
	.long	.LASF98
	.byte	0xa
	.byte	0x66
	.long	0x817c
	.byte	0x3
	.byte	0x23
	.uleb128 0x9c
	.uleb128 0xa
	.long	.LASF99
	.byte	0xa
	.byte	0x68
	.long	0x8167
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0xa
	.long	.LASF100
	.byte	0xa
	.byte	0x69
	.long	0x875a
	.byte	0x3
	.byte	0x23
	.uleb128 0xa1
	.uleb128 0xa
	.long	.LASF101
	.byte	0xa
	.byte	0x6a
	.long	0x8210
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0xa
	.long	.LASF102
	.byte	0xa
	.byte	0x6b
	.long	0x8225
	.byte	0x3
	.byte	0x23
	.uleb128 0xac
	.uleb128 0xa
	.long	.LASF103
	.byte	0xa
	.byte	0x6d
	.long	0x878a
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0xa
	.long	.LASF104
	.byte	0xa
	.byte	0x6e
	.long	0x8171
	.byte	0x3
	.byte	0x23
	.uleb128 0xba
	.byte	0x0
	.uleb128 0xf
	.long	0x8171
	.long	0x873a
	.uleb128 0x10
	.long	0x537
	.byte	0x3
	.byte	0x0
	.uleb128 0xf
	.long	0x8171
	.long	0x874a
	.uleb128 0x10
	.long	0x537
	.byte	0x2
	.byte	0x0
	.uleb128 0xf
	.long	0x8167
	.long	0x875a
	.uleb128 0x10
	.long	0x537
	.byte	0x1f
	.byte	0x0
	.uleb128 0xf
	.long	0x8167
	.long	0x876a
	.uleb128 0x10
	.long	0x537
	.byte	0x6
	.byte	0x0
	.uleb128 0xf
	.long	0x8171
	.long	0x877a
	.uleb128 0x10
	.long	0x537
	.byte	0x7
	.byte	0x0
	.uleb128 0xf
	.long	0x8167
	.long	0x878a
	.uleb128 0x10
	.long	0x537
	.byte	0x1
	.byte	0x0
	.uleb128 0xf
	.long	0x8167
	.long	0x879a
	.uleb128 0x10
	.long	0x537
	.byte	0x9
	.byte	0x0
	.uleb128 0xd
	.long	.LASF133
	.byte	0x10
	.byte	0xa
	.byte	0x92
	.long	0x884f
	.uleb128 0xa
	.long	.LASF134
	.byte	0xa
	.byte	0x93
	.long	0x8171
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF135
	.byte	0xa
	.byte	0x94
	.long	0x8171
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF136
	.byte	0xa
	.byte	0x95
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF137
	.byte	0xa
	.byte	0x96
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x6
	.string	"irq"
	.byte	0xa
	.byte	0x97
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xa
	.long	.LASF138
	.byte	0xa
	.byte	0x98
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x6
	.string	"dma"
	.byte	0xa
	.byte	0x99
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.string	"pio"
	.byte	0xa
	.byte	0x9a
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0xa
	.long	.LASF139
	.byte	0xa
	.byte	0x9b
	.long	0x8171
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xa
	.long	.LASF140
	.byte	0xa
	.byte	0x9c
	.long	0x8171
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF141
	.byte	0xa
	.byte	0x9d
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF142
	.byte	0xa
	.byte	0x9e
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xd
	.long	.LASF143
	.byte	0x18
	.byte	0xa
	.byte	0xa2
	.long	0x88da
	.uleb128 0xa
	.long	.LASF144
	.byte	0xa
	.byte	0xa3
	.long	0x82de
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF145
	.byte	0xa
	.byte	0xa4
	.long	0x817c
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF146
	.byte	0xa
	.byte	0xa5
	.long	0x8171
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF147
	.byte	0xa
	.byte	0xa6
	.long	0x8171
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xa
	.long	.LASF148
	.byte	0xa
	.byte	0xa7
	.long	0x8171
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF149
	.byte	0xa
	.byte	0xa8
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF150
	.byte	0xa
	.byte	0xa9
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.uleb128 0xa
	.long	.LASF151
	.byte	0xa
	.byte	0xaa
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF122
	.byte	0xa
	.byte	0xad
	.long	0x82e4
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.byte	0x0
	.uleb128 0xd
	.long	.LASF152
	.byte	0x10
	.byte	0xa
	.byte	0xb0
	.long	0x898f
	.uleb128 0xa
	.long	.LASF132
	.byte	0xa
	.byte	0xb1
	.long	0x8171
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF131
	.byte	0xa
	.byte	0xb2
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF153
	.byte	0xa
	.byte	0xb3
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0xa
	.long	.LASF154
	.byte	0xa
	.byte	0xb4
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF155
	.byte	0xa
	.byte	0xb5
	.long	0x8171
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0xa
	.long	.LASF140
	.byte	0xa
	.byte	0xb6
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0xa
	.long	.LASF156
	.byte	0xa
	.byte	0xb7
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF157
	.byte	0xa
	.byte	0xb8
	.long	0x8171
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0xa
	.long	.LASF158
	.byte	0xa
	.byte	0xb9
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0xb
	.uleb128 0xa
	.long	.LASF159
	.byte	0xa
	.byte	0xba
	.long	0x8171
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF123
	.byte	0xa
	.byte	0xbb
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF142
	.byte	0xa
	.byte	0xbc
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.byte	0x0
	.uleb128 0x5
	.byte	0x8
	.byte	0xa
	.byte	0xc1
	.long	0x89c2
	.uleb128 0xa
	.long	.LASF160
	.byte	0xa
	.byte	0xc2
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF161
	.byte	0xa
	.byte	0xc3
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF162
	.byte	0xa
	.byte	0xc4
	.long	0x89c2
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0xf
	.long	0x8167
	.long	0x89d2
	.uleb128 0x10
	.long	0x537
	.byte	0x5
	.byte	0x0
	.uleb128 0xb
	.byte	0x8
	.byte	0xa
	.byte	0xc0
	.long	0x89eb
	.uleb128 0x8
	.long	0x898f
	.uleb128 0xc
	.long	.LASF163
	.byte	0xa
	.byte	0xc6
	.long	0x8187
	.byte	0x0
	.uleb128 0xd
	.long	.LASF164
	.byte	0x8
	.byte	0xa
	.byte	0xbf
	.long	0x8a00
	.uleb128 0xe
	.long	0x89d2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x16
	.long	.LASF165
	.value	0xb68
	.byte	0xa
	.byte	0xca
	.long	0x8b13
	.uleb128 0xa
	.long	.LASF106
	.byte	0xa
	.byte	0xcb
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF166
	.byte	0xa
	.byte	0xcc
	.long	0x8b13
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF167
	.byte	0xa
	.byte	0xcd
	.long	0x8210
	.byte	0x2
	.byte	0x23
	.uleb128 0x22
	.uleb128 0xa
	.long	.LASF168
	.byte	0xa
	.byte	0xce
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x26
	.uleb128 0xa
	.long	.LASF169
	.byte	0xa
	.byte	0xcf
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x27
	.uleb128 0xa
	.long	.LASF170
	.byte	0xa
	.byte	0xd0
	.long	0x8235
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0xa
	.long	.LASF171
	.byte	0xa
	.byte	0xd2
	.long	0x8b23
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0xa
	.long	.LASF172
	.byte	0xa
	.byte	0xd5
	.long	0x8b33
	.byte	0x2
	.byte	0x23
	.uleb128 0x3d
	.uleb128 0xa
	.long	.LASF173
	.byte	0xa
	.byte	0xd8
	.long	0x8b43
	.byte	0x2
	.byte	0x23
	.uleb128 0x5d
	.uleb128 0xa
	.long	.LASF174
	.byte	0xa
	.byte	0xdb
	.long	0x8167
	.byte	0x3
	.byte	0x23
	.uleb128 0x121
	.uleb128 0xa
	.long	.LASF175
	.byte	0xa
	.byte	0xdc
	.long	0x89eb
	.byte	0x3
	.byte	0x23
	.uleb128 0x122
	.uleb128 0xa
	.long	.LASF176
	.byte	0xa
	.byte	0xde
	.long	0x6c
	.byte	0x3
	.byte	0x23
	.uleb128 0x12a
	.uleb128 0xa
	.long	.LASF177
	.byte	0xa
	.byte	0xe1
	.long	0x884f
	.byte	0x3
	.byte	0x23
	.uleb128 0x12e
	.uleb128 0xa
	.long	.LASF178
	.byte	0xa
	.byte	0xe4
	.long	0x879a
	.byte	0x3
	.byte	0x23
	.uleb128 0x146
	.uleb128 0xa
	.long	.LASF179
	.byte	0xa
	.byte	0xe7
	.long	0x8b53
	.byte	0x3
	.byte	0x23
	.uleb128 0x156
	.uleb128 0xa
	.long	.LASF180
	.byte	0xa
	.byte	0xe9
	.long	0x8171
	.byte	0x3
	.byte	0x23
	.uleb128 0x166
	.uleb128 0xa
	.long	.LASF181
	.byte	0xa
	.byte	0xec
	.long	0x8b63
	.byte	0x3
	.byte	0x23
	.uleb128 0x168
	.uleb128 0xa
	.long	.LASF182
	.byte	0xa
	.byte	0xee
	.long	0x8b74
	.byte	0x3
	.byte	0x23
	.uleb128 0x368
	.byte	0x0
	.uleb128 0xf
	.long	0x8167
	.long	0x8b23
	.uleb128 0x10
	.long	0x537
	.byte	0x20
	.byte	0x0
	.uleb128 0xf
	.long	0x8167
	.long	0x8b33
	.uleb128 0x10
	.long	0x537
	.byte	0xc
	.byte	0x0
	.uleb128 0xf
	.long	0x88da
	.long	0x8b43
	.uleb128 0x10
	.long	0x537
	.byte	0x1
	.byte	0x0
	.uleb128 0xf
	.long	0x8167
	.long	0x8b53
	.uleb128 0x10
	.long	0x537
	.byte	0xc3
	.byte	0x0
	.uleb128 0xf
	.long	0x8167
	.long	0x8b63
	.uleb128 0x10
	.long	0x537
	.byte	0xf
	.byte	0x0
	.uleb128 0xf
	.long	0x8167
	.long	0x8b74
	.uleb128 0x17
	.long	0x537
	.value	0x1ff
	.byte	0x0
	.uleb128 0xf
	.long	0x8167
	.long	0x8b85
	.uleb128 0x17
	.long	0x537
	.value	0x7ff
	.byte	0x0
	.uleb128 0x14
	.long	.LASF105
	.byte	0xa
	.byte	0xa
	.value	0x13e
	.long	0x8c1a
	.uleb128 0x15
	.long	.LASF106
	.byte	0xa
	.value	0x13f
	.long	0x8171
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x15
	.long	.LASF107
	.byte	0xa
	.value	0x140
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x15
	.long	.LASF108
	.byte	0xa
	.value	0x141
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x15
	.long	.LASF109
	.byte	0xa
	.value	0x142
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x15
	.long	.LASF110
	.byte	0xa
	.value	0x143
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x15
	.long	.LASF111
	.byte	0xa
	.value	0x143
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x15
	.long	.LASF112
	.byte	0xa
	.value	0x143
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x15
	.long	.LASF113
	.byte	0xa
	.value	0x143
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x15
	.long	.LASF114
	.byte	0xa
	.value	0x143
	.long	0x8167
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.byte	0x0
	.uleb128 0x2
	.string	"u32"
	.byte	0x23
	.byte	0xd
	.long	0x65
	.uleb128 0x5
	.byte	0xc
	.byte	0x27
	.byte	0x14
	.long	0x8c58
	.uleb128 0x6
	.string	"ecx"
	.byte	0x27
	.byte	0x14
	.long	0x8c1a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"eax"
	.byte	0x27
	.byte	0x14
	.long	0x8c1a
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"edx"
	.byte	0x27
	.byte	0x14
	.long	0x8c1a
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x2
	.string	"u8"
	.byte	0x23
	.byte	0x9
	.long	0x33
	.uleb128 0x2
	.string	"u16"
	.byte	0x23
	.byte	0xb
	.long	0x4c
	.uleb128 0x2
	.string	"u32"
	.byte	0x23
	.byte	0xd
	.long	0x65
	.uleb128 0x2
	.string	"u64"
	.byte	0x23
	.byte	0xf
	.long	0x7e
	.uleb128 0x5
	.byte	0x4
	.byte	0x19
	.byte	0xbc
	.long	0x8ca8
	.uleb128 0xa
	.long	.LASF7
	.byte	0x19
	.byte	0xbd
	.long	0x8c62
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"seg"
	.byte	0x19
	.byte	0xbe
	.long	0x8c62
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0x19
	.byte	0xbb
	.long	0x8cc1
	.uleb128 0x8
	.long	0x8c83
	.uleb128 0xc
	.long	.LASF8
	.byte	0x19
	.byte	0xc0
	.long	0x8c6d
	.byte	0x0
	.uleb128 0xd
	.long	.LASF33
	.byte	0x4
	.byte	0x19
	.byte	0xba
	.long	0x8cd6
	.uleb128 0xe
	.long	0x8ca8
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0xf
	.long	0x8c58
	.long	0x8ce6
	.uleb128 0x10
	.long	0x537
	.byte	0x3
	.byte	0x0
	.uleb128 0xd
	.long	.LASF119
	.byte	0x24
	.byte	0x24
	.byte	0x97
	.long	0x8d7f
	.uleb128 0xa
	.long	.LASF120
	.byte	0x24
	.byte	0xb0
	.long	0x8c58
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF121
	.byte	0x24
	.byte	0xb1
	.long	0x8c58
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF122
	.byte	0x24
	.byte	0xb2
	.long	0x8d85
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF123
	.byte	0x24
	.byte	0xb3
	.long	0x8c78
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF124
	.byte	0x24
	.byte	0xb4
	.long	0x53c
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF125
	.byte	0x24
	.byte	0xb5
	.long	0x8c6d
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.long	.LASF126
	.byte	0x24
	.byte	0xb6
	.long	0x8c58
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF127
	.byte	0x24
	.byte	0xb9
	.long	0x8c58
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF128
	.byte	0x24
	.byte	0xba
	.long	0x8c62
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF129
	.byte	0x24
	.byte	0xbb
	.long	0x8d85
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0x8ce6
	.uleb128 0xd
	.long	.LASF130
	.byte	0x6
	.byte	0x24
	.byte	0xa9
	.long	0x8dbc
	.uleb128 0xa
	.long	.LASF131
	.byte	0x24
	.byte	0xaa
	.long	0x8c62
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF132
	.byte	0x24
	.byte	0xab
	.long	0x8c62
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.string	"spt"
	.byte	0x24
	.byte	0xac
	.long	0x8c62
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xd
	.long	.LASF210
	.byte	0xc4
	.byte	0x24
	.byte	0xd0
	.long	0x8df3
	.uleb128 0xa
	.long	.LASF211
	.byte	0x24
	.byte	0xd2
	.long	0x8c58
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF212
	.byte	0x24
	.byte	0xd3
	.long	0x8c58
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF213
	.byte	0x24
	.byte	0xd4
	.long	0x8df3
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xf
	.long	0x8d7f
	.long	0x8e09
	.uleb128 0x10
	.long	0x537
	.byte	0x2
	.uleb128 0x10
	.long	0x537
	.byte	0xf
	.byte	0x0
	.uleb128 0xd
	.long	.LASF38
	.byte	0xbc
	.byte	0xa
	.byte	0x21
	.long	0x91cb
	.uleb128 0xa
	.long	.LASF39
	.byte	0xa
	.byte	0x23
	.long	0x91cb
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF40
	.byte	0xa
	.byte	0x24
	.long	0x91db
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF41
	.byte	0xa
	.byte	0x25
	.long	0x8c62
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF42
	.byte	0xa
	.byte	0x27
	.long	0x8c62
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF43
	.byte	0xa
	.byte	0x28
	.long	0x8c58
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0xa
	.long	.LASF44
	.byte	0xa
	.byte	0x29
	.long	0x8c62
	.byte	0x2
	.byte	0x23
	.uleb128 0x13
	.uleb128 0xa
	.long	.LASF45
	.byte	0xa
	.byte	0x2a
	.long	0x8c58
	.byte	0x2
	.byte	0x23
	.uleb128 0x15
	.uleb128 0xa
	.long	.LASF46
	.byte	0xa
	.byte	0x2b
	.long	0x8c58
	.byte	0x2
	.byte	0x23
	.uleb128 0x16
	.uleb128 0xa
	.long	.LASF47
	.byte	0xa
	.byte	0x2c
	.long	0x8c58
	.byte	0x2
	.byte	0x23
	.uleb128 0x17
	.uleb128 0xa
	.long	.LASF48
	.byte	0xa
	.byte	0x2d
	.long	0x8c58
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF49
	.byte	0xa
	.byte	0x2e
	.long	0x8c58
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF50
	.byte	0xa
	.byte	0x2f
	.long	0x8c62
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF51
	.byte	0xa
	.byte	0x30
	.long	0x8c62
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.long	.LASF52
	.byte	0xa
	.byte	0x32
	.long	0x91eb
	.byte	0x2
	.byte	0x23
	.uleb128 0x1e
	.uleb128 0xa
	.long	.LASF53
	.byte	0xa
	.byte	0x33
	.long	0x8c58
	.byte	0x2
	.byte	0x23
	.uleb128 0x3e
	.uleb128 0xa
	.long	.LASF54
	.byte	0xa
	.byte	0x34
	.long	0x8c58
	.byte	0x2
	.byte	0x23
	.uleb128 0x3f
	.uleb128 0xa
	.long	.LASF55
	.byte	0xa
	.byte	0x36
	.long	0x8c58
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0xa
	.long	.LASF56
	.byte	0xa
	.byte	0x37
	.long	0x8c58
	.byte	0x2
	.byte	0x23
	.uleb128 0x41
	.uleb128 0xa
	.long	.LASF57
	.byte	0xa
	.byte	0x38
	.long	0x91fb
	.byte	0x2
	.byte	0x23
	.uleb128 0x42
	.uleb128 0xa
	.long	.LASF58
	.byte	0xa
	.byte	0x39
	.long	0x8c58
	.byte	0x2
	.byte	0x23
	.uleb128 0x49
	.uleb128 0xa
	.long	.LASF59
	.byte	0xa
	.byte	0x3a
	.long	0x8c62
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.uleb128 0xa
	.long	.LASF60
	.byte	0xa
	.byte	0x3b
	.long	0x8c62
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0xa
	.long	.LASF61
	.byte	0xa
	.byte	0x3c
	.long	0x8c62
	.byte	0x2
	.byte	0x23
	.uleb128 0x4e
	.uleb128 0xa
	.long	.LASF62
	.byte	0xa
	.byte	0x3e
	.long	0x920b
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0xa
	.long	.LASF63
	.byte	0xa
	.byte	0x40
	.long	0x8c62
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0xa
	.long	.LASF64
	.byte	0xa
	.byte	0x41
	.long	0x8c58
	.byte	0x2
	.byte	0x23
	.uleb128 0x62
	.uleb128 0xa
	.long	.LASF65
	.byte	0xa
	.byte	0x42
	.long	0x8c62
	.byte	0x2
	.byte	0x23
	.uleb128 0x63
	.uleb128 0xa
	.long	.LASF66
	.byte	0xa
	.byte	0x43
	.long	0x8c58
	.byte	0x2
	.byte	0x23
	.uleb128 0x65
	.uleb128 0xa
	.long	.LASF67
	.byte	0xa
	.byte	0x44
	.long	0x8c58
	.byte	0x2
	.byte	0x23
	.uleb128 0x66
	.uleb128 0xa
	.long	.LASF68
	.byte	0xa
	.byte	0x45
	.long	0x8cc1
	.byte	0x2
	.byte	0x23
	.uleb128 0x67
	.uleb128 0xa
	.long	.LASF69
	.byte	0xa
	.byte	0x46
	.long	0x8c58
	.byte	0x2
	.byte	0x23
	.uleb128 0x6b
	.uleb128 0xa
	.long	.LASF70
	.byte	0xa
	.byte	0x47
	.long	0x8c6d
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.uleb128 0xa
	.long	.LASF71
	.byte	0xa
	.byte	0x49
	.long	0x8c58
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0xa
	.long	.LASF72
	.byte	0xa
	.byte	0x4a
	.long	0x8c58
	.byte	0x2
	.byte	0x23
	.uleb128 0x71
	.uleb128 0xa
	.long	.LASF73
	.byte	0xa
	.byte	0x4b
	.long	0x8c62
	.byte	0x2
	.byte	0x23
	.uleb128 0x72
	.uleb128 0xa
	.long	.LASF74
	.byte	0xa
	.byte	0x4c
	.long	0x8c58
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0xa
	.long	.LASF75
	.byte	0xa
	.byte	0x4d
	.long	0x8c58
	.byte	0x2
	.byte	0x23
	.uleb128 0x75
	.uleb128 0xa
	.long	.LASF76
	.byte	0xa
	.byte	0x4e
	.long	0x8c58
	.byte	0x2
	.byte	0x23
	.uleb128 0x76
	.uleb128 0xa
	.long	.LASF77
	.byte	0xa
	.byte	0x4f
	.long	0x8c58
	.byte	0x2
	.byte	0x23
	.uleb128 0x77
	.uleb128 0xa
	.long	.LASF78
	.byte	0xa
	.byte	0x50
	.long	0x8cd6
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0xa
	.long	.LASF79
	.byte	0xa
	.byte	0x51
	.long	0x8cd6
	.byte	0x2
	.byte	0x23
	.uleb128 0x7c
	.uleb128 0xa
	.long	.LASF80
	.byte	0xa
	.byte	0x53
	.long	0x8c62
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0xa
	.long	.LASF81
	.byte	0xa
	.byte	0x54
	.long	0x8c62
	.byte	0x3
	.byte	0x23
	.uleb128 0x82
	.uleb128 0xa
	.long	.LASF82
	.byte	0xa
	.byte	0x55
	.long	0x8c58
	.byte	0x3
	.byte	0x23
	.uleb128 0x84
	.uleb128 0xa
	.long	.LASF83
	.byte	0xa
	.byte	0x56
	.long	0x8c62
	.byte	0x3
	.byte	0x23
	.uleb128 0x85
	.uleb128 0xa
	.long	.LASF84
	.byte	0xa
	.byte	0x57
	.long	0x8c58
	.byte	0x3
	.byte	0x23
	.uleb128 0x87
	.uleb128 0xa
	.long	.LASF85
	.byte	0xa
	.byte	0x58
	.long	0x8c58
	.byte	0x3
	.byte	0x23
	.uleb128 0x88
	.uleb128 0xa
	.long	.LASF86
	.byte	0xa
	.byte	0x59
	.long	0x8c58
	.byte	0x3
	.byte	0x23
	.uleb128 0x89
	.uleb128 0xa
	.long	.LASF87
	.byte	0xa
	.byte	0x5a
	.long	0x8c58
	.byte	0x3
	.byte	0x23
	.uleb128 0x8a
	.uleb128 0xa
	.long	.LASF88
	.byte	0xa
	.byte	0x5b
	.long	0x8c58
	.byte	0x3
	.byte	0x23
	.uleb128 0x8b
	.uleb128 0xa
	.long	.LASF89
	.byte	0xa
	.byte	0x5c
	.long	0x8c58
	.byte	0x3
	.byte	0x23
	.uleb128 0x8c
	.uleb128 0xa
	.long	.LASF90
	.byte	0xa
	.byte	0x5d
	.long	0x8c58
	.byte	0x3
	.byte	0x23
	.uleb128 0x8d
	.uleb128 0xa
	.long	.LASF91
	.byte	0xa
	.byte	0x5e
	.long	0x8c58
	.byte	0x3
	.byte	0x23
	.uleb128 0x8e
	.uleb128 0xa
	.long	.LASF92
	.byte	0xa
	.byte	0x5f
	.long	0x8c58
	.byte	0x3
	.byte	0x23
	.uleb128 0x8f
	.uleb128 0xa
	.long	.LASF93
	.byte	0xa
	.byte	0x61
	.long	0x8cd6
	.byte	0x3
	.byte	0x23
	.uleb128 0x90
	.uleb128 0xa
	.long	.LASF94
	.byte	0xa
	.byte	0x62
	.long	0x921b
	.byte	0x3
	.byte	0x23
	.uleb128 0x94
	.uleb128 0xa
	.long	.LASF95
	.byte	0xa
	.byte	0x63
	.long	0x8c58
	.byte	0x3
	.byte	0x23
	.uleb128 0x96
	.uleb128 0xa
	.long	.LASF96
	.byte	0xa
	.byte	0x64
	.long	0x8c58
	.byte	0x3
	.byte	0x23
	.uleb128 0x97
	.uleb128 0xa
	.long	.LASF97
	.byte	0xa
	.byte	0x65
	.long	0x8cc1
	.byte	0x3
	.byte	0x23
	.uleb128 0x98
	.uleb128 0xa
	.long	.LASF98
	.byte	0xa
	.byte	0x66
	.long	0x8c6d
	.byte	0x3
	.byte	0x23
	.uleb128 0x9c
	.uleb128 0xa
	.long	.LASF99
	.byte	0xa
	.byte	0x68
	.long	0x8c58
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0xa
	.long	.LASF100
	.byte	0xa
	.byte	0x69
	.long	0x91fb
	.byte	0x3
	.byte	0x23
	.uleb128 0xa1
	.uleb128 0xa
	.long	.LASF101
	.byte	0xa
	.byte	0x6a
	.long	0x8cc1
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0xa
	.long	.LASF102
	.byte	0xa
	.byte	0x6b
	.long	0x8cd6
	.byte	0x3
	.byte	0x23
	.uleb128 0xac
	.uleb128 0xa
	.long	.LASF103
	.byte	0xa
	.byte	0x6d
	.long	0x922b
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0xa
	.long	.LASF104
	.byte	0xa
	.byte	0x6e
	.long	0x8c62
	.byte	0x3
	.byte	0x23
	.uleb128 0xba
	.byte	0x0
	.uleb128 0xf
	.long	0x8c62
	.long	0x91db
	.uleb128 0x10
	.long	0x537
	.byte	0x3
	.byte	0x0
	.uleb128 0xf
	.long	0x8c62
	.long	0x91eb
	.uleb128 0x10
	.long	0x537
	.byte	0x2
	.byte	0x0
	.uleb128 0xf
	.long	0x8c58
	.long	0x91fb
	.uleb128 0x10
	.long	0x537
	.byte	0x1f
	.byte	0x0
	.uleb128 0xf
	.long	0x8c58
	.long	0x920b
	.uleb128 0x10
	.long	0x537
	.byte	0x6
	.byte	0x0
	.uleb128 0xf
	.long	0x8c62
	.long	0x921b
	.uleb128 0x10
	.long	0x537
	.byte	0x7
	.byte	0x0
	.uleb128 0xf
	.long	0x8c58
	.long	0x922b
	.uleb128 0x10
	.long	0x537
	.byte	0x1
	.byte	0x0
	.uleb128 0xf
	.long	0x8c58
	.long	0x923b
	.uleb128 0x10
	.long	0x537
	.byte	0x9
	.byte	0x0
	.uleb128 0x14
	.long	.LASF105
	.byte	0xa
	.byte	0xa
	.value	0x13e
	.long	0x92d0
	.uleb128 0x15
	.long	.LASF106
	.byte	0xa
	.value	0x13f
	.long	0x8c62
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x15
	.long	.LASF107
	.byte	0xa
	.value	0x140
	.long	0x8c58
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x15
	.long	.LASF108
	.byte	0xa
	.value	0x141
	.long	0x8c58
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x15
	.long	.LASF109
	.byte	0xa
	.value	0x142
	.long	0x8c58
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x15
	.long	.LASF110
	.byte	0xa
	.value	0x143
	.long	0x8c58
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x15
	.long	.LASF111
	.byte	0xa
	.value	0x143
	.long	0x8c58
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x15
	.long	.LASF112
	.byte	0xa
	.value	0x143
	.long	0x8c58
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x15
	.long	.LASF113
	.byte	0xa
	.value	0x143
	.long	0x8c58
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x15
	.long	.LASF114
	.byte	0xa
	.value	0x143
	.long	0x8c58
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.byte	0x0
	.uleb128 0x2
	.string	"u8"
	.byte	0x23
	.byte	0x9
	.long	0x33
	.uleb128 0x2
	.string	"u16"
	.byte	0x23
	.byte	0xb
	.long	0x4c
	.uleb128 0x2
	.string	"u32"
	.byte	0x23
	.byte	0xd
	.long	0x65
	.uleb128 0x2
	.string	"u64"
	.byte	0x23
	.byte	0xf
	.long	0x7e
	.uleb128 0x5
	.byte	0x8
	.byte	0x23
	.byte	0x14
	.long	0x931e
	.uleb128 0x6
	.string	"hi"
	.byte	0x23
	.byte	0x14
	.long	0x92e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"lo"
	.byte	0x23
	.byte	0x14
	.long	0x92e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x7
	.long	.LASF118
	.byte	0x8
	.byte	0x23
	.byte	0x13
	.long	0x933b
	.uleb128 0x8
	.long	0x92fb
	.uleb128 0x9
	.string	"val"
	.byte	0x23
	.byte	0x15
	.long	0x92f0
	.byte	0x0
	.uleb128 0xd
	.long	.LASF259
	.byte	0x21
	.byte	0x1f
	.byte	0xb
	.long	0x93fe
	.uleb128 0xa
	.long	.LASF191
	.byte	0x1f
	.byte	0xc
	.long	0x92e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF192
	.byte	0x1f
	.byte	0xd
	.long	0x92d0
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF116
	.byte	0x1f
	.byte	0xe
	.long	0x92d0
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0xa
	.long	.LASF250
	.byte	0x1f
	.byte	0xf
	.long	0x92da
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xa
	.long	.LASF142
	.byte	0x1f
	.byte	0x10
	.long	0x92d0
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF260
	.byte	0x1f
	.byte	0x11
	.long	0x92e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0xa
	.long	.LASF261
	.byte	0x1f
	.byte	0x12
	.long	0x92da
	.byte	0x2
	.byte	0x23
	.uleb128 0xd
	.uleb128 0xa
	.long	.LASF262
	.byte	0x1f
	.byte	0x13
	.long	0x92da
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.uleb128 0xa
	.long	.LASF263
	.byte	0x1f
	.byte	0x14
	.long	0x92da
	.byte	0x2
	.byte	0x23
	.uleb128 0x11
	.uleb128 0xa
	.long	.LASF264
	.byte	0x1f
	.byte	0x15
	.long	0x92e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x13
	.uleb128 0xa
	.long	.LASF265
	.byte	0x1f
	.byte	0x16
	.long	0x92e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x17
	.uleb128 0xa
	.long	.LASF266
	.byte	0x1f
	.byte	0x17
	.long	0x92da
	.byte	0x2
	.byte	0x23
	.uleb128 0x1b
	.uleb128 0xa
	.long	.LASF267
	.byte	0x1f
	.byte	0x18
	.long	0x92e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x1d
	.byte	0x0
	.uleb128 0x2
	.string	"u8"
	.byte	0x23
	.byte	0x9
	.long	0x33
	.uleb128 0x2
	.string	"u16"
	.byte	0x23
	.byte	0xb
	.long	0x4c
	.uleb128 0x2
	.string	"u32"
	.byte	0x23
	.byte	0xd
	.long	0x65
	.uleb128 0x2
	.string	"u64"
	.byte	0x23
	.byte	0xf
	.long	0x7e
	.uleb128 0xd
	.long	.LASF268
	.byte	0x3
	.byte	0x28
	.byte	0x35
	.long	0x9452
	.uleb128 0xa
	.long	.LASF269
	.byte	0x28
	.byte	0x36
	.long	0x93fe
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF270
	.byte	0x28
	.byte	0x37
	.long	0x9408
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.byte	0x0
	.uleb128 0xd
	.long	.LASF271
	.byte	0x10
	.byte	0x28
	.byte	0x3a
	.long	0x94a5
	.uleb128 0x6
	.string	"bus"
	.byte	0x28
	.byte	0x3b
	.long	0x93fe
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"dev"
	.byte	0x28
	.byte	0x3c
	.long	0x93fe
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF272
	.byte	0x28
	.byte	0x3d
	.long	0x94a5
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF273
	.byte	0x28
	.byte	0x3e
	.long	0x93fe
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF140
	.byte	0x28
	.byte	0x3f
	.long	0x93fe
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xf
	.long	0x9429
	.long	0x94b5
	.uleb128 0x10
	.long	0x537
	.byte	0x3
	.byte	0x0
	.uleb128 0xd
	.long	.LASF274
	.byte	0x20
	.byte	0x28
	.byte	0x42
	.long	0x955c
	.uleb128 0xa
	.long	.LASF191
	.byte	0x28
	.byte	0x43
	.long	0x9413
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF192
	.byte	0x28
	.byte	0x44
	.long	0x9408
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF106
	.byte	0x28
	.byte	0x45
	.long	0x9408
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xa
	.long	.LASF275
	.byte	0x28
	.byte	0x46
	.long	0x93fe
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF276
	.byte	0x28
	.byte	0x47
	.long	0x93fe
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0xa
	.long	.LASF277
	.byte	0x28
	.byte	0x48
	.long	0x9408
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xa
	.long	.LASF278
	.byte	0x28
	.byte	0x49
	.long	0x9413
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF279
	.byte	0x28
	.byte	0x4a
	.long	0x9413
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF140
	.byte	0x28
	.byte	0x4b
	.long	0x955c
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.long	.LASF142
	.byte	0x28
	.byte	0x4c
	.long	0x93fe
	.byte	0x2
	.byte	0x23
	.uleb128 0x1f
	.uleb128 0xa
	.long	.LASF280
	.byte	0x28
	.byte	0x4d
	.long	0x956c
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.byte	0x0
	.uleb128 0xf
	.long	0x93fe
	.long	0x956c
	.uleb128 0x10
	.long	0x537
	.byte	0xa
	.byte	0x0
	.uleb128 0xf
	.long	0x9452
	.long	0x957b
	.uleb128 0x1e
	.long	0x537
	.byte	0x0
	.uleb128 0xd
	.long	.LASF119
	.byte	0x24
	.byte	0x24
	.byte	0x97
	.long	0x9614
	.uleb128 0xa
	.long	.LASF120
	.byte	0x24
	.byte	0xb0
	.long	0x93fe
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF121
	.byte	0x24
	.byte	0xb1
	.long	0x93fe
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF122
	.byte	0x24
	.byte	0xb2
	.long	0x961a
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF123
	.byte	0x24
	.byte	0xb3
	.long	0x941e
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF124
	.byte	0x24
	.byte	0xb4
	.long	0x53c
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF125
	.byte	0x24
	.byte	0xb5
	.long	0x9413
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.long	.LASF126
	.byte	0x24
	.byte	0xb6
	.long	0x93fe
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF127
	.byte	0x24
	.byte	0xb9
	.long	0x93fe
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF128
	.byte	0x24
	.byte	0xba
	.long	0x9408
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF129
	.byte	0x24
	.byte	0xbb
	.long	0x961a
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0x957b
	.uleb128 0xd
	.long	.LASF130
	.byte	0x6
	.byte	0x24
	.byte	0xa9
	.long	0x9651
	.uleb128 0xa
	.long	.LASF131
	.byte	0x24
	.byte	0xaa
	.long	0x9408
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF132
	.byte	0x24
	.byte	0xab
	.long	0x9408
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.string	"spt"
	.byte	0x24
	.byte	0xac
	.long	0x9408
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xd
	.long	.LASF210
	.byte	0xc4
	.byte	0x24
	.byte	0xd0
	.long	0x9688
	.uleb128 0xa
	.long	.LASF211
	.byte	0x24
	.byte	0xd2
	.long	0x93fe
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF212
	.byte	0x24
	.byte	0xd3
	.long	0x93fe
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF213
	.byte	0x24
	.byte	0xd4
	.long	0x9688
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xf
	.long	0x9614
	.long	0x969e
	.uleb128 0x10
	.long	0x537
	.byte	0x2
	.uleb128 0x10
	.long	0x537
	.byte	0xf
	.byte	0x0
	.uleb128 0x14
	.long	.LASF105
	.byte	0xa
	.byte	0xa
	.value	0x13e
	.long	0x9733
	.uleb128 0x15
	.long	.LASF106
	.byte	0xa
	.value	0x13f
	.long	0x9408
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x15
	.long	.LASF107
	.byte	0xa
	.value	0x140
	.long	0x93fe
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x15
	.long	.LASF108
	.byte	0xa
	.value	0x141
	.long	0x93fe
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x15
	.long	.LASF109
	.byte	0xa
	.value	0x142
	.long	0x93fe
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x15
	.long	.LASF110
	.byte	0xa
	.value	0x143
	.long	0x93fe
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x15
	.long	.LASF111
	.byte	0xa
	.value	0x143
	.long	0x93fe
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x15
	.long	.LASF112
	.byte	0xa
	.value	0x143
	.long	0x93fe
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x15
	.long	.LASF113
	.byte	0xa
	.value	0x143
	.long	0x93fe
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x15
	.long	.LASF114
	.byte	0xa
	.value	0x143
	.long	0x93fe
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.byte	0x0
	.uleb128 0xd
	.long	.LASF281
	.byte	0x80
	.byte	0x29
	.byte	0xe
	.long	0x975c
	.uleb128 0x6
	.string	"pir"
	.byte	0x29
	.byte	0xf
	.long	0x94b5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF280
	.byte	0x29
	.byte	0x10
	.long	0x975c
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.byte	0x0
	.uleb128 0xf
	.long	0x9452
	.long	0x976c
	.uleb128 0x10
	.long	0x537
	.byte	0x5
	.byte	0x0
	.uleb128 0x2
	.string	"u8"
	.byte	0x23
	.byte	0x9
	.long	0x33
	.uleb128 0x2
	.string	"u16"
	.byte	0x23
	.byte	0xb
	.long	0x4c
	.uleb128 0x2
	.string	"u32"
	.byte	0x23
	.byte	0xd
	.long	0x65
	.uleb128 0x2
	.string	"u64"
	.byte	0x23
	.byte	0xf
	.long	0x7e
	.uleb128 0x5
	.byte	0x8
	.byte	0x23
	.byte	0x14
	.long	0x97ba
	.uleb128 0x6
	.string	"hi"
	.byte	0x23
	.byte	0x14
	.long	0x9781
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"lo"
	.byte	0x23
	.byte	0x14
	.long	0x9781
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x7
	.long	.LASF118
	.byte	0x8
	.byte	0x23
	.byte	0x13
	.long	0x97d7
	.uleb128 0x8
	.long	0x9797
	.uleb128 0x9
	.string	"val"
	.byte	0x23
	.byte	0x15
	.long	0x978c
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0x19
	.byte	0xbc
	.long	0x97fc
	.uleb128 0xa
	.long	.LASF7
	.byte	0x19
	.byte	0xbd
	.long	0x9776
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"seg"
	.byte	0x19
	.byte	0xbe
	.long	0x9776
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0x19
	.byte	0xbb
	.long	0x9815
	.uleb128 0x8
	.long	0x97d7
	.uleb128 0xc
	.long	.LASF8
	.byte	0x19
	.byte	0xc0
	.long	0x9781
	.byte	0x0
	.uleb128 0xd
	.long	.LASF33
	.byte	0x4
	.byte	0x19
	.byte	0xba
	.long	0x982a
	.uleb128 0xe
	.long	0x97fc
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0x984e
	.uleb128 0x6
	.string	"di"
	.byte	0xe
	.byte	0x28
	.long	0x9776
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF9
	.byte	0xe
	.byte	0x28
	.long	0x9776
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0x988f
	.uleb128 0xa
	.long	.LASF10
	.byte	0xe
	.byte	0x28
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF9
	.byte	0xe
	.byte	0x28
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF11
	.byte	0xe
	.byte	0x28
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF12
	.byte	0xe
	.byte	0x28
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0x98ad
	.uleb128 0x9
	.string	"edi"
	.byte	0xe
	.byte	0x28
	.long	0x9781
	.uleb128 0x8
	.long	0x982a
	.uleb128 0x8
	.long	0x984e
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0x98d1
	.uleb128 0x6
	.string	"si"
	.byte	0xe
	.byte	0x29
	.long	0x9776
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF13
	.byte	0xe
	.byte	0x29
	.long	0x9776
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0x9912
	.uleb128 0xa
	.long	.LASF14
	.byte	0xe
	.byte	0x29
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF13
	.byte	0xe
	.byte	0x29
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF15
	.byte	0xe
	.byte	0x29
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF16
	.byte	0xe
	.byte	0x29
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0x9930
	.uleb128 0x9
	.string	"esi"
	.byte	0xe
	.byte	0x29
	.long	0x9781
	.uleb128 0x8
	.long	0x98ad
	.uleb128 0x8
	.long	0x98d1
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0x9954
	.uleb128 0x6
	.string	"bp"
	.byte	0xe
	.byte	0x2a
	.long	0x9776
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF17
	.byte	0xe
	.byte	0x2a
	.long	0x9776
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0x9995
	.uleb128 0xa
	.long	.LASF18
	.byte	0xe
	.byte	0x2a
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF17
	.byte	0xe
	.byte	0x2a
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF19
	.byte	0xe
	.byte	0x2a
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF20
	.byte	0xe
	.byte	0x2a
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0x99b3
	.uleb128 0x9
	.string	"ebp"
	.byte	0xe
	.byte	0x2a
	.long	0x9781
	.uleb128 0x8
	.long	0x9930
	.uleb128 0x8
	.long	0x9954
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0x99d7
	.uleb128 0x6
	.string	"bx"
	.byte	0xe
	.byte	0x2b
	.long	0x9776
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF21
	.byte	0xe
	.byte	0x2b
	.long	0x9776
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0x9a16
	.uleb128 0x6
	.string	"bl"
	.byte	0xe
	.byte	0x2b
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"bh"
	.byte	0xe
	.byte	0x2b
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF22
	.byte	0xe
	.byte	0x2b
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF23
	.byte	0xe
	.byte	0x2b
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0x9a34
	.uleb128 0x9
	.string	"ebx"
	.byte	0xe
	.byte	0x2b
	.long	0x9781
	.uleb128 0x8
	.long	0x99b3
	.uleb128 0x8
	.long	0x99d7
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0x9a58
	.uleb128 0x6
	.string	"dx"
	.byte	0xe
	.byte	0x2c
	.long	0x9776
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF24
	.byte	0xe
	.byte	0x2c
	.long	0x9776
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0x9a97
	.uleb128 0x6
	.string	"dl"
	.byte	0xe
	.byte	0x2c
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"dh"
	.byte	0xe
	.byte	0x2c
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF25
	.byte	0xe
	.byte	0x2c
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF26
	.byte	0xe
	.byte	0x2c
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0x9ab5
	.uleb128 0x9
	.string	"edx"
	.byte	0xe
	.byte	0x2c
	.long	0x9781
	.uleb128 0x8
	.long	0x9a34
	.uleb128 0x8
	.long	0x9a58
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0x9ad9
	.uleb128 0x6
	.string	"cx"
	.byte	0xe
	.byte	0x2d
	.long	0x9776
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF27
	.byte	0xe
	.byte	0x2d
	.long	0x9776
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0x9b18
	.uleb128 0x6
	.string	"cl"
	.byte	0xe
	.byte	0x2d
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"ch"
	.byte	0xe
	.byte	0x2d
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF28
	.byte	0xe
	.byte	0x2d
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF29
	.byte	0xe
	.byte	0x2d
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0x9b36
	.uleb128 0x9
	.string	"ecx"
	.byte	0xe
	.byte	0x2d
	.long	0x9781
	.uleb128 0x8
	.long	0x9ab5
	.uleb128 0x8
	.long	0x9ad9
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0x9b5a
	.uleb128 0x6
	.string	"ax"
	.byte	0xe
	.byte	0x2e
	.long	0x9776
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF30
	.byte	0xe
	.byte	0x2e
	.long	0x9776
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0x9b99
	.uleb128 0x6
	.string	"al"
	.byte	0xe
	.byte	0x2e
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"ah"
	.byte	0xe
	.byte	0x2e
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF31
	.byte	0xe
	.byte	0x2e
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF32
	.byte	0xe
	.byte	0x2e
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0x9bb7
	.uleb128 0x9
	.string	"eax"
	.byte	0xe
	.byte	0x2e
	.long	0x9781
	.uleb128 0x8
	.long	0x9b36
	.uleb128 0x8
	.long	0x9b5a
	.byte	0x0
	.uleb128 0xd
	.long	.LASF34
	.byte	0x26
	.byte	0xe
	.byte	0x25
	.long	0x9c32
	.uleb128 0x6
	.string	"ds"
	.byte	0xe
	.byte	0x26
	.long	0x9776
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"es"
	.byte	0xe
	.byte	0x27
	.long	0x9776
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xe
	.long	0x988f
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xe
	.long	0x9912
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xe
	.long	0x9995
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xe
	.long	0x9a16
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xe
	.long	0x9a97
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xe
	.long	0x9b18
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xe
	.long	0x9b99
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.long	.LASF35
	.byte	0xe
	.byte	0x2f
	.long	0x9815
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xa
	.long	.LASF36
	.byte	0xe
	.byte	0x30
	.long	0x9776
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xd
	.long	.LASF119
	.byte	0x24
	.byte	0x24
	.byte	0x97
	.long	0x9ccb
	.uleb128 0xa
	.long	.LASF120
	.byte	0x24
	.byte	0xb0
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF121
	.byte	0x24
	.byte	0xb1
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF122
	.byte	0x24
	.byte	0xb2
	.long	0x9cd1
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF123
	.byte	0x24
	.byte	0xb3
	.long	0x978c
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF124
	.byte	0x24
	.byte	0xb4
	.long	0x53c
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF125
	.byte	0x24
	.byte	0xb5
	.long	0x9781
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.long	.LASF126
	.byte	0x24
	.byte	0xb6
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF127
	.byte	0x24
	.byte	0xb9
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF128
	.byte	0x24
	.byte	0xba
	.long	0x9776
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF129
	.byte	0x24
	.byte	0xbb
	.long	0x9cd1
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0x9c32
	.uleb128 0xd
	.long	.LASF130
	.byte	0x6
	.byte	0x24
	.byte	0xa9
	.long	0x9d08
	.uleb128 0xa
	.long	.LASF131
	.byte	0x24
	.byte	0xaa
	.long	0x9776
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF132
	.byte	0x24
	.byte	0xab
	.long	0x9776
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.string	"spt"
	.byte	0x24
	.byte	0xac
	.long	0x9776
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xd
	.long	.LASF210
	.byte	0xc4
	.byte	0x24
	.byte	0xd0
	.long	0x9d3f
	.uleb128 0xa
	.long	.LASF211
	.byte	0x24
	.byte	0xd2
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF212
	.byte	0x24
	.byte	0xd3
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF213
	.byte	0x24
	.byte	0xd4
	.long	0x9d3f
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xf
	.long	0x9ccb
	.long	0x9d55
	.uleb128 0x10
	.long	0x537
	.byte	0x2
	.uleb128 0x10
	.long	0x537
	.byte	0xf
	.byte	0x0
	.uleb128 0x14
	.long	.LASF105
	.byte	0xa
	.byte	0xa
	.value	0x13e
	.long	0x9dea
	.uleb128 0x15
	.long	.LASF106
	.byte	0xa
	.value	0x13f
	.long	0x9776
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x15
	.long	.LASF107
	.byte	0xa
	.value	0x140
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x15
	.long	.LASF108
	.byte	0xa
	.value	0x141
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x15
	.long	.LASF109
	.byte	0xa
	.value	0x142
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x15
	.long	.LASF110
	.byte	0xa
	.value	0x143
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x15
	.long	.LASF111
	.byte	0xa
	.value	0x143
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x15
	.long	.LASF112
	.byte	0xa
	.value	0x143
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x15
	.long	.LASF113
	.byte	0xa
	.value	0x143
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x15
	.long	.LASF114
	.byte	0xa
	.value	0x143
	.long	0x976c
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.byte	0x0
	.uleb128 0x2
	.string	"u8"
	.byte	0x23
	.byte	0x9
	.long	0x33
	.uleb128 0x2
	.string	"u16"
	.byte	0x23
	.byte	0xb
	.long	0x4c
	.uleb128 0x2
	.string	"u32"
	.byte	0x23
	.byte	0xd
	.long	0x65
	.uleb128 0x2
	.string	"u64"
	.byte	0x23
	.byte	0xf
	.long	0x7e
	.uleb128 0xd
	.long	.LASF205
	.byte	0x14
	.byte	0x24
	.byte	0x94
	.long	0x9e68
	.uleb128 0x6
	.string	"lba"
	.byte	0x24
	.byte	0x95
	.long	0x9e0a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF206
	.byte	0x24
	.byte	0x96
	.long	0x53a
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF207
	.byte	0x24
	.byte	0x97
	.long	0x9f01
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF208
	.byte	0x24
	.byte	0x98
	.long	0x9df4
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF209
	.byte	0x24
	.byte	0x99
	.long	0x9dea
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.byte	0x0
	.uleb128 0xd
	.long	.LASF119
	.byte	0x24
	.byte	0x24
	.byte	0x97
	.long	0x9f01
	.uleb128 0xa
	.long	.LASF120
	.byte	0x24
	.byte	0xb0
	.long	0x9dea
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF121
	.byte	0x24
	.byte	0xb1
	.long	0x9dea
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF122
	.byte	0x24
	.byte	0xb2
	.long	0x9f07
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF123
	.byte	0x24
	.byte	0xb3
	.long	0x9e0a
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF124
	.byte	0x24
	.byte	0xb4
	.long	0x53c
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF125
	.byte	0x24
	.byte	0xb5
	.long	0x9dff
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.long	.LASF126
	.byte	0x24
	.byte	0xb6
	.long	0x9dea
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF127
	.byte	0x24
	.byte	0xb9
	.long	0x9dea
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF128
	.byte	0x24
	.byte	0xba
	.long	0x9df4
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF129
	.byte	0x24
	.byte	0xbb
	.long	0x9f07
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0x9e68
	.uleb128 0xd
	.long	.LASF130
	.byte	0x6
	.byte	0x24
	.byte	0xa9
	.long	0x9f3e
	.uleb128 0xa
	.long	.LASF131
	.byte	0x24
	.byte	0xaa
	.long	0x9df4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF132
	.byte	0x24
	.byte	0xab
	.long	0x9df4
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.string	"spt"
	.byte	0x24
	.byte	0xac
	.long	0x9df4
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xd
	.long	.LASF210
	.byte	0xc4
	.byte	0x24
	.byte	0xd0
	.long	0x9f75
	.uleb128 0xa
	.long	.LASF211
	.byte	0x24
	.byte	0xd2
	.long	0x9dea
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF212
	.byte	0x24
	.byte	0xd3
	.long	0x9dea
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF213
	.byte	0x24
	.byte	0xd4
	.long	0x9f75
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xf
	.long	0x9f01
	.long	0x9f8b
	.uleb128 0x10
	.long	0x537
	.byte	0x2
	.uleb128 0x10
	.long	0x537
	.byte	0xf
	.byte	0x0
	.uleb128 0x14
	.long	.LASF105
	.byte	0xa
	.byte	0xa
	.value	0x13e
	.long	0xa020
	.uleb128 0x15
	.long	.LASF106
	.byte	0xa
	.value	0x13f
	.long	0x9df4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x15
	.long	.LASF107
	.byte	0xa
	.value	0x140
	.long	0x9dea
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x15
	.long	.LASF108
	.byte	0xa
	.value	0x141
	.long	0x9dea
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x15
	.long	.LASF109
	.byte	0xa
	.value	0x142
	.long	0x9dea
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x15
	.long	.LASF110
	.byte	0xa
	.value	0x143
	.long	0x9dea
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x15
	.long	.LASF111
	.byte	0xa
	.value	0x143
	.long	0x9dea
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x15
	.long	.LASF112
	.byte	0xa
	.value	0x143
	.long	0x9dea
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x15
	.long	.LASF113
	.byte	0xa
	.value	0x143
	.long	0x9dea
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x15
	.long	.LASF114
	.byte	0xa
	.value	0x143
	.long	0x9dea
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.byte	0x0
	.uleb128 0x2
	.string	"u8"
	.byte	0x23
	.byte	0x9
	.long	0x33
	.uleb128 0x2
	.string	"u16"
	.byte	0x23
	.byte	0xb
	.long	0x4c
	.uleb128 0x2
	.string	"u32"
	.byte	0x23
	.byte	0xd
	.long	0x65
	.uleb128 0x2
	.string	"u64"
	.byte	0x23
	.byte	0xf
	.long	0x7e
	.uleb128 0x5
	.byte	0x8
	.byte	0x23
	.byte	0x14
	.long	0xa06e
	.uleb128 0x6
	.string	"hi"
	.byte	0x23
	.byte	0x14
	.long	0xa035
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"lo"
	.byte	0x23
	.byte	0x14
	.long	0xa035
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x7
	.long	.LASF118
	.byte	0x8
	.byte	0x23
	.byte	0x13
	.long	0xa08b
	.uleb128 0x8
	.long	0xa04b
	.uleb128 0x9
	.string	"val"
	.byte	0x23
	.byte	0x15
	.long	0xa040
	.byte	0x0
	.uleb128 0xd
	.long	.LASF268
	.byte	0x3
	.byte	0x28
	.byte	0x35
	.long	0xa0b4
	.uleb128 0xa
	.long	.LASF269
	.byte	0x28
	.byte	0x36
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF270
	.byte	0x28
	.byte	0x37
	.long	0xa02a
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.byte	0x0
	.uleb128 0xd
	.long	.LASF271
	.byte	0x10
	.byte	0x28
	.byte	0x3a
	.long	0xa107
	.uleb128 0x6
	.string	"bus"
	.byte	0x28
	.byte	0x3b
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"dev"
	.byte	0x28
	.byte	0x3c
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF272
	.byte	0x28
	.byte	0x3d
	.long	0xa107
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF273
	.byte	0x28
	.byte	0x3e
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF140
	.byte	0x28
	.byte	0x3f
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xf
	.long	0xa08b
	.long	0xa117
	.uleb128 0x10
	.long	0x537
	.byte	0x3
	.byte	0x0
	.uleb128 0xd
	.long	.LASF274
	.byte	0x20
	.byte	0x28
	.byte	0x42
	.long	0xa1be
	.uleb128 0xa
	.long	.LASF191
	.byte	0x28
	.byte	0x43
	.long	0xa035
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF192
	.byte	0x28
	.byte	0x44
	.long	0xa02a
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF106
	.byte	0x28
	.byte	0x45
	.long	0xa02a
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xa
	.long	.LASF275
	.byte	0x28
	.byte	0x46
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF276
	.byte	0x28
	.byte	0x47
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0xa
	.long	.LASF277
	.byte	0x28
	.byte	0x48
	.long	0xa02a
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xa
	.long	.LASF278
	.byte	0x28
	.byte	0x49
	.long	0xa035
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF279
	.byte	0x28
	.byte	0x4a
	.long	0xa035
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF140
	.byte	0x28
	.byte	0x4b
	.long	0xa1be
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.long	.LASF142
	.byte	0x28
	.byte	0x4c
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x1f
	.uleb128 0xa
	.long	.LASF280
	.byte	0x28
	.byte	0x4d
	.long	0xa1ce
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.byte	0x0
	.uleb128 0xf
	.long	0xa020
	.long	0xa1ce
	.uleb128 0x10
	.long	0x537
	.byte	0xa
	.byte	0x0
	.uleb128 0xf
	.long	0xa0b4
	.long	0xa1dd
	.uleb128 0x1e
	.long	0x537
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0x19
	.byte	0xbc
	.long	0xa202
	.uleb128 0xa
	.long	.LASF7
	.byte	0x19
	.byte	0xbd
	.long	0xa02a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"seg"
	.byte	0x19
	.byte	0xbe
	.long	0xa02a
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0x19
	.byte	0xbb
	.long	0xa21b
	.uleb128 0x8
	.long	0xa1dd
	.uleb128 0xc
	.long	.LASF8
	.byte	0x19
	.byte	0xc0
	.long	0xa035
	.byte	0x0
	.uleb128 0xd
	.long	.LASF33
	.byte	0x4
	.byte	0x19
	.byte	0xba
	.long	0xa230
	.uleb128 0xe
	.long	0xa202
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0xa254
	.uleb128 0x6
	.string	"di"
	.byte	0xe
	.byte	0x28
	.long	0xa02a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF9
	.byte	0xe
	.byte	0x28
	.long	0xa02a
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0xa295
	.uleb128 0xa
	.long	.LASF10
	.byte	0xe
	.byte	0x28
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF9
	.byte	0xe
	.byte	0x28
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF11
	.byte	0xe
	.byte	0x28
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF12
	.byte	0xe
	.byte	0x28
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0xa2b3
	.uleb128 0x9
	.string	"edi"
	.byte	0xe
	.byte	0x28
	.long	0xa035
	.uleb128 0x8
	.long	0xa230
	.uleb128 0x8
	.long	0xa254
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0xa2d7
	.uleb128 0x6
	.string	"si"
	.byte	0xe
	.byte	0x29
	.long	0xa02a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF13
	.byte	0xe
	.byte	0x29
	.long	0xa02a
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0xa318
	.uleb128 0xa
	.long	.LASF14
	.byte	0xe
	.byte	0x29
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF13
	.byte	0xe
	.byte	0x29
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF15
	.byte	0xe
	.byte	0x29
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF16
	.byte	0xe
	.byte	0x29
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0xa336
	.uleb128 0x9
	.string	"esi"
	.byte	0xe
	.byte	0x29
	.long	0xa035
	.uleb128 0x8
	.long	0xa2b3
	.uleb128 0x8
	.long	0xa2d7
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0xa35a
	.uleb128 0x6
	.string	"bp"
	.byte	0xe
	.byte	0x2a
	.long	0xa02a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF17
	.byte	0xe
	.byte	0x2a
	.long	0xa02a
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0xa39b
	.uleb128 0xa
	.long	.LASF18
	.byte	0xe
	.byte	0x2a
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF17
	.byte	0xe
	.byte	0x2a
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF19
	.byte	0xe
	.byte	0x2a
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF20
	.byte	0xe
	.byte	0x2a
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0xa3b9
	.uleb128 0x9
	.string	"ebp"
	.byte	0xe
	.byte	0x2a
	.long	0xa035
	.uleb128 0x8
	.long	0xa336
	.uleb128 0x8
	.long	0xa35a
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0xa3dd
	.uleb128 0x6
	.string	"bx"
	.byte	0xe
	.byte	0x2b
	.long	0xa02a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF21
	.byte	0xe
	.byte	0x2b
	.long	0xa02a
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0xa41c
	.uleb128 0x6
	.string	"bl"
	.byte	0xe
	.byte	0x2b
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"bh"
	.byte	0xe
	.byte	0x2b
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF22
	.byte	0xe
	.byte	0x2b
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF23
	.byte	0xe
	.byte	0x2b
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0xa43a
	.uleb128 0x9
	.string	"ebx"
	.byte	0xe
	.byte	0x2b
	.long	0xa035
	.uleb128 0x8
	.long	0xa3b9
	.uleb128 0x8
	.long	0xa3dd
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0xa45e
	.uleb128 0x6
	.string	"dx"
	.byte	0xe
	.byte	0x2c
	.long	0xa02a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF24
	.byte	0xe
	.byte	0x2c
	.long	0xa02a
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0xa49d
	.uleb128 0x6
	.string	"dl"
	.byte	0xe
	.byte	0x2c
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"dh"
	.byte	0xe
	.byte	0x2c
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF25
	.byte	0xe
	.byte	0x2c
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF26
	.byte	0xe
	.byte	0x2c
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0xa4bb
	.uleb128 0x9
	.string	"edx"
	.byte	0xe
	.byte	0x2c
	.long	0xa035
	.uleb128 0x8
	.long	0xa43a
	.uleb128 0x8
	.long	0xa45e
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0xa4df
	.uleb128 0x6
	.string	"cx"
	.byte	0xe
	.byte	0x2d
	.long	0xa02a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF27
	.byte	0xe
	.byte	0x2d
	.long	0xa02a
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0xa51e
	.uleb128 0x6
	.string	"cl"
	.byte	0xe
	.byte	0x2d
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"ch"
	.byte	0xe
	.byte	0x2d
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF28
	.byte	0xe
	.byte	0x2d
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF29
	.byte	0xe
	.byte	0x2d
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0xa53c
	.uleb128 0x9
	.string	"ecx"
	.byte	0xe
	.byte	0x2d
	.long	0xa035
	.uleb128 0x8
	.long	0xa4bb
	.uleb128 0x8
	.long	0xa4df
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0xa560
	.uleb128 0x6
	.string	"ax"
	.byte	0xe
	.byte	0x2e
	.long	0xa02a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF30
	.byte	0xe
	.byte	0x2e
	.long	0xa02a
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0xa59f
	.uleb128 0x6
	.string	"al"
	.byte	0xe
	.byte	0x2e
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"ah"
	.byte	0xe
	.byte	0x2e
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF31
	.byte	0xe
	.byte	0x2e
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF32
	.byte	0xe
	.byte	0x2e
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0xa5bd
	.uleb128 0x9
	.string	"eax"
	.byte	0xe
	.byte	0x2e
	.long	0xa035
	.uleb128 0x8
	.long	0xa53c
	.uleb128 0x8
	.long	0xa560
	.byte	0x0
	.uleb128 0xd
	.long	.LASF34
	.byte	0x26
	.byte	0x8
	.byte	0xb1
	.long	0xa638
	.uleb128 0x6
	.string	"ds"
	.byte	0xe
	.byte	0x26
	.long	0xa02a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"es"
	.byte	0xe
	.byte	0x27
	.long	0xa02a
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xe
	.long	0xa295
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xe
	.long	0xa318
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xe
	.long	0xa39b
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xe
	.long	0xa41c
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xe
	.long	0xa49d
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xe
	.long	0xa51e
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xe
	.long	0xa59f
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.long	.LASF35
	.byte	0xe
	.byte	0x2f
	.long	0xa21b
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xa
	.long	.LASF36
	.byte	0xe
	.byte	0x30
	.long	0xa02a
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xd
	.long	.LASF119
	.byte	0x24
	.byte	0x24
	.byte	0x97
	.long	0xa6d1
	.uleb128 0xa
	.long	.LASF120
	.byte	0x24
	.byte	0xb0
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF121
	.byte	0x24
	.byte	0xb1
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF122
	.byte	0x24
	.byte	0xb2
	.long	0xa6d7
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF123
	.byte	0x24
	.byte	0xb3
	.long	0xa040
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF124
	.byte	0x24
	.byte	0xb4
	.long	0x53c
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF125
	.byte	0x24
	.byte	0xb5
	.long	0xa035
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.long	.LASF126
	.byte	0x24
	.byte	0xb6
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF127
	.byte	0x24
	.byte	0xb9
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF128
	.byte	0x24
	.byte	0xba
	.long	0xa02a
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF129
	.byte	0x24
	.byte	0xbb
	.long	0xa6d7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0xa638
	.uleb128 0xd
	.long	.LASF130
	.byte	0x6
	.byte	0x24
	.byte	0xa9
	.long	0xa70e
	.uleb128 0xa
	.long	.LASF131
	.byte	0x24
	.byte	0xaa
	.long	0xa02a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF132
	.byte	0x24
	.byte	0xab
	.long	0xa02a
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.string	"spt"
	.byte	0x24
	.byte	0xac
	.long	0xa02a
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xd
	.long	.LASF210
	.byte	0xc4
	.byte	0x24
	.byte	0xd0
	.long	0xa745
	.uleb128 0xa
	.long	.LASF211
	.byte	0x24
	.byte	0xd2
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF212
	.byte	0x24
	.byte	0xd3
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF213
	.byte	0x24
	.byte	0xd4
	.long	0xa745
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xf
	.long	0xa6d1
	.long	0xa75b
	.uleb128 0x10
	.long	0x537
	.byte	0x2
	.uleb128 0x10
	.long	0x537
	.byte	0xf
	.byte	0x0
	.uleb128 0x14
	.long	.LASF105
	.byte	0xa
	.byte	0xa
	.value	0x13e
	.long	0xa7f0
	.uleb128 0x15
	.long	.LASF106
	.byte	0xa
	.value	0x13f
	.long	0xa02a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x15
	.long	.LASF107
	.byte	0xa
	.value	0x140
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x15
	.long	.LASF108
	.byte	0xa
	.value	0x141
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x15
	.long	.LASF109
	.byte	0xa
	.value	0x142
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x15
	.long	.LASF110
	.byte	0xa
	.value	0x143
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x15
	.long	.LASF111
	.byte	0xa
	.value	0x143
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x15
	.long	.LASF112
	.byte	0xa
	.value	0x143
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x15
	.long	.LASF113
	.byte	0xa
	.value	0x143
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x15
	.long	.LASF114
	.byte	0xa
	.value	0x143
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.byte	0x0
	.uleb128 0xd
	.long	.LASF282
	.byte	0x10
	.byte	0xf
	.byte	0xd5
	.long	0xa851
	.uleb128 0xa
	.long	.LASF191
	.byte	0xf
	.byte	0xd6
	.long	0xa035
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF283
	.byte	0xf
	.byte	0xd7
	.long	0xa035
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF192
	.byte	0xf
	.byte	0xd8
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF116
	.byte	0xf
	.byte	0xd9
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0xa
	.long	.LASF142
	.byte	0xf
	.byte	0xda
	.long	0xa020
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xa
	.long	.LASF140
	.byte	0xf
	.byte	0xdb
	.long	0xa851
	.byte	0x2
	.byte	0x23
	.uleb128 0xb
	.byte	0x0
	.uleb128 0xf
	.long	0xa020
	.long	0xa861
	.uleb128 0x10
	.long	0x537
	.byte	0x4
	.byte	0x0
	.uleb128 0x2
	.string	"u8"
	.byte	0x23
	.byte	0x9
	.long	0x33
	.uleb128 0x2
	.string	"u16"
	.byte	0x23
	.byte	0xb
	.long	0x4c
	.uleb128 0x2
	.string	"u32"
	.byte	0x23
	.byte	0xd
	.long	0x65
	.uleb128 0x2
	.string	"u64"
	.byte	0x23
	.byte	0xf
	.long	0x7e
	.uleb128 0x5
	.byte	0x8
	.byte	0x23
	.byte	0x14
	.long	0xa8af
	.uleb128 0x6
	.string	"hi"
	.byte	0x23
	.byte	0x14
	.long	0xa876
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"lo"
	.byte	0x23
	.byte	0x14
	.long	0xa876
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x7
	.long	.LASF118
	.byte	0x8
	.byte	0x23
	.byte	0x13
	.long	0xa8cc
	.uleb128 0x8
	.long	0xa88c
	.uleb128 0x9
	.string	"val"
	.byte	0x23
	.byte	0x15
	.long	0xa881
	.byte	0x0
	.uleb128 0xd
	.long	.LASF205
	.byte	0x14
	.byte	0x24
	.byte	0x94
	.long	0xa91f
	.uleb128 0x6
	.string	"lba"
	.byte	0x24
	.byte	0x95
	.long	0xa881
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF206
	.byte	0x24
	.byte	0x96
	.long	0x53a
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF207
	.byte	0x24
	.byte	0x97
	.long	0xa9b8
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF208
	.byte	0x24
	.byte	0x98
	.long	0xa86b
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF209
	.byte	0x24
	.byte	0x99
	.long	0xa861
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.byte	0x0
	.uleb128 0xd
	.long	.LASF119
	.byte	0x24
	.byte	0x24
	.byte	0x97
	.long	0xa9b8
	.uleb128 0xa
	.long	.LASF120
	.byte	0x24
	.byte	0xb0
	.long	0xa861
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF121
	.byte	0x24
	.byte	0xb1
	.long	0xa861
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF122
	.byte	0x24
	.byte	0xb2
	.long	0xa9be
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF123
	.byte	0x24
	.byte	0xb3
	.long	0xa881
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF124
	.byte	0x24
	.byte	0xb4
	.long	0x53c
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF125
	.byte	0x24
	.byte	0xb5
	.long	0xa876
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.long	.LASF126
	.byte	0x24
	.byte	0xb6
	.long	0xa861
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF127
	.byte	0x24
	.byte	0xb9
	.long	0xa861
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF128
	.byte	0x24
	.byte	0xba
	.long	0xa86b
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF129
	.byte	0x24
	.byte	0xbb
	.long	0xa9be
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0xa91f
	.uleb128 0xd
	.long	.LASF130
	.byte	0x6
	.byte	0x24
	.byte	0xa9
	.long	0xa9f5
	.uleb128 0xa
	.long	.LASF131
	.byte	0x24
	.byte	0xaa
	.long	0xa86b
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF132
	.byte	0x24
	.byte	0xab
	.long	0xa86b
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.string	"spt"
	.byte	0x24
	.byte	0xac
	.long	0xa86b
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xd
	.long	.LASF210
	.byte	0xc4
	.byte	0x24
	.byte	0xd0
	.long	0xaa2c
	.uleb128 0xa
	.long	.LASF211
	.byte	0x24
	.byte	0xd2
	.long	0xa861
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF212
	.byte	0x24
	.byte	0xd3
	.long	0xa861
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF213
	.byte	0x24
	.byte	0xd4
	.long	0xaa2c
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xf
	.long	0xa9b8
	.long	0xaa42
	.uleb128 0x10
	.long	0x537
	.byte	0x2
	.uleb128 0x10
	.long	0x537
	.byte	0xf
	.byte	0x0
	.uleb128 0xf
	.long	0xa861
	.long	0xaa52
	.uleb128 0x10
	.long	0x537
	.byte	0x5
	.byte	0x0
	.uleb128 0x14
	.long	.LASF105
	.byte	0xa
	.byte	0xa
	.value	0x13e
	.long	0xaae7
	.uleb128 0x15
	.long	.LASF106
	.byte	0xa
	.value	0x13f
	.long	0xa86b
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x15
	.long	.LASF107
	.byte	0xa
	.value	0x140
	.long	0xa861
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x15
	.long	.LASF108
	.byte	0xa
	.value	0x141
	.long	0xa861
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x15
	.long	.LASF109
	.byte	0xa
	.value	0x142
	.long	0xa861
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x15
	.long	.LASF110
	.byte	0xa
	.value	0x143
	.long	0xa861
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x15
	.long	.LASF111
	.byte	0xa
	.value	0x143
	.long	0xa861
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x15
	.long	.LASF112
	.byte	0xa
	.value	0x143
	.long	0xa861
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x15
	.long	.LASF113
	.byte	0xa
	.value	0x143
	.long	0xa861
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x15
	.long	.LASF114
	.byte	0xa
	.value	0x143
	.long	0xa861
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.byte	0x0
	.uleb128 0xd
	.long	.LASF284
	.byte	0x10
	.byte	0x2a
	.byte	0xb
	.long	0xab56
	.uleb128 0xa
	.long	.LASF209
	.byte	0x2a
	.byte	0xc
	.long	0xa861
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF36
	.byte	0x2a
	.byte	0xd
	.long	0xa861
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x6
	.string	"lba"
	.byte	0x2a
	.byte	0xe
	.long	0xa876
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF285
	.byte	0x2a
	.byte	0xf
	.long	0xa861
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xa
	.long	.LASF208
	.byte	0x2a
	.byte	0x10
	.long	0xa86b
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0xa
	.long	.LASF286
	.byte	0x2a
	.byte	0x11
	.long	0xa861
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0x6
	.string	"pad"
	.byte	0x2a
	.byte	0x12
	.long	0xaa42
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.byte	0x0
	.uleb128 0x2
	.string	"u8"
	.byte	0x23
	.byte	0x9
	.long	0x33
	.uleb128 0x2
	.string	"u16"
	.byte	0x23
	.byte	0xb
	.long	0x4c
	.uleb128 0x2
	.string	"u32"
	.byte	0x23
	.byte	0xd
	.long	0x65
	.uleb128 0x2
	.string	"u64"
	.byte	0x23
	.byte	0xf
	.long	0x7e
	.uleb128 0x5
	.byte	0x8
	.byte	0x23
	.byte	0x14
	.long	0xaba4
	.uleb128 0x6
	.string	"hi"
	.byte	0x23
	.byte	0x14
	.long	0xab6b
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"lo"
	.byte	0x23
	.byte	0x14
	.long	0xab6b
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x7
	.long	.LASF118
	.byte	0x8
	.byte	0x23
	.byte	0x13
	.long	0xabc1
	.uleb128 0x8
	.long	0xab81
	.uleb128 0x9
	.string	"val"
	.byte	0x23
	.byte	0x15
	.long	0xab76
	.byte	0x0
	.uleb128 0xd
	.long	.LASF195
	.byte	0x4
	.byte	0x8
	.byte	0xd6
	.long	0xabdc
	.uleb128 0xa
	.long	.LASF196
	.byte	0x8
	.byte	0xd6
	.long	0xab6b
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0xd
	.long	.LASF287
	.byte	0xc
	.byte	0x2b
	.byte	0x6
	.long	0xac58
	.uleb128 0xa
	.long	.LASF288
	.byte	0x2c
	.byte	0x9
	.long	0xacab
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF120
	.byte	0x2c
	.byte	0xa
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"ep"
	.byte	0x2c
	.byte	0xb
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0xa
	.long	.LASF289
	.byte	0x2c
	.byte	0xc
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xa
	.long	.LASF290
	.byte	0x2c
	.byte	0xd
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0xa
	.long	.LASF291
	.byte	0x2c
	.byte	0xe
	.long	0xab60
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF292
	.byte	0x2c
	.byte	0xf
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xa
	.long	.LASF293
	.byte	0x2c
	.byte	0x10
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0xb
	.byte	0x0
	.uleb128 0xd
	.long	.LASF294
	.byte	0x10
	.byte	0x2c
	.byte	0x9
	.long	0xacab
	.uleb128 0xa
	.long	.LASF295
	.byte	0x2c
	.byte	0x15
	.long	0xacb1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF296
	.byte	0x2c
	.byte	0x16
	.long	0xabc1
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF297
	.byte	0x2c
	.byte	0x17
	.long	0x6c
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF120
	.byte	0x2c
	.byte	0x18
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF298
	.byte	0x2c
	.byte	0x19
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0xac58
	.uleb128 0x13
	.byte	0x4
	.long	0xabdc
	.uleb128 0xd
	.long	.LASF299
	.byte	0x24
	.byte	0x2c
	.byte	0x1d
	.long	0xad41
	.uleb128 0x6
	.string	"op"
	.byte	0x2c
	.byte	0x1e
	.long	0xad78
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF300
	.byte	0x2c
	.byte	0x1f
	.long	0xacb1
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF288
	.byte	0x2c
	.byte	0x20
	.long	0xacab
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF301
	.byte	0x2c
	.byte	0x21
	.long	0xabc1
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF302
	.byte	0x2c
	.byte	0x22
	.long	0xab6b
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF303
	.byte	0x2c
	.byte	0x23
	.long	0xab6b
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.long	.LASF304
	.byte	0x2c
	.byte	0x24
	.long	0xab6b
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF305
	.byte	0x2c
	.byte	0x25
	.long	0xab6b
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.long	.LASF306
	.byte	0x2c
	.byte	0x26
	.long	0xab6b
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.byte	0x0
	.uleb128 0xd
	.long	.LASF307
	.byte	0xc
	.byte	0x2c
	.byte	0x1e
	.long	0xad78
	.uleb128 0xa
	.long	.LASF308
	.byte	0x2c
	.byte	0x2b
	.long	0xad99
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF309
	.byte	0x2c
	.byte	0x2c
	.long	0xad99
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF310
	.byte	0x2c
	.byte	0x2d
	.long	0xadb0
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0xad41
	.uleb128 0x1f
	.byte	0x1
	.long	0x6c
	.long	0xad93
	.uleb128 0x1b
	.long	0xad93
	.uleb128 0x1b
	.long	0xab6b
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0xacb7
	.uleb128 0x13
	.byte	0x4
	.long	0xad7e
	.uleb128 0x1a
	.byte	0x1
	.long	0xadb0
	.uleb128 0x1b
	.long	0xad93
	.uleb128 0x1b
	.long	0xab6b
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0xad9f
	.uleb128 0xd
	.long	.LASF311
	.byte	0x8
	.byte	0x2c
	.byte	0x67
	.long	0xae09
	.uleb128 0xa
	.long	.LASF312
	.byte	0x2c
	.byte	0x68
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF313
	.byte	0x2c
	.byte	0x69
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF314
	.byte	0x2c
	.byte	0x6a
	.long	0xab60
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF315
	.byte	0x2c
	.byte	0x6b
	.long	0xab60
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF316
	.byte	0x2c
	.byte	0x6c
	.long	0xab60
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.byte	0x0
	.uleb128 0xd
	.long	.LASF317
	.byte	0x12
	.byte	0x2c
	.byte	0x77
	.long	0xaeda
	.uleb128 0xa
	.long	.LASF318
	.byte	0x2c
	.byte	0x78
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF319
	.byte	0x2c
	.byte	0x79
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF320
	.byte	0x2c
	.byte	0x7b
	.long	0xab60
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF321
	.byte	0x2c
	.byte	0x7c
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF322
	.byte	0x2c
	.byte	0x7d
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0xa
	.long	.LASF323
	.byte	0x2c
	.byte	0x7e
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xa
	.long	.LASF324
	.byte	0x2c
	.byte	0x7f
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0xa
	.long	.LASF325
	.byte	0x2c
	.byte	0x80
	.long	0xab60
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF326
	.byte	0x2c
	.byte	0x81
	.long	0xab60
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xa
	.long	.LASF327
	.byte	0x2c
	.byte	0x82
	.long	0xab60
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF328
	.byte	0x2c
	.byte	0x83
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF329
	.byte	0x2c
	.byte	0x84
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.uleb128 0xa
	.long	.LASF330
	.byte	0x2c
	.byte	0x85
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF331
	.byte	0x2c
	.byte	0x86
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x11
	.byte	0x0
	.uleb128 0xd
	.long	.LASF332
	.byte	0x9
	.byte	0x2c
	.byte	0x93
	.long	0xaf57
	.uleb128 0xa
	.long	.LASF318
	.byte	0x2c
	.byte	0x94
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF319
	.byte	0x2c
	.byte	0x95
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF333
	.byte	0x2c
	.byte	0x97
	.long	0xab60
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF334
	.byte	0x2c
	.byte	0x98
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF335
	.byte	0x2c
	.byte	0x99
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0xa
	.long	.LASF336
	.byte	0x2c
	.byte	0x9a
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xa
	.long	.LASF337
	.byte	0x2c
	.byte	0x9b
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0xa
	.long	.LASF338
	.byte	0x2c
	.byte	0x9c
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0xd
	.long	.LASF339
	.byte	0x9
	.byte	0x2d
	.byte	0x5
	.long	0xafe2
	.uleb128 0xa
	.long	.LASF318
	.byte	0x2c
	.byte	0xa0
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF319
	.byte	0x2c
	.byte	0xa1
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF340
	.byte	0x2c
	.byte	0xa3
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF341
	.byte	0x2c
	.byte	0xa4
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0xa
	.long	.LASF342
	.byte	0x2c
	.byte	0xa5
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF343
	.byte	0x2c
	.byte	0xa6
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0xa
	.long	.LASF344
	.byte	0x2c
	.byte	0xa7
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xa
	.long	.LASF345
	.byte	0x2c
	.byte	0xa8
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0xa
	.long	.LASF346
	.byte	0x2c
	.byte	0xa9
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0xd
	.long	.LASF119
	.byte	0x24
	.byte	0x24
	.byte	0x97
	.long	0xb07b
	.uleb128 0xa
	.long	.LASF120
	.byte	0x24
	.byte	0xb0
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF121
	.byte	0x24
	.byte	0xb1
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF122
	.byte	0x24
	.byte	0xb2
	.long	0xb081
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF123
	.byte	0x24
	.byte	0xb3
	.long	0xab76
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF124
	.byte	0x24
	.byte	0xb4
	.long	0x53c
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF125
	.byte	0x24
	.byte	0xb5
	.long	0xab6b
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.long	.LASF126
	.byte	0x24
	.byte	0xb6
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF127
	.byte	0x24
	.byte	0xb9
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF128
	.byte	0x24
	.byte	0xba
	.long	0xab60
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF129
	.byte	0x24
	.byte	0xbb
	.long	0xb081
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0xafe2
	.uleb128 0xd
	.long	.LASF130
	.byte	0x6
	.byte	0x24
	.byte	0xa9
	.long	0xb0b8
	.uleb128 0xa
	.long	.LASF131
	.byte	0x24
	.byte	0xaa
	.long	0xab60
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF132
	.byte	0x24
	.byte	0xab
	.long	0xab60
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.string	"spt"
	.byte	0x24
	.byte	0xac
	.long	0xab60
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xd
	.long	.LASF210
	.byte	0xc4
	.byte	0x24
	.byte	0xd0
	.long	0xb0ef
	.uleb128 0xa
	.long	.LASF211
	.byte	0x24
	.byte	0xd2
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF212
	.byte	0x24
	.byte	0xd3
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF213
	.byte	0x24
	.byte	0xd4
	.long	0xb0ef
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xf
	.long	0xb07b
	.long	0xb105
	.uleb128 0x10
	.long	0x537
	.byte	0x2
	.uleb128 0x10
	.long	0x537
	.byte	0xf
	.byte	0x0
	.uleb128 0x14
	.long	.LASF105
	.byte	0xa
	.byte	0xa
	.value	0x13e
	.long	0xb19a
	.uleb128 0x15
	.long	.LASF106
	.byte	0xa
	.value	0x13f
	.long	0xab60
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x15
	.long	.LASF107
	.byte	0xa
	.value	0x140
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x15
	.long	.LASF108
	.byte	0xa
	.value	0x141
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x15
	.long	.LASF109
	.byte	0xa
	.value	0x142
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x15
	.long	.LASF110
	.byte	0xa
	.value	0x143
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x15
	.long	.LASF111
	.byte	0xa
	.value	0x143
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x15
	.long	.LASF112
	.byte	0xa
	.value	0x143
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x15
	.long	.LASF113
	.byte	0xa
	.value	0x143
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x15
	.long	.LASF114
	.byte	0xa
	.value	0x143
	.long	0xab56
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.byte	0x0
	.uleb128 0x2
	.string	"u8"
	.byte	0x23
	.byte	0x9
	.long	0x33
	.uleb128 0x2
	.string	"u16"
	.byte	0x23
	.byte	0xb
	.long	0x4c
	.uleb128 0x2
	.string	"u32"
	.byte	0x23
	.byte	0xd
	.long	0x65
	.uleb128 0x2
	.string	"u64"
	.byte	0x23
	.byte	0xf
	.long	0x7e
	.uleb128 0x5
	.byte	0x8
	.byte	0x23
	.byte	0x14
	.long	0xb1e8
	.uleb128 0x6
	.string	"hi"
	.byte	0x23
	.byte	0x14
	.long	0xb1af
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"lo"
	.byte	0x23
	.byte	0x14
	.long	0xb1af
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x7
	.long	.LASF118
	.byte	0x8
	.byte	0x23
	.byte	0x13
	.long	0xb205
	.uleb128 0x8
	.long	0xb1c5
	.uleb128 0x9
	.string	"val"
	.byte	0x23
	.byte	0x15
	.long	0xb1ba
	.byte	0x0
	.uleb128 0xd
	.long	.LASF195
	.byte	0x4
	.byte	0x8
	.byte	0xd6
	.long	0xb220
	.uleb128 0xa
	.long	.LASF196
	.byte	0x8
	.byte	0xd6
	.long	0xb1af
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x16
	.long	.LASF347
	.value	0x1000
	.byte	0x2b
	.byte	0x49
	.long	0xb23c
	.uleb128 0xa
	.long	.LASF272
	.byte	0x2b
	.byte	0x4a
	.long	0xb23c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0xf
	.long	0xb1af
	.long	0xb24d
	.uleb128 0x17
	.long	0x537
	.value	0x3ff
	.byte	0x0
	.uleb128 0xd
	.long	.LASF348
	.byte	0x10
	.byte	0x2b
	.byte	0x6e
	.long	0xb292
	.uleb128 0xa
	.long	.LASF269
	.byte	0x2b
	.byte	0x6f
	.long	0xb1af
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF349
	.byte	0x2b
	.byte	0x70
	.long	0xb1af
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF350
	.byte	0x2b
	.byte	0x71
	.long	0xb1af
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF351
	.byte	0x2b
	.byte	0x72
	.long	0x53a
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0x0
	.uleb128 0xd
	.long	.LASF352
	.byte	0x8
	.byte	0x2b
	.byte	0x75
	.long	0xb2bb
	.uleb128 0xa
	.long	.LASF269
	.byte	0x2b
	.byte	0x76
	.long	0xb1af
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF353
	.byte	0x2b
	.byte	0x77
	.long	0xb1af
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xd
	.long	.LASF287
	.byte	0xc
	.byte	0x2b
	.byte	0x6
	.long	0xb337
	.uleb128 0xa
	.long	.LASF288
	.byte	0x2c
	.byte	0x9
	.long	0xb38a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF120
	.byte	0x2c
	.byte	0xa
	.long	0xb19a
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"ep"
	.byte	0x2c
	.byte	0xb
	.long	0xb19a
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0xa
	.long	.LASF289
	.byte	0x2c
	.byte	0xc
	.long	0xb19a
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xa
	.long	.LASF290
	.byte	0x2c
	.byte	0xd
	.long	0xb19a
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0xa
	.long	.LASF291
	.byte	0x2c
	.byte	0xe
	.long	0xb1a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF292
	.byte	0x2c
	.byte	0xf
	.long	0xb19a
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xa
	.long	.LASF293
	.byte	0x2c
	.byte	0x10
	.long	0xb19a
	.byte	0x2
	.byte	0x23
	.uleb128 0xb
	.byte	0x0
	.uleb128 0xd
	.long	.LASF294
	.byte	0x10
	.byte	0x2c
	.byte	0x9
	.long	0xb38a
	.uleb128 0xa
	.long	.LASF295
	.byte	0x2c
	.byte	0x15
	.long	0xb390
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF296
	.byte	0x2c
	.byte	0x16
	.long	0xb205
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF297
	.byte	0x2c
	.byte	0x17
	.long	0x6c
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF120
	.byte	0x2c
	.byte	0x18
	.long	0xb19a
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF298
	.byte	0x2c
	.byte	0x19
	.long	0xb19a
	.byte	0x2
	.byte	0x23
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0xb337
	.uleb128 0x13
	.byte	0x4
	.long	0xb2bb
	.uleb128 0xd
	.long	.LASF299
	.byte	0x24
	.byte	0x2c
	.byte	0x1d
	.long	0xb420
	.uleb128 0x6
	.string	"op"
	.byte	0x2c
	.byte	0x1e
	.long	0xb457
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF300
	.byte	0x2c
	.byte	0x1f
	.long	0xb390
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF288
	.byte	0x2c
	.byte	0x20
	.long	0xb38a
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF301
	.byte	0x2c
	.byte	0x21
	.long	0xb205
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF302
	.byte	0x2c
	.byte	0x22
	.long	0xb1af
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF303
	.byte	0x2c
	.byte	0x23
	.long	0xb1af
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.long	.LASF304
	.byte	0x2c
	.byte	0x24
	.long	0xb1af
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF305
	.byte	0x2c
	.byte	0x25
	.long	0xb1af
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.long	.LASF306
	.byte	0x2c
	.byte	0x26
	.long	0xb1af
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.byte	0x0
	.uleb128 0xd
	.long	.LASF307
	.byte	0xc
	.byte	0x2c
	.byte	0x1e
	.long	0xb457
	.uleb128 0xa
	.long	.LASF308
	.byte	0x2c
	.byte	0x2b
	.long	0xb478
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF309
	.byte	0x2c
	.byte	0x2c
	.long	0xb478
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF310
	.byte	0x2c
	.byte	0x2d
	.long	0xb48f
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0xb420
	.uleb128 0x1f
	.byte	0x1
	.long	0x6c
	.long	0xb472
	.uleb128 0x1b
	.long	0xb472
	.uleb128 0x1b
	.long	0xb1af
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0xb396
	.uleb128 0x13
	.byte	0x4
	.long	0xb45d
	.uleb128 0x1a
	.byte	0x1
	.long	0xb48f
	.uleb128 0x1b
	.long	0xb472
	.uleb128 0x1b
	.long	0xb1af
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0xb47e
	.uleb128 0xd
	.long	.LASF354
	.byte	0x20
	.byte	0x13
	.byte	0x10
	.long	0xb4e8
	.uleb128 0x6
	.string	"usb"
	.byte	0x13
	.byte	0x11
	.long	0xb337
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF355
	.byte	0x13
	.byte	0x12
	.long	0xb1a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF356
	.byte	0x13
	.byte	0x13
	.long	0xb4e8
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.long	.LASF357
	.byte	0x13
	.byte	0x13
	.long	0xb4e8
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF358
	.byte	0x13
	.byte	0x14
	.long	0xb4ee
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0xb292
	.uleb128 0x13
	.byte	0x4
	.long	0xb220
	.uleb128 0xd
	.long	.LASF359
	.byte	0x1c
	.byte	0x13
	.byte	0xf8
	.long	0xb546
	.uleb128 0x6
	.string	"qh"
	.byte	0x13
	.byte	0xf9
	.long	0xb292
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF360
	.byte	0x13
	.byte	0xfa
	.long	0xb546
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF300
	.byte	0x13
	.byte	0xfb
	.long	0xb2bb
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF355
	.byte	0x13
	.byte	0xfc
	.long	0xb1a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF361
	.byte	0x13
	.byte	0xfd
	.long	0xb19a
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0xb24d
	.uleb128 0x2
	.string	"u8"
	.byte	0x23
	.byte	0x9
	.long	0x33
	.uleb128 0x2
	.string	"u16"
	.byte	0x23
	.byte	0xb
	.long	0x4c
	.uleb128 0x2
	.string	"u32"
	.byte	0x23
	.byte	0xd
	.long	0x65
	.uleb128 0x2
	.string	"u64"
	.byte	0x23
	.byte	0xf
	.long	0x7e
	.uleb128 0x5
	.byte	0x8
	.byte	0x23
	.byte	0x14
	.long	0xb59a
	.uleb128 0x6
	.string	"hi"
	.byte	0x23
	.byte	0x14
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"lo"
	.byte	0x23
	.byte	0x14
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x7
	.long	.LASF118
	.byte	0x8
	.byte	0x23
	.byte	0x13
	.long	0xb5b7
	.uleb128 0x8
	.long	0xb577
	.uleb128 0x9
	.string	"val"
	.byte	0x23
	.byte	0x15
	.long	0xb56c
	.byte	0x0
	.uleb128 0xd
	.long	.LASF195
	.byte	0x4
	.byte	0x8
	.byte	0xd6
	.long	0xb5d2
	.uleb128 0xa
	.long	.LASF196
	.byte	0x8
	.byte	0xd6
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0xd
	.long	.LASF362
	.byte	0x10
	.byte	0x2e
	.byte	0x13
	.long	0xb617
	.uleb128 0xa
	.long	.LASF363
	.byte	0x2e
	.byte	0x14
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF364
	.byte	0x2e
	.byte	0x15
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF365
	.byte	0x2e
	.byte	0x16
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF366
	.byte	0x2e
	.byte	0x17
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0x0
	.uleb128 0xd
	.long	.LASF367
	.byte	0x10
	.byte	0x2e
	.byte	0x23
	.long	0xb65c
	.uleb128 0xa
	.long	.LASF363
	.byte	0x2e
	.byte	0x24
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF368
	.byte	0x2e
	.byte	0x25
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF369
	.byte	0x2e
	.byte	0x26
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF370
	.byte	0x2e
	.byte	0x27
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0x0
	.uleb128 0x16
	.long	.LASF371
	.value	0x100
	.byte	0x2e
	.byte	0x3d
	.long	0xb6a5
	.uleb128 0xa
	.long	.LASF372
	.byte	0x2e
	.byte	0x3e
	.long	0xb6a5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF373
	.byte	0x2e
	.byte	0x3f
	.long	0xb561
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0xa
	.long	.LASF374
	.byte	0x2e
	.byte	0x40
	.long	0xb561
	.byte	0x3
	.byte	0x23
	.uleb128 0x84
	.uleb128 0xa
	.long	.LASF140
	.byte	0x2e
	.byte	0x41
	.long	0xb6b5
	.byte	0x3
	.byte	0x23
	.uleb128 0x88
	.byte	0x0
	.uleb128 0xf
	.long	0xb561
	.long	0xb6b5
	.uleb128 0x10
	.long	0x537
	.byte	0x1f
	.byte	0x0
	.uleb128 0xf
	.long	0xb54c
	.long	0xb6c5
	.uleb128 0x10
	.long	0x537
	.byte	0x77
	.byte	0x0
	.uleb128 0xd
	.long	.LASF375
	.byte	0x90
	.byte	0x2e
	.byte	0x44
	.long	0xb806
	.uleb128 0xa
	.long	.LASF141
	.byte	0x2e
	.byte	0x45
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF250
	.byte	0x2e
	.byte	0x46
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF376
	.byte	0x2e
	.byte	0x47
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF377
	.byte	0x2e
	.byte	0x48
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF378
	.byte	0x2e
	.byte	0x49
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF379
	.byte	0x2e
	.byte	0x4a
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.long	.LASF380
	.byte	0x2e
	.byte	0x4c
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF381
	.byte	0x2e
	.byte	0x4d
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.long	.LASF382
	.byte	0x2e
	.byte	0x4e
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xa
	.long	.LASF383
	.byte	0x2e
	.byte	0x4f
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0xa
	.long	.LASF384
	.byte	0x2e
	.byte	0x50
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0xa
	.long	.LASF385
	.byte	0x2e
	.byte	0x51
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0xa
	.long	.LASF386
	.byte	0x2e
	.byte	0x52
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0xa
	.long	.LASF387
	.byte	0x2e
	.byte	0x54
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0xa
	.long	.LASF388
	.byte	0x2e
	.byte	0x55
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0xa
	.long	.LASF389
	.byte	0x2e
	.byte	0x56
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0xa
	.long	.LASF390
	.byte	0x2e
	.byte	0x57
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0xa
	.long	.LASF391
	.byte	0x2e
	.byte	0x58
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0xa
	.long	.LASF392
	.byte	0x2e
	.byte	0x5a
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0xa
	.long	.LASF393
	.byte	0x2e
	.byte	0x5b
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0xa
	.long	.LASF394
	.byte	0x2e
	.byte	0x5c
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0xa
	.long	.LASF395
	.byte	0x2e
	.byte	0x5d
	.long	0xb806
	.byte	0x2
	.byte	0x23
	.uleb128 0x54
	.byte	0x0
	.uleb128 0xf
	.long	0xb561
	.long	0xb816
	.uleb128 0x10
	.long	0x537
	.byte	0xe
	.byte	0x0
	.uleb128 0xd
	.long	.LASF287
	.byte	0xc
	.byte	0x2e
	.byte	0x6
	.long	0xb892
	.uleb128 0xa
	.long	.LASF288
	.byte	0x2c
	.byte	0x9
	.long	0xb8e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF120
	.byte	0x2c
	.byte	0xa
	.long	0xb54c
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"ep"
	.byte	0x2c
	.byte	0xb
	.long	0xb54c
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0xa
	.long	.LASF289
	.byte	0x2c
	.byte	0xc
	.long	0xb54c
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xa
	.long	.LASF290
	.byte	0x2c
	.byte	0xd
	.long	0xb54c
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0xa
	.long	.LASF291
	.byte	0x2c
	.byte	0xe
	.long	0xb556
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF292
	.byte	0x2c
	.byte	0xf
	.long	0xb54c
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xa
	.long	.LASF293
	.byte	0x2c
	.byte	0x10
	.long	0xb54c
	.byte	0x2
	.byte	0x23
	.uleb128 0xb
	.byte	0x0
	.uleb128 0xd
	.long	.LASF294
	.byte	0x10
	.byte	0x2c
	.byte	0x9
	.long	0xb8e5
	.uleb128 0xa
	.long	.LASF295
	.byte	0x2c
	.byte	0x15
	.long	0xb8eb
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF296
	.byte	0x2c
	.byte	0x16
	.long	0xb5b7
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF297
	.byte	0x2c
	.byte	0x17
	.long	0x6c
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF120
	.byte	0x2c
	.byte	0x18
	.long	0xb54c
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF298
	.byte	0x2c
	.byte	0x19
	.long	0xb54c
	.byte	0x2
	.byte	0x23
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0xb892
	.uleb128 0x13
	.byte	0x4
	.long	0xb816
	.uleb128 0xd
	.long	.LASF299
	.byte	0x24
	.byte	0x2c
	.byte	0x1d
	.long	0xb97b
	.uleb128 0x6
	.string	"op"
	.byte	0x2c
	.byte	0x1e
	.long	0xb9b2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF300
	.byte	0x2c
	.byte	0x1f
	.long	0xb8eb
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF288
	.byte	0x2c
	.byte	0x20
	.long	0xb8e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF301
	.byte	0x2c
	.byte	0x21
	.long	0xb5b7
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF302
	.byte	0x2c
	.byte	0x22
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF303
	.byte	0x2c
	.byte	0x23
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.long	.LASF304
	.byte	0x2c
	.byte	0x24
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF305
	.byte	0x2c
	.byte	0x25
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.long	.LASF306
	.byte	0x2c
	.byte	0x26
	.long	0xb561
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.byte	0x0
	.uleb128 0xd
	.long	.LASF307
	.byte	0xc
	.byte	0x2c
	.byte	0x1e
	.long	0xb9b2
	.uleb128 0xa
	.long	.LASF308
	.byte	0x2c
	.byte	0x2b
	.long	0xb9d3
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF309
	.byte	0x2c
	.byte	0x2c
	.long	0xb9d3
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF310
	.byte	0x2c
	.byte	0x2d
	.long	0xb9ea
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0xb97b
	.uleb128 0x1f
	.byte	0x1
	.long	0x6c
	.long	0xb9cd
	.uleb128 0x1b
	.long	0xb9cd
	.uleb128 0x1b
	.long	0xb561
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0xb8f1
	.uleb128 0x13
	.byte	0x4
	.long	0xb9b8
	.uleb128 0x1a
	.byte	0x1
	.long	0xb9ea
	.uleb128 0x1b
	.long	0xb9cd
	.uleb128 0x1b
	.long	0xb561
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0xb9d9
	.uleb128 0xd
	.long	.LASF396
	.byte	0x14
	.byte	0x14
	.byte	0x11
	.long	0xba19
	.uleb128 0x6
	.string	"usb"
	.byte	0x14
	.byte	0x12
	.long	0xb892
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF397
	.byte	0x14
	.byte	0x13
	.long	0xba19
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0xb6c5
	.uleb128 0x14
	.long	.LASF398
	.byte	0x28
	.byte	0x14
	.value	0x123
	.long	0xba77
	.uleb128 0x1d
	.string	"ed"
	.byte	0x14
	.value	0x124
	.long	0xb5d2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x15
	.long	.LASF300
	.byte	0x14
	.value	0x125
	.long	0xb816
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x15
	.long	.LASF163
	.byte	0x14
	.value	0x126
	.long	0x53a
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x15
	.long	.LASF208
	.byte	0x14
	.value	0x127
	.long	0x6c
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x1d
	.string	"tds"
	.byte	0x14
	.value	0x128
	.long	0xba77
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0xb617
	.uleb128 0x2
	.string	"u8"
	.byte	0x23
	.byte	0x9
	.long	0x33
	.uleb128 0x2
	.string	"u16"
	.byte	0x23
	.byte	0xb
	.long	0x4c
	.uleb128 0x2
	.string	"u32"
	.byte	0x23
	.byte	0xd
	.long	0x65
	.uleb128 0x2
	.string	"u64"
	.byte	0x23
	.byte	0xf
	.long	0x7e
	.uleb128 0x5
	.byte	0x8
	.byte	0x23
	.byte	0x14
	.long	0xbacb
	.uleb128 0x6
	.string	"hi"
	.byte	0x23
	.byte	0x14
	.long	0xba92
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"lo"
	.byte	0x23
	.byte	0x14
	.long	0xba92
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x7
	.long	.LASF118
	.byte	0x8
	.byte	0x23
	.byte	0x13
	.long	0xbae8
	.uleb128 0x8
	.long	0xbaa8
	.uleb128 0x9
	.string	"val"
	.byte	0x23
	.byte	0x15
	.long	0xba9d
	.byte	0x0
	.uleb128 0xd
	.long	.LASF195
	.byte	0x4
	.byte	0x8
	.byte	0xd6
	.long	0xbb03
	.uleb128 0xa
	.long	.LASF196
	.byte	0x8
	.byte	0xd6
	.long	0xba92
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0xd
	.long	.LASF399
	.byte	0x14
	.byte	0x2f
	.byte	0x15
	.long	0xbb64
	.uleb128 0xa
	.long	.LASF400
	.byte	0x2f
	.byte	0x16
	.long	0xba7d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF401
	.byte	0x2f
	.byte	0x17
	.long	0xba7d
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF402
	.byte	0x2f
	.byte	0x18
	.long	0xba87
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF403
	.byte	0x2f
	.byte	0x19
	.long	0xba92
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF404
	.byte	0x2f
	.byte	0x1a
	.long	0xba92
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF405
	.byte	0x2f
	.byte	0x1b
	.long	0xba9d
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0x0
	.uleb128 0xd
	.long	.LASF406
	.byte	0x44
	.byte	0x2f
	.byte	0x22
	.long	0xbbfd
	.uleb128 0xa
	.long	.LASF407
	.byte	0x2f
	.byte	0x23
	.long	0xba92
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF408
	.byte	0x2f
	.byte	0x24
	.long	0xba92
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF409
	.byte	0x2f
	.byte	0x25
	.long	0xba92
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF410
	.byte	0x2f
	.byte	0x26
	.long	0xba92
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF411
	.byte	0x2f
	.byte	0x27
	.long	0xba92
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF412
	.byte	0x2f
	.byte	0x28
	.long	0xba92
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.long	.LASF413
	.byte	0x2f
	.byte	0x29
	.long	0xba92
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF140
	.byte	0x2f
	.byte	0x2a
	.long	0xbbfd
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.long	.LASF414
	.byte	0x2f
	.byte	0x2b
	.long	0xba92
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0xa
	.long	.LASF415
	.byte	0x2f
	.byte	0x2c
	.long	0xbc0d
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.byte	0x0
	.uleb128 0xf
	.long	0xba92
	.long	0xbc0d
	.uleb128 0x10
	.long	0x537
	.byte	0x8
	.byte	0x0
	.uleb128 0xf
	.long	0xba92
	.long	0xbc1c
	.uleb128 0x1e
	.long	0x537
	.byte	0x0
	.uleb128 0xd
	.long	.LASF416
	.byte	0x30
	.byte	0x2f
	.byte	0x5f
	.long	0xbc99
	.uleb128 0xa
	.long	.LASF189
	.byte	0x2f
	.byte	0x60
	.long	0xba92
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF417
	.byte	0x2f
	.byte	0x61
	.long	0xba92
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF418
	.byte	0x2f
	.byte	0x62
	.long	0xba92
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF419
	.byte	0x2f
	.byte	0x63
	.long	0xba92
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF420
	.byte	0x2f
	.byte	0x65
	.long	0xba92
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF421
	.byte	0x2f
	.byte	0x66
	.long	0xba92
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.long	.LASF350
	.byte	0x2f
	.byte	0x67
	.long	0xba92
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x6
	.string	"buf"
	.byte	0x2f
	.byte	0x68
	.long	0xbc99
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0xf
	.long	0xba92
	.long	0xbca9
	.uleb128 0x10
	.long	0x537
	.byte	0x4
	.byte	0x0
	.uleb128 0xd
	.long	.LASF422
	.byte	0x20
	.byte	0x2f
	.byte	0x8a
	.long	0xbcee
	.uleb128 0xa
	.long	.LASF420
	.byte	0x2f
	.byte	0x8b
	.long	0xba92
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF421
	.byte	0x2f
	.byte	0x8c
	.long	0xba92
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF350
	.byte	0x2f
	.byte	0x8d
	.long	0xba92
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.string	"buf"
	.byte	0x2f
	.byte	0x8e
	.long	0xbc99
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0x0
	.uleb128 0x16
	.long	.LASF423
	.value	0x1000
	.byte	0x2f
	.byte	0xa9
	.long	0xbd0a
	.uleb128 0xa
	.long	.LASF272
	.byte	0x2f
	.byte	0xaa
	.long	0xbd0a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0xf
	.long	0xba92
	.long	0xbd1b
	.uleb128 0x17
	.long	0x537
	.value	0x3ff
	.byte	0x0
	.uleb128 0xd
	.long	.LASF287
	.byte	0xc
	.byte	0x2f
	.byte	0x6
	.long	0xbd97
	.uleb128 0xa
	.long	.LASF288
	.byte	0x2c
	.byte	0x9
	.long	0xbdea
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF120
	.byte	0x2c
	.byte	0xa
	.long	0xba7d
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"ep"
	.byte	0x2c
	.byte	0xb
	.long	0xba7d
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0xa
	.long	.LASF289
	.byte	0x2c
	.byte	0xc
	.long	0xba7d
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xa
	.long	.LASF290
	.byte	0x2c
	.byte	0xd
	.long	0xba7d
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0xa
	.long	.LASF291
	.byte	0x2c
	.byte	0xe
	.long	0xba87
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF292
	.byte	0x2c
	.byte	0xf
	.long	0xba7d
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xa
	.long	.LASF293
	.byte	0x2c
	.byte	0x10
	.long	0xba7d
	.byte	0x2
	.byte	0x23
	.uleb128 0xb
	.byte	0x0
	.uleb128 0xd
	.long	.LASF294
	.byte	0x10
	.byte	0x2c
	.byte	0x9
	.long	0xbdea
	.uleb128 0xa
	.long	.LASF295
	.byte	0x2c
	.byte	0x15
	.long	0xbdf0
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF296
	.byte	0x2c
	.byte	0x16
	.long	0xbae8
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF297
	.byte	0x2c
	.byte	0x17
	.long	0x6c
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF120
	.byte	0x2c
	.byte	0x18
	.long	0xba7d
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF298
	.byte	0x2c
	.byte	0x19
	.long	0xba7d
	.byte	0x2
	.byte	0x23
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0xbd97
	.uleb128 0x13
	.byte	0x4
	.long	0xbd1b
	.uleb128 0xd
	.long	.LASF299
	.byte	0x24
	.byte	0x2c
	.byte	0x1d
	.long	0xbe80
	.uleb128 0x6
	.string	"op"
	.byte	0x2c
	.byte	0x1e
	.long	0xbeb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF300
	.byte	0x2c
	.byte	0x1f
	.long	0xbdf0
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF288
	.byte	0x2c
	.byte	0x20
	.long	0xbdea
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF301
	.byte	0x2c
	.byte	0x21
	.long	0xbae8
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF302
	.byte	0x2c
	.byte	0x22
	.long	0xba92
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF303
	.byte	0x2c
	.byte	0x23
	.long	0xba92
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.long	.LASF304
	.byte	0x2c
	.byte	0x24
	.long	0xba92
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF305
	.byte	0x2c
	.byte	0x25
	.long	0xba92
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.long	.LASF306
	.byte	0x2c
	.byte	0x26
	.long	0xba92
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.byte	0x0
	.uleb128 0xd
	.long	.LASF307
	.byte	0xc
	.byte	0x2c
	.byte	0x1e
	.long	0xbeb7
	.uleb128 0xa
	.long	.LASF308
	.byte	0x2c
	.byte	0x2b
	.long	0xbed8
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF309
	.byte	0x2c
	.byte	0x2c
	.long	0xbed8
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF310
	.byte	0x2c
	.byte	0x2d
	.long	0xbeef
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0xbe80
	.uleb128 0x1f
	.byte	0x1
	.long	0x6c
	.long	0xbed2
	.uleb128 0x1b
	.long	0xbed2
	.uleb128 0x1b
	.long	0xba92
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0xbdf6
	.uleb128 0x13
	.byte	0x4
	.long	0xbebd
	.uleb128 0x1a
	.byte	0x1
	.long	0xbeef
	.uleb128 0x1b
	.long	0xbed2
	.uleb128 0x1b
	.long	0xba92
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0xbede
	.uleb128 0xd
	.long	.LASF424
	.byte	0x4
	.byte	0x15
	.byte	0x13
	.long	0xbf1e
	.uleb128 0x6
	.string	"bdf"
	.byte	0x15
	.byte	0x14
	.long	0xba87
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF120
	.byte	0x15
	.byte	0x15
	.long	0xba87
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0xd
	.long	.LASF425
	.byte	0x44
	.byte	0x15
	.byte	0x18
	.long	0xbf8d
	.uleb128 0x6
	.string	"usb"
	.byte	0x15
	.byte	0x19
	.long	0xbd97
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF426
	.byte	0x15
	.byte	0x1a
	.long	0xbf8d
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF397
	.byte	0x15
	.byte	0x1b
	.long	0xbf93
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.long	.LASF427
	.byte	0x15
	.byte	0x1c
	.long	0xbf99
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF428
	.byte	0x15
	.byte	0x1d
	.long	0xbf9f
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.long	.LASF429
	.byte	0x15
	.byte	0x1e
	.long	0x6c
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0xa
	.long	.LASF430
	.byte	0x15
	.byte	0x1f
	.long	0x6c
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0xbb03
	.uleb128 0x13
	.byte	0x4
	.long	0xbb64
	.uleb128 0x13
	.byte	0x4
	.long	0xbc1c
	.uleb128 0xf
	.long	0xbef5
	.long	0xbfaf
	.uleb128 0x10
	.long	0x537
	.byte	0x7
	.byte	0x0
	.uleb128 0x14
	.long	.LASF431
	.byte	0x48
	.byte	0x15
	.value	0x16e
	.long	0xc007
	.uleb128 0x1d
	.string	"qh"
	.byte	0x15
	.value	0x16f
	.long	0xbc1c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x15
	.long	.LASF360
	.byte	0x15
	.value	0x170
	.long	0xc007
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x1d
	.string	"tds"
	.byte	0x15
	.value	0x170
	.long	0xc007
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x15
	.long	.LASF163
	.byte	0x15
	.value	0x171
	.long	0x53a
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x15
	.long	.LASF300
	.byte	0x15
	.value	0x172
	.long	0xbd1b
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0xbca9
	.uleb128 0x2
	.string	"u8"
	.byte	0x23
	.byte	0x9
	.long	0x33
	.uleb128 0x2
	.string	"u16"
	.byte	0x23
	.byte	0xb
	.long	0x4c
	.uleb128 0x2
	.string	"u32"
	.byte	0x23
	.byte	0xd
	.long	0x65
	.uleb128 0x2
	.string	"u64"
	.byte	0x23
	.byte	0xf
	.long	0x7e
	.uleb128 0x5
	.byte	0x8
	.byte	0x23
	.byte	0x14
	.long	0xc05b
	.uleb128 0x6
	.string	"hi"
	.byte	0x23
	.byte	0x14
	.long	0xc022
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"lo"
	.byte	0x23
	.byte	0x14
	.long	0xc022
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x7
	.long	.LASF118
	.byte	0x8
	.byte	0x23
	.byte	0x13
	.long	0xc078
	.uleb128 0x8
	.long	0xc038
	.uleb128 0x9
	.string	"val"
	.byte	0x23
	.byte	0x15
	.long	0xc02d
	.byte	0x0
	.uleb128 0xd
	.long	.LASF195
	.byte	0x4
	.byte	0x8
	.byte	0xd6
	.long	0xc093
	.uleb128 0xa
	.long	.LASF196
	.byte	0x8
	.byte	0xd6
	.long	0xc022
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0xd
	.long	.LASF287
	.byte	0xc
	.byte	0x2d
	.byte	0x6
	.long	0xc10f
	.uleb128 0xa
	.long	.LASF288
	.byte	0x2c
	.byte	0x9
	.long	0xc162
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF120
	.byte	0x2c
	.byte	0xa
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"ep"
	.byte	0x2c
	.byte	0xb
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0xa
	.long	.LASF289
	.byte	0x2c
	.byte	0xc
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xa
	.long	.LASF290
	.byte	0x2c
	.byte	0xd
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0xa
	.long	.LASF291
	.byte	0x2c
	.byte	0xe
	.long	0xc017
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF292
	.byte	0x2c
	.byte	0xf
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xa
	.long	.LASF293
	.byte	0x2c
	.byte	0x10
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0xb
	.byte	0x0
	.uleb128 0xd
	.long	.LASF294
	.byte	0x10
	.byte	0x2c
	.byte	0x9
	.long	0xc162
	.uleb128 0xa
	.long	.LASF295
	.byte	0x2c
	.byte	0x15
	.long	0xc168
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF296
	.byte	0x2c
	.byte	0x16
	.long	0xc078
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF297
	.byte	0x2c
	.byte	0x17
	.long	0x6c
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF120
	.byte	0x2c
	.byte	0x18
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF298
	.byte	0x2c
	.byte	0x19
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0xc10f
	.uleb128 0x13
	.byte	0x4
	.long	0xc093
	.uleb128 0x5
	.byte	0x4
	.byte	0x19
	.byte	0xbc
	.long	0xc193
	.uleb128 0xa
	.long	.LASF7
	.byte	0x19
	.byte	0xbd
	.long	0xc017
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"seg"
	.byte	0x19
	.byte	0xbe
	.long	0xc017
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0x19
	.byte	0xbb
	.long	0xc1ac
	.uleb128 0x8
	.long	0xc16e
	.uleb128 0xc
	.long	.LASF8
	.byte	0x19
	.byte	0xc0
	.long	0xc022
	.byte	0x0
	.uleb128 0xd
	.long	.LASF33
	.byte	0x4
	.byte	0x19
	.byte	0xba
	.long	0xc1c1
	.uleb128 0xe
	.long	0xc193
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0xf
	.long	0xc00d
	.long	0xc1d1
	.uleb128 0x10
	.long	0x537
	.byte	0x3
	.byte	0x0
	.uleb128 0xf
	.long	0xc00d
	.long	0xc1e1
	.uleb128 0x10
	.long	0x537
	.byte	0x7
	.byte	0x0
	.uleb128 0xd
	.long	.LASF119
	.byte	0x24
	.byte	0x24
	.byte	0x97
	.long	0xc27a
	.uleb128 0xa
	.long	.LASF120
	.byte	0x24
	.byte	0xb0
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF121
	.byte	0x24
	.byte	0xb1
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF122
	.byte	0x24
	.byte	0xb2
	.long	0xc280
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF123
	.byte	0x24
	.byte	0xb3
	.long	0xc02d
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF124
	.byte	0x24
	.byte	0xb4
	.long	0x53c
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF125
	.byte	0x24
	.byte	0xb5
	.long	0xc022
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.long	.LASF126
	.byte	0x24
	.byte	0xb6
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF127
	.byte	0x24
	.byte	0xb9
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF128
	.byte	0x24
	.byte	0xba
	.long	0xc017
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF129
	.byte	0x24
	.byte	0xbb
	.long	0xc280
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0xc1e1
	.uleb128 0xd
	.long	.LASF130
	.byte	0x6
	.byte	0x24
	.byte	0xa9
	.long	0xc2b7
	.uleb128 0xa
	.long	.LASF131
	.byte	0x24
	.byte	0xaa
	.long	0xc017
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF132
	.byte	0x24
	.byte	0xab
	.long	0xc017
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.string	"spt"
	.byte	0x24
	.byte	0xac
	.long	0xc017
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xd
	.long	.LASF210
	.byte	0xc4
	.byte	0x24
	.byte	0xd0
	.long	0xc2ee
	.uleb128 0xa
	.long	.LASF211
	.byte	0x24
	.byte	0xd2
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF212
	.byte	0x24
	.byte	0xd3
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF213
	.byte	0x24
	.byte	0xd4
	.long	0xc2ee
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xf
	.long	0xc27a
	.long	0xc304
	.uleb128 0x10
	.long	0x537
	.byte	0x2
	.uleb128 0x10
	.long	0x537
	.byte	0xf
	.byte	0x0
	.uleb128 0xd
	.long	.LASF38
	.byte	0xbc
	.byte	0xa
	.byte	0x21
	.long	0xc6c6
	.uleb128 0xa
	.long	.LASF39
	.byte	0xa
	.byte	0x23
	.long	0xc6c6
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF40
	.byte	0xa
	.byte	0x24
	.long	0xc6d6
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF41
	.byte	0xa
	.byte	0x25
	.long	0xc017
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF42
	.byte	0xa
	.byte	0x27
	.long	0xc017
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF43
	.byte	0xa
	.byte	0x28
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0xa
	.long	.LASF44
	.byte	0xa
	.byte	0x29
	.long	0xc017
	.byte	0x2
	.byte	0x23
	.uleb128 0x13
	.uleb128 0xa
	.long	.LASF45
	.byte	0xa
	.byte	0x2a
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x15
	.uleb128 0xa
	.long	.LASF46
	.byte	0xa
	.byte	0x2b
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x16
	.uleb128 0xa
	.long	.LASF47
	.byte	0xa
	.byte	0x2c
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x17
	.uleb128 0xa
	.long	.LASF48
	.byte	0xa
	.byte	0x2d
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF49
	.byte	0xa
	.byte	0x2e
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF50
	.byte	0xa
	.byte	0x2f
	.long	0xc017
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF51
	.byte	0xa
	.byte	0x30
	.long	0xc017
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.long	.LASF52
	.byte	0xa
	.byte	0x32
	.long	0xc6e6
	.byte	0x2
	.byte	0x23
	.uleb128 0x1e
	.uleb128 0xa
	.long	.LASF53
	.byte	0xa
	.byte	0x33
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x3e
	.uleb128 0xa
	.long	.LASF54
	.byte	0xa
	.byte	0x34
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x3f
	.uleb128 0xa
	.long	.LASF55
	.byte	0xa
	.byte	0x36
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0xa
	.long	.LASF56
	.byte	0xa
	.byte	0x37
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x41
	.uleb128 0xa
	.long	.LASF57
	.byte	0xa
	.byte	0x38
	.long	0xc6f6
	.byte	0x2
	.byte	0x23
	.uleb128 0x42
	.uleb128 0xa
	.long	.LASF58
	.byte	0xa
	.byte	0x39
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x49
	.uleb128 0xa
	.long	.LASF59
	.byte	0xa
	.byte	0x3a
	.long	0xc017
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.uleb128 0xa
	.long	.LASF60
	.byte	0xa
	.byte	0x3b
	.long	0xc017
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0xa
	.long	.LASF61
	.byte	0xa
	.byte	0x3c
	.long	0xc017
	.byte	0x2
	.byte	0x23
	.uleb128 0x4e
	.uleb128 0xa
	.long	.LASF62
	.byte	0xa
	.byte	0x3e
	.long	0xc706
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0xa
	.long	.LASF63
	.byte	0xa
	.byte	0x40
	.long	0xc017
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0xa
	.long	.LASF64
	.byte	0xa
	.byte	0x41
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x62
	.uleb128 0xa
	.long	.LASF65
	.byte	0xa
	.byte	0x42
	.long	0xc017
	.byte	0x2
	.byte	0x23
	.uleb128 0x63
	.uleb128 0xa
	.long	.LASF66
	.byte	0xa
	.byte	0x43
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x65
	.uleb128 0xa
	.long	.LASF67
	.byte	0xa
	.byte	0x44
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x66
	.uleb128 0xa
	.long	.LASF68
	.byte	0xa
	.byte	0x45
	.long	0xc1ac
	.byte	0x2
	.byte	0x23
	.uleb128 0x67
	.uleb128 0xa
	.long	.LASF69
	.byte	0xa
	.byte	0x46
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x6b
	.uleb128 0xa
	.long	.LASF70
	.byte	0xa
	.byte	0x47
	.long	0xc022
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.uleb128 0xa
	.long	.LASF71
	.byte	0xa
	.byte	0x49
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0xa
	.long	.LASF72
	.byte	0xa
	.byte	0x4a
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x71
	.uleb128 0xa
	.long	.LASF73
	.byte	0xa
	.byte	0x4b
	.long	0xc017
	.byte	0x2
	.byte	0x23
	.uleb128 0x72
	.uleb128 0xa
	.long	.LASF74
	.byte	0xa
	.byte	0x4c
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0xa
	.long	.LASF75
	.byte	0xa
	.byte	0x4d
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x75
	.uleb128 0xa
	.long	.LASF76
	.byte	0xa
	.byte	0x4e
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x76
	.uleb128 0xa
	.long	.LASF77
	.byte	0xa
	.byte	0x4f
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x77
	.uleb128 0xa
	.long	.LASF78
	.byte	0xa
	.byte	0x50
	.long	0xc1c1
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0xa
	.long	.LASF79
	.byte	0xa
	.byte	0x51
	.long	0xc1c1
	.byte	0x2
	.byte	0x23
	.uleb128 0x7c
	.uleb128 0xa
	.long	.LASF80
	.byte	0xa
	.byte	0x53
	.long	0xc017
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0xa
	.long	.LASF81
	.byte	0xa
	.byte	0x54
	.long	0xc017
	.byte	0x3
	.byte	0x23
	.uleb128 0x82
	.uleb128 0xa
	.long	.LASF82
	.byte	0xa
	.byte	0x55
	.long	0xc00d
	.byte	0x3
	.byte	0x23
	.uleb128 0x84
	.uleb128 0xa
	.long	.LASF83
	.byte	0xa
	.byte	0x56
	.long	0xc017
	.byte	0x3
	.byte	0x23
	.uleb128 0x85
	.uleb128 0xa
	.long	.LASF84
	.byte	0xa
	.byte	0x57
	.long	0xc00d
	.byte	0x3
	.byte	0x23
	.uleb128 0x87
	.uleb128 0xa
	.long	.LASF85
	.byte	0xa
	.byte	0x58
	.long	0xc00d
	.byte	0x3
	.byte	0x23
	.uleb128 0x88
	.uleb128 0xa
	.long	.LASF86
	.byte	0xa
	.byte	0x59
	.long	0xc00d
	.byte	0x3
	.byte	0x23
	.uleb128 0x89
	.uleb128 0xa
	.long	.LASF87
	.byte	0xa
	.byte	0x5a
	.long	0xc00d
	.byte	0x3
	.byte	0x23
	.uleb128 0x8a
	.uleb128 0xa
	.long	.LASF88
	.byte	0xa
	.byte	0x5b
	.long	0xc00d
	.byte	0x3
	.byte	0x23
	.uleb128 0x8b
	.uleb128 0xa
	.long	.LASF89
	.byte	0xa
	.byte	0x5c
	.long	0xc00d
	.byte	0x3
	.byte	0x23
	.uleb128 0x8c
	.uleb128 0xa
	.long	.LASF90
	.byte	0xa
	.byte	0x5d
	.long	0xc00d
	.byte	0x3
	.byte	0x23
	.uleb128 0x8d
	.uleb128 0xa
	.long	.LASF91
	.byte	0xa
	.byte	0x5e
	.long	0xc00d
	.byte	0x3
	.byte	0x23
	.uleb128 0x8e
	.uleb128 0xa
	.long	.LASF92
	.byte	0xa
	.byte	0x5f
	.long	0xc00d
	.byte	0x3
	.byte	0x23
	.uleb128 0x8f
	.uleb128 0xa
	.long	.LASF93
	.byte	0xa
	.byte	0x61
	.long	0xc1c1
	.byte	0x3
	.byte	0x23
	.uleb128 0x90
	.uleb128 0xa
	.long	.LASF94
	.byte	0xa
	.byte	0x62
	.long	0xc716
	.byte	0x3
	.byte	0x23
	.uleb128 0x94
	.uleb128 0xa
	.long	.LASF95
	.byte	0xa
	.byte	0x63
	.long	0xc00d
	.byte	0x3
	.byte	0x23
	.uleb128 0x96
	.uleb128 0xa
	.long	.LASF96
	.byte	0xa
	.byte	0x64
	.long	0xc00d
	.byte	0x3
	.byte	0x23
	.uleb128 0x97
	.uleb128 0xa
	.long	.LASF97
	.byte	0xa
	.byte	0x65
	.long	0xc1ac
	.byte	0x3
	.byte	0x23
	.uleb128 0x98
	.uleb128 0xa
	.long	.LASF98
	.byte	0xa
	.byte	0x66
	.long	0xc022
	.byte	0x3
	.byte	0x23
	.uleb128 0x9c
	.uleb128 0xa
	.long	.LASF99
	.byte	0xa
	.byte	0x68
	.long	0xc00d
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0xa
	.long	.LASF100
	.byte	0xa
	.byte	0x69
	.long	0xc6f6
	.byte	0x3
	.byte	0x23
	.uleb128 0xa1
	.uleb128 0xa
	.long	.LASF101
	.byte	0xa
	.byte	0x6a
	.long	0xc1ac
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0xa
	.long	.LASF102
	.byte	0xa
	.byte	0x6b
	.long	0xc1c1
	.byte	0x3
	.byte	0x23
	.uleb128 0xac
	.uleb128 0xa
	.long	.LASF103
	.byte	0xa
	.byte	0x6d
	.long	0xc726
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0xa
	.long	.LASF104
	.byte	0xa
	.byte	0x6e
	.long	0xc017
	.byte	0x3
	.byte	0x23
	.uleb128 0xba
	.byte	0x0
	.uleb128 0xf
	.long	0xc017
	.long	0xc6d6
	.uleb128 0x10
	.long	0x537
	.byte	0x3
	.byte	0x0
	.uleb128 0xf
	.long	0xc017
	.long	0xc6e6
	.uleb128 0x10
	.long	0x537
	.byte	0x2
	.byte	0x0
	.uleb128 0xf
	.long	0xc00d
	.long	0xc6f6
	.uleb128 0x10
	.long	0x537
	.byte	0x1f
	.byte	0x0
	.uleb128 0xf
	.long	0xc00d
	.long	0xc706
	.uleb128 0x10
	.long	0x537
	.byte	0x6
	.byte	0x0
	.uleb128 0xf
	.long	0xc017
	.long	0xc716
	.uleb128 0x10
	.long	0x537
	.byte	0x7
	.byte	0x0
	.uleb128 0xf
	.long	0xc00d
	.long	0xc726
	.uleb128 0x10
	.long	0x537
	.byte	0x1
	.byte	0x0
	.uleb128 0xf
	.long	0xc00d
	.long	0xc736
	.uleb128 0x10
	.long	0x537
	.byte	0x9
	.byte	0x0
	.uleb128 0xd
	.long	.LASF133
	.byte	0x10
	.byte	0xa
	.byte	0x92
	.long	0xc7eb
	.uleb128 0xa
	.long	.LASF134
	.byte	0xa
	.byte	0x93
	.long	0xc017
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF135
	.byte	0xa
	.byte	0x94
	.long	0xc017
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF136
	.byte	0xa
	.byte	0x95
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF137
	.byte	0xa
	.byte	0x96
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x6
	.string	"irq"
	.byte	0xa
	.byte	0x97
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xa
	.long	.LASF138
	.byte	0xa
	.byte	0x98
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x6
	.string	"dma"
	.byte	0xa
	.byte	0x99
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.string	"pio"
	.byte	0xa
	.byte	0x9a
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0xa
	.long	.LASF139
	.byte	0xa
	.byte	0x9b
	.long	0xc017
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xa
	.long	.LASF140
	.byte	0xa
	.byte	0x9c
	.long	0xc017
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF141
	.byte	0xa
	.byte	0x9d
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF142
	.byte	0xa
	.byte	0x9e
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xd
	.long	.LASF143
	.byte	0x18
	.byte	0xa
	.byte	0xa2
	.long	0xc876
	.uleb128 0xa
	.long	.LASF144
	.byte	0xa
	.byte	0xa3
	.long	0xc27a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF145
	.byte	0xa
	.byte	0xa4
	.long	0xc022
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF146
	.byte	0xa
	.byte	0xa5
	.long	0xc017
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF147
	.byte	0xa
	.byte	0xa6
	.long	0xc017
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xa
	.long	.LASF148
	.byte	0xa
	.byte	0xa7
	.long	0xc017
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF149
	.byte	0xa
	.byte	0xa8
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF150
	.byte	0xa
	.byte	0xa9
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.uleb128 0xa
	.long	.LASF151
	.byte	0xa
	.byte	0xaa
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF122
	.byte	0xa
	.byte	0xad
	.long	0xc280
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.byte	0x0
	.uleb128 0xd
	.long	.LASF152
	.byte	0x10
	.byte	0xa
	.byte	0xb0
	.long	0xc92b
	.uleb128 0xa
	.long	.LASF132
	.byte	0xa
	.byte	0xb1
	.long	0xc017
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF131
	.byte	0xa
	.byte	0xb2
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF153
	.byte	0xa
	.byte	0xb3
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0xa
	.long	.LASF154
	.byte	0xa
	.byte	0xb4
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF155
	.byte	0xa
	.byte	0xb5
	.long	0xc017
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0xa
	.long	.LASF140
	.byte	0xa
	.byte	0xb6
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0xa
	.long	.LASF156
	.byte	0xa
	.byte	0xb7
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF157
	.byte	0xa
	.byte	0xb8
	.long	0xc017
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0xa
	.long	.LASF158
	.byte	0xa
	.byte	0xb9
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0xb
	.uleb128 0xa
	.long	.LASF159
	.byte	0xa
	.byte	0xba
	.long	0xc017
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF123
	.byte	0xa
	.byte	0xbb
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF142
	.byte	0xa
	.byte	0xbc
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.byte	0x0
	.uleb128 0x5
	.byte	0x8
	.byte	0xa
	.byte	0xc1
	.long	0xc95e
	.uleb128 0xa
	.long	.LASF160
	.byte	0xa
	.byte	0xc2
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF161
	.byte	0xa
	.byte	0xc3
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF162
	.byte	0xa
	.byte	0xc4
	.long	0xc95e
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0xf
	.long	0xc00d
	.long	0xc96e
	.uleb128 0x10
	.long	0x537
	.byte	0x5
	.byte	0x0
	.uleb128 0xb
	.byte	0x8
	.byte	0xa
	.byte	0xc0
	.long	0xc987
	.uleb128 0x8
	.long	0xc92b
	.uleb128 0xc
	.long	.LASF163
	.byte	0xa
	.byte	0xc6
	.long	0xc02d
	.byte	0x0
	.uleb128 0xd
	.long	.LASF164
	.byte	0x8
	.byte	0xa
	.byte	0xbf
	.long	0xc99c
	.uleb128 0xe
	.long	0xc96e
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x16
	.long	.LASF165
	.value	0xb68
	.byte	0xa
	.byte	0xca
	.long	0xcaaf
	.uleb128 0xa
	.long	.LASF106
	.byte	0xa
	.byte	0xcb
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF166
	.byte	0xa
	.byte	0xcc
	.long	0xcaaf
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF167
	.byte	0xa
	.byte	0xcd
	.long	0xc1ac
	.byte	0x2
	.byte	0x23
	.uleb128 0x22
	.uleb128 0xa
	.long	.LASF168
	.byte	0xa
	.byte	0xce
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x26
	.uleb128 0xa
	.long	.LASF169
	.byte	0xa
	.byte	0xcf
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x27
	.uleb128 0xa
	.long	.LASF170
	.byte	0xa
	.byte	0xd0
	.long	0xc1d1
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0xa
	.long	.LASF171
	.byte	0xa
	.byte	0xd2
	.long	0xcabf
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0xa
	.long	.LASF172
	.byte	0xa
	.byte	0xd5
	.long	0xcacf
	.byte	0x2
	.byte	0x23
	.uleb128 0x3d
	.uleb128 0xa
	.long	.LASF173
	.byte	0xa
	.byte	0xd8
	.long	0xcadf
	.byte	0x2
	.byte	0x23
	.uleb128 0x5d
	.uleb128 0xa
	.long	.LASF174
	.byte	0xa
	.byte	0xdb
	.long	0xc00d
	.byte	0x3
	.byte	0x23
	.uleb128 0x121
	.uleb128 0xa
	.long	.LASF175
	.byte	0xa
	.byte	0xdc
	.long	0xc987
	.byte	0x3
	.byte	0x23
	.uleb128 0x122
	.uleb128 0xa
	.long	.LASF176
	.byte	0xa
	.byte	0xde
	.long	0x6c
	.byte	0x3
	.byte	0x23
	.uleb128 0x12a
	.uleb128 0xa
	.long	.LASF177
	.byte	0xa
	.byte	0xe1
	.long	0xc7eb
	.byte	0x3
	.byte	0x23
	.uleb128 0x12e
	.uleb128 0xa
	.long	.LASF178
	.byte	0xa
	.byte	0xe4
	.long	0xc736
	.byte	0x3
	.byte	0x23
	.uleb128 0x146
	.uleb128 0xa
	.long	.LASF179
	.byte	0xa
	.byte	0xe7
	.long	0xcaef
	.byte	0x3
	.byte	0x23
	.uleb128 0x156
	.uleb128 0xa
	.long	.LASF180
	.byte	0xa
	.byte	0xe9
	.long	0xc017
	.byte	0x3
	.byte	0x23
	.uleb128 0x166
	.uleb128 0xa
	.long	.LASF181
	.byte	0xa
	.byte	0xec
	.long	0xcaff
	.byte	0x3
	.byte	0x23
	.uleb128 0x168
	.uleb128 0xa
	.long	.LASF182
	.byte	0xa
	.byte	0xee
	.long	0xcb10
	.byte	0x3
	.byte	0x23
	.uleb128 0x368
	.byte	0x0
	.uleb128 0xf
	.long	0xc00d
	.long	0xcabf
	.uleb128 0x10
	.long	0x537
	.byte	0x20
	.byte	0x0
	.uleb128 0xf
	.long	0xc00d
	.long	0xcacf
	.uleb128 0x10
	.long	0x537
	.byte	0xc
	.byte	0x0
	.uleb128 0xf
	.long	0xc876
	.long	0xcadf
	.uleb128 0x10
	.long	0x537
	.byte	0x1
	.byte	0x0
	.uleb128 0xf
	.long	0xc00d
	.long	0xcaef
	.uleb128 0x10
	.long	0x537
	.byte	0xc3
	.byte	0x0
	.uleb128 0xf
	.long	0xc00d
	.long	0xcaff
	.uleb128 0x10
	.long	0x537
	.byte	0xf
	.byte	0x0
	.uleb128 0xf
	.long	0xc00d
	.long	0xcb10
	.uleb128 0x17
	.long	0x537
	.value	0x1ff
	.byte	0x0
	.uleb128 0xf
	.long	0xc00d
	.long	0xcb21
	.uleb128 0x17
	.long	0x537
	.value	0x7ff
	.byte	0x0
	.uleb128 0x14
	.long	.LASF105
	.byte	0xa
	.byte	0xa
	.value	0x13e
	.long	0xcbb6
	.uleb128 0x15
	.long	.LASF106
	.byte	0xa
	.value	0x13f
	.long	0xc017
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x15
	.long	.LASF107
	.byte	0xa
	.value	0x140
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x15
	.long	.LASF108
	.byte	0xa
	.value	0x141
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x15
	.long	.LASF109
	.byte	0xa
	.value	0x142
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x15
	.long	.LASF110
	.byte	0xa
	.value	0x143
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x15
	.long	.LASF111
	.byte	0xa
	.value	0x143
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x15
	.long	.LASF112
	.byte	0xa
	.value	0x143
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x15
	.long	.LASF113
	.byte	0xa
	.value	0x143
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x15
	.long	.LASF114
	.byte	0xa
	.value	0x143
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.byte	0x0
	.uleb128 0xd
	.long	.LASF432
	.byte	0x8
	.byte	0x1a
	.byte	0x77
	.long	0xcbed
	.uleb128 0xa
	.long	.LASF160
	.byte	0x1a
	.byte	0x78
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF140
	.byte	0x1a
	.byte	0x79
	.long	0xc00d
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF162
	.byte	0x1a
	.byte	0x7a
	.long	0xc95e
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x2
	.string	"u8"
	.byte	0x23
	.byte	0x9
	.long	0x33
	.uleb128 0x2
	.string	"u16"
	.byte	0x23
	.byte	0xb
	.long	0x4c
	.uleb128 0x2
	.string	"u32"
	.byte	0x23
	.byte	0xd
	.long	0x65
	.uleb128 0x2
	.string	"u64"
	.byte	0x23
	.byte	0xf
	.long	0x7e
	.uleb128 0x5
	.byte	0x8
	.byte	0x23
	.byte	0x14
	.long	0xcc3b
	.uleb128 0x6
	.string	"hi"
	.byte	0x23
	.byte	0x14
	.long	0xcc02
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"lo"
	.byte	0x23
	.byte	0x14
	.long	0xcc02
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x7
	.long	.LASF118
	.byte	0x8
	.byte	0x23
	.byte	0x13
	.long	0xcc58
	.uleb128 0x8
	.long	0xcc18
	.uleb128 0x9
	.string	"val"
	.byte	0x23
	.byte	0x15
	.long	0xcc0d
	.byte	0x0
	.uleb128 0xd
	.long	.LASF195
	.byte	0x4
	.byte	0x8
	.byte	0xd6
	.long	0xcc73
	.uleb128 0xa
	.long	.LASF196
	.byte	0x8
	.byte	0xd6
	.long	0xcc02
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0xd
	.long	.LASF287
	.byte	0xc
	.byte	0x30
	.byte	0x8
	.long	0xccef
	.uleb128 0xa
	.long	.LASF288
	.byte	0x2c
	.byte	0x9
	.long	0xcd42
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF120
	.byte	0x2c
	.byte	0xa
	.long	0xcbed
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"ep"
	.byte	0x2c
	.byte	0xb
	.long	0xcbed
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0xa
	.long	.LASF289
	.byte	0x2c
	.byte	0xc
	.long	0xcbed
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xa
	.long	.LASF290
	.byte	0x2c
	.byte	0xd
	.long	0xcbed
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0xa
	.long	.LASF291
	.byte	0x2c
	.byte	0xe
	.long	0xcbf7
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF292
	.byte	0x2c
	.byte	0xf
	.long	0xcbed
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xa
	.long	.LASF293
	.byte	0x2c
	.byte	0x10
	.long	0xcbed
	.byte	0x2
	.byte	0x23
	.uleb128 0xb
	.byte	0x0
	.uleb128 0xd
	.long	.LASF294
	.byte	0x10
	.byte	0x2c
	.byte	0x9
	.long	0xcd42
	.uleb128 0xa
	.long	.LASF295
	.byte	0x2c
	.byte	0x15
	.long	0xcd48
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF296
	.byte	0x2c
	.byte	0x16
	.long	0xcc58
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF297
	.byte	0x2c
	.byte	0x17
	.long	0x6c
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF120
	.byte	0x2c
	.byte	0x18
	.long	0xcbed
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF298
	.byte	0x2c
	.byte	0x19
	.long	0xcbed
	.byte	0x2
	.byte	0x23
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0xccef
	.uleb128 0x13
	.byte	0x4
	.long	0xcc73
	.uleb128 0xd
	.long	.LASF205
	.byte	0x14
	.byte	0x30
	.byte	0x5
	.long	0xcda1
	.uleb128 0x6
	.string	"lba"
	.byte	0x24
	.byte	0x95
	.long	0xcc0d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF206
	.byte	0x24
	.byte	0x96
	.long	0x53a
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF207
	.byte	0x24
	.byte	0x97
	.long	0xce3a
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF208
	.byte	0x24
	.byte	0x98
	.long	0xcbf7
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF209
	.byte	0x24
	.byte	0x99
	.long	0xcbed
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.byte	0x0
	.uleb128 0xd
	.long	.LASF119
	.byte	0x24
	.byte	0x24
	.byte	0x97
	.long	0xce3a
	.uleb128 0xa
	.long	.LASF120
	.byte	0x24
	.byte	0xb0
	.long	0xcbed
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF121
	.byte	0x24
	.byte	0xb1
	.long	0xcbed
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF122
	.byte	0x24
	.byte	0xb2
	.long	0xce40
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF123
	.byte	0x24
	.byte	0xb3
	.long	0xcc0d
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF124
	.byte	0x24
	.byte	0xb4
	.long	0x53c
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF125
	.byte	0x24
	.byte	0xb5
	.long	0xcc02
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.long	.LASF126
	.byte	0x24
	.byte	0xb6
	.long	0xcbed
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF127
	.byte	0x24
	.byte	0xb9
	.long	0xcbed
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF128
	.byte	0x24
	.byte	0xba
	.long	0xcbf7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF129
	.byte	0x24
	.byte	0xbb
	.long	0xce40
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0xcda1
	.uleb128 0xd
	.long	.LASF130
	.byte	0x6
	.byte	0x24
	.byte	0xa9
	.long	0xce77
	.uleb128 0xa
	.long	.LASF131
	.byte	0x24
	.byte	0xaa
	.long	0xcbf7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF132
	.byte	0x24
	.byte	0xab
	.long	0xcbf7
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.string	"spt"
	.byte	0x24
	.byte	0xac
	.long	0xcbf7
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xd
	.long	.LASF210
	.byte	0xc4
	.byte	0x24
	.byte	0xd0
	.long	0xceae
	.uleb128 0xa
	.long	.LASF211
	.byte	0x24
	.byte	0xd2
	.long	0xcbed
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF212
	.byte	0x24
	.byte	0xd3
	.long	0xcbed
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF213
	.byte	0x24
	.byte	0xd4
	.long	0xceae
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xf
	.long	0xce3a
	.long	0xcec4
	.uleb128 0x10
	.long	0x537
	.byte	0x2
	.uleb128 0x10
	.long	0x537
	.byte	0xf
	.byte	0x0
	.uleb128 0xf
	.long	0xcbed
	.long	0xced4
	.uleb128 0x10
	.long	0x537
	.byte	0xf
	.byte	0x0
	.uleb128 0x14
	.long	.LASF105
	.byte	0xa
	.byte	0xa
	.value	0x13e
	.long	0xcf69
	.uleb128 0x15
	.long	.LASF106
	.byte	0xa
	.value	0x13f
	.long	0xcbf7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x15
	.long	.LASF107
	.byte	0xa
	.value	0x140
	.long	0xcbed
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x15
	.long	.LASF108
	.byte	0xa
	.value	0x141
	.long	0xcbed
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x15
	.long	.LASF109
	.byte	0xa
	.value	0x142
	.long	0xcbed
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x15
	.long	.LASF110
	.byte	0xa
	.value	0x143
	.long	0xcbed
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x15
	.long	.LASF111
	.byte	0xa
	.value	0x143
	.long	0xcbed
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x15
	.long	.LASF112
	.byte	0xa
	.value	0x143
	.long	0xcbed
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x15
	.long	.LASF113
	.byte	0xa
	.value	0x143
	.long	0xcbed
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x15
	.long	.LASF114
	.byte	0xa
	.value	0x143
	.long	0xcbed
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.byte	0x0
	.uleb128 0xd
	.long	.LASF433
	.byte	0x2c
	.byte	0x21
	.byte	0x10
	.long	0xcfa0
	.uleb128 0xa
	.long	.LASF233
	.byte	0x21
	.byte	0x11
	.long	0xcda1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF434
	.byte	0x21
	.byte	0x12
	.long	0xcd48
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0xa
	.long	.LASF435
	.byte	0x21
	.byte	0x12
	.long	0xcd48
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.byte	0x0
	.uleb128 0xd
	.long	.LASF436
	.byte	0x1f
	.byte	0x21
	.byte	0x1e
	.long	0xd00f
	.uleb128 0xa
	.long	.LASF437
	.byte	0x21
	.byte	0x1f
	.long	0xcc02
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF438
	.byte	0x21
	.byte	0x20
	.long	0xcc02
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF439
	.byte	0x21
	.byte	0x21
	.long	0xcc02
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF440
	.byte	0x21
	.byte	0x22
	.long	0xcbed
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF441
	.byte	0x21
	.byte	0x23
	.long	0xcbed
	.byte	0x2
	.byte	0x23
	.uleb128 0xd
	.uleb128 0xa
	.long	.LASF442
	.byte	0x21
	.byte	0x24
	.long	0xcbed
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF443
	.byte	0x21
	.byte	0x25
	.long	0xcec4
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xd
	.long	.LASF444
	.byte	0xd
	.byte	0x21
	.byte	0x2a
	.long	0xd054
	.uleb128 0xa
	.long	.LASF445
	.byte	0x21
	.byte	0x2b
	.long	0xcc02
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF446
	.byte	0x21
	.byte	0x2c
	.long	0xcc02
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF447
	.byte	0x21
	.byte	0x2d
	.long	0xcc02
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF448
	.byte	0x21
	.byte	0x2e
	.long	0xcbed
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0x0
	.uleb128 0x2
	.string	"u8"
	.byte	0x23
	.byte	0x9
	.long	0x33
	.uleb128 0x2
	.string	"u16"
	.byte	0x23
	.byte	0xb
	.long	0x4c
	.uleb128 0x2
	.string	"u32"
	.byte	0x23
	.byte	0xd
	.long	0x65
	.uleb128 0x2
	.string	"u64"
	.byte	0x23
	.byte	0xf
	.long	0x7e
	.uleb128 0x5
	.byte	0x8
	.byte	0x23
	.byte	0x14
	.long	0xd0a2
	.uleb128 0x6
	.string	"hi"
	.byte	0x23
	.byte	0x14
	.long	0xd069
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"lo"
	.byte	0x23
	.byte	0x14
	.long	0xd069
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x7
	.long	.LASF118
	.byte	0x8
	.byte	0x23
	.byte	0x13
	.long	0xd0bf
	.uleb128 0x8
	.long	0xd07f
	.uleb128 0x9
	.string	"val"
	.byte	0x23
	.byte	0x15
	.long	0xd074
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0x19
	.byte	0xbc
	.long	0xd0e4
	.uleb128 0xa
	.long	.LASF7
	.byte	0x19
	.byte	0xbd
	.long	0xd05e
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"seg"
	.byte	0x19
	.byte	0xbe
	.long	0xd05e
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0x19
	.byte	0xbb
	.long	0xd0fd
	.uleb128 0x8
	.long	0xd0bf
	.uleb128 0xc
	.long	.LASF8
	.byte	0x19
	.byte	0xc0
	.long	0xd069
	.byte	0x0
	.uleb128 0xd
	.long	.LASF33
	.byte	0x4
	.byte	0x19
	.byte	0xba
	.long	0xd112
	.uleb128 0xe
	.long	0xd0e4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0xf
	.long	0xd054
	.long	0xd122
	.uleb128 0x10
	.long	0x537
	.byte	0x3
	.byte	0x0
	.uleb128 0xd
	.long	.LASF119
	.byte	0x24
	.byte	0x24
	.byte	0x97
	.long	0xd1bb
	.uleb128 0xa
	.long	.LASF120
	.byte	0x24
	.byte	0xb0
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF121
	.byte	0x24
	.byte	0xb1
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF122
	.byte	0x24
	.byte	0xb2
	.long	0xd1c1
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF123
	.byte	0x24
	.byte	0xb3
	.long	0xd074
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF124
	.byte	0x24
	.byte	0xb4
	.long	0x53c
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF125
	.byte	0x24
	.byte	0xb5
	.long	0xd069
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.long	.LASF126
	.byte	0x24
	.byte	0xb6
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF127
	.byte	0x24
	.byte	0xb9
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF128
	.byte	0x24
	.byte	0xba
	.long	0xd05e
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF129
	.byte	0x24
	.byte	0xbb
	.long	0xd1c1
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0xd122
	.uleb128 0xd
	.long	.LASF130
	.byte	0x6
	.byte	0x24
	.byte	0xa9
	.long	0xd1f8
	.uleb128 0xa
	.long	.LASF131
	.byte	0x24
	.byte	0xaa
	.long	0xd05e
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF132
	.byte	0x24
	.byte	0xab
	.long	0xd05e
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.string	"spt"
	.byte	0x24
	.byte	0xac
	.long	0xd05e
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xd
	.long	.LASF210
	.byte	0xc4
	.byte	0x24
	.byte	0xd0
	.long	0xd22f
	.uleb128 0xa
	.long	.LASF211
	.byte	0x24
	.byte	0xd2
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF212
	.byte	0x24
	.byte	0xd3
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF213
	.byte	0x24
	.byte	0xd4
	.long	0xd22f
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xf
	.long	0xd1bb
	.long	0xd245
	.uleb128 0x10
	.long	0x537
	.byte	0x2
	.uleb128 0x10
	.long	0x537
	.byte	0xf
	.byte	0x0
	.uleb128 0xd
	.long	.LASF38
	.byte	0xbc
	.byte	0xa
	.byte	0x21
	.long	0xd607
	.uleb128 0xa
	.long	.LASF39
	.byte	0xa
	.byte	0x23
	.long	0xd607
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF40
	.byte	0xa
	.byte	0x24
	.long	0xd617
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF41
	.byte	0xa
	.byte	0x25
	.long	0xd05e
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF42
	.byte	0xa
	.byte	0x27
	.long	0xd05e
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF43
	.byte	0xa
	.byte	0x28
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0xa
	.long	.LASF44
	.byte	0xa
	.byte	0x29
	.long	0xd05e
	.byte	0x2
	.byte	0x23
	.uleb128 0x13
	.uleb128 0xa
	.long	.LASF45
	.byte	0xa
	.byte	0x2a
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x15
	.uleb128 0xa
	.long	.LASF46
	.byte	0xa
	.byte	0x2b
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x16
	.uleb128 0xa
	.long	.LASF47
	.byte	0xa
	.byte	0x2c
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x17
	.uleb128 0xa
	.long	.LASF48
	.byte	0xa
	.byte	0x2d
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF49
	.byte	0xa
	.byte	0x2e
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF50
	.byte	0xa
	.byte	0x2f
	.long	0xd05e
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF51
	.byte	0xa
	.byte	0x30
	.long	0xd05e
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.long	.LASF52
	.byte	0xa
	.byte	0x32
	.long	0xd627
	.byte	0x2
	.byte	0x23
	.uleb128 0x1e
	.uleb128 0xa
	.long	.LASF53
	.byte	0xa
	.byte	0x33
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x3e
	.uleb128 0xa
	.long	.LASF54
	.byte	0xa
	.byte	0x34
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x3f
	.uleb128 0xa
	.long	.LASF55
	.byte	0xa
	.byte	0x36
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0xa
	.long	.LASF56
	.byte	0xa
	.byte	0x37
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x41
	.uleb128 0xa
	.long	.LASF57
	.byte	0xa
	.byte	0x38
	.long	0xd637
	.byte	0x2
	.byte	0x23
	.uleb128 0x42
	.uleb128 0xa
	.long	.LASF58
	.byte	0xa
	.byte	0x39
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x49
	.uleb128 0xa
	.long	.LASF59
	.byte	0xa
	.byte	0x3a
	.long	0xd05e
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.uleb128 0xa
	.long	.LASF60
	.byte	0xa
	.byte	0x3b
	.long	0xd05e
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0xa
	.long	.LASF61
	.byte	0xa
	.byte	0x3c
	.long	0xd05e
	.byte	0x2
	.byte	0x23
	.uleb128 0x4e
	.uleb128 0xa
	.long	.LASF62
	.byte	0xa
	.byte	0x3e
	.long	0xd647
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0xa
	.long	.LASF63
	.byte	0xa
	.byte	0x40
	.long	0xd05e
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0xa
	.long	.LASF64
	.byte	0xa
	.byte	0x41
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x62
	.uleb128 0xa
	.long	.LASF65
	.byte	0xa
	.byte	0x42
	.long	0xd05e
	.byte	0x2
	.byte	0x23
	.uleb128 0x63
	.uleb128 0xa
	.long	.LASF66
	.byte	0xa
	.byte	0x43
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x65
	.uleb128 0xa
	.long	.LASF67
	.byte	0xa
	.byte	0x44
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x66
	.uleb128 0xa
	.long	.LASF68
	.byte	0xa
	.byte	0x45
	.long	0xd0fd
	.byte	0x2
	.byte	0x23
	.uleb128 0x67
	.uleb128 0xa
	.long	.LASF69
	.byte	0xa
	.byte	0x46
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x6b
	.uleb128 0xa
	.long	.LASF70
	.byte	0xa
	.byte	0x47
	.long	0xd069
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.uleb128 0xa
	.long	.LASF71
	.byte	0xa
	.byte	0x49
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0xa
	.long	.LASF72
	.byte	0xa
	.byte	0x4a
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x71
	.uleb128 0xa
	.long	.LASF73
	.byte	0xa
	.byte	0x4b
	.long	0xd05e
	.byte	0x2
	.byte	0x23
	.uleb128 0x72
	.uleb128 0xa
	.long	.LASF74
	.byte	0xa
	.byte	0x4c
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0xa
	.long	.LASF75
	.byte	0xa
	.byte	0x4d
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x75
	.uleb128 0xa
	.long	.LASF76
	.byte	0xa
	.byte	0x4e
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x76
	.uleb128 0xa
	.long	.LASF77
	.byte	0xa
	.byte	0x4f
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x77
	.uleb128 0xa
	.long	.LASF78
	.byte	0xa
	.byte	0x50
	.long	0xd112
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0xa
	.long	.LASF79
	.byte	0xa
	.byte	0x51
	.long	0xd112
	.byte	0x2
	.byte	0x23
	.uleb128 0x7c
	.uleb128 0xa
	.long	.LASF80
	.byte	0xa
	.byte	0x53
	.long	0xd05e
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0xa
	.long	.LASF81
	.byte	0xa
	.byte	0x54
	.long	0xd05e
	.byte	0x3
	.byte	0x23
	.uleb128 0x82
	.uleb128 0xa
	.long	.LASF82
	.byte	0xa
	.byte	0x55
	.long	0xd054
	.byte	0x3
	.byte	0x23
	.uleb128 0x84
	.uleb128 0xa
	.long	.LASF83
	.byte	0xa
	.byte	0x56
	.long	0xd05e
	.byte	0x3
	.byte	0x23
	.uleb128 0x85
	.uleb128 0xa
	.long	.LASF84
	.byte	0xa
	.byte	0x57
	.long	0xd054
	.byte	0x3
	.byte	0x23
	.uleb128 0x87
	.uleb128 0xa
	.long	.LASF85
	.byte	0xa
	.byte	0x58
	.long	0xd054
	.byte	0x3
	.byte	0x23
	.uleb128 0x88
	.uleb128 0xa
	.long	.LASF86
	.byte	0xa
	.byte	0x59
	.long	0xd054
	.byte	0x3
	.byte	0x23
	.uleb128 0x89
	.uleb128 0xa
	.long	.LASF87
	.byte	0xa
	.byte	0x5a
	.long	0xd054
	.byte	0x3
	.byte	0x23
	.uleb128 0x8a
	.uleb128 0xa
	.long	.LASF88
	.byte	0xa
	.byte	0x5b
	.long	0xd054
	.byte	0x3
	.byte	0x23
	.uleb128 0x8b
	.uleb128 0xa
	.long	.LASF89
	.byte	0xa
	.byte	0x5c
	.long	0xd054
	.byte	0x3
	.byte	0x23
	.uleb128 0x8c
	.uleb128 0xa
	.long	.LASF90
	.byte	0xa
	.byte	0x5d
	.long	0xd054
	.byte	0x3
	.byte	0x23
	.uleb128 0x8d
	.uleb128 0xa
	.long	.LASF91
	.byte	0xa
	.byte	0x5e
	.long	0xd054
	.byte	0x3
	.byte	0x23
	.uleb128 0x8e
	.uleb128 0xa
	.long	.LASF92
	.byte	0xa
	.byte	0x5f
	.long	0xd054
	.byte	0x3
	.byte	0x23
	.uleb128 0x8f
	.uleb128 0xa
	.long	.LASF93
	.byte	0xa
	.byte	0x61
	.long	0xd112
	.byte	0x3
	.byte	0x23
	.uleb128 0x90
	.uleb128 0xa
	.long	.LASF94
	.byte	0xa
	.byte	0x62
	.long	0xd657
	.byte	0x3
	.byte	0x23
	.uleb128 0x94
	.uleb128 0xa
	.long	.LASF95
	.byte	0xa
	.byte	0x63
	.long	0xd054
	.byte	0x3
	.byte	0x23
	.uleb128 0x96
	.uleb128 0xa
	.long	.LASF96
	.byte	0xa
	.byte	0x64
	.long	0xd054
	.byte	0x3
	.byte	0x23
	.uleb128 0x97
	.uleb128 0xa
	.long	.LASF97
	.byte	0xa
	.byte	0x65
	.long	0xd0fd
	.byte	0x3
	.byte	0x23
	.uleb128 0x98
	.uleb128 0xa
	.long	.LASF98
	.byte	0xa
	.byte	0x66
	.long	0xd069
	.byte	0x3
	.byte	0x23
	.uleb128 0x9c
	.uleb128 0xa
	.long	.LASF99
	.byte	0xa
	.byte	0x68
	.long	0xd054
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0xa
	.long	.LASF100
	.byte	0xa
	.byte	0x69
	.long	0xd637
	.byte	0x3
	.byte	0x23
	.uleb128 0xa1
	.uleb128 0xa
	.long	.LASF101
	.byte	0xa
	.byte	0x6a
	.long	0xd0fd
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0xa
	.long	.LASF102
	.byte	0xa
	.byte	0x6b
	.long	0xd112
	.byte	0x3
	.byte	0x23
	.uleb128 0xac
	.uleb128 0xa
	.long	.LASF103
	.byte	0xa
	.byte	0x6d
	.long	0xd667
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0xa
	.long	.LASF104
	.byte	0xa
	.byte	0x6e
	.long	0xd05e
	.byte	0x3
	.byte	0x23
	.uleb128 0xba
	.byte	0x0
	.uleb128 0xf
	.long	0xd05e
	.long	0xd617
	.uleb128 0x10
	.long	0x537
	.byte	0x3
	.byte	0x0
	.uleb128 0xf
	.long	0xd05e
	.long	0xd627
	.uleb128 0x10
	.long	0x537
	.byte	0x2
	.byte	0x0
	.uleb128 0xf
	.long	0xd054
	.long	0xd637
	.uleb128 0x10
	.long	0x537
	.byte	0x1f
	.byte	0x0
	.uleb128 0xf
	.long	0xd054
	.long	0xd647
	.uleb128 0x10
	.long	0x537
	.byte	0x6
	.byte	0x0
	.uleb128 0xf
	.long	0xd05e
	.long	0xd657
	.uleb128 0x10
	.long	0x537
	.byte	0x7
	.byte	0x0
	.uleb128 0xf
	.long	0xd054
	.long	0xd667
	.uleb128 0x10
	.long	0x537
	.byte	0x1
	.byte	0x0
	.uleb128 0xf
	.long	0xd054
	.long	0xd677
	.uleb128 0x10
	.long	0x537
	.byte	0x9
	.byte	0x0
	.uleb128 0x14
	.long	.LASF105
	.byte	0xa
	.byte	0xa
	.value	0x13e
	.long	0xd70c
	.uleb128 0x15
	.long	.LASF106
	.byte	0xa
	.value	0x13f
	.long	0xd05e
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x15
	.long	.LASF107
	.byte	0xa
	.value	0x140
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x15
	.long	.LASF108
	.byte	0xa
	.value	0x141
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x15
	.long	.LASF109
	.byte	0xa
	.value	0x142
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x15
	.long	.LASF110
	.byte	0xa
	.value	0x143
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x15
	.long	.LASF111
	.byte	0xa
	.value	0x143
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x15
	.long	.LASF112
	.byte	0xa
	.value	0x143
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x15
	.long	.LASF113
	.byte	0xa
	.value	0x143
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x15
	.long	.LASF114
	.byte	0xa
	.value	0x143
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.byte	0x0
	.uleb128 0xd
	.long	.LASF449
	.byte	0x14
	.byte	0x31
	.byte	0xd
	.long	0xd743
	.uleb128 0xa
	.long	.LASF450
	.byte	0x31
	.byte	0xe
	.long	0xd074
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF106
	.byte	0x31
	.byte	0xf
	.long	0xd074
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF120
	.byte	0x31
	.byte	0x10
	.long	0xd069
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0xd767
	.uleb128 0x6
	.string	"di"
	.byte	0xe
	.byte	0x28
	.long	0xd05e
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF9
	.byte	0xe
	.byte	0x28
	.long	0xd05e
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0xd7a8
	.uleb128 0xa
	.long	.LASF10
	.byte	0xe
	.byte	0x28
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF9
	.byte	0xe
	.byte	0x28
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF11
	.byte	0xe
	.byte	0x28
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF12
	.byte	0xe
	.byte	0x28
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0xd7c6
	.uleb128 0x9
	.string	"edi"
	.byte	0xe
	.byte	0x28
	.long	0xd069
	.uleb128 0x8
	.long	0xd743
	.uleb128 0x8
	.long	0xd767
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0xd7ea
	.uleb128 0x6
	.string	"si"
	.byte	0xe
	.byte	0x29
	.long	0xd05e
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF13
	.byte	0xe
	.byte	0x29
	.long	0xd05e
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0xd82b
	.uleb128 0xa
	.long	.LASF14
	.byte	0xe
	.byte	0x29
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF13
	.byte	0xe
	.byte	0x29
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF15
	.byte	0xe
	.byte	0x29
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF16
	.byte	0xe
	.byte	0x29
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0xd849
	.uleb128 0x9
	.string	"esi"
	.byte	0xe
	.byte	0x29
	.long	0xd069
	.uleb128 0x8
	.long	0xd7c6
	.uleb128 0x8
	.long	0xd7ea
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0xd86d
	.uleb128 0x6
	.string	"bp"
	.byte	0xe
	.byte	0x2a
	.long	0xd05e
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF17
	.byte	0xe
	.byte	0x2a
	.long	0xd05e
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0xd8ae
	.uleb128 0xa
	.long	.LASF18
	.byte	0xe
	.byte	0x2a
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF17
	.byte	0xe
	.byte	0x2a
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF19
	.byte	0xe
	.byte	0x2a
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF20
	.byte	0xe
	.byte	0x2a
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0xd8cc
	.uleb128 0x9
	.string	"ebp"
	.byte	0xe
	.byte	0x2a
	.long	0xd069
	.uleb128 0x8
	.long	0xd849
	.uleb128 0x8
	.long	0xd86d
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0xd8f0
	.uleb128 0x6
	.string	"bx"
	.byte	0xe
	.byte	0x2b
	.long	0xd05e
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF21
	.byte	0xe
	.byte	0x2b
	.long	0xd05e
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0xd92f
	.uleb128 0x6
	.string	"bl"
	.byte	0xe
	.byte	0x2b
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"bh"
	.byte	0xe
	.byte	0x2b
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF22
	.byte	0xe
	.byte	0x2b
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF23
	.byte	0xe
	.byte	0x2b
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0xd94d
	.uleb128 0x9
	.string	"ebx"
	.byte	0xe
	.byte	0x2b
	.long	0xd069
	.uleb128 0x8
	.long	0xd8cc
	.uleb128 0x8
	.long	0xd8f0
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0xd971
	.uleb128 0x6
	.string	"dx"
	.byte	0xe
	.byte	0x2c
	.long	0xd05e
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF24
	.byte	0xe
	.byte	0x2c
	.long	0xd05e
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0xd9b0
	.uleb128 0x6
	.string	"dl"
	.byte	0xe
	.byte	0x2c
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"dh"
	.byte	0xe
	.byte	0x2c
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF25
	.byte	0xe
	.byte	0x2c
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF26
	.byte	0xe
	.byte	0x2c
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0xd9ce
	.uleb128 0x9
	.string	"edx"
	.byte	0xe
	.byte	0x2c
	.long	0xd069
	.uleb128 0x8
	.long	0xd94d
	.uleb128 0x8
	.long	0xd971
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0xd9f2
	.uleb128 0x6
	.string	"cx"
	.byte	0xe
	.byte	0x2d
	.long	0xd05e
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF27
	.byte	0xe
	.byte	0x2d
	.long	0xd05e
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0xda31
	.uleb128 0x6
	.string	"cl"
	.byte	0xe
	.byte	0x2d
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"ch"
	.byte	0xe
	.byte	0x2d
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF28
	.byte	0xe
	.byte	0x2d
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF29
	.byte	0xe
	.byte	0x2d
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0xda4f
	.uleb128 0x9
	.string	"ecx"
	.byte	0xe
	.byte	0x2d
	.long	0xd069
	.uleb128 0x8
	.long	0xd9ce
	.uleb128 0x8
	.long	0xd9f2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0xda73
	.uleb128 0x6
	.string	"ax"
	.byte	0xe
	.byte	0x2e
	.long	0xd05e
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF30
	.byte	0xe
	.byte	0x2e
	.long	0xd05e
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0xdab2
	.uleb128 0x6
	.string	"al"
	.byte	0xe
	.byte	0x2e
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"ah"
	.byte	0xe
	.byte	0x2e
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF31
	.byte	0xe
	.byte	0x2e
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF32
	.byte	0xe
	.byte	0x2e
	.long	0xd054
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0xdad0
	.uleb128 0x9
	.string	"eax"
	.byte	0xe
	.byte	0x2e
	.long	0xd069
	.uleb128 0x8
	.long	0xda4f
	.uleb128 0x8
	.long	0xda73
	.byte	0x0
	.uleb128 0xd
	.long	.LASF34
	.byte	0x26
	.byte	0x8
	.byte	0xb1
	.long	0xdb4b
	.uleb128 0x6
	.string	"ds"
	.byte	0xe
	.byte	0x26
	.long	0xd05e
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"es"
	.byte	0xe
	.byte	0x27
	.long	0xd05e
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xe
	.long	0xd7a8
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xe
	.long	0xd82b
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xe
	.long	0xd8ae
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xe
	.long	0xd92f
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xe
	.long	0xd9b0
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xe
	.long	0xda31
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xe
	.long	0xdab2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.long	.LASF35
	.byte	0xe
	.byte	0x2f
	.long	0xd0fd
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xa
	.long	.LASF36
	.byte	0xe
	.byte	0x30
	.long	0xd05e
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.byte	0x0
	.uleb128 0x2
	.string	"u8"
	.byte	0x23
	.byte	0x9
	.long	0x33
	.uleb128 0x2
	.string	"u16"
	.byte	0x23
	.byte	0xb
	.long	0x4c
	.uleb128 0x2
	.string	"u32"
	.byte	0x23
	.byte	0xd
	.long	0x65
	.uleb128 0x2
	.string	"u64"
	.byte	0x23
	.byte	0xf
	.long	0x7e
	.uleb128 0x5
	.byte	0x8
	.byte	0x23
	.byte	0x14
	.long	0xdb99
	.uleb128 0x6
	.string	"hi"
	.byte	0x23
	.byte	0x14
	.long	0xdb60
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"lo"
	.byte	0x23
	.byte	0x14
	.long	0xdb60
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x7
	.long	.LASF118
	.byte	0x8
	.byte	0x23
	.byte	0x13
	.long	0xdbb6
	.uleb128 0x8
	.long	0xdb76
	.uleb128 0x9
	.string	"val"
	.byte	0x23
	.byte	0x15
	.long	0xdb6b
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0x19
	.byte	0xbc
	.long	0xdbdb
	.uleb128 0xa
	.long	.LASF7
	.byte	0x19
	.byte	0xbd
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"seg"
	.byte	0x19
	.byte	0xbe
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0x19
	.byte	0xbb
	.long	0xdbf4
	.uleb128 0x8
	.long	0xdbb6
	.uleb128 0xc
	.long	.LASF8
	.byte	0x19
	.byte	0xc0
	.long	0xdb60
	.byte	0x0
	.uleb128 0xd
	.long	.LASF33
	.byte	0x4
	.byte	0x19
	.byte	0xba
	.long	0xdc09
	.uleb128 0xe
	.long	0xdbdb
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0xd
	.long	.LASF451
	.byte	0x10
	.byte	0x24
	.byte	0x23
	.long	0xdc5c
	.uleb128 0xa
	.long	.LASF106
	.byte	0x24
	.byte	0x24
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF140
	.byte	0x24
	.byte	0x25
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF208
	.byte	0x24
	.byte	0x26
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF163
	.byte	0x24
	.byte	0x27
	.long	0xdbf4
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"lba"
	.byte	0x24
	.byte	0x28
	.long	0xdb6b
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0xd
	.long	.LASF452
	.byte	0x42
	.byte	0x24
	.byte	0x31
	.long	0xdd73
	.uleb128 0xa
	.long	.LASF106
	.byte	0x24
	.byte	0x32
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF453
	.byte	0x24
	.byte	0x33
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF132
	.byte	0x24
	.byte	0x34
	.long	0xdb60
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF131
	.byte	0x24
	.byte	0x35
	.long	0xdb60
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.string	"spt"
	.byte	0x24
	.byte	0x36
	.long	0xdb60
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF148
	.byte	0x24
	.byte	0x37
	.long	0xdb6b
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF128
	.byte	0x24
	.byte	0x38
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF454
	.byte	0x24
	.byte	0x39
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF455
	.byte	0x24
	.byte	0x3a
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x6
	.string	"key"
	.byte	0x24
	.byte	0x3b
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x1e
	.uleb128 0xa
	.long	.LASF456
	.byte	0x24
	.byte	0x3c
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xa
	.long	.LASF166
	.byte	0x24
	.byte	0x3d
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x21
	.uleb128 0xa
	.long	.LASF457
	.byte	0x24
	.byte	0x3e
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x22
	.uleb128 0xa
	.long	.LASF458
	.byte	0x24
	.byte	0x3f
	.long	0xdd73
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0xa
	.long	.LASF459
	.byte	0x24
	.byte	0x40
	.long	0xdd83
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0xa
	.long	.LASF460
	.byte	0x24
	.byte	0x41
	.long	0xdb6b
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0xa
	.long	.LASF461
	.byte	0x24
	.byte	0x42
	.long	0xdb6b
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0xa
	.long	.LASF462
	.byte	0x24
	.byte	0x43
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0xa
	.long	.LASF142
	.byte	0x24
	.byte	0x44
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x41
	.byte	0x0
	.uleb128 0xf
	.long	0xdb4b
	.long	0xdd83
	.uleb128 0x10
	.long	0x537
	.byte	0x3
	.byte	0x0
	.uleb128 0xf
	.long	0xdb4b
	.long	0xdd93
	.uleb128 0x10
	.long	0x537
	.byte	0x7
	.byte	0x0
	.uleb128 0xd
	.long	.LASF214
	.byte	0xb
	.byte	0x24
	.byte	0x4d
	.long	0xde3a
	.uleb128 0xa
	.long	.LASF215
	.byte	0x24
	.byte	0x4e
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF216
	.byte	0x24
	.byte	0x4f
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF217
	.byte	0x24
	.byte	0x50
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF218
	.byte	0x24
	.byte	0x51
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0xa
	.long	.LASF123
	.byte	0x24
	.byte	0x52
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF219
	.byte	0x24
	.byte	0x53
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0xa
	.long	.LASF220
	.byte	0x24
	.byte	0x54
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xa
	.long	.LASF221
	.byte	0x24
	.byte	0x55
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0xa
	.long	.LASF222
	.byte	0x24
	.byte	0x56
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF223
	.byte	0x24
	.byte	0x57
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0xa
	.long	.LASF224
	.byte	0x24
	.byte	0x58
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.byte	0x0
	.uleb128 0xd
	.long	.LASF463
	.byte	0xe
	.byte	0x24
	.byte	0x5b
	.long	0xde7f
	.uleb128 0x6
	.string	"dbt"
	.byte	0x24
	.byte	0x5c
	.long	0xdd93
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF464
	.byte	0x24
	.byte	0x5e
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0xb
	.uleb128 0xa
	.long	.LASF465
	.byte	0x24
	.byte	0x5f
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF466
	.byte	0x24
	.byte	0x60
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0xd
	.byte	0x0
	.uleb128 0xd
	.long	.LASF205
	.byte	0x14
	.byte	0x24
	.byte	0x94
	.long	0xded2
	.uleb128 0x6
	.string	"lba"
	.byte	0x24
	.byte	0x95
	.long	0xdb6b
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF206
	.byte	0x24
	.byte	0x96
	.long	0x53a
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF207
	.byte	0x24
	.byte	0x97
	.long	0xdf6b
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF208
	.byte	0x24
	.byte	0x98
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF209
	.byte	0x24
	.byte	0x99
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.byte	0x0
	.uleb128 0xd
	.long	.LASF119
	.byte	0x24
	.byte	0x24
	.byte	0x97
	.long	0xdf6b
	.uleb128 0xa
	.long	.LASF120
	.byte	0x24
	.byte	0xb0
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF121
	.byte	0x24
	.byte	0xb1
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF122
	.byte	0x24
	.byte	0xb2
	.long	0xdf71
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF123
	.byte	0x24
	.byte	0xb3
	.long	0xdb6b
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF124
	.byte	0x24
	.byte	0xb4
	.long	0x53c
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF125
	.byte	0x24
	.byte	0xb5
	.long	0xdb60
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.long	.LASF126
	.byte	0x24
	.byte	0xb6
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF127
	.byte	0x24
	.byte	0xb9
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF128
	.byte	0x24
	.byte	0xba
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF129
	.byte	0x24
	.byte	0xbb
	.long	0xdf71
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0xded2
	.uleb128 0xd
	.long	.LASF130
	.byte	0x6
	.byte	0x24
	.byte	0xa9
	.long	0xdfa8
	.uleb128 0xa
	.long	.LASF131
	.byte	0x24
	.byte	0xaa
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF132
	.byte	0x24
	.byte	0xab
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.string	"spt"
	.byte	0x24
	.byte	0xac
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xd
	.long	.LASF210
	.byte	0xc4
	.byte	0x24
	.byte	0xd0
	.long	0xdfdf
	.uleb128 0xa
	.long	.LASF211
	.byte	0x24
	.byte	0xd2
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF212
	.byte	0x24
	.byte	0xd3
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF213
	.byte	0x24
	.byte	0xd4
	.long	0xdfdf
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xf
	.long	0xdf6b
	.long	0xdff5
	.uleb128 0x10
	.long	0x537
	.byte	0x2
	.uleb128 0x10
	.long	0x537
	.byte	0xf
	.byte	0x0
	.uleb128 0xd
	.long	.LASF38
	.byte	0xbc
	.byte	0xa
	.byte	0x21
	.long	0xe3b7
	.uleb128 0xa
	.long	.LASF39
	.byte	0xa
	.byte	0x23
	.long	0xe3b7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF40
	.byte	0xa
	.byte	0x24
	.long	0xe3c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF41
	.byte	0xa
	.byte	0x25
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF42
	.byte	0xa
	.byte	0x27
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF43
	.byte	0xa
	.byte	0x28
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0xa
	.long	.LASF44
	.byte	0xa
	.byte	0x29
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x13
	.uleb128 0xa
	.long	.LASF45
	.byte	0xa
	.byte	0x2a
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x15
	.uleb128 0xa
	.long	.LASF46
	.byte	0xa
	.byte	0x2b
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x16
	.uleb128 0xa
	.long	.LASF47
	.byte	0xa
	.byte	0x2c
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x17
	.uleb128 0xa
	.long	.LASF48
	.byte	0xa
	.byte	0x2d
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF49
	.byte	0xa
	.byte	0x2e
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF50
	.byte	0xa
	.byte	0x2f
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF51
	.byte	0xa
	.byte	0x30
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.long	.LASF52
	.byte	0xa
	.byte	0x32
	.long	0xe3d7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1e
	.uleb128 0xa
	.long	.LASF53
	.byte	0xa
	.byte	0x33
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x3e
	.uleb128 0xa
	.long	.LASF54
	.byte	0xa
	.byte	0x34
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x3f
	.uleb128 0xa
	.long	.LASF55
	.byte	0xa
	.byte	0x36
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0xa
	.long	.LASF56
	.byte	0xa
	.byte	0x37
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x41
	.uleb128 0xa
	.long	.LASF57
	.byte	0xa
	.byte	0x38
	.long	0xe3e7
	.byte	0x2
	.byte	0x23
	.uleb128 0x42
	.uleb128 0xa
	.long	.LASF58
	.byte	0xa
	.byte	0x39
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x49
	.uleb128 0xa
	.long	.LASF59
	.byte	0xa
	.byte	0x3a
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.uleb128 0xa
	.long	.LASF60
	.byte	0xa
	.byte	0x3b
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0xa
	.long	.LASF61
	.byte	0xa
	.byte	0x3c
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x4e
	.uleb128 0xa
	.long	.LASF62
	.byte	0xa
	.byte	0x3e
	.long	0xe3f7
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0xa
	.long	.LASF63
	.byte	0xa
	.byte	0x40
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0xa
	.long	.LASF64
	.byte	0xa
	.byte	0x41
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x62
	.uleb128 0xa
	.long	.LASF65
	.byte	0xa
	.byte	0x42
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x63
	.uleb128 0xa
	.long	.LASF66
	.byte	0xa
	.byte	0x43
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x65
	.uleb128 0xa
	.long	.LASF67
	.byte	0xa
	.byte	0x44
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x66
	.uleb128 0xa
	.long	.LASF68
	.byte	0xa
	.byte	0x45
	.long	0xdbf4
	.byte	0x2
	.byte	0x23
	.uleb128 0x67
	.uleb128 0xa
	.long	.LASF69
	.byte	0xa
	.byte	0x46
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x6b
	.uleb128 0xa
	.long	.LASF70
	.byte	0xa
	.byte	0x47
	.long	0xdb60
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.uleb128 0xa
	.long	.LASF71
	.byte	0xa
	.byte	0x49
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0xa
	.long	.LASF72
	.byte	0xa
	.byte	0x4a
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x71
	.uleb128 0xa
	.long	.LASF73
	.byte	0xa
	.byte	0x4b
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x72
	.uleb128 0xa
	.long	.LASF74
	.byte	0xa
	.byte	0x4c
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0xa
	.long	.LASF75
	.byte	0xa
	.byte	0x4d
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x75
	.uleb128 0xa
	.long	.LASF76
	.byte	0xa
	.byte	0x4e
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x76
	.uleb128 0xa
	.long	.LASF77
	.byte	0xa
	.byte	0x4f
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x77
	.uleb128 0xa
	.long	.LASF78
	.byte	0xa
	.byte	0x50
	.long	0xdd73
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0xa
	.long	.LASF79
	.byte	0xa
	.byte	0x51
	.long	0xdd73
	.byte	0x2
	.byte	0x23
	.uleb128 0x7c
	.uleb128 0xa
	.long	.LASF80
	.byte	0xa
	.byte	0x53
	.long	0xdb55
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0xa
	.long	.LASF81
	.byte	0xa
	.byte	0x54
	.long	0xdb55
	.byte	0x3
	.byte	0x23
	.uleb128 0x82
	.uleb128 0xa
	.long	.LASF82
	.byte	0xa
	.byte	0x55
	.long	0xdb4b
	.byte	0x3
	.byte	0x23
	.uleb128 0x84
	.uleb128 0xa
	.long	.LASF83
	.byte	0xa
	.byte	0x56
	.long	0xdb55
	.byte	0x3
	.byte	0x23
	.uleb128 0x85
	.uleb128 0xa
	.long	.LASF84
	.byte	0xa
	.byte	0x57
	.long	0xdb4b
	.byte	0x3
	.byte	0x23
	.uleb128 0x87
	.uleb128 0xa
	.long	.LASF85
	.byte	0xa
	.byte	0x58
	.long	0xdb4b
	.byte	0x3
	.byte	0x23
	.uleb128 0x88
	.uleb128 0xa
	.long	.LASF86
	.byte	0xa
	.byte	0x59
	.long	0xdb4b
	.byte	0x3
	.byte	0x23
	.uleb128 0x89
	.uleb128 0xa
	.long	.LASF87
	.byte	0xa
	.byte	0x5a
	.long	0xdb4b
	.byte	0x3
	.byte	0x23
	.uleb128 0x8a
	.uleb128 0xa
	.long	.LASF88
	.byte	0xa
	.byte	0x5b
	.long	0xdb4b
	.byte	0x3
	.byte	0x23
	.uleb128 0x8b
	.uleb128 0xa
	.long	.LASF89
	.byte	0xa
	.byte	0x5c
	.long	0xdb4b
	.byte	0x3
	.byte	0x23
	.uleb128 0x8c
	.uleb128 0xa
	.long	.LASF90
	.byte	0xa
	.byte	0x5d
	.long	0xdb4b
	.byte	0x3
	.byte	0x23
	.uleb128 0x8d
	.uleb128 0xa
	.long	.LASF91
	.byte	0xa
	.byte	0x5e
	.long	0xdb4b
	.byte	0x3
	.byte	0x23
	.uleb128 0x8e
	.uleb128 0xa
	.long	.LASF92
	.byte	0xa
	.byte	0x5f
	.long	0xdb4b
	.byte	0x3
	.byte	0x23
	.uleb128 0x8f
	.uleb128 0xa
	.long	.LASF93
	.byte	0xa
	.byte	0x61
	.long	0xdd73
	.byte	0x3
	.byte	0x23
	.uleb128 0x90
	.uleb128 0xa
	.long	.LASF94
	.byte	0xa
	.byte	0x62
	.long	0xe407
	.byte	0x3
	.byte	0x23
	.uleb128 0x94
	.uleb128 0xa
	.long	.LASF95
	.byte	0xa
	.byte	0x63
	.long	0xdb4b
	.byte	0x3
	.byte	0x23
	.uleb128 0x96
	.uleb128 0xa
	.long	.LASF96
	.byte	0xa
	.byte	0x64
	.long	0xdb4b
	.byte	0x3
	.byte	0x23
	.uleb128 0x97
	.uleb128 0xa
	.long	.LASF97
	.byte	0xa
	.byte	0x65
	.long	0xdbf4
	.byte	0x3
	.byte	0x23
	.uleb128 0x98
	.uleb128 0xa
	.long	.LASF98
	.byte	0xa
	.byte	0x66
	.long	0xdb60
	.byte	0x3
	.byte	0x23
	.uleb128 0x9c
	.uleb128 0xa
	.long	.LASF99
	.byte	0xa
	.byte	0x68
	.long	0xdb4b
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0xa
	.long	.LASF100
	.byte	0xa
	.byte	0x69
	.long	0xe3e7
	.byte	0x3
	.byte	0x23
	.uleb128 0xa1
	.uleb128 0xa
	.long	.LASF101
	.byte	0xa
	.byte	0x6a
	.long	0xdbf4
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0xa
	.long	.LASF102
	.byte	0xa
	.byte	0x6b
	.long	0xdd73
	.byte	0x3
	.byte	0x23
	.uleb128 0xac
	.uleb128 0xa
	.long	.LASF103
	.byte	0xa
	.byte	0x6d
	.long	0xe417
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0xa
	.long	.LASF104
	.byte	0xa
	.byte	0x6e
	.long	0xdb55
	.byte	0x3
	.byte	0x23
	.uleb128 0xba
	.byte	0x0
	.uleb128 0xf
	.long	0xdb55
	.long	0xe3c7
	.uleb128 0x10
	.long	0x537
	.byte	0x3
	.byte	0x0
	.uleb128 0xf
	.long	0xdb55
	.long	0xe3d7
	.uleb128 0x10
	.long	0x537
	.byte	0x2
	.byte	0x0
	.uleb128 0xf
	.long	0xdb4b
	.long	0xe3e7
	.uleb128 0x10
	.long	0x537
	.byte	0x1f
	.byte	0x0
	.uleb128 0xf
	.long	0xdb4b
	.long	0xe3f7
	.uleb128 0x10
	.long	0x537
	.byte	0x6
	.byte	0x0
	.uleb128 0xf
	.long	0xdb55
	.long	0xe407
	.uleb128 0x10
	.long	0x537
	.byte	0x7
	.byte	0x0
	.uleb128 0xf
	.long	0xdb4b
	.long	0xe417
	.uleb128 0x10
	.long	0x537
	.byte	0x1
	.byte	0x0
	.uleb128 0xf
	.long	0xdb4b
	.long	0xe427
	.uleb128 0x10
	.long	0x537
	.byte	0x9
	.byte	0x0
	.uleb128 0xd
	.long	.LASF133
	.byte	0x10
	.byte	0xa
	.byte	0x92
	.long	0xe4dc
	.uleb128 0xa
	.long	.LASF134
	.byte	0xa
	.byte	0x93
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF135
	.byte	0xa
	.byte	0x94
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF136
	.byte	0xa
	.byte	0x95
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF137
	.byte	0xa
	.byte	0x96
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x6
	.string	"irq"
	.byte	0xa
	.byte	0x97
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xa
	.long	.LASF138
	.byte	0xa
	.byte	0x98
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x6
	.string	"dma"
	.byte	0xa
	.byte	0x99
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.string	"pio"
	.byte	0xa
	.byte	0x9a
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0xa
	.long	.LASF139
	.byte	0xa
	.byte	0x9b
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xa
	.long	.LASF140
	.byte	0xa
	.byte	0x9c
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF141
	.byte	0xa
	.byte	0x9d
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF142
	.byte	0xa
	.byte	0x9e
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xd
	.long	.LASF143
	.byte	0x18
	.byte	0xa
	.byte	0xa2
	.long	0xe567
	.uleb128 0xa
	.long	.LASF144
	.byte	0xa
	.byte	0xa3
	.long	0xdf6b
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF145
	.byte	0xa
	.byte	0xa4
	.long	0xdb60
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF146
	.byte	0xa
	.byte	0xa5
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF147
	.byte	0xa
	.byte	0xa6
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xa
	.long	.LASF148
	.byte	0xa
	.byte	0xa7
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF149
	.byte	0xa
	.byte	0xa8
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF150
	.byte	0xa
	.byte	0xa9
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.uleb128 0xa
	.long	.LASF151
	.byte	0xa
	.byte	0xaa
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF122
	.byte	0xa
	.byte	0xad
	.long	0xdf71
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.byte	0x0
	.uleb128 0xd
	.long	.LASF152
	.byte	0x10
	.byte	0xa
	.byte	0xb0
	.long	0xe61c
	.uleb128 0xa
	.long	.LASF132
	.byte	0xa
	.byte	0xb1
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF131
	.byte	0xa
	.byte	0xb2
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF153
	.byte	0xa
	.byte	0xb3
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0xa
	.long	.LASF154
	.byte	0xa
	.byte	0xb4
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF155
	.byte	0xa
	.byte	0xb5
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0xa
	.long	.LASF140
	.byte	0xa
	.byte	0xb6
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0xa
	.long	.LASF156
	.byte	0xa
	.byte	0xb7
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF157
	.byte	0xa
	.byte	0xb8
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0xa
	.long	.LASF158
	.byte	0xa
	.byte	0xb9
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0xb
	.uleb128 0xa
	.long	.LASF159
	.byte	0xa
	.byte	0xba
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF123
	.byte	0xa
	.byte	0xbb
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xa
	.long	.LASF142
	.byte	0xa
	.byte	0xbc
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.byte	0x0
	.uleb128 0x5
	.byte	0x8
	.byte	0xa
	.byte	0xc1
	.long	0xe64f
	.uleb128 0xa
	.long	.LASF160
	.byte	0xa
	.byte	0xc2
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF161
	.byte	0xa
	.byte	0xc3
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF162
	.byte	0xa
	.byte	0xc4
	.long	0xe64f
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0xf
	.long	0xdb4b
	.long	0xe65f
	.uleb128 0x10
	.long	0x537
	.byte	0x5
	.byte	0x0
	.uleb128 0xb
	.byte	0x8
	.byte	0xa
	.byte	0xc0
	.long	0xe678
	.uleb128 0x8
	.long	0xe61c
	.uleb128 0xc
	.long	.LASF163
	.byte	0xa
	.byte	0xc6
	.long	0xdb6b
	.byte	0x0
	.uleb128 0xd
	.long	.LASF164
	.byte	0x8
	.byte	0xa
	.byte	0xbf
	.long	0xe68d
	.uleb128 0xe
	.long	0xe65f
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x16
	.long	.LASF165
	.value	0xb68
	.byte	0xa
	.byte	0xca
	.long	0xe7a0
	.uleb128 0xa
	.long	.LASF106
	.byte	0xa
	.byte	0xcb
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF166
	.byte	0xa
	.byte	0xcc
	.long	0xe7a0
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF167
	.byte	0xa
	.byte	0xcd
	.long	0xdbf4
	.byte	0x2
	.byte	0x23
	.uleb128 0x22
	.uleb128 0xa
	.long	.LASF168
	.byte	0xa
	.byte	0xce
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x26
	.uleb128 0xa
	.long	.LASF169
	.byte	0xa
	.byte	0xcf
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x27
	.uleb128 0xa
	.long	.LASF170
	.byte	0xa
	.byte	0xd0
	.long	0xdd83
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0xa
	.long	.LASF171
	.byte	0xa
	.byte	0xd2
	.long	0xe7b0
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0xa
	.long	.LASF172
	.byte	0xa
	.byte	0xd5
	.long	0xe7c0
	.byte	0x2
	.byte	0x23
	.uleb128 0x3d
	.uleb128 0xa
	.long	.LASF173
	.byte	0xa
	.byte	0xd8
	.long	0xe7d0
	.byte	0x2
	.byte	0x23
	.uleb128 0x5d
	.uleb128 0xa
	.long	.LASF174
	.byte	0xa
	.byte	0xdb
	.long	0xdb4b
	.byte	0x3
	.byte	0x23
	.uleb128 0x121
	.uleb128 0xa
	.long	.LASF175
	.byte	0xa
	.byte	0xdc
	.long	0xe678
	.byte	0x3
	.byte	0x23
	.uleb128 0x122
	.uleb128 0xa
	.long	.LASF176
	.byte	0xa
	.byte	0xde
	.long	0x6c
	.byte	0x3
	.byte	0x23
	.uleb128 0x12a
	.uleb128 0xa
	.long	.LASF177
	.byte	0xa
	.byte	0xe1
	.long	0xe4dc
	.byte	0x3
	.byte	0x23
	.uleb128 0x12e
	.uleb128 0xa
	.long	.LASF178
	.byte	0xa
	.byte	0xe4
	.long	0xe427
	.byte	0x3
	.byte	0x23
	.uleb128 0x146
	.uleb128 0xa
	.long	.LASF179
	.byte	0xa
	.byte	0xe7
	.long	0xe7e0
	.byte	0x3
	.byte	0x23
	.uleb128 0x156
	.uleb128 0xa
	.long	.LASF180
	.byte	0xa
	.byte	0xe9
	.long	0xdb55
	.byte	0x3
	.byte	0x23
	.uleb128 0x166
	.uleb128 0xa
	.long	.LASF181
	.byte	0xa
	.byte	0xec
	.long	0xe7f0
	.byte	0x3
	.byte	0x23
	.uleb128 0x168
	.uleb128 0xa
	.long	.LASF182
	.byte	0xa
	.byte	0xee
	.long	0xe801
	.byte	0x3
	.byte	0x23
	.uleb128 0x368
	.byte	0x0
	.uleb128 0xf
	.long	0xdb4b
	.long	0xe7b0
	.uleb128 0x10
	.long	0x537
	.byte	0x20
	.byte	0x0
	.uleb128 0xf
	.long	0xdb4b
	.long	0xe7c0
	.uleb128 0x10
	.long	0x537
	.byte	0xc
	.byte	0x0
	.uleb128 0xf
	.long	0xe567
	.long	0xe7d0
	.uleb128 0x10
	.long	0x537
	.byte	0x1
	.byte	0x0
	.uleb128 0xf
	.long	0xdb4b
	.long	0xe7e0
	.uleb128 0x10
	.long	0x537
	.byte	0xc3
	.byte	0x0
	.uleb128 0xf
	.long	0xdb4b
	.long	0xe7f0
	.uleb128 0x10
	.long	0x537
	.byte	0xf
	.byte	0x0
	.uleb128 0xf
	.long	0xdb4b
	.long	0xe801
	.uleb128 0x17
	.long	0x537
	.value	0x1ff
	.byte	0x0
	.uleb128 0xf
	.long	0xdb4b
	.long	0xe812
	.uleb128 0x17
	.long	0x537
	.value	0x7ff
	.byte	0x0
	.uleb128 0x14
	.long	.LASF105
	.byte	0xa
	.byte	0xa
	.value	0x13e
	.long	0xe8a7
	.uleb128 0x15
	.long	.LASF106
	.byte	0xa
	.value	0x13f
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x15
	.long	.LASF107
	.byte	0xa
	.value	0x140
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x15
	.long	.LASF108
	.byte	0xa
	.value	0x141
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x15
	.long	.LASF109
	.byte	0xa
	.value	0x142
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x15
	.long	.LASF110
	.byte	0xa
	.value	0x143
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x15
	.long	.LASF111
	.byte	0xa
	.value	0x143
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x15
	.long	.LASF112
	.byte	0xa
	.value	0x143
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x15
	.long	.LASF113
	.byte	0xa
	.value	0x143
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x15
	.long	.LASF114
	.byte	0xa
	.value	0x143
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0xe8cb
	.uleb128 0x6
	.string	"di"
	.byte	0xe
	.byte	0x28
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF9
	.byte	0xe
	.byte	0x28
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0xe90c
	.uleb128 0xa
	.long	.LASF10
	.byte	0xe
	.byte	0x28
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF9
	.byte	0xe
	.byte	0x28
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF11
	.byte	0xe
	.byte	0x28
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF12
	.byte	0xe
	.byte	0x28
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0xe92a
	.uleb128 0x9
	.string	"edi"
	.byte	0xe
	.byte	0x28
	.long	0xdb60
	.uleb128 0x8
	.long	0xe8a7
	.uleb128 0x8
	.long	0xe8cb
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0xe94e
	.uleb128 0x6
	.string	"si"
	.byte	0xe
	.byte	0x29
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF13
	.byte	0xe
	.byte	0x29
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0xe98f
	.uleb128 0xa
	.long	.LASF14
	.byte	0xe
	.byte	0x29
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF13
	.byte	0xe
	.byte	0x29
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF15
	.byte	0xe
	.byte	0x29
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF16
	.byte	0xe
	.byte	0x29
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0xe9ad
	.uleb128 0x9
	.string	"esi"
	.byte	0xe
	.byte	0x29
	.long	0xdb60
	.uleb128 0x8
	.long	0xe92a
	.uleb128 0x8
	.long	0xe94e
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0xe9d1
	.uleb128 0x6
	.string	"bp"
	.byte	0xe
	.byte	0x2a
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF17
	.byte	0xe
	.byte	0x2a
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0xea12
	.uleb128 0xa
	.long	.LASF18
	.byte	0xe
	.byte	0x2a
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF17
	.byte	0xe
	.byte	0x2a
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF19
	.byte	0xe
	.byte	0x2a
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF20
	.byte	0xe
	.byte	0x2a
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0xea30
	.uleb128 0x9
	.string	"ebp"
	.byte	0xe
	.byte	0x2a
	.long	0xdb60
	.uleb128 0x8
	.long	0xe9ad
	.uleb128 0x8
	.long	0xe9d1
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0xea54
	.uleb128 0x6
	.string	"bx"
	.byte	0xe
	.byte	0x2b
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF21
	.byte	0xe
	.byte	0x2b
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0xea93
	.uleb128 0x6
	.string	"bl"
	.byte	0xe
	.byte	0x2b
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"bh"
	.byte	0xe
	.byte	0x2b
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF22
	.byte	0xe
	.byte	0x2b
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF23
	.byte	0xe
	.byte	0x2b
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0xeab1
	.uleb128 0x9
	.string	"ebx"
	.byte	0xe
	.byte	0x2b
	.long	0xdb60
	.uleb128 0x8
	.long	0xea30
	.uleb128 0x8
	.long	0xea54
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0xead5
	.uleb128 0x6
	.string	"dx"
	.byte	0xe
	.byte	0x2c
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF24
	.byte	0xe
	.byte	0x2c
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0xeb14
	.uleb128 0x6
	.string	"dl"
	.byte	0xe
	.byte	0x2c
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"dh"
	.byte	0xe
	.byte	0x2c
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF25
	.byte	0xe
	.byte	0x2c
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF26
	.byte	0xe
	.byte	0x2c
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0xeb32
	.uleb128 0x9
	.string	"edx"
	.byte	0xe
	.byte	0x2c
	.long	0xdb60
	.uleb128 0x8
	.long	0xeab1
	.uleb128 0x8
	.long	0xead5
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0xeb56
	.uleb128 0x6
	.string	"cx"
	.byte	0xe
	.byte	0x2d
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF27
	.byte	0xe
	.byte	0x2d
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0xeb95
	.uleb128 0x6
	.string	"cl"
	.byte	0xe
	.byte	0x2d
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"ch"
	.byte	0xe
	.byte	0x2d
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF28
	.byte	0xe
	.byte	0x2d
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF29
	.byte	0xe
	.byte	0x2d
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0xebb3
	.uleb128 0x9
	.string	"ecx"
	.byte	0xe
	.byte	0x2d
	.long	0xdb60
	.uleb128 0x8
	.long	0xeb32
	.uleb128 0x8
	.long	0xeb56
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0xebd7
	.uleb128 0x6
	.string	"ax"
	.byte	0xe
	.byte	0x2e
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF30
	.byte	0xe
	.byte	0x2e
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0xec16
	.uleb128 0x6
	.string	"al"
	.byte	0xe
	.byte	0x2e
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"ah"
	.byte	0xe
	.byte	0x2e
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF31
	.byte	0xe
	.byte	0x2e
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF32
	.byte	0xe
	.byte	0x2e
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0xec34
	.uleb128 0x9
	.string	"eax"
	.byte	0xe
	.byte	0x2e
	.long	0xdb60
	.uleb128 0x8
	.long	0xebb3
	.uleb128 0x8
	.long	0xebd7
	.byte	0x0
	.uleb128 0xd
	.long	.LASF34
	.byte	0x26
	.byte	0x24
	.byte	0x64
	.long	0xecaf
	.uleb128 0x6
	.string	"ds"
	.byte	0xe
	.byte	0x26
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"es"
	.byte	0xe
	.byte	0x27
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xe
	.long	0xe90c
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xe
	.long	0xe98f
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xe
	.long	0xea12
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xe
	.long	0xea93
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xe
	.long	0xeb14
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xe
	.long	0xeb95
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xe
	.long	0xec16
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.long	.LASF35
	.byte	0xe
	.byte	0x2f
	.long	0xdbf4
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xa
	.long	.LASF36
	.byte	0xe
	.byte	0x30
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xd
	.long	.LASF228
	.byte	0xc
	.byte	0x26
	.byte	0x8
	.long	0xed10
	.uleb128 0xa
	.long	.LASF134
	.byte	0x26
	.byte	0x9
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF135
	.byte	0x26
	.byte	0xa
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF229
	.byte	0x26
	.byte	0xb
	.long	0xdb55
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"irq"
	.byte	0x26
	.byte	0xc
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xa
	.long	.LASF230
	.byte	0x26
	.byte	0xd
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0xa
	.long	.LASF231
	.byte	0x26
	.byte	0xe
	.long	0x6c
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0xd
	.long	.LASF232
	.byte	0x2c
	.byte	0x26
	.byte	0x11
	.long	0xed47
	.uleb128 0xa
	.long	.LASF233
	.byte	0x26
	.byte	0x12
	.long	0xded2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF234
	.byte	0x26
	.byte	0x13
	.long	0xed47
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0xa
	.long	.LASF235
	.byte	0x26
	.byte	0x14
	.long	0xdb4b
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0xecaf
	.uleb128 0x2
	.string	"u8"
	.byte	0x23
	.byte	0x9
	.long	0x33
	.uleb128 0x2
	.string	"u16"
	.byte	0x23
	.byte	0xb
	.long	0x4c
	.uleb128 0x2
	.string	"u32"
	.byte	0x23
	.byte	0xd
	.long	0x65
	.uleb128 0x2
	.string	"u64"
	.byte	0x23
	.byte	0xf
	.long	0x7e
	.uleb128 0x5
	.byte	0x8
	.byte	0x23
	.byte	0x14
	.long	0xed9b
	.uleb128 0x6
	.string	"hi"
	.byte	0x23
	.byte	0x14
	.long	0xed62
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"lo"
	.byte	0x23
	.byte	0x14
	.long	0xed62
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x7
	.long	.LASF118
	.byte	0x8
	.byte	0x23
	.byte	0x13
	.long	0xedb8
	.uleb128 0x8
	.long	0xed78
	.uleb128 0x9
	.string	"val"
	.byte	0x23
	.byte	0x15
	.long	0xed6d
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0x19
	.byte	0xbc
	.long	0xeddd
	.uleb128 0xa
	.long	.LASF7
	.byte	0x19
	.byte	0xbd
	.long	0xed57
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"seg"
	.byte	0x19
	.byte	0xbe
	.long	0xed57
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0x19
	.byte	0xbb
	.long	0xedf6
	.uleb128 0x8
	.long	0xedb8
	.uleb128 0xc
	.long	.LASF8
	.byte	0x19
	.byte	0xc0
	.long	0xed62
	.byte	0x0
	.uleb128 0xd
	.long	.LASF33
	.byte	0x4
	.byte	0x19
	.byte	0xba
	.long	0xee0b
	.uleb128 0xe
	.long	0xeddd
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0xee2f
	.uleb128 0x6
	.string	"di"
	.byte	0xe
	.byte	0x28
	.long	0xed57
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF9
	.byte	0xe
	.byte	0x28
	.long	0xed57
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0xee70
	.uleb128 0xa
	.long	.LASF10
	.byte	0xe
	.byte	0x28
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF9
	.byte	0xe
	.byte	0x28
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF11
	.byte	0xe
	.byte	0x28
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF12
	.byte	0xe
	.byte	0x28
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x28
	.long	0xee8e
	.uleb128 0x9
	.string	"edi"
	.byte	0xe
	.byte	0x28
	.long	0xed62
	.uleb128 0x8
	.long	0xee0b
	.uleb128 0x8
	.long	0xee2f
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0xeeb2
	.uleb128 0x6
	.string	"si"
	.byte	0xe
	.byte	0x29
	.long	0xed57
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF13
	.byte	0xe
	.byte	0x29
	.long	0xed57
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0xeef3
	.uleb128 0xa
	.long	.LASF14
	.byte	0xe
	.byte	0x29
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF13
	.byte	0xe
	.byte	0x29
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF15
	.byte	0xe
	.byte	0x29
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF16
	.byte	0xe
	.byte	0x29
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x29
	.long	0xef11
	.uleb128 0x9
	.string	"esi"
	.byte	0xe
	.byte	0x29
	.long	0xed62
	.uleb128 0x8
	.long	0xee8e
	.uleb128 0x8
	.long	0xeeb2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0xef35
	.uleb128 0x6
	.string	"bp"
	.byte	0xe
	.byte	0x2a
	.long	0xed57
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF17
	.byte	0xe
	.byte	0x2a
	.long	0xed57
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0xef76
	.uleb128 0xa
	.long	.LASF18
	.byte	0xe
	.byte	0x2a
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF17
	.byte	0xe
	.byte	0x2a
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF19
	.byte	0xe
	.byte	0x2a
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF20
	.byte	0xe
	.byte	0x2a
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0xef94
	.uleb128 0x9
	.string	"ebp"
	.byte	0xe
	.byte	0x2a
	.long	0xed62
	.uleb128 0x8
	.long	0xef11
	.uleb128 0x8
	.long	0xef35
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0xefb8
	.uleb128 0x6
	.string	"bx"
	.byte	0xe
	.byte	0x2b
	.long	0xed57
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF21
	.byte	0xe
	.byte	0x2b
	.long	0xed57
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0xeff7
	.uleb128 0x6
	.string	"bl"
	.byte	0xe
	.byte	0x2b
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"bh"
	.byte	0xe
	.byte	0x2b
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF22
	.byte	0xe
	.byte	0x2b
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF23
	.byte	0xe
	.byte	0x2b
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2b
	.long	0xf015
	.uleb128 0x9
	.string	"ebx"
	.byte	0xe
	.byte	0x2b
	.long	0xed62
	.uleb128 0x8
	.long	0xef94
	.uleb128 0x8
	.long	0xefb8
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0xf039
	.uleb128 0x6
	.string	"dx"
	.byte	0xe
	.byte	0x2c
	.long	0xed57
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF24
	.byte	0xe
	.byte	0x2c
	.long	0xed57
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0xf078
	.uleb128 0x6
	.string	"dl"
	.byte	0xe
	.byte	0x2c
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"dh"
	.byte	0xe
	.byte	0x2c
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF25
	.byte	0xe
	.byte	0x2c
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF26
	.byte	0xe
	.byte	0x2c
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2c
	.long	0xf096
	.uleb128 0x9
	.string	"edx"
	.byte	0xe
	.byte	0x2c
	.long	0xed62
	.uleb128 0x8
	.long	0xf015
	.uleb128 0x8
	.long	0xf039
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0xf0ba
	.uleb128 0x6
	.string	"cx"
	.byte	0xe
	.byte	0x2d
	.long	0xed57
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF27
	.byte	0xe
	.byte	0x2d
	.long	0xed57
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0xf0f9
	.uleb128 0x6
	.string	"cl"
	.byte	0xe
	.byte	0x2d
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"ch"
	.byte	0xe
	.byte	0x2d
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF28
	.byte	0xe
	.byte	0x2d
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF29
	.byte	0xe
	.byte	0x2d
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2d
	.long	0xf117
	.uleb128 0x9
	.string	"ecx"
	.byte	0xe
	.byte	0x2d
	.long	0xed62
	.uleb128 0x8
	.long	0xf096
	.uleb128 0x8
	.long	0xf0ba
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0xf13b
	.uleb128 0x6
	.string	"ax"
	.byte	0xe
	.byte	0x2e
	.long	0xed57
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF30
	.byte	0xe
	.byte	0x2e
	.long	0xed57
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0xf17a
	.uleb128 0x6
	.string	"al"
	.byte	0xe
	.byte	0x2e
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"ah"
	.byte	0xe
	.byte	0x2e
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF31
	.byte	0xe
	.byte	0x2e
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF32
	.byte	0xe
	.byte	0x2e
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.byte	0xe
	.byte	0x2e
	.long	0xf198
	.uleb128 0x9
	.string	"eax"
	.byte	0xe
	.byte	0x2e
	.long	0xed62
	.uleb128 0x8
	.long	0xf117
	.uleb128 0x8
	.long	0xf13b
	.byte	0x0
	.uleb128 0xd
	.long	.LASF34
	.byte	0x26
	.byte	0xe
	.byte	0x25
	.long	0xf213
	.uleb128 0x6
	.string	"ds"
	.byte	0xe
	.byte	0x26
	.long	0xed57
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.string	"es"
	.byte	0xe
	.byte	0x27
	.long	0xed57
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xe
	.long	0xee70
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xe
	.long	0xeef3
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xe
	.long	0xef76
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xe
	.long	0xeff7
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xe
	.long	0xf078
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xe
	.long	0xf0f9
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xe
	.long	0xf17a
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.long	.LASF35
	.byte	0xe
	.byte	0x2f
	.long	0xedf6
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xa
	.long	.LASF36
	.byte	0xe
	.byte	0x30
	.long	0xed57
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xd
	.long	.LASF214
	.byte	0xb
	.byte	0x24
	.byte	0x4d
	.long	0xf2ba
	.uleb128 0xa
	.long	.LASF215
	.byte	0x24
	.byte	0x4e
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF216
	.byte	0x24
	.byte	0x4f
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF217
	.byte	0x24
	.byte	0x50
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF218
	.byte	0x24
	.byte	0x51
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0xa
	.long	.LASF123
	.byte	0x24
	.byte	0x52
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF219
	.byte	0x24
	.byte	0x53
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0xa
	.long	.LASF220
	.byte	0x24
	.byte	0x54
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xa
	.long	.LASF221
	.byte	0x24
	.byte	0x55
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0xa
	.long	.LASF222
	.byte	0x24
	.byte	0x56
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF223
	.byte	0x24
	.byte	0x57
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0xa
	.long	.LASF224
	.byte	0x24
	.byte	0x58
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.byte	0x0
	.uleb128 0xd
	.long	.LASF463
	.byte	0xe
	.byte	0x24
	.byte	0x5b
	.long	0xf2ff
	.uleb128 0x6
	.string	"dbt"
	.byte	0x24
	.byte	0x5c
	.long	0xf213
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF464
	.byte	0x24
	.byte	0x5e
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0xb
	.uleb128 0xa
	.long	.LASF465
	.byte	0x24
	.byte	0x5f
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF466
	.byte	0x24
	.byte	0x60
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0xd
	.byte	0x0
	.uleb128 0xd
	.long	.LASF119
	.byte	0x24
	.byte	0x24
	.byte	0x97
	.long	0xf398
	.uleb128 0xa
	.long	.LASF120
	.byte	0x24
	.byte	0xb0
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF121
	.byte	0x24
	.byte	0xb1
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF122
	.byte	0x24
	.byte	0xb2
	.long	0xf39e
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF123
	.byte	0x24
	.byte	0xb3
	.long	0xed6d
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF124
	.byte	0x24
	.byte	0xb4
	.long	0x53c
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF125
	.byte	0x24
	.byte	0xb5
	.long	0xed62
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.long	.LASF126
	.byte	0x24
	.byte	0xb6
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF127
	.byte	0x24
	.byte	0xb9
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xa
	.long	.LASF128
	.byte	0x24
	.byte	0xba
	.long	0xed57
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xa
	.long	.LASF129
	.byte	0x24
	.byte	0xbb
	.long	0xf39e
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0xf2ff
	.uleb128 0xd
	.long	.LASF130
	.byte	0x6
	.byte	0x24
	.byte	0xa9
	.long	0xf3d5
	.uleb128 0xa
	.long	.LASF131
	.byte	0x24
	.byte	0xaa
	.long	0xed57
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF132
	.byte	0x24
	.byte	0xab
	.long	0xed57
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.string	"spt"
	.byte	0x24
	.byte	0xac
	.long	0xed57
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xd
	.long	.LASF210
	.byte	0xc4
	.byte	0x24
	.byte	0xd0
	.long	0xf40c
	.uleb128 0xa
	.long	.LASF211
	.byte	0x24
	.byte	0xd2
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF212
	.byte	0x24
	.byte	0xd3
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF213
	.byte	0x24
	.byte	0xd4
	.long	0xf40c
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xf
	.long	0xf398
	.long	0xf422
	.uleb128 0x10
	.long	0x537
	.byte	0x2
	.uleb128 0x10
	.long	0x537
	.byte	0xf
	.byte	0x0
	.uleb128 0x14
	.long	.LASF105
	.byte	0xa
	.byte	0xa
	.value	0x13e
	.long	0xf4b7
	.uleb128 0x15
	.long	.LASF106
	.byte	0xa
	.value	0x13f
	.long	0xed57
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x15
	.long	.LASF107
	.byte	0xa
	.value	0x140
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x15
	.long	.LASF108
	.byte	0xa
	.value	0x141
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x15
	.long	.LASF109
	.byte	0xa
	.value	0x142
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x15
	.long	.LASF110
	.byte	0xa
	.value	0x143
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x15
	.long	.LASF111
	.byte	0xa
	.value	0x143
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x15
	.long	.LASF112
	.byte	0xa
	.value	0x143
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x15
	.long	.LASF113
	.byte	0xa
	.value	0x143
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x15
	.long	.LASF114
	.byte	0xa
	.value	0x143
	.long	0xed4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.byte	0x0
	.uleb128 0x2
	.string	"u8"
	.byte	0x23
	.byte	0x9
	.long	0x33
	.uleb128 0x20
	.long	.LASF468
	.byte	0x2
	.byte	0x51
	.byte	0x1
	.byte	0x3
	.long	0xf4e5
	.uleb128 0x21
	.long	.LASF467
	.byte	0x2
	.byte	0x51
	.long	0x29
	.uleb128 0x21
	.long	.LASF303
	.byte	0x2
	.byte	0x51
	.long	0x41
	.byte	0x0
	.uleb128 0x20
	.long	.LASF469
	.byte	0x32
	.byte	0x19
	.byte	0x1
	.byte	0x3
	.long	0xf4ff
	.uleb128 0x22
	.uleb128 0x23
	.long	0xf4d9
	.uleb128 0x23
	.long	0xf4ce
	.byte	0x0
	.byte	0x0
	.uleb128 0x24
	.long	.LASF472
	.byte	0x4
	.byte	0x86
	.byte	0x1
	.long	0xf561
	.byte	0x1
	.long	0xf561
	.uleb128 0x21
	.long	.LASF163
	.byte	0x4
	.byte	0x86
	.long	0x53a
	.uleb128 0x25
	.string	"i"
	.byte	0x4
	.byte	0x88
	.long	0x6c
	.uleb128 0x22
	.uleb128 0x26
	.long	.LASF470
	.byte	0x4
	.byte	0x8a
	.long	0xf561
	.uleb128 0x27
	.long	0xf541
	.uleb128 0x26
	.long	.LASF471
	.byte	0x4
	.byte	0x8a
	.long	0xf561
	.byte	0x0
	.uleb128 0x27
	.long	0xf552
	.uleb128 0x26
	.long	.LASF471
	.byte	0x4
	.byte	0x8b
	.long	0xa5e
	.byte	0x0
	.uleb128 0x22
	.uleb128 0x26
	.long	.LASF471
	.byte	0x4
	.byte	0x8c
	.long	0xa5e
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0x14af
	.uleb128 0x24
	.long	.LASF473
	.byte	0x4
	.byte	0x94
	.byte	0x1
	.long	0x6c
	.byte	0x1
	.long	0xf5dd
	.uleb128 0x21
	.long	.LASF163
	.byte	0x4
	.byte	0x94
	.long	0x53a
	.uleb128 0x21
	.long	.LASF186
	.byte	0x4
	.byte	0x94
	.long	0xa5e
	.uleb128 0x26
	.long	.LASF470
	.byte	0x4
	.byte	0x96
	.long	0xf561
	.uleb128 0x27
	.long	0xf5cf
	.uleb128 0x23
	.long	0xf510
	.uleb128 0x22
	.uleb128 0x28
	.long	0xf51b
	.uleb128 0x22
	.uleb128 0x28
	.long	0xf525
	.uleb128 0x27
	.long	0xf5ba
	.uleb128 0x28
	.long	0xf535
	.byte	0x0
	.uleb128 0x27
	.long	0xf5c5
	.uleb128 0x28
	.long	0xf546
	.byte	0x0
	.uleb128 0x22
	.uleb128 0x28
	.long	0xf553
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
	.uleb128 0x26
	.long	.LASF471
	.byte	0x4
	.byte	0x97
	.long	0xa5e
	.byte	0x0
	.byte	0x0
	.uleb128 0x29
	.long	.LASF474
	.byte	0x4
	.value	0x119
	.byte	0x1
	.long	0x53a
	.byte	0x1
	.long	0xf64c
	.uleb128 0x2a
	.long	.LASF187
	.byte	0x4
	.value	0x119
	.long	0xa5e
	.uleb128 0x2b
	.long	.LASF475
	.byte	0x4
	.value	0x11b
	.long	0x153a
	.uleb128 0x27
	.long	0xf619
	.uleb128 0x2b
	.long	.LASF471
	.byte	0x4
	.value	0x11c
	.long	0x153a
	.byte	0x0
	.uleb128 0x27
	.long	0xf62b
	.uleb128 0x2b
	.long	.LASF471
	.byte	0x4
	.value	0x11d
	.long	0xa5e
	.byte	0x0
	.uleb128 0x27
	.long	0xf63d
	.uleb128 0x2b
	.long	.LASF471
	.byte	0x4
	.value	0x11e
	.long	0x53a
	.byte	0x0
	.uleb128 0x22
	.uleb128 0x2b
	.long	.LASF471
	.byte	0x4
	.value	0x11c
	.long	0x153a
	.byte	0x0
	.byte	0x0
	.uleb128 0x24
	.long	.LASF476
	.byte	0xa
	.byte	0xf8
	.byte	0x1
	.long	0x15d1
	.byte	0x3
	.long	0xf66b
	.uleb128 0x22
	.uleb128 0x26
	.long	.LASF471
	.byte	0xa
	.byte	0xf9
	.long	0x15d1
	.byte	0x0
	.byte	0x0
	.uleb128 0x20
	.long	.LASF477
	.byte	0x6
	.byte	0x45
	.byte	0x1
	.byte	0x1
	.long	0xf694
	.uleb128 0x22
	.uleb128 0x2c
	.byte	0x1
	.long	.LASF953
	.byte	0x6
	.byte	0x50
	.byte	0x1
	.long	0xf688
	.uleb128 0x2d
	.byte	0x0
	.uleb128 0x25
	.string	"br"
	.byte	0x6
	.byte	0x51
	.long	0x2a9f
	.byte	0x0
	.byte	0x0
	.uleb128 0x20
	.long	.LASF478
	.byte	0xe
	.byte	0x39
	.byte	0x1
	.byte	0x3
	.long	0xf6b8
	.uleb128 0x21
	.long	.LASF397
	.byte	0xe
	.byte	0x39
	.long	0xf6b8
	.uleb128 0x21
	.long	.LASF479
	.byte	0xe
	.byte	0x39
	.long	0x6c
	.byte	0x0
	.uleb128 0x13
	.byte	0x4
	.long	0x2501
	.uleb128 0x20
	.long	.LASF468
	.byte	0x2
	.byte	0x51
	.byte	0x1
	.byte	0x3
	.long	0xf6e2
	.uleb128 0x21
	.long	.LASF467
	.byte	0x2
	.byte	0x51
	.long	0x20ab
	.uleb128 0x21
	.long	.LASF303
	.byte	0x2
	.byte	0x51
	.long	0x20b5
	.byte	0x0
	.uleb128 0x20
	.long	.LASF480
	.byte	0x3
	.byte	0x30
	.byte	0x1
	.byte	0x1
	.long	0xf704
	.uleb128 0x2e
	.string	"c"
	.byte	0x3
	.byte	0x30
	.long	0x542
	.uleb128 0x26
	.long	.LASF481
	.byte	0x3
	.byte	0x34
	.long	0x6c
	.byte	0x0
	.uleb128 0x20
	.long	.LASF482
	.byte	0x3
	.byte	0x4b
	.byte	0x1
	.byte	0x1
	.long	0xf732
	.uleb128 0x21
	.long	.LASF483
	.byte	0x3
	.byte	0x4b
	.long	0x263d
	.uleb128 0x2e
	.string	"c"
	.byte	0x3
	.byte	0x4b
	.long	0x542
	.uleb128 0x22
	.uleb128 0x23
	.long	0xf6d6
	.uleb128 0x23
	.long	0xf6cb
	.byte	0x0
	.byte	0x0
	.uleb128 0x20
	.long	.LASF484
	.byte	0x3
	.byte	0x87
	.byte	0x1
	.byte	0x1
	.long	0xf777
	.uleb128 0x21
	.long	.LASF483
	.byte	0x3
	.byte	0x87
	.long	0x263d
	.uleb128 0x2e
	.string	"c"
	.byte	0x3
	.byte	0x87
	.long	0x542
	.uleb128 0x26
	.long	.LASF203
	.byte	0x3
	.byte	0x8f
	.long	0x2643
	.uleb128 0x22
	.uleb128 0x23
	.long	0xf71c
	.uleb128 0x23
	.long	0xf711
	.uleb128 0x22
	.uleb128 0x23
	.long	0xf6d6
	.uleb128 0x23
	.long	0xf6cb
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x2f
	.long	.LASF506
	.byte	0xa
	.value	0x123
	.byte	0x1
	.long	0x20c0
	.byte	0x3
	.uleb128 0x20
	.long	.LASF485
	.byte	0x3
	.byte	0x9d
	.byte	0x1
	.byte	0x1
	.long	0xf7f8
	.uleb128 0x21
	.long	.LASF483
	.byte	0x3
	.byte	0x9d
	.long	0x263d
	.uleb128 0x2e
	.string	"s"
	.byte	0x3
	.byte	0x9d
	.long	0x3c3d
	.uleb128 0x25
	.string	"vs"
	.byte	0x3
	.byte	0x9f
	.long	0x53c
	.uleb128 0x22
	.uleb128 0x25
	.string	"c"
	.byte	0x3
	.byte	0xa1
	.long	0x542
	.uleb128 0x27
	.long	0xf7e9
	.uleb128 0x23
	.long	0xf74a
	.uleb128 0x23
	.long	0xf73f
	.uleb128 0x22
	.uleb128 0x28
	.long	0xf753
	.uleb128 0x22
	.uleb128 0x23
	.long	0xf71c
	.uleb128 0x23
	.long	0xf711
	.uleb128 0x22
	.uleb128 0x23
	.long	0xf6d6
	.uleb128 0x23
	.long	0xf6cb
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
	.uleb128 0x26
	.long	.LASF471
	.byte	0x3
	.byte	0xa1
	.long	0x542
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x20
	.long	.LASF486
	.byte	0x3
	.byte	0x3e
	.byte	0x1
	.byte	0x1
	.long	0xf811
	.uleb128 0x26
	.long	.LASF481
	.byte	0x3
	.byte	0x42
	.long	0x6c
	.byte	0x0
	.uleb128 0x30
	.long	.LASF487
	.byte	0x3
	.value	0x1bd
	.byte	0x1
	.byte	0x1
	.long	0xf8ab
	.uleb128 0x2a
	.long	.LASF488
	.byte	0x3
	.value	0x1bd
	.long	0x3c3d
	.uleb128 0x27
	.long	0xf85a
	.uleb128 0x23
	.long	0xf74a
	.uleb128 0x23
	.long	0xf73f
	.uleb128 0x22
	.uleb128 0x28
	.long	0xf753
	.uleb128 0x22
	.uleb128 0x23
	.long	0xf71c
	.uleb128 0x23
	.long	0xf711
	.uleb128 0x22
	.uleb128 0x23
	.long	0xf6d6
	.uleb128 0x23
	.long	0xf6cb
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
	.uleb128 0x23
	.long	0xf79d
	.uleb128 0x23
	.long	0xf792
	.uleb128 0x22
	.uleb128 0x28
	.long	0xf7a6
	.uleb128 0x22
	.uleb128 0x28
	.long	0xf7b1
	.uleb128 0x27
	.long	0xf8a0
	.uleb128 0x23
	.long	0xf74a
	.uleb128 0x23
	.long	0xf73f
	.uleb128 0x22
	.uleb128 0x28
	.long	0xf753
	.uleb128 0x22
	.uleb128 0x23
	.long	0xf71c
	.uleb128 0x23
	.long	0xf711
	.uleb128 0x22
	.uleb128 0x23
	.long	0xf6d6
	.uleb128 0x23
	.long	0xf6cb
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
	.uleb128 0x28
	.long	0xf7ea
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x20
	.long	.LASF489
	.byte	0x32
	.byte	0x20
	.byte	0x1
	.byte	0x3
	.long	0xf8d7
	.uleb128 0x27
	.long	0xf8ca
	.uleb128 0x22
	.uleb128 0x23
	.long	0xf4d9
	.uleb128 0x23
	.long	0xf4ce
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
	.uleb128 0x23
	.long	0xf4d9
	.uleb128 0x23
	.long	0xf4ce
	.byte	0x0
	.byte	0x0
	.uleb128 0x20
	.long	.LASF490
	.byte	0x3
	.byte	0x95
	.byte	0x1
	.byte	0x1
	.long	0xf924
	.uleb128 0x21
	.long	.LASF483
	.byte	0x3
	.byte	0x95
	.long	0x263d
	.uleb128 0x2e
	.string	"s"
	.byte	0x3
	.byte	0x95
	.long	0x3c3d
	.uleb128 0x22
	.uleb128 0x23
	.long	0xf74a
	.uleb128 0x23
	.long	0xf73f
	.uleb128 0x22
	.uleb128 0x28
	.long	0xf753
	.uleb128 0x22
	.uleb128 0x23
	.long	0xf71c
	.uleb128 0x23
	.long	0xf711
	.uleb128 0x22
	.uleb128 0x23
	.long	0xf6d6
	.uleb128 0x23
	.long	0xf6cb
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x20
	.long	.LASF491
	.byte	0x3
	.byte	0xbb
	.byte	0x1
	.byte	0x3
	.long	0xf973
	.uleb128 0x21
	.long	.LASF483
	.byte	0x3
	.byte	0xbb
	.long	0x263d
	.uleb128 0x2e
	.string	"val"
	.byte	0x3
	.byte	0xbb
	.long	0x20c0
	.uleb128 0x22
	.uleb128 0x23
	.long	0xf74a
	.uleb128 0x23
	.long	0xf73f
	.uleb128 0x22
	.uleb128 0x28
	.long	0xf753
	.uleb128 0x22
	.uleb128 0x23
	.long	0xf71c
	.uleb128 0x23
	.long	0xf711
	.uleb128 0x22
	.uleb128 0x23
	.long	0xf6d6
	.uleb128 0x23
	.long	0xf6cb
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x24
	.long	.LASF492
	.byte	0x3
	.byte	0xe4
	.byte	0x1
	.long	0x6c
	.byte	0x3
	.long	0xf98e
	.uleb128 0x2e
	.string	"c"
	.byte	0x3
	.byte	0xe4
	.long	0x20ab
	.byte	0x0
	.uleb128 0x20
	.long	.LASF493
	.byte	0x3
	.byte	0xc6
	.byte	0x1
	.byte	0x1
	.long	0xfba2
	.uleb128 0x21
	.long	.LASF483
	.byte	0x3
	.byte	0xc6
	.long	0x263d
	.uleb128 0x2e
	.string	"val"
	.byte	0x3
	.byte	0xc6
	.long	0x20c0
	.uleb128 0x21
	.long	.LASF494
	.byte	0x3
	.byte	0xc6
	.long	0x6c
	.uleb128 0x27
	.long	0xf9f7
	.uleb128 0x23
	.long	0xf93c
	.uleb128 0x23
	.long	0xf931
	.uleb128 0x22
	.uleb128 0x23
	.long	0xf74a
	.uleb128 0x23
	.long	0xf73f
	.uleb128 0x22
	.uleb128 0x28
	.long	0xf753
	.uleb128 0x22
	.uleb128 0x23
	.long	0xf71c
	.uleb128 0x23
	.long	0xf711
	.uleb128 0x22
	.uleb128 0x23
	.long	0xf6d6
	.uleb128 0x23
	.long	0xf6cb
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x27
	.long	0xfa32
	.uleb128 0x23
	.long	0xf93c
	.uleb128 0x23
	.long	0xf931
	.uleb128 0x22
	.uleb128 0x23
	.long	0xf74a
	.uleb128 0x23
	.long	0xf73f
	.uleb128 0x22
	.uleb128 0x28
	.long	0xf753
	.uleb128 0x22
	.uleb128 0x23
	.long	0xf71c
	.uleb128 0x23
	.long	0xf711
	.uleb128 0x22
	.uleb128 0x23
	.long	0xf6d6
	.uleb128 0x23
	.long	0xf6cb
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x27
	.long	0xfa6d
	.uleb128 0x23
	.long	0xf93c
	.uleb128 0x23
	.long	0xf931
	.uleb128 0x22
	.uleb128 0x23
	.long	0xf74a
	.uleb128 0x23
	.long	0xf73f
	.uleb128 0x22
	.uleb128 0x28
	.long	0xf753
	.uleb128 0x22
	.uleb128 0x23
	.long	0xf71c
	.uleb128 0x23
	.long	0xf711
	.uleb128 0x22
	.uleb128 0x23
	.long	0xf6d6
	.uleb128 0x23
	.long	0xf6cb
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x27
	.long	0xfaa8
	.uleb128 0x23
	.long	0xf93c
	.uleb128 0x23
	.long	0xf931
	.uleb128 0x22