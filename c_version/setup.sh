nasm -f elf32 bootloader.asm -o bootloader.o
gcc -m32 -ffreestanding -c kernel.c -o kernel.o
ld -m elf_i386 -T linker.ld -o kernel.bin bootloader.o kernel.o
