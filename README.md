## MD-Config

MD-COnfig (means multi-dimensional configuration) project is Shiyue's configuration for multiple projects, multiple languages, and multiple Linux distributions.
It provides configurations about *zsh, vim, neovim* on Ubuntu, Deepin, OpenSuse, and Manjora.
The goal of this configuration is to support *Linux kernel, GNURadio, iw* projects and *Latex, Markdown, Python, C+* languages.

## Basic packets

### Ubuntu and Deepin
The useful packets that can be install from *apt*: git, zsh, cmake, make.

    sudo apt update
    sudo apt install git zsh cmake make

After installing *git*, it is recommended to set a proxy for git if a proxy is used in the system.
We can set a sock5 proxy with the following command

    git config --global http.proxy 'socks5://127.0.0.1:8088' 
    git config --global https.proxy 'socks5://127.0.0.1:8088' 

### OpenSUSE
    
    sudo zypper update
    sudo zypper install git zsh cmake make

## Shell 

zsh is recommanded and [oh-my-zsh](https://ohmyz.sh/) is a perfect distribution of zsh.

Run `zsh_setup.sh` in the cloned directory to install oh-my-zsh and plugins.

The useful plugins include *git, sudo, z, wd, [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions), [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting.git)*.
Some of them is pre-installed with oh-my-zsh, but the following plugins are required to install from github.

    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

The following command should replace the default command (i.e., `plugins=(git)`) in *.zshrc* file:
```
plugins=(git sudo z wd zsh-autosuggestions zsh-syntax-highlighting)
```
Finally, run `source ~/.zshrc` to activate the file or restart the system.

## Editor

### vim and gvim

We choose vim as the editor in Ubuntu and Deepin.
It can be installed by 
    
    sudo apt install vim

All vim configurations are in the 'vimrc' file.
Copy the file into the home directory `cp vimrc ~/.vimrc`
The first thing for the file is to install vim-plug.
When vim has been firstly opened, all plugins can be installed by vim-plug with “:PlugInstall"
*vimrc* provides some customized configurations at final.

Note that vim (or gvim) in Deepin cannot install YouCompleteMe because the version is old.


### Neovim

Neovim has been used in OpenSUSE for Python projects.
The plugin manager is *packer*.
It provides pyright as the language server protocol (LSP).

## To Be Done

- Blog and jekyll
- Python and jupyter
- xv6 operating system

