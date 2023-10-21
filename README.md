# Graphicless

Graphicless (GL) is a `dotfile` project that contains a collection of personal-use configurations across a variety of Linux distributions and programs on them.
In addition, it is also an "awesome" project that lists and compares awesome projects that I am interested in. 

Install GL is easy

    git clone --bare https://github.com/OctHe/Graphicless .graphicless
    alias gl='/usr/bin/git --git-dir=$HOME/.graphicless/ --work-tree=$HOME'
    gl checkout

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

## Shell

Graphicless uses command-line tools as many as possible to avoid extra overhead of graphic user interface (GUI), which is one of the most resource-intensive module in a desktop operating system.
Note that Graphicless does not means it only uses command-line tool, since some efficient tools rely on GUI, including web browser and PDF viewer.
Graphicelss shows that, in most of the time, the command line can meet the requirement of our workflow.

### Bash

Bash is the default shell for most Linux distribution.
The first things for Graphicless is to config a graceful shell environment.
The configuration is in the `shell/bashrc`
To install it in Debian, use

    git clone https://github.com/OctHe/Graphicless ~/.Graphicless 
    sudo apt install bash-completion
    ln -s ~/.Graphicless/shell/bashrc .bashrc

or use `cp` instead of `ln` as follows

    cp ~/.Graphicless/shell/bashrc .bashrc

The supported (or will support) features include:
- Prompt
    - [bash-git-prompt](https://github.com/magicmonty/bash-git-prompt)
- Alias
    - ls
    - git
- History
    - *<ctrl-r>*: Interactive search history
- Keybinding
    - Built-in `bind`
- Directory
    - fold_pwd()
- Completion
    - Bash-completion
- Help
    - Built-in `help`
    - curl cheat.sh
    - man
    - info

### zsh

zsh is not the default shell in most Linux distribution.
In Debian, the follow command can be used to install zsh

    sudo apt install zsh

In openSUSE, it uses `zypper` as the manager, so 

    sudo zypper install zsh

After installing zsh, to get the configuration of zsh, use

    git clone https://github.com/OctHe/Graphicless ~/.Graphicless 
    ln -s ~/.Graphicless/shell/zshrc .zshrc
    bash ~/.Graphicless/shell/PluginInstall.sh    

or use `cp` instead of `ln` as follows

    cp ~/.Graphicless/shell/zshrc .zshrc

It support (or will support) the follow features, which are under-development.

- Prompt
    - git
- Alias
    - ls
    - git
- History
- Keybinding: Built-in `bindkey`
- Directory
    - z
    - wd
    - fold_pwd()
- Completion
    - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
    - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting.git)
- Help
    - Built-in `run-help`
    - curl cheat.sh
    - dict
    - man
    - info

#### oh-my-zsh

The community-driven [oh-my-zsh](https://ohmyz.sh/) framework for zsh also provides powerful plugins and themes.

    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    source ~/.zshrc     # Activate oh-my-zsh

The useful plugins of oh-my-zsh include git, sudo, z, wd, [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions), [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting.git), zsh-command-time.
Some of them is pre-installed with oh-my-zsh, but the following plugins are required to install from github.

    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/popstas/zsh-command-time ${ZSH_CUSTOM:~/.oh-my-zsh/custom}/plugins/zsh-command-time

The following command should replace the default command (i.e., `plugins=(git)`) in *.zshrc* file:

    plugins=(git sudo z wd colored-man-pages zsh-autosuggestions zsh-syntax-highlighting zsh-command-time)


### Swap keys

Usually, if you wants to swap Caplock and left Ctrl since the latter is more useful, some desktop provides an GUI tool such as gnome-tweak in GNOME or the setting in KDE that support this function.
For the desktops that do not have an GUI tool, a shell method is to use xmodmap and the GUI helper xkeycaps.
After change the keys in xkeycaps, write out the configuration file of xmodmap in the HOME diretory, and add the follows in the shell

    xmodmap ~/.xmodmap-`uname -n`

xmodmap will trigger the key swap when open a terminal.

## Editor

Graphicless focuses on a terminal-based coding environment.
It is benefited by the powerful plugin ecosystem of vim and integrates open-source language servers, compilers, debuggers and other useful tools.
It also contains the configuration of other editors, such as emacs (in the feature) and micro editor.

### Neovim

In stall neovim by using the package manager, for example

    sudo apt install neovim

And then install the configuration

    git clone https://github.com/OctHe/Graphicless ~/.Graphicless 
    ln -s ~/.Graphicless/editor/nvim .config/nvim

It contains follow modules, in which contains multiple plugins with Neovim-specific lua plugins.
Please see the configuration for detail.

- Plugin manager
    - Lazy
- UI
- Text
- Search
- Lint
    - [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
    - [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- Completion
- Runner
- Version control system

### Vim

To install the configuration of vim is also requires a `git clone` command, and then give a symbolic link

    ln -s ~/.Graphicless/editor/vim .vim

- Plugin manager
    - [vim-plug](https://github.com/junegunn/vim-plug)
    - dein
- UI
    - Built-in `:colorscheme desert`
    - [vim-airline](https://github.com/vim-airline/vim-airline)
- Text
    - [vim-commentary](https://github.com/tpope/vim-commentary)
    - [vim-surround](https://github.com/tpope/vim-surround)
    - [tagbar](https://github.com/preservim/tagbar)
- Search
    - [NERDTree](https://github.com/preservim/nerdtree)
    - [fzf](https://github.com/junegunn/fzf)
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
    - [UltiSnip](https://github.com/SirVer/ultisnips): Snip engine
    - [vim-snippet](https://github.com/honza/vim-snippets): Database
- Runner
    - Built-in `:make`
    - [vimspector](https://github.com/puremourning/vimspector)
    - [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)
- VCS

YouCompleteMe, and UltiSnip require python3 support in vim.
In addition, YouCompleteMe also relies on python3 packet.
It can be installed by

    sudo apt install python3-dev clangd make    # clangd is the backend of YcuCompleteMe
    sudo pip3 install pyflacks                  # If pip3 is not installed, install it with sudo apt install python3-pip

clangd requires [bear](https://github.com/rizsotto/Bear) to automatically generate `complie_commands.json` file for make-based projects.
To install it

    sudo apt install bear

### Emacs

Emacs default uses GUI.
To open it in shell, use
    emacs -nw

### Micro Editor

Micro is a easily used terminal editor with intuitive key bindings as well as modern build-in features, including command line, auto-pair and linter.

Install it in Debian (Test on Debian 12)

    sudo apt install micro

A universal installation method for most Linux distributions

    mkdir ~/bin
	cd ~/bin
	curl https://getmic.ro | bash

The configuration files are in `~/.config/micro/*`

The recommended plugins are follows
- linter (default installation)
- filemanager
- wc
- quickfix

The linter requires out-of-box support for each language (see, `help linter` in the command line mode).
Enter the command line mode by typing <C-e>, run

	plugin install filemanager wc quickfix

### Backend

The backend for lint, completion, compiling, and debug.

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
        - cpython
        - pypy
    - Tex
        - texinfo
        - pdftex
        - xetex
        - bibtex
- Debugger
    - gdb
    - ddd
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
