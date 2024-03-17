# One OS

## TODO

1. script for automation test
2. complete document and make a website
3. Multiple OS for Android
4. Multiple OS on Bootable USB
5. Run anywhere: Proxmox VE, Vmware Workstation, Vmware ESXI, Virtual box, QEMU, KVM, Bare Metal...
6. Auto generate opencore/clover/rEFInd configuration
7. [Ventoy](https://www.ventoy.net) support
8. UEFI, Legacy
9. ...

## Description

## Get Started

### [Update to PowerShell 7](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.4&viewFallbackFrom=powershell-7&WT.mc_id=THOMASMAURER-blog-thmaure)

```powershell
winget search Microsoft.PowerShell
# Install PowerShell or PowerShell Preview using the id parameter
winget install --id Microsoft.Powershell --source winget
winget install --id Microsoft.Powershell.Preview --source winget
```

### Download Project

#### method1

```sh
git clone https://github.com/JuckZ/one-os.git one-os --recursive
```

#### method2

```sh
git clone https://github.com/JuckZ/one-os.git one-os
cd one-os
git submodule init
git submodule update
```

## [Hackintosh](docs/Hackintosh.md)

## FAQ

Opencore引导其他操作系统  https://sumingyd.github.io/OpenCore-Install-Guide/AMD/zen.html#patch

SecureBootModel 虚拟机需要使用x86legacy来获得安全引导支持
