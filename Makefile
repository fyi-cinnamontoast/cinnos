BIN := bin

BOOT_DIR := boot
KERNEL_DIR := kernel

AS := nasm
AS_FLAGS := -felf32 -I $(BOOT_DIR)

CC := clang
CC_FLAGS := -std=gnu99 -ffreestanding -O2 -Wall -Wextra -m32 -nostdinc

LINK := ld
LINK_FLAGS := -melf_i386 -n -T link.ld

KERNEL_SRC := $(notdir $(wildcard $(KERNEL_DIR)/*.c))
KERNEL_OBJ := $(addprefix $(BIN)/,$(KERNEL_SRC:.c=.o))

all: build run

build: $(BIN)/boot.o kernel $(BIN)/cinnos.bin cinnos.iso

$(BIN)/boot.o: $(BOOT_DIR)/boot.S
	mkdir -p $(BIN)
	$(AS) $(AS_FLAGS) $< -o $@

kernel: $(KERNEL_OBJ)

$(BIN)/%.o: $(KERNEL_DIR)/%.c
	mkdir -p $(BIN)
	$(CC) $(CC_FLAGS) -c $< -o $@

$(BIN)/cinnos.bin: $(BIN)/boot.o $(KERNEL_OBJ)
	mkdir -p $(BIN)
	$(LINK) $(LINK_FLAGS) -o $@ $^
	$(info Verifying Multiboot2)
	grub-file --is-x86-multiboot2 $@

cinnos.iso: $(BIN)/cinnos.bin
	mkdir -p iso/boot/grub
	cp grub.cfg iso/boot/grub
	cp $< iso/boot
	grub-mkrescue -o $@ iso

.PHONY: run
run:
	qemu-system-i386 -cdrom cinnos.iso

clean:
	rm -rf $(BIN) iso cinnos.iso
