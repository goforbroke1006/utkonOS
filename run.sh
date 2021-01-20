#!/bin/bash

KERNEL=./build/kernel.bin
ISO=./build/utkonOS.iso

set -e

mkdir -p ./build/
rm -rf ./build/*

#assemble boot.s file
as --32 boot.s -o ./build/boot.o

#compile kernel.c file
gcc -m32 -c kernel.c -o ./build/kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra

#linking the kernel with kernel.o and boot.o files
ld -m elf_i386 -T linker.ld ./build/kernel.o ./build/boot.o -o ${KERNEL} -nostdlib

#check ${KERNEL} file is x86 multiboot file or not
grub-file --is-x86-multiboot ${KERNEL}

#building the iso file
mkdir -p ./build/isodir/boot/grub
cp ${KERNEL} ./build/isodir/boot/kernel.bin
cp grub.cfg ./build/isodir/boot/grub/grub.cfg
grub-mkrescue -o ${ISO} ./build/isodir

#run it in qemu
qemu-system-x86_64 -cdrom ${ISO}
