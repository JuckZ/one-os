@REM fsutil file createnew disk.img 314572800
@REM mkdir efi
@REM diskpart
@REM create vdisk file="D:\projects\one-os\asm_version\disk.img" maximum=300 type=fixed
@REM select vdisk file="D:\projects\one-os\asm_version\disk.img"
@REM attach vdisk
@REM assign letter=z
@REM exit
@REM xcopy /E /H /Y /I /V /Z /K /R /S /Q /z /exclude:./exclude.txt ../CloverV2/* z:\
@REM rmdir /s /q efi
@REM copy /b /y hello_world.bin disk.img

@REM 创建一个磁盘映像文件
diskpart
create vdisk file="D:\projects\one-os\disk\all-in-one.vhd" maximum=300 type=fixed
select vdisk file="D:\projects\one-os\disk\all-in-one.vhd"
attach vdisk
@REM assign letter=z
exit

xcopy /E /I "D:\projects\one-os\CloverV2\EFI" "F:\EFI"
xcopy /E /I "D:\projects\one-os\OpenCore-0.9.3-DEBUG\X64\EFI" "F:\EFI"

diskpart
select vdisk file="D:\projects\one-os\disk\all-in-one.vhd"
detach vdisk
exit