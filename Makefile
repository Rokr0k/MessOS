AS = i686-elf-as
CC = i686-elf-gcc
QEMU = qemu-system-i386

CC_FLAGS = -std=gnu99 -ffreestanding -O2 -Wall -Wextra
LD_FLAGS = -ffreestanding -O2 -nostdlib

OBJS = boot.o kernel.o

all: messos.iso

clean:
	rm -r isodir *.o *.bin *.iso

run: messos.iso
	$(QEMU) -cdrom $^

messos.iso: messos.bin grub.cfg
	mkdir -p isodir/boot/grub
	cp messos.bin isodir/boot/messos.bin
	cp grub.cfg isodir/boot/grub/grub.cfg
	grub-mkrescue -o $@ isodir

messos.bin: linker.ld $(OBJS)
	$(CC) -T $< -o $@ $(LD_FLAGS) $(OBJS) -lgcc

%.o: %.c
	$(CC) -c $^ -o $@ $(CC_FLAGS)

%.o: %.s
	$(AS) $^ -o $@