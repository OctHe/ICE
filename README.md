## Coding-in-Vim

Coding-in-vim, or CIM in short, is a terminal-based coding environment that uses vim as the editor.
It is benefited by the powerful plugin ecosystem of vim and integrates open-source language servers, compilers, debuggers and other useful tools.

### Structure

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

CIM provides an LW mode and an ICE mode.
ICE includes a powerful environment that requires lots of out-of-box installation, while LW is only based on pure vimscript/lua plugins.

In each mode, CIM implements common edit, language-specific features (provided by language servers), compile and debug modules by giving options, key mappings and commands.
The options can be used to configure the default configuration of CIM.

- Vim
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

## Prerequisite

### Ubuntu

    sudo apt install git zsh vim make

Then, CIM can be installed by git

    git clone https://github.com/OctHe/All-in-Vim ~/.vim/

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

Language-specific functions requires completion, and lint.
These functions have been integrated into the language protocol server (LSP).
Therefore, CIM uses [clangd](https://clangd.llvm.org/) and pyflacks.
To install them, uses

    sudo apt install clangd
    sudo pip3 install pyflacks

clangd requires [bear](https://github.com/rizsotto/Bear) to automatically generate `complie_commands.json` file for make-based projects.
To install it

    sudo apt install bear

As the client, CIM uses [ALE](https://github.com/dense-analysis/ale) plugin instead of [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe).

- [auto-pairs](https://github.com/LunarWatcher/auto-pairs)

### Debug

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
