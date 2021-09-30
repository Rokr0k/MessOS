# Mess OS

This OS is a complete Mess. (Not now but will)

# Build

You need `i686` cross-compilers to build. [Here](https://wiki.osdev.org/GCC_Cross-Compiler)  
The compilers are expected to be in `$HOME/opt/cross/bin/`

You need GRUB utilities and `xorriso` to execute `grub-mkrescue`.

You need `qemu-system-i386` to test.

```sh
make # This will generate messos.iso file
make run # This will run MessOS with QEMU
make clean # This will make files cleaner than your room
```