## All-In-Vim

All-in-vim, or AIM in short, is Shiyue He's project-oriented coding environment that integrates all toolchains into the terminal around the famous Vim editor.
Here is the list of the target projects:
- C/C++
    - *Linux kernel*
    - *iw*
    - *xv6*
    - *GNURadio*
- Python
    - *leetcode_unit*
- VimScript/Lua
    - *AIM*
- Latex
    - *xelatex -> bibtex -> xelatex -> xelatex* (Thsis)
    - *pdflatex -> bibtex -> pdflatex -> pdflatex* (paper)
    - *xelatex*
- Markdown
    - *MoreWireless*
    - *README.md*
    - *jekyll*

Naturally, AIM does not want to build the toolchain from scratch.
It contains lots existing tools, while this projects focuses on the following processes of each project: reading, writing, compilation (If needed), debug, and test.

## Ubuntu

AIM provides the coding environment of Projects iw, xv6, and Linux kernel on Ubuntu.
All these projects are based on C/C++, and uses `make` as their compile tool.


## Prerequisite

To read the code, AIM uses Vim as the editor, zsh is the recommended shell.
The compilation toolchain is *make*.

They can be installed by

    sudo apt install git zsh vim make

After installing *git*, it is recommended to set a proxy to avoid some network issues.
We can set a sock5 proxy with the following command

    git config --global http.proxy 'socks5://127.0.0.1:8088' 
    git config --global https.proxy 'socks5://127.0.0.1:8088' 

The *vim-plug* can be automatically installed to manage plugins when vim is firstly started.
All plugins can be installed by vim-plug with `:PlugInstall`
vimrc provides some customized configurations at final.

Then, Aim can be installed by git

    git clone https://github.com/OctHe/All-in-Vim ~/.vim/

### Reading

AIM selects four plugins to support the code reading: NERDTree, fzf, tagbar, and vim-airline.



### Writing

[YouCompleteMe](https://github.com/ycm-core/YouCompleteMe) is a complex plugin to install.
It requires multiple dependencies that should be downloaded.
To avoid the network problem, it is recommended to set a proxy for the terminal, similar to the proxy in git.
The proxy can be set with the following command in the `~/.zshrc` file (suppose the shell is `zsh`).

    export http_proxy="socks5://127.0.0.1:7890"
    export https_proxy="socks5://127.0.0.1:7890"


### Compilation


## Deepin

Deepin is based on Ubuntu, so it has similar packet manager, while the applications are most outdated.
    sudo apt update
    sudo apt install git zsh cmake make vim

Therefore, Deepin is recommended to use SpaceVim as the configuration.

    curl -sLf https://spacevim.org/install.sh | bash

## OpenSUSE

OpenSUSE uses *zypper* as the packet manager

    sudo zypper update
    sudo zypper install git zsh cmake make vim

Similarily, We can set a sock5 proxy with the same commands, if needed.

Neovim has been used in OpenSUSE for Python projects.
The plugin manager is *packer*.
It provides pyright as the language server protocol (LSP).

pyright can be installed with

    pip3 install pyright

