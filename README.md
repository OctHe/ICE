# Integrated Command-Line Environment (ICE)

There are lots of useful integrated development environments (IDEs) that based on graphical user interfaces (GUI).
They are awesome, but the command-line interface (CLI) also has advantages that cannot be ignored.
For example, CLI can be used for most servers with ssh command.
Therefore, ICE is an IDE based on CLI. 
The goal of ICE is to get as much work done in CLI as possible, not to replace GUI entirely.
So it would still use some GUI tools because some formatted text cannot be displayed in CLI (such as pdf and markdown).

The prerequisites of ICE is bash and one of the system-level package managers (e.g., apt, zypper, etc.).
It will provide detail manual and scripts to install all the tools.

So, let's begin!

# Features

- Only require bash and a package manager at first.
- Provide multiple modes according to the installed packages.

## Environment

- Shell
    - Bash
        - Bash-it
    - zsh
        - oh-my-zsh
        - Plugin
        - Completion
        - Alias
        - Theme
    - Python
        - python shell
        - ipython
- Environment manager
    - Package manager
        - apt
        - zypper
    - File
        - find
        - fzf
    - Text search tool
        - grep
        - ack
        - ag
        - ripgrep (rg)
    - Version management
        - git
    - Job control
        - tmux
    - Network
        - iw
    - Web
    	- lynx
- Editor
    - vim/rvim/evim/gvim
        - Editing
        - LSP-client
        - Compilation
        - Version management
        - Debug
        - Colorscheme
    - neovim
    - emacs
    - micro
        - linter (default install)
        - filemanager
        - wc
        - quickfix
- Language server
    - C/C++
        - clangd
        - ccls
    - Python
        - pyright
    - Bash
        - shellcheck
- Compilation
    - make
        - bear
    - cmake
    - c/c++
        - gcc
        - clang
- Debuger
    - gdb
    - lldb

## File tree

The file tree after installing ice will be

	~
	|-- .bashrc
	|-- .zshrc
	|-- .vim/
	|-- .config/
		|-- nvim/
		|-- micro/
	|--.local/
		|-- bin/
			|-- micro


# Shell

In Ubuntu/Debian, the follow command can be used to install packages

    sudo apt install zsh git

In OpenSUSE, it uses `zypper` as the manager, so 

    sudo zypper install git

In the above command, only git is installed.

## Bash and bash-it

Bash is the default shell for most Linux distribution.
The first things for ICE is to config a graceful shell environment with bash-it.

    git clone https://github.com/Bash-it/bash-it.git ~/.bash_it
    cd .bash_it
    ~/.bash_it/install.sh       # Active bash-it

## zsh and oh-my-zsh

ICE default uses the community-driven [oh-my-zsh](https://ohmyz.sh/) framework for zsh.
ICE installs zsh and oh-my-zsh with the following

    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    source ~/.zshrc     # Activate oh-my-zsh

### Plugin

The useful plugins of oh-my-zsh include *git, sudo, z, wd, [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions), [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting.git)*.
Some of them is pre-installed with oh-my-zsh, but the following plugins are required to install from github.

    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

The following command should replace the default command (i.e., `plugins=(git)`) in *.zshrc* file:

    plugins=(git sudo z wd zsh-autosuggestions zsh-syntax-highlighting)

### Proxy

Use the following command in `.zshrc`

    export http_proxy="socks5://127.0.0.1:7890"
    export https_proxy="socks5://127.0.0.1:7890"

# Editor

## Micro

Micro is a easily used terminal editor compared to Vim/Emacs.
It provides intuitive key bindings as well as modern build-in features including command line, auto-pair and linter.
Install it in OpenSUSE

	cd ~/bin
	curl https://getmic.ro | bash

The configuration files are in `~/.config/micro/*`

### Plugins

The linter requires out-of-box support for each language (see, `help linter` in the command line mode).

Enter the command line mode by typing <C-e>, run

	plugin install filemanager wc quickfix
