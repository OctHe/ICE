# Shell

Graphicless uses command-line tools as many as possible to avoid extra overhead of graphic user interface (GUI), which is one of the most resource-intensive module in a desktop operating system.
Note that Graphicless does not means it only uses command-line tool, since some efficient tools rely on GUI, including web browser and PDF viewer.
Graphicelss shows that, in most of the time, the command line can meet the requirement of our workflow.

## Bash

Bash is the default shell for most Linux distribution.
The first things for Graphicless is to config a graceful shell environment.
The configuration is in the `shell/bashrc`
To install it in Debian, use

    git clone https://github.com/OctHe/Graphicless ~/.Graphicless 
    sudo apt install bash-completion
    ln -s ~/.Graphicless/shell/bashrc .bashrc

or use `cp` instead of `ln` as follows

    cp ~/.Graphicless/shell/bashrc .bashrc

The supported (or will support) features include:
- Prompt
    - [bash-git-prompt](https://github.com/magicmonty/bash-git-prompt)
- Alias
    - ls
    - git
- History
    - *<ctrl-r>*: Interactive search history
- Keybinding
    - Built-in `bind`
- Directory
    - fold_pwd()
- Completion
    - Bash-completion
- Help
    - Built-in `help`
    - curl cheat.sh
    - man
    - info

Except the above configuration, the follow projects also can give a powerful bash.

### Bash-it

    git clone https://github.com/Bash-it/bash-it.git ~/.bash_it
    cd .bash_it
    ~/.bash_it/install.sh       # Active bash-it

### oh-my-bash

## zsh

zsh is not the default shell in most Linux distribution.
In Debian, the follow command can be used to install zsh

    sudo apt install zsh

In openSUSE, it uses `zypper` as the manager, so 

    sudo zypper install zsh

After installing zsh, to get the configuration of zsh, use

    git clone https://github.com/OctHe/Graphicless ~/.Graphicless 
    ln -s ~/.Graphicless/shell/zshrc .zshrc
    bash ~/.Graphicless/shell/PluginInstall.sh    

or use `cp` instead of `ln` as follows

    cp ~/.Graphicless/shell/zshrc .zshrc

It support (or will support) the follow features, which are under-development.

- Prompt
    - git
- Alias
    - ls
    - git
- History
- Keybinding: Built-in `bindkey`
- Directory
    - z
    - wd
    - fold_pwd()
- Completion
    - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
    - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting.git)
- Help
    - Built-in `run-help`
    - curl cheat.sh
    - dict
    - man
    - info

### oh-my-zsh

The community-driven [oh-my-zsh](https://ohmyz.sh/) framework for zsh also provides powerful plugins and themes.

    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    source ~/.zshrc     # Activate oh-my-zsh

The useful plugins of oh-my-zsh include git, sudo, z, wd, [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions), [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting.git), zsh-command-time.
Some of them is pre-installed with oh-my-zsh, but the following plugins are required to install from github.

    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/popstas/zsh-command-time ${ZSH_CUSTOM:~/.oh-my-zsh/custom}/plugins/zsh-command-time

The following command should replace the default command (i.e., `plugins=(git)`) in *.zshrc* file:

    plugins=(git sudo z wd colored-man-pages zsh-autosuggestions zsh-syntax-highlighting zsh-command-time)


## Swap keys

Usually, if you wants to swap Caplock and left Ctrl since the latter is more useful, some desktop provides an GUI tool such as gnome-tweak in GNOME or the setting in KDE that support this function.
For the desktops that do not have an GUI tool, a shell method is to use xmodmap and the GUI helper xkeycaps.
After change the keys in xkeycaps, write out the configuration file of xmodmap in the HOME diretory, and add the follows in the shell

    xmodmap ~/.xmodmap-`uname -n`

xmodmap will trigger the key swap when open a terminal.

