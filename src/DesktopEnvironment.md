## Desktop Environment

A Linux distribution usually has two types of interfaces.
One of them is virtual console (CLI) and the other is GUI.
Virtual console is the default interface from Linux kernel and does not support Unicode.
For example, in Debian/Ubuntu, type `<ctrl>+<alt>+F{1-6}` can change between virtual console and GUI.
Specifically, `<ctrl>+<alt>+F2` can change to the GUI, and `<ctrl>+<alt>+F{3,4,5,6}` are different virtual consoles.
Desktop environment is a collection of GUI programs that replaces CLI and is one of the most complicated subsystem in Linux.
It breaks up the limitation of shell and provides a more flexiable interface for users.
By default, the startup program, i.e., systemd, will initialize the GUI desktop.
The desktop also can be opened manually. 
For example, `sudo startx` is the command to start an x11 service.
x11 and Wayland are two communication protocol that relates a display server and the client.
Most of the desktop and libraries are based on them.

Graphicless compares the follow open-source desktop environments.

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
|      Network     |   Network Manager  |  Network Manager  |          -          |       -      |          -          |
|     Capturer     |      Spectacle     |  GNOME Screenshot | xfce4-screenshooter |  Screengrab  |  deepin-screenshot  |
|  Document viewer |       Okular       |       Evince      |          -          |       -      |    deepin-reader    |
|   Image viewer   |      Gwenview      |       Loupe       |      Ristretto      |  Lximage-qt  | deepin-image-viewer |
|   Input method   |          -         |         -         |          -          |       -      |      deepin-im      |
| Advanced setting |          -         |    gnome-tweaks   |          -          |       -      |     deepin-tweak    |
|    Development   |      KDevelop      |   GNOME Builder   |          -          |       -      |      Deepin-IDE     |

### xfce4

Graphicless tests xfce4 in Debian 12.
It uses xfce4-terminal and firefox as the default applications for terminal and web browser, respectively.

## Window Manager

|          | Openbox |  i3 |  xmonad |   sway  |
|---------:|:-------:|:---:|:-------:|:-------:|
| Protocol |   x11   | x11 | Wayland | Wayland |

### Openbox

Install Openbox with apt

    sudo apt install openbox

By default, openbox has a refresh issue in Ubuntu.
The applications will not automatic refresh after opening them.
To fix this, change the configuration file

    sudo vim /usr/lib/x86_64-linux-gnu/openbox-autostart

Uncommand the line `test -z $BG || $BG -solid "#303030"`

## Terminal Multiplexer

| tmux | GNU Screen |
|:----:|:----------:|
|   -  |      -     |

