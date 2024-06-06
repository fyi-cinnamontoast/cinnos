%include "multiboot.S"

;; ==== STACK ====
section .bss
align 16
stk_btm:
	resb	16 * 1024 ; 16KiB
stk_top:
;; ==== STACK ====

;; ==== ENTRY ====
section .text
align 8
extern kmain

global _start:function (_start.end - _start)
_start:
	; setup stack
	mov esp, stk_top
	; setup gdt
	call gdt_flush
	; call into kernel
	push eax
	push ebx
	call kmain
	; halt
.halt:
	cli
.halt_loop:
	hlt
	jmp .halt_loop
.end:

%include "gdt.S"
;; ==== ENTRY ====
