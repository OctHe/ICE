# Introduction

This is a repo for shiyue's linux configuration.
This config works well at Ubuntu 20.04.

# Basic packets

The useful packets that can be install from *apt*: git, zsh, cmake, make, pip3.

```
sudo apt update
sudo apt install git zsh cmake make python3-pip
```

# zsh and oh-my-zsh 

The full docu can be find at the [official website](https://ohmyz.sh/).

Install oh-my-zsh with curl: 
```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
If *curl* is not installed, run the command before: `sudo apt install curl`.

## Plugins for oh-my-zsh

The useful plugins include git, sudo, z, wd, [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions), [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting.git).
*zsh-autosuggestions* and *zsh-syntax-highlighting* are required to install from github.
```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

The following command should replace the default command in .zshrc file (i.e., `plugins=(git)`).
```
plugins=(git sudo z wd zsh-autosuggestions zsh-syntax-highlighting)
```
Finally, run `source ~/.shrc` to activate the file or restart the system.

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
