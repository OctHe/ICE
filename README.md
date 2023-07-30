# Graphicless

Graphic user interface (GUI) is one of the most resource-intensive modules in a desktop operating system.
However, in most of the time, a command line can support lots of work flows.
Graphicless uses command-line tools as many as possible.
For example, it chooses vim/neovim as the editor by default, and give configuration for multiple shells.
It will support lots of other command-line tools in the future.
Note that graphicless does not means we only uses command-line tool, since some efficient tools rely on GUI, including web browser and PDF viewer.

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

Configuration files that after installing Graphicless.
Note that the follow tree is not the source code tree.

	~
	|-- .bashrc
	|-- .zshrc
    |-- .cshrc
	|-- .vim/
	|-- .config/
		|-- nvim/
		|-- micro/
        |-- terminator/config
	|--.local/
		|-- bin/
			|-- micro

## Swap keys

Usually, someone wants to swap Caplock and left Ctrl since the latter is more useful.
A shell method is use xmodmap and the GUI helper xkeycaps.
After change the keys in xkeycaps, write out the configuration file of xmodmap in the HOME diretory, and add the follows in the shell

    xmodmap ~/.xmodmap-`uname -n`

xmodmap would trigger the key swap when open a terminal.

