@REM TODO 可以提前导入所有需要的环境变量
@REM 安装nasm、qemu等
@REM 编译为二进制文件
nasm -f bin hello_world.asm -o hello_world.bin

@REM 运行到QEMU虚拟机（方式1）
qemu-system-x86_64 hello_world.bin
@REM 创建一个磁盘映像文件
dd if=/dev/zero of=disk.img bs=512 count=2880
@REM 写入二进制文件到硬盘文件
dd if=hello_world.bin of=disk.img conv=notrunc
@REM 运行img到QEMU虚拟机（方式2）
qemu-system-x86_64 -drive format=raw,file=disk.img
@REM 没有配置环境变量就使用全路径
"C:\Program Files\QEMU\qemu-system-x86_64.exe" -drive format=raw,file=disk.img
@REM 转换为虚拟硬盘文件
"C:\Program Files\Oracle\VirtualBox\VBoxManage" convertfromraw --format VDI D:\projects\one-os\disk.img D:\projects\one-os\disk.vdi
@REM 使用VirtualBox打开虚拟机（略）

@REM 启动vhd到QEMU虚拟机
qemu-system-x86_64 -drive file=my-os.vhd,format=vpc -bios ./OVMF-X64-r15214/OVMF.fd
