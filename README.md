# Graphicless

Graphicless contains a collection of configurations across a variety of Linux distributions and the programs on them.
In addition, it is more like an "awesome" project that lists and compares all the awesome programs that I am interested in. 

## Linux Distribution

A Linux distribtuion comprises multiple drivers to support different hardware architectures and a collections of softwares in the user sapce.
The follow tables summarize the main different between these awesome distributions and the programs.

|                 |    Arch   |   Fedora  |  openSUSE |    Void   |      Debian      |
|:---------------:|:---------:|:---------:|:---------:|:---------:|:----------------:|
| Default desktop |     -     |   GNOME   |    KDE    |    xfce   |       GNOME      |
|   Init system   |  systemd  |  systemd  |  systemd  |   runit   |      systemd     |
| Package manager |   pacman  |    dnf    |   zypper  |    xbps   |        apt       |
|    C library    |   glibc   |   glibc   |   glibc   |    musl   |       glibc      |
|     Utility     | coreutils | coreutils | coreutils | coreutils |     coreutils    |
|    Installer    |    CLI    |  Anaconda |    YaST   |    CLI    | Debian-Installer |

|                 |  Alpine |   NixOS   |   Solus   |      Deepin      |
|:---------------:|:-------:|:---------:|:---------:|:----------------:|
| Default desktop |    -    |   GNOME   |   Budgie  |        DDE       |
|   Init system   |  OpenRC |  systemd  |  systemd  |      systemd     |
| Package manager |   apk   |    Nix    |   eopkg   |         -        |
|    C library    |   musl  |   glibc   |  GNU libc |       glibc      |
|     Utility     | Busybox | coreutils | coreutils |     coreutils    |
|    Installer    |   CLI   | Calamares |    CLI    | deepin-installer |

## Package Manager

- apt
- zypper
- dnf
- pacman
- Flatpak
- AppImage

### openSUSE

openSUSE uses `zypper` as the default package manager.
It is based on RPM, which is similar to Fedora.
Besides installation of the built programs, zypper also provides an option for the source code.
As an example, the download and build process for the `hostapd` is

    sudo zypper source-install hostapd
    # or
    #   sudo zypper si hostapd
    cd /usr/src/packages/       # cd to the default directory for source code
    ls SOURCES
    ls SPECS
    sudo zypper in rpmbuild     # The build tool of the download source code
    sudo rpmbuild -ba SPECS/hostapd.spec
                                # -ba means to perform a full build. 
    ls RPMS/x86_64              # The built program in the x86 architecture

    sudo rpmbuild -ba --noclean SPECS/hostapd.spec
                                # It does not remove the extracted source code
    ls BUILD                    # The extracted source code

### Flatpak

Flatpak is a cross-platform package manager that run applications in a sandbox.
It can download apps from FlatHub, which is the official repository of Flatpak.

    flatpak install <package name/ID>

Different from apt/zypper/dnf/pacman, you cannot run the applications from flatpak directly.

    flatpak run <package name/ID>

## Advanced Setting

### gnome-tweaks

gnome-tweaks gives advanced settings for gnome.
It support swap of Caplock and Ctrl.
Download it in Debian with

    sudo apt install gnome-tweaks

This swap is only useful in gnome-based GUI.
Windows has a similar tool that named as [PowerToys](https://github.com/microsoft/PowerToys).

## File Manager

- $n^3$
- ranger

## Viewer

- Okular
- Evince
- Zathura

## Terminal emulator

- terminator

### Terminator

Therminal emulator is the prerequisite of shell.
An open-source terminal emulator is *terminator*.
Install it with

    sudo apt install terminator

The terminal emulator provides color and font support for shell.
For example, the [agnoster theme](https://github.com/agnoster/agnoster-zsh-theme) of zsh requires the powerline font.
To install it, run

    sudo apt install fonts-powerline

And then set the fonts in the terminator.

## Web Browser

- chromium
- Firefox
- lynx

## Process

- top
- htop

## Utility

- Busybox
- GNU coreutils
