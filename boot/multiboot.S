;; ==== MULTIBOOT v2 ====
; magic
MB_MAGIC		equ 0xE85250D6
MB_ARCH_I386		equ 0x0
MB_ARCH_MIPS		equ 0x4
MB_ARCH			equ MB_ARCH_I386
MB_LENGTH		equ (mb_hdr_end - mb_hdr_start)
MB_CHECKSUM		equ 0x100000000 - (MB_MAGIC + MB_ARCH + MB_LENGTH)

; tags
MB_TERM_TAG		equ 0x0
MB_INFO_TAG		equ 0x1
MB_ADDR_TAG		equ 0x2
MB_ENTRY_TAG		equ 0x3
MB_CONSOLE_TAG		equ 0x4
MB_FRAMEBUF_TAG		equ 0x5
MB_MOD_ALIGN_TAG	equ 0x6
MB_EFI_BOOT_TAG		equ 0x7
MB_ENTRY_EFI32_TAG	equ 0x8
MB_ENTRY_EFI64_TAG	equ 0x9
MB_RELOC_TAG		equ 0xA

section .multiboot
align 8
mb_hdr_start:
	; required fields
	dd	MB_MAGIC
	dd	MB_ARCH
	dd	MB_LENGTH
	dd	MB_CHECKSUM
	; term tag
	dw	MB_TERM_TAG
	dw	0x0
	dd	0x8
mb_hdr_end:
;; ==== MULTIBOOT v2 ====
