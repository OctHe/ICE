# Editor

Graphicless focuses on a terminal-based coding environment that uses vim/neovim.
It is benefited by the powerful plugin ecosystem of vim and integrates open-source language servers, compilers, debuggers and other useful tools.
It also contains other editors.

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
    - linter (default installation)
    - filemanager
    - wc
    - quickfix

## Out-of-Box Tools

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

## Vim

The vim configuration implements common edit, language-specific features (provided by language servers), and debug modules.


### Text

The following plugins are used to support the common edit
- [NERDTree](https://github.com/preservim/nerdtree)
- [fzf](https://github.com/junegunn/fzf)
- [tagbar](https://github.com/preservim/tagbar)
- [vim-commentary](https://github.com/tpope/vim-commentary)
- [vim-surround](https://github.com/tpope/vim-surround)

### UI

- [vim-airline](https://github.com/vim-airline/vim-airline)

### Lint and Completion

YouCompleteMe, Markdown-preview, and UltiSnip require python3 support in vim.
In addition, YouCompleteMe also relies on python3 packet.
It can be installed by

    sudo apt install python3-dev clangd make    # clangd is the backend of YcuCompleteMe
    sudo pip3 install pyflacks                  # If pip3 is not installed, install it with sudo apt install python3-pip

clangd requires [bear](https://github.com/rizsotto/Bear) to automatically generate `complie_commands.json` file for make-based projects.
To install it

    sudo apt install bear

As the client, CIM uses [ALE](https://github.com/dense-analysis/ale) plugin instead of [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe).

- [auto-pairs](https://github.com/LunarWatcher/auto-pairs)

### Debug


## Micro Editor

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

