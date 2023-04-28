# Integrated Command-Line Environment (ICE)

The main advantage of command-line interface is the high efficiency compared to graphical user interface (GUI) since it only relies on keyboard as the input method.
ICE wants to use keyboard as many as possible to obtain an efficient workflow like the command-line interface, but it built on desktop environment (like GNOME, KDE, or xfce etc.).
We argue that the command-line interface (CLI) also can meet the requirement in most time.

The prerequisites of ICE is bash and one of the system-level package managers (e.g., apt, zypper, etc.).
It will install all the other tools.

## Environment

- [Shell](./shell/README.md)
- Package manager
    - apt
    - zypper
    - snap
    - flatpack
    - pacman
- coreutils (GNU software)
- Process
    - [procps](https://gitlab.com/procps-ng/procps/)
        - ps
        - top
- Kernel
    - [kmod](https://man7.org/linux/man-pages/man8/kmod.8.html)
- File
    - Finder
        - findutils (GNU software)
            - find
        - fzf
    - File manager
        - vifm
    - Viewer
        - zathura
- Help
    - cheat.sh
    - dict
    - man
    - info
- Desktop
    - GNOME
        - GNOME session
        - GNOME Shell
        - gdm (GNOME Display Manager)
    - KDE
    - LXQT
        - Openbox
    - Xfce
        - LightDM
    - Tile window manager
        - i3
        - Termial multiplex
            - screen
            - tmux
- Network
    - netlink
        - iw
        - iwd
            - iwctl
        - wpa_supplicant, wpa_cli
        - hostapd
        - NetworkManager: Rely on wpa_supplicant or iwd as backend
            - Clients: nmcli, nm-connection-editor, nm-applet
        - ConnMan: Rely on iwd as backend
        - iproute2
            - ip, tc
    - wext
        - net-tools
            - ifconfig, arp, etc.
        - wireless-tools
            - iwconfig, iwlist, etc.
    - Web
        - lynx
- Text search tool
    - grep (GNU software)
    - ack
    - ag
    - ripgrep (rg)
- [Editor](./editor/README.md)
- Linter
    - Python
        - pyflacks
- Compiler/Interpreter
    - make
        - bear
    - cmake
    - c/c++
        - gcc
        - clang
    - Python
        - python2
        - python3
- Debugger
    - gdb
    - lldb
- Language server
    - C/C++
        - clangd
        - ccls
    - Python
    - Bash
        - shellcheck
- Version control
    - git
- Text
    - Engine
        - latex
        - texinfo
    - format
        - pdftex
        - xetex
        - bibtex

## Dotfile

Configuration files that after installing ICE.
Note that the follow tree is not the source code tree.

	~
	|-- .bashrc
	|-- .zshrc
	|-- .vim/
	|-- .config/
		|-- nvim/
		|-- micro/
        |-- terminator/config
    |-- .share/nvim/
	|--.local/
		|-- bin/
			|-- micro

## Swap keys in Linux

Usually, someone wants to swap Caplock and left Ctrl since the latter is more useful.
In Ubuntu, download tweak to swap them in GUI.

    sudo apt install gnome-tweaks

This method is only useful in gnome-based GUI.
Windows has a similar tool that named as [PowerToys](https://github.com/microsoft/PowerToys).
A shell method is use xmodmap and the GUI helper xkeycaps.
After change the keys in xkeycaps, write out the configuration file of xmodmap in the HOME diretory, and add the follows in the shell

    xmodmap ~/.xmodmap-`uname -n`

xmodmap would trigger the key swap when open a terminal.

## Projects

The target languages include C/C++, Python, Lua, vimscript/vim9script, bash/zsh, Latex, Markdown.

Here is the list of the target projects:
- C/C++
    - *Linux kernel*
    - *iw*
    - *xv6*
    - *GNURadio*
- Python
    - *leetcode_unit*
- VimScript/Lua
    - *CIM*
- Markdown
    - *MoreWireless*
