# Linux To Go

Linux To Go (LTG) is a method to install Linux in external USB disk.
The main advantage of LTG is to boot your owe system in multiple computers that have same architecture (for example, x86 system).
This README shows the install process and some tips that install LTG.

## Fedora

I choose Fedora as my LTG system since it has stable version.
The main advantage is I don't need to update it frequently.
The boot method is UEFI, so I give a partition with 1 GiB to support UEFI.
In addition, I choose to install the bootloader to the USB disk.
After that, the installation process is the same as a normal installation in any disk.

## Debian

I have tried install Debian in external disk multiple times.
But when I unplugged the USB disk, the UEFI cannot find Debian anymore.
However, Debian-installer, which is the default GUI installer of debian, does not provides
