[org 0x7c00] ; 0x7c00是引导扇区的加载地址

; 这是我们的入口点
start:
    mov ax, 0x07c0 ;设置堆栈指针
    add ax, 0x0200
    mov ss, ax
    mov sp, 0x1000

    ; 清除所有的段寄存器
    xor ax, ax
    mov ds, ax
    mov es, ax

    ; 打印字符串
    mov si, hello_string
print_string:
    lodsb ;取出SI指向的字符，并将SI加1
    or al, al ;检查AL是否为0（字符串结束）
    jz done
    mov ah, 0x0e ;使用BIOS的teletype功能
    int 0x10 ;调用BIOS中断
    jmp print_string ;继续打印下一个字符
done:

    cli ;关闭中断
    hlt ;暂停CPU

hello_string db 'Hello, World!', 0

; 填充剩余的扇区以使其大小为512字节
TIMES 510-($-$$) db 0
DW 0xaa55 ;这是引导扇区的标记

section .data
reboot_cmd db 'reboot', 0
buffer db 0

section .text
    ; 简单的键盘处理例程
    get_input:
        mov ah, 0x00
        int 0x16 ; 使用 BIOS 中断读取按键
        cmp al, 0x0D ; 检查输入的是否是回车
        je check_reboot
        ; 存储字符到缓冲区
        mov [buffer], al
        ret

    check_reboot:
        mov si, buffer
        mov di, reboot_cmd
        cld
        repe cmpsb
        je reboot
        ret

    ; 重启函数
    reboot:
        mov al, 0x64
        out 0x64, al
        jmp reboot

section .text
    ; 程序入口
    global _start
    _start:
        ; 设置好环境，初始化等
        ; ...
        ; 进入接收输入的循环
    loop:
        call get_input
        jmp loop
