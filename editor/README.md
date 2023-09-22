# Editor

Graphicless focuses on a terminal-based coding environment.
It is benefited by the powerful plugin ecosystem of vim and integrates open-source language servers, compilers, debuggers and other useful tools.
It also contains the configuration of other editors, such as emacs (in the feature) and micro editor.

## Neovim

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

## Vim

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

## Emacs

Emacs default uses GUI.
To open it in shell, use
    emacs -nw

## Micro Editor

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

## Backend

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
