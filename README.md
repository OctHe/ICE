## Introduction

This project is a total configurations of Shiyue for his multiple Linux distributions.
It provides configurations about *zsh, vim, neovim* on Ubuntu, Deepin, OpenSuse, and Manjora.
The goal of the configuration is to support Projects *Linux kernel, GNURadio, Latex, Markdown, Python, and C++*.

## Basic packets

### Ubuntu and Deepin
The useful packets that can be install from *apt*: git, zsh, cmake, make.

    sudo apt update
    sudo apt install git zsh cmake make

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

# VIM setup

(TBD)

## VIM plugins

### Markdown-preview.nvim

*Vundle* cannot use hook, so it is necessary to manually run `call mkdp#util#install()` after vundle complete the installation

# Blog and jekyll

(TBD)

# Python and jupyter

(TBD)

# xv6 operating system

(TBD)
