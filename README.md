# Integrated Command-Line Environment (ICE)

There are lots of useful integrated development environments (IDEs) that based on graphical user interfaces (GUI).
They are awesome, but the command-line interface (CLI) also can meet the requirement in most time.

The goal of ICE is to get as much work done in CLI as possible, not to replace GUI entirely.
So it would still use some GUI tools if terminal cannot correctly display some formatted text (such as latex and markdown).

The prerequisites of ICE is bash and one of the system-level package managers (e.g., apt, zypper, etc.).
It will provide detail manual and scripts to install all the other tools.

## Environment

- Shell
    - Bash
        - Prompt
            - Fold directory
            - [bash-git-prompt](https://github.com/magicmonty/bash-git-prompt)
        - Alias: ls, git
        - Color
        - History
        - Keybinding: bulit-in `bind`
        - Completion
            - Bash-completion
        - Help: Built-in `help`
    - zsh
        - Prompt
            - common
            - git
                - (branch, branch tracking|local status)
        - Alias: ls, git
        - Color
        - History
        - Keybinding (bindkey)
            - sudo, man, less
        - Directory
            - z
            - wd
        - Completion
            - [gitignore](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/gitignore/gitignore.plugin.zsh)
            - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
            - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting.git)
        - Help: Built-in `run-help`
    - Python
        - ipython
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
- Editor
    - neovim
        - Plugin manager
        - UI
        - Text
        - Search
        - Lint
            - [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
            - [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
        - Completion
        - Debug
        - Version control system
    - vim
        - Plugin manager
            - [vim-plug](https://github.com/junegunn/vim-plug)
            - dein
        - UI
            - Built-in `:colorscheme desert`
            - [vim-airline](https://github.com/vim-airline/vim-airline)
        - Text
            - [vim-commentary](https://github.com/tpope/vim-commentary)
            - [vim-surround](https://github.com/tpope/vim-surround)
            - [NERDTree](https://github.com/preservim/nerdtree)
        - Lint: Require linters or LSPs
            - [tagbar](https://github.com/preservim/tagbar)
            - [neomake](https://github.com/neomake/neomake)
            - [ALE](https://github.com/dense-analysis/ale)
        - Format: Require `astyle` or LSPs
            - Built-in `gg=G` and `gq`
            - [vim-autoformat](https://github.com/vim-autoformat/vim-autoformat)
        - Completion
            - [auto-pairs](https://github.com/LunarWatcher/auto-pairs)
            - YouCompleteMe
            - Engine
                - [UltiSnip](https://github.com/SirVer/ultisnips)
            - Database
                - [vim-snippet](https://github.com/honza/vim-snippets)
            - [vim-autoformat](https://github.com/vim-autoformat/vim-autoformat)
        - Debug
            - Built-in `:make`
            - [vimspector](https://github.com/puremourning/vimspector)
            - [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)
        - Version management
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
- Version control
    - git

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

ICE focuses on a terminal-based coding environment that uses vim/neovimm.
It is benefited by the powerful plugin ecosystem of vim and integrates open-source language servers, compilers, debuggers and other useful tools.

### Vim

The vim configuration implements common edit, language-specific features (provided by language servers), and debug modules.

    ---------------------------------
    |            |                  |
    | Keymapping |       Option     |
    | Function   | Text, UI, Search |
    | Command    | Completion, Debug|
    |            |                  |
    ---------------------------------
    |       Plugins                 |
    |                               |
    | Text, UI, Search              |
    | Lint, Completion              |
    | Debug, VCS                    |
    |                               |
    ---------------------------------


#### Text

The following plugins are used to support the common edit
- [NERDTree](https://github.com/preservim/nerdtree)
- [fzf](https://github.com/junegunn/fzf)
- [tagbar](https://github.com/preservim/tagbar)
- [vim-commentary](https://github.com/tpope/vim-commentary)
- [vim-surround](https://github.com/tpope/vim-surround)

#### UI

- [vim-airline](https://github.com/vim-airline/vim-airline)

#### Lint and Completion

    sudo apt install clangd
    sudo pip3 install pyflacks

clangd requires [bear](https://github.com/rizsotto/Bear) to automatically generate `complie_commands.json` file for make-based projects.
To install it

    sudo apt install bear

As the client, CIM uses [ALE](https://github.com/dense-analysis/ale) plugin instead of [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe).

- [auto-pairs](https://github.com/LunarWatcher/auto-pairs)

#### Debug


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
- Latex
    - *xelatex -> bibtex -> xelatex -> xelatex*
    - *pdflatex -> bibtex -> pdflatex -> pdflatex*
    - *xelatex*
- Markdown
    - *MoreWireless*
