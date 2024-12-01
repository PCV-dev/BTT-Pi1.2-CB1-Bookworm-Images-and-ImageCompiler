

# Debian Bookworm for BTT Pi1.2 / CB1 - CLI BUILD - AllWinner H616

## are you looking for ready for use Images ?

* [go to Reales](https://github.com/PCV-dev/BTT-Pi1.2-CB1-Bookworm-Images-and-ImageCompiler/releases/new)


It's done. The build tool is now working. It can build CLI_Standard and CLI_Minimal images. Kernel and Bootloader individually also work. Please use it to build your own images. Please note that you should already know what you're doing. Toolchains are not all the same. And a kernel needs to be configured first. Support requests like "I tried something and it doesn't work" will not be answered.

## Tested Hardwares

* [BigTreeTech CB1](https://github.com/bigtreetech/CB1)
* [BigTreeTech Pi1.2](https://github.com/bigtreetech/CB1)   uses the same Image

## Build Prerequisites

On Ubuntu22.04

``` zsh
sudo apt-get install ccache debian-archive-keyring debootstrap device-tree-compiler dwarves 
sudo apt-get install gcc-arm-linux-gnueabihf jq libbison-dev libc6-dev-armhf-cross 
sudo apt-get install libelf-dev libfl-dev liblz4-tool libpython2.7-dev libusb-1.0-0-dev 
sudo apt-get install pigz pixz pv swig pkg-config python3-distutils qemu-user-static u-boot-tools 
sudo apt-get install distcc uuid-dev lib32ncurses-dev lib32stdc++6 apt-cacher-ng 
sudo apt-get install aptly aria2 libfdt-dev libssl-dev
```

## Versions Included

|  Part   | Version  |
| :----:  | :------: |
| uboot   | v2021.10 |
| kernel  | v6.1.118 |
| T.Chain | v11.2    |

## Install / deployment

To automatically install all required packages, run the `Install.sh` script as root.
You are also welcome to install the packages manually. **BUT** the `Unzip_FileList_eng.sh` script **must** be executed, otherwise files will be missing.


## Project Build

In the project's root directory, run:

``` bash
sudo ./build.sh
```

- uboot config file
    
    Allwinner-H616/u-boot/configs/h616_defconfig

- Compile information output directory

    output/debug/

## Releases

Please note that ready-made releases will soon be available for download, and I will try to keep them relatively up-to-date.

## Reference





- Allwinner usb boot: https://linux-sunxi.org/FEL/USBBoot

- [Allwinner Online Development Forum](https://bbs.aw-ol.com/topic/2054/mq-quad-h616-%E4%B8%BB%E7%BA%BF%E5%86%85%E6%A0%B8%E7%BC%96%E8%AF%91%E8%B0%83%E8%AF%95%E8%AE%B0%E5%BD%95-u-boot-kernel-buildroot/17)


![Besucherzähler](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https://github.com/PCV-dev/BTT-Pi1.2-CB1-Bookworm-Images-and-ImageCompiler.git)


