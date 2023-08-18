# Graphicless

Graphic user interface (GUI) is one of the most resource-intensive modules in a desktop operating system.
However, in most of the time, a command line can support lots of work flows.
Graphicless uses command-line tools as many as possible.
For example, it chooses vim/neovim as the editor by default, and gives configurations for bash and zsh.
It will support lots of other command-line tools in the future.

Note that graphicless does not means we only uses command-line tool, since some efficient tools rely on GUI, including web browser and PDF viewer.

## Shell

Graphicless shells provide prompt, alias, interactive history, completion, and customized functions for bash and zsh.
It also give advices about awesome plugins.
Configuration of fish and other shells will be added in the future.

### Terminal emulator

An open-source terminal emulator is *terminator*

    sudo apt install terminator

The terminal emulator provides color and font support for shell.
For example, the [agnoster theme](https://github.com/agnoster/agnoster-zsh-theme) of zsh requires the powerline font.
To install it, run

    sudo apt install fonts-powerline

And then set the fonts in the terminator.

### Bash

The configuration is in the `shell/bashrc`
To install it in Debian, use

    git clone https://github.com/OctHe/Graphicless ~/.graphicless 
    sudo apt install bash-completion
    ln -s ~/.graphicless/shell/bashrc .bashrc
    
or use `cp` instead of `ln` as follows

    cp ~/.graphicless/shell/bashrc .bashrc

The supported (or will support) features include:
- Prompt
    - [bash-git-prompt](https://github.com/magicmonty/bash-git-prompt)
- Alias
    - ls
    - git
- History
- Keybinding: bulit-in `bind`
- Directory
    - fold_pwd()
- Completion
    - Bash-completion
- Help: Built-in `help`

### zsh

zsh is not the default shell in most Linux distribution.
In Debian, the follow command can be used to install zsh

    sudo apt install zsh

In OpenSUSE, it uses `zypper` as the manager, so 

    sudo zypper install zsh

After installing zsh, to get the configuration of zsh, use

    git clone https://github.com/OctHe/Graphicless ~/.graphicless 
    ln -s ~/.graphicless/shell/zshrc .zshrc
    bash ~/.graphicless/shell/PluginInstall.sh    

or use `cp` instead of `ln` as follows

    cp ~/.graphicless/shell/zshrc .zshrc

It wants to support the follow features, which are under-development.

- Prompt
    - git
- Alias
    - ls
    - git
- History
- Keybinding: built-in `bindkey`
- Directory
    - z
    - wd
    - fold_pwd()
- Completion
    - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
    - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting.git)
- Help: Built-in `run-help`

## Editor

Graphicless focuses on a terminal-based coding environment.
It is benefited by the powerful plugin ecosystem of vim and integrates open-source language servers, compilers, debuggers and other useful tools.
It also contains the configuration of other editors, such as emacs (in the feature) and micro editor.

### Neovim

In stall neovim by using the package manager, for example

    sudo apt install neovim

And then install the configuration

    git clone https://github.com/OctHe/Graphicless ~/.graphicless 
    ln -s ~/.graphicless/editor/nvim .config/nvim

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

    ln -s ~/.graphicless/editor/vim .vim

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

Install it in OpenSUSE

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

### External Tools

These tools are backend for completion, compile, running, and debug.

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
- Runner
    - texinfo
    - pdftex
    - xetex
    - bibtex

## Configuration Directory

	~
	|-- .bashrc
	|-- .zshrc
    |-- .cshrc
	|-- .vim/
	|-- .config/
		|-- nvim/
		|-- micro/
        |-- terminator/config
    |-- .local/share/vim/plugins/

## Swap keys

Usually, if you wants to swap Caplock and left Ctrl since the latter is more useful, some desktop provides an GUI tool such as gnome-tweak in GNOME or the setting in KDE that support this function.
For the desktops that do not have an GUI tool, a shell method is to use xmodmap and the GUI helper xkeycaps.
After change the keys in xkeycaps, write out the configuration file of xmodmap in the HOME diretory, and add the follows in the shell

    xmodmap ~/.xmodmap-`uname -n`

xmodmap will trigger the key swap when open a terminal.

