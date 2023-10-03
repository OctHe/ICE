# Graphicless

Graphicless contains a collection of configurations across a variety of Linux distributions and the programs on them.
In addition, it is more like an "awesome" project that lists and compares all the awesome programs that I am interested in. 

## Linux Distribution

A Linux distribtuion comprises multiple drivers to support different hardware architecutres and a collections of softwares in the user sapce.
The follow tables summarize the main different between these awesome distributions and the programs.

|                 |    Arch   |   Fedora  |  OpenSUSE |    Void   |      Debian      |
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

## Viewer

- Okular
- Evince
- Zathura

## Cross-Platform Package Manager

- Flatpak
- AppImage

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
