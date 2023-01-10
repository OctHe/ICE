## MultiVim

MultiVim is Shiyue's Vim distribution for Linux kernel, GNURadio, iw projects.
It aims to support C/C++, Latex, Markdown, python on Ubuntu, Deepin, and OpenSuse.

## Ubuntu and Deepin
The useful packets that can be install from *apt* to support vim

    sudo apt update
    sudo apt install git zsh cmake make vim

After installing *git*, it is recommended to set a proxy for git if a proxy is used in the system.
We can set a sock5 proxy with the following command

    git config --global http.proxy 'socks5://127.0.0.1:8088' 
    git config --global https.proxy 'socks5://127.0.0.1:8088' 

We choose vim as the editor in Ubuntu and Deepin.

All vim configurations are in the 'vimrc' file.
Copy the file into the home directory `cp vimrc ~/.vimrc`
The *vim-plug* can be automatically installed to manage plugins when vim is firstly started.
All plugins can be installed by vim-plug with “:PlugInstall"
vimrc provides some customized configurations at final.

Note that vim (or gvim) in Deepin cannot install YouCompleteMe because the version is old.

### OpenSUSE

OpenSUSE uses *zypper* as the packet managerr

    sudo zypper update
    sudo zypper install git zsh cmake make vim

Similarily, We can set a sock5 proxy with the same commands, if needed.

Neovim has been used in OpenSUSE for Python projects.
The plugin manager is *packer*.
It provides pyright as the language server protocol (LSP).

pyright can be installed with

    pip3 install pyright

## To Be Done

- Blog and jekyll
- Python and jupyter
- xv6 operating system

