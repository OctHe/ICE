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

## Desktop Environment

Linux desktop subsystem is one of the most complicated subsystem.
OpenDE collects awesome open-source desktop environments.

Linux desktop usually has two types of interfaces.
One of them is virtual console and the other is GUI.
Virtual console is the default interface from Linux kernel and does not support Unicode.
For example, in Debian/Ubuntu, type `<ctrl>+<alt>+F{1-6}` can change between virtual console and GUI.
Specifically, `<ctrl>+<alt>+F2` can change to the GUI, and `<ctrl>+<alt>+F{3,4,5,6}` are different virtual consoles.
By default, the startup program, i.e., systemd, will initialize the GUI desktop.
It also can be opened manually. 
For example, `sudo startx` is the command to start an x11 service.

x11 and Wayland are two communication protocol that relates a display server and the client.
Most of the graphic desktop and libraries are based on them.

|                  |         KDE        |       GNOME       |         xfce        |     LXQT     |         DDE         |
|:----------------:|:------------------:|:-----------------:|:-------------------:|:------------:|:-------------------:|
|      Toolkit     |         QT         |        GTK        |         GTK         |      QT      |          QT         |
|  Display manager |        SDDM        |        gdm        |       LightDM       |     SDDM     |       LightDM       |
|  Session manager |      ksmserver     |   gnome-session   |    xfce4-session    | lxqt-session |     dde-session     |
|  Windows manager |        KWin        |    gnome-shell    |        xfwm4        |    Openbox   |     deepin-kwin     |
|  Desktop manager |          -         |         -         |      xfdesktop      |       -      |          -          |
|   File manager   |       Dolphin      |     Nautilus      |        Thunar       |  PcManFm-qt  |   dde-file-manager  |
|     Launcher     |       Kickoff      |         -         |      xfce-panel     |  lxqt-runner |     dde-launcher    |
|      Editor      |        Kate        | gnome-text-editor |       Mousepad      |       -      |    deepin-editor    |
|     Terminal     |       Konsole      |   gnome-terminal  |    xfce4-terminal   |   QTerminal  |   deepin-terminal   |
|      Network     | Network Management |     nm-applet     |          -          |       -      |          -          |
|     Capturer     |      Spectacle     |  GNOME Screenshot | xfce4-screenshooter |  Screengrab  |  deepin-screenshot  |
|  Document viewer |       Okular       |       Evince      |          -          |       -      |    deepin-reader    |
|   Image viewer   |      Gwenview      |       Loupe       |      Ristretto      |  Lximage-qt  | deepin-image-viewer |
|   Input method   |          -         |         -         |          -          |       -      |      deepin-im      |
| Advanced setting |          -         |    gnome-tweaks   |          -          |       -      |     deepin-tweak    |
|    Development   |      KDevelop      |   GNOME Builder   |          -          |       -      |      Deepin-IDE     |


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

## Window Managers

|          | Openbox |  i3 |  xmonad |   sway  | tmux | GNU Screen |
|---------:|:-------:|:---:|:-------:|:-------:|:----:|:----------:|
| Protocol |   x11   | x11 | Wayland | Wayland |   -  |      -     |

### Openbox

Install Openbox with apt

    sudo apt install openbox

By default, openbox has a refresh issue in Ubuntu.
The applications will not automatic refresh after opening them.
To fix this, change the configuration file

    sudo vim /usr/lib/x86_64-linux-gnu/openbox-autostart

Uncommand the line `test -z $BG || $BG -solid "#303030"`

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
