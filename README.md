# Integrated Command-Line Environment (ICE)

There are lots of useful integrated development environments (IDEs) that based on graphical user interfaces (GUI).
They are awesome, but the command-line interface (CLI) also can meet the requirement in most time.

The goal of ICE is to get as much work done in CLI as possible, not to replace GUI entirely.
So it would still use some GUI tools if terminal cannot correctly display some formatted text (such as latex and markdown).

The prerequisites of ICE is bash and one of the system-level package managers (e.g., apt, zypper, etc.).
It will provide detail manual and scripts to install all the other tools.

## Features

- Provide multiple modes according to the installed packages.

### Environment

- Shell
    - Bash
        - git
        - Alias
        - Color
        - Bind
        - Fold
        - history
        - Completion
        - Help
            - help
            - man
            - info
    - zsh
        - Directory
            - z
            - wd
            - Fold
        - Completion
            - [gitignore](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/gitignore/gitignore.plugin.zsh)
            - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
            - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting.git)
        - Alias
            - git
        - Keybinding (bindkey)
            - sudo, man, less
        - Theme
            - prompt
                - common
                - git
                    - (branch, branch tracking|local status)
            - Nerdfont
        - Help
            - run-help
            - man
            - info
    - Python
        - ipython
- Package manager
    - apt
    - zypper
    - snap
    - flatpack
    - pacman
- GNU software
    - coreutils
    - findutils
        - find
    - grep
- Process
    - [procps](https://gitlab.com/procps-ng/procps/)
        - ps
        - top
- Kernel
    - [kmod](https://man7.org/linux/man-pages/man8/kmod.8.html)
- Tools
    - File
        - vifm
    - Text search tool
        - ack
        - ag
        - ripgrep (rg)
    - Code management
        - git
    - Job control
        - screen
        - tmux
    - Help
        - dict
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
    - lynx
- Editor
    - vim/neovim
        - Project CIM
    - emacs
    - micro
        - linter (default install)
        - filemanager
        - wc
        - quickfix
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

### File tree

The file tree after installing ice will be

	~
	|-- .bashrc
	|-- .zshrc
	|-- .vim/
	|-- .config/
		|-- nvim/
		|-- micro/
    |-- .share/nvim/
	|--.local/
		|-- bin/
			|-- micro


## Shell

In Ubuntu/Debian, the follow command can be used to install packages

    sudo apt install zsh git

In OpenSUSE, it uses `zypper` as the manager, so 

    sudo zypper install git

In the above command, only git is installed.

### Bash and bash-it

Bash is the default shell for most Linux distribution.
The first things for ICE is to config a graceful shell environment with bash-it.

    git clone https://github.com/Bash-it/bash-it.git ~/.bash_it
    cd .bash_it
    ~/.bash_it/install.sh       # Active bash-it

### zsh and oh-my-zsh

ICE default uses the community-driven [oh-my-zsh](https://ohmyz.sh/) framework for zsh.
ICE installs zsh and oh-my-zsh with the following

    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    source ~/.zshrc     # Activate oh-my-zsh

#### Plugin

The useful plugins of oh-my-zsh include git, sudo, z, wd, [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions), [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting.git), zsh-command-time.
Some of them is pre-installed with oh-my-zsh, but the following plugins are required to install from github.

    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/popstas/zsh-command-time ${ZSH_CUSTOM:~/.oh-my-zsh/custom}/plugins/zsh-command-time

The following command should replace the default command (i.e., `plugins=(git)`) in *.zshrc* file:

    plugins=(git sudo z wd colored-man-pages zsh-autosuggestions zsh-syntax-highlighting zsh-command-time)

## Editor

### Vim

Vim and Neovim are based on Project CIM.

### Micro

Micro is a easily used terminal editor compared to Vim/Emacs.
It provides intuitive key bindings as well as modern build-in features including command line, auto-pair and linter.
Install it in OpenSUSE

	cd ~/bin
	curl https://getmic.ro | bash

The configuration files are in `~/.config/micro/*`

#### Plugins

The linter requires out-of-box support for each language (see, `help linter` in the command line mode).

Enter the command line mode by typing <C-e>, run

	plugin install filemanager wc quickfix

## Swap keys in Linux

Usually, someone wants to swap Caplock and left Ctrl since the latter is more useful.
In Ubuntu, download tweak to swap them in GUI.

    sudo apt install gnome-tweaks

This method is only useful in gnome-based GUI.
Windows has a similar tool that named as [PowerToys](https://github.com/microsoft/PowerToys).
A general method in Linux is use xmodmap and the GUI helper xkeycaps.
After change the keys in xkeycaps, write out the configuration file of xmodmap in the HOME diretory, and add the follows in the shell

    xmodmap ~/.xmodmap-`uname -n`
