## zterm

zterm is a terminal configuration of Shiyue.
It is based on zsh, and it uses the famous [oh-my-zsh](https://ohmyz.sh/) framework.

### Installation

zterm requires zsh and oh-my-zsh with the following

    sudo apt update
    sudo apt zsh
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

### Proxy

Use the following command in `.zshrc`

    export http_proxy="socks5://127.0.0.1:7890"
    export https_proxy="socks5://127.0.0.1:7890"

### Plugins

The useful plugins of oh-my-zsh include *git, sudo, z, wd, [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions), [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting.git)*.
Some of them is pre-installed with oh-my-zsh, but the following plugins are required to install from github.

    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

The following command should replace the default command (i.e., `plugins=(git)`) in *.zshrc* file:

    plugins=(git sudo z wd zsh-autosuggestions zsh-syntax-highlighting)

Finally, run `source ~/.zshrc` to activate the file or restart the system.
