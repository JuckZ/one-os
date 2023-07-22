[ORG 0x7c00]  ; This is the memory location BIOS loads the bootloader

jmp start
nop

; BIOS Parameter Block
OEMLabel        db "BOOT    "  ; OEM Label
BytesPerSector  dw 512         ; Bytes per sector
SectorsPerCluster db 1         ; Sectors per cluster
ReservedForBoot dw 1           ; Reserved sectors for boot record
NumberOfFats    db 2           ; Number of FAT copies
RootDirEntries  dw 224         ; Number of entries in root dir
                                ; (224 * 32 = 7,168 = 14 sectors to read)
LogicalSectors  dw 2880        ; Number of logical sectors
MediumByte      db 0F0h        ; Medium descriptor byte
SectorsPerFat   dw 9           ; Sectors per FAT
SectorsPerTrack dw 18          ; Sectors per track (36/cylinder)
Sides           dw 2           ; Number of sides/heads
HiddenSectors   dd 0           ; Number of hidden sectors
LargeSectors    dd 0           ; Number of large sectors
DriveNo         dw 0           ; Drive No: 0
Signature       db 41          ; Signature: 41 for floppy (29h for hard disks)
VolumeID        dd 00000000h   ; Volume ID: any number
VolumeLabel     db "MYOS       "; Volume Label: any 11 chars
FileSystem      db "FAT12   "  ; File system type: don't change!

; The bootloader code
start:
    cli                         ; Disable interrupts
    xor ax, ax                  ; Zero out ax
    mov ds, ax                  ; Set DS-register to 0 - segment of the string
    mov es, ax                  ; Set ES-register to 0 - segment of the buffer
    mov ss, ax                  ; Set SS-register (stack segment) to 0 
    mov sp, 0x7c00              ; Set SP-register (stack pointer) to 0x7c00.  
                                ; It means that our stack begins from 0x0000:0x7c00 
                                ; and grows to 0x0000:0x0000
    sti                         ; Enable interrupts

    cld                         ; Clear direction flag - we'll use lodsb and movsb 

    ; Here you would normally load your kernel to memory

    call print_hello_world      ; Call our C function

    ; Endless loop
    hang:
        jmp hang

; Function to call our C code
print_hello_world:
    extern _hello_world         ; Our C function to call
    call _hello_world           ; Call the function
    ret                         ; Return to caller

; Bootsector padding
times 510-($-$$) db 0           ; Fill the rest of the sector with zeros
dw 0xAA55                       ; Boot signature at the end of bootloader
