## Coding-in-Vim

Coding-in-vim, or CIM in short, is [Shiyue He](https://octhe.github.io/)'s terminal-based coding environment that uses vim/neovimm as the editor.
It is benefited by the powerful plugin ecosystem of vim and integrates open-source language servers, compilers and debuggers and other useful tools.
The target languages include C/C++, Python, Lua, vimscript/vim9script, bash/zsh, Latex, Markdown.

### Structure

CIM provides an LW mode and an ICE mode.
ICE includes a powerful environment that requires lots of out-of-box installation, while LW is only based on pure vimscript/lua plugins.

In each mode, CIM implements common edit, language-specific features (provided by language servers), compile and debug modules by giving options, key mappings and commands.
The options can be used to configure the default configuration of CIM.

- Vim
    - LW (Lightweight)
        - Plugin manager
            - [vim-plug](https://github.com/junegunn/vim-plug)
            - Vit: A lightweight vim plugin manager based on git (TBD)
        - Colorscheme
            - Built-in `:colorscheme desert`
        - Edit
            - [tagbar](https://github.com/preservim/tagbar)
                - based on universal-ctags
            - [vim-airline](https://github.com/vim-airline/vim-airline)
            - [auto-pairs](https://github.com/LunarWatcher/auto-pairs)
            - [vim-commentary](https://github.com/tpope/vim-commentary)
            - [vim-surround](https://github.com/tpope/vim-surround)
        - Highlight, Tags, GoTo, Hover, Lint, Fix, Format, Completion, Snippet
            - LSP-client
        - Compile
            - built-in `:make`
            - [neomake](https://github.com/neomake/neomake)
        - Debug
            - Debug adapter
        - Version management
    - ICE (Integrated Command-line Environment)
        - Plugin manager
            - [vim-plug](https://github.com/junegunn/vim-plug)
        - Colorscheme
        - Edit
        - Highlight, Tags, GoTo, Hover, Lint, Fix, Format, Completion, Snippet
            - LSP-client
        - Compile
        - Debug
            - Debug adapter
        - Version management
- Neovim
    - LW (Lightweight)
        - Plugin manager
        - Colorscheme
        - Edit
        - Highlight, Tags, GoTo, Hover, Lint, Fix, Format, Completion, Snippet
            - LSP-client
        - Compile
        - Debug
            - Debug adapter
        - Version management
    - ICE (Integrated Command-line Environment)
        - Plugin manager
        - Colorscheme
        - Edit
        - Highlight
            - [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
        - Tags, GoTo, Hover, Lint, Fix, Format, Completion, Snippet
            - LSP-client
        - Compile
        - Debug
            - Debug adapter
        - Version management

## Prerequisite

### Ubuntu

    sudo apt install git zsh vim make

Then, CIM can be installed by git

    git clone https://github.com/OctHe/All-in-Vim ~/.vim/

### Edit

The following plugins are used to support the common edit
- [NERDTree](https://github.com/preservim/nerdtree)
- [fzf](https://github.com/junegunn/fzf)
- [tagbar](https://github.com/preservim/tagbar)
- [vim-airline](https://github.com/vim-airline/vim-airline)

- [auto-pairs](https://github.com/LunarWatcher/auto-pairs)
- [vim-commentary](https://github.com/tpope/vim-commentary)
- [vim-surround](https://github.com/tpope/vim-surround)

Language-specific functions requires autocompletion, linter, goto, and snippet functions.
These functions have been integrated into the language protocol server (LSP).
Therefore, CIM uses two famous LSP for C/C++ and python projects: [clangd](https://clangd.llvm.org/) and [pyright](https://github.com/microsoft/pyright).
To install them, uses

    sudo apt install clangd
    sudo pip3 install pyright

As the client, CIM uses [ALE](https://github.com/dense-analysis/ale) plugin instead of [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe).

clangd requires [bear](https://github.com/rizsotto/Bear) to automatically generate `complie_commands.json` file for make-based projects.
To install it

    sudo apt install bear

### Compilation

## Projects

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
    - *xelatex -> bibtex -> xelatex -> xelatex* (Thsis)
    - *pdflatex -> bibtex -> pdflatex -> pdflatex* (paper)
    - *xelatex*
- Markdown
    - *MoreWireless*
    - *README.md*
    - *jekyll*
