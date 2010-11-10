extern uint64_t global_mem_event_counter;
extern int memtrace_enable;

void cm_memtrace_buf_full(void);
inline void tcg_out_memtrace(TCGContext *s, int write);
inline void tcg_out_memtrace(TCGContext *s, int write)
{

	if(!memtrace_enable)
		return;
	
	uint8_t *label_finish;
	int r0,r1,rexw;

#if TARGET_LONG_BITS == 32
    rexw = 0;
#else
    rexw = P_REXW;
#endif

	r0 = TCG_REG_RDI;
    r1 = TCG_REG_RSI;
	
	/* &(memtrace_buf->cur) -> rsi */
	tcg_out_movi(s, TCG_TYPE_I64, r1, (tcg_target_long)&(memtrace_buf->cur));

	/* (rsi) -> rax */
	tcg_out_modrm_offset(s, 0x8b | P_REXW, TCG_REG_RAX, r1, 0);

	/* rax + 16 -> rax */
	tcg_out_addi(s, TCG_REG_RAX, 16);

	/* rax -> (rsi) */
	tcg_out_modrm_offset(s, 0x89 | P_REXW, TCG_REG_RAX, r1, 0);

	/* rdi -> -8(rax) */
	tcg_out_modrm_offset(s, 0x89 | P_REXW, r0, TCG_REG_RAX, -8);

	/* &global_mem_event_counter -> rsi*/
	tcg_out_movi(s, TCG_TYPE_I64, r1, (tcg_target_long)&global_mem_event_counter);

	/* 2 -> rdi */
	tcg_out_movi(s, TCG_TYPE_I64, r0, 2);	
	
	/* xadd rdi,(rsi) */
	tcg_out8(s, 0xf0);
	tcg_out32(s, 0x3ec10f48);

	if(write){
		tcg_out_modrm(s, 0x83, 1, r0); 
        tcg_out8(s, 1);
	}	

	/* rdi -> -16(rax) */
	tcg_out_modrm_offset(s, 0x89 | P_REXW, r0, TCG_REG_RAX, -16);

	/* &(memtrace_buf->end) -> rsi */
	tcg_out_movi(s, TCG_TYPE_I64, r1, (tcg_target_long)&(memtrace_buf->end));

	/* cmp 0(r1), r0 */
    tcg_out_modrm_offset(s, 0x3b | rexw, TCG_REG_RAX, r1, 0);
	
	/* jne label_finish */
    tcg_out8(s, 0x70 + JCC_JNE);
    label_finish = s->code_ptr;
    s->code_ptr++;

	/* call buf_full */
	tcg_out_goto(s, 1, (uint8_t*)cm_memtrace_buf_full);

	/* label_finish: */
    *label_finish = s->code_ptr - label_finish - 1;
	
}
