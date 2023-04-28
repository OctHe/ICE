## Shell

In Ubuntu/Debian, the follow command can be used to install packages

    sudo apt install zsh git

In OpenSUSE, it uses `zypper` as the manager, so 

    sudo zypper install git

In the above command, only git is installed.

- Shell
    - Bash
        - Prompt
            - Fold directory
            - [bash-git-prompt](https://github.com/magicmonty/bash-git-prompt)
        - Alias: ls, git
        - Color
        - History
        - Keybinding: bulit-in `bind`
        - Completion
            - Bash-completion
        - Help: Built-in `help`
    - zsh
        - Prompt
            - common
            - git
                - (branch, branch tracking|local status)
        - Alias: ls, git
        - Color
        - History
        - Keybinding (bindkey)
            - sudo, man, less
        - Directory
            - z
            - wd
        - Completion
            - [gitignore](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/gitignore/gitignore.plugin.zsh)
            - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
            - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting.git)
        - Help: Built-in `run-help`
    - Python
        - ipython

### Bash and bash-it

Bash is the default shell for most Linux distribution.
The first things for ICE is to config a graceful shell environment with bash-it.

    git clone https://github.com/Bash-it/bash-it.git ~/.bash_it
    cd .bash_it
    ~/.bash_it/install.sh       # Active bash-it

### zsh and oh-my-zsh

ICE default uses the community-driven [oh-my-zsh](https://ohmyz.sh/) framework for zsh.
ICE installs zsh and oh-my-zsh with the following

    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    source ~/.zshrc     # Activate oh-my-zsh

#### Plugin

The useful plugins of oh-my-zsh include git, sudo, z, wd, [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions), [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting.git), zsh-command-time.
Some of them is pre-installed with oh-my-zsh, but the following plugins are required to install from github.

    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/popstas/zsh-command-time ${ZSH_CUSTOM:~/.oh-my-zsh/custom}/plugins/zsh-command-time

The following command should replace the default command (i.e., `plugins=(git)`) in *.zshrc* file:

    plugins=(git sudo z wd colored-man-pages zsh-autosuggestions zsh-syntax-highlighting zsh-command-time)

