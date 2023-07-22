# dd if=/dev/zero of=disk.img bs=512 count=2880
# dd if=./EFI of=./disk.img bs=4M conv=sync
dd if=../asm_version/hello_world.bin of=disk.img conv=notrunc
qemu-system-x86_64 -drive format=raw,file=disk.img
