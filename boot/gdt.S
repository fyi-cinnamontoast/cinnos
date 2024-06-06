section .data
gdt_start:
	dq	0 ; null segment

gdt_code:
	dw	0xFFFF
	dw	0x0000
	db	0x00
	db	0b10011010
	db	0b11001111
	db	0x00

gdt_data:
	dw	0xFFFF
	dw	0x0000
	db	0x00
	db	0b10010010
	db	0b11001111
	db	0x00

gdt_end:

gdt:
	dw	gdt_end - gdt_start - 1
	dd	gdt_start

CODE_SEG	equ gdt_code - gdt_start
DATA_SEG	equ gdt_data - gdt_start

gdt_flush:
	lgdt [gdt]
	mov ax, DATA_SEG
	mov ds, ax
	mov es, ax
	mov fs, ax
	mov gs, ax
	mov ss, ax
	pop eax
	push CODE_SEG
	push eax
	retf
