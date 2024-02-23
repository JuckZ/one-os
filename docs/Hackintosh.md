# Hackintosh

## Steps

1. Get the target image by macrecovery or gibMacOS or downloading from the Internet.
   1. https://i12bretro.github.io/tutorials/0763.html
2. Follow the [OpenCore-Install-Guide](https://dortania.github.io/OpenCore-Install-Guide/)

- [x] 下载最新的[OpenCorePkg](https://github.com/acidanthera/OpenCorePkg)，现在是0.9.8，然后拷贝OpenCore-0.9.8-DEBUG\X64\EFI或OpenCore-0.9.8-RELEASE\X64\EFI
- [x] 清理不需要的文件
- [x] Add [HfsPlus.efi](https://github.com/acidanthera/OcBinaryData/blob/master/Drivers/HfsPlus.efi)
- [x] Add [Resources](https://dortania.github.io/OpenCore-Post-Install/cosmetic/gui.html#setting-up-opencore-s-gui), then change the config.plist according to the instruction
- [x] Add [VirtualSMC](https://github.com/acidanthera/VirtualSMC/releases)-1.3.2-DEBUG(or SMCAMDProcessor for AMD) 
- [x] Add [Lilu](https://github.com/acidanthera/Lilu/releases)-1.6.7-DEBUG
- [ ] AMDRyzenCPUPowerManagement.kext, SMCAMDProcessor.kext, AMD Power Gadget.app, SMCBatteryManager.kext
- [x] Add [NVMeFix](https://github.com/acidanthera/NVMeFix/releases)-1.1.1-DEBUG
- [x] Add [HibernationFixup](https://github.com/acidanthera/HibernationFixup/releases)-1.4.9-DEBUG
- [x] Add ACPI using SSDTTime or other methods
- [x] Set Misc -> Security -> Vault to "Optional"
- [ ] TODO? [AppleALC or AppleALCU](https://github.com/acidanthera/AppleALC/releases)-1.8.9 for audio AMD 15h/16h may have issues with AppleALC and Ryzen/Threadripper systems rarely have mic support
- [ ] Add RadeonGadget-1.3.0-DEBUG, RadeonSensor-1.3.0-DEBUG, SMCRadeonGPU-1.3.0-DEBUG
- [ ] Add WhateverGreen-1.6.6-DEBUG and WhateverName.app
- [ ] TODO? Network adaptor
- [ ] Add USBToolBox-1.1.1-DEBUG (USBToolBox.kext and UTBDefault.kext)
- [ ] TODO Wifi and Buletooth?
- [ ] If you want to use MacOS 12.3 or higher with an AMD processor, you need : AppleMCEReporterDisabler.kext
- [ ] TODO Keyboard and touchboard, firstly **TEST** VoodooPS2Controller-2.3.5-DEBUG
- [ ]  Make your own ACPI files using SSTDTime(SSDT-PLUG-ALT.aml, SSDT-USBX.aml and SSDT-EC.aml)
- [ ]  Copy OpenCore-0.9.7-RELEASE\Docs\Sample.plist, and rename as config.plist
- [ ]  TODO ~~~remove SSDT-PLUG-ALT.aml(**Not sure, firstly TEST needed**)~~~
- [ ]  TODO 特定于gpu的引导参数: agdpmod=pikera ?? -radcodec 添加4G解码启动参数 npci=0x3000
- [x]  Patch using AMD_Vanilla if your CPU is AMD, And follow the [instruction](https://github.com/AMD-OSX/AMD_Vanilla#read-me-first)
  - [x]  enable kernel Quirk `ProvideCurrentCpuInfo`
  - [x]  Set Core Count patch
  - [x]  Note for Zen 4: Zen 4 (Ryzen 7000) requires patching for IOPCIFamily.kext.
  - [ ]  ......
- [x]  Configure [DeviceProperties](https://dortania.github.io/OpenCore-Install-Guide/AMD/zen.html#deviceproperties)
  - [x] delete all the PciRoot's here as we won't be using this section(Add section)
- [x]  GENBIOS, copy to PlatformInfo, iMacPro1,1
- [x]  Set boot-args to "-v keepsyms=1 debug=0x100"
- [x]  Set Misc -> Debug -> Target to "67" 
- [x]  Refresh your config.plist using ProperTree
- [ ]  3D acceleration
  - [ ]  DeviceProperties修改显卡的device-id和AAPL,ig-platform-id（如果适用）这些值需要根据你的显卡型号和需要支持的macOS版本来确定。
  - [ ]  kexts是否需要调整 
  - [ ]  启动参数 boot-args是否需要调整
- [ ]  Reboot support for Sonoma
- [x]  Reboot support for BigSur
- [x]  Use OpenCore-0.9.8-DEBUG\Utilities\ocvalidate in to check
  - [x]  OpenCanopy.efi is loaded at UEFI->Drivers, but Misc->Boot->PickerMode is not set to External!
  - [ ]  ......

### Option

- [x] Add [Hackintool](https://github.com/benbaker76/Hackintool)-4.0.3
- [x] Add [OCAuxiliaryTools](https://github.com/ic005k/OCAuxiliaryTools/releases)-20240001