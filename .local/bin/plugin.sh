#!/bin/zsh
#
# Plugins for zsh

function install_plugins() {
    if [[ $# -ge 1 ]]; then
        local zsh_plugin=$1

    elif [[ $# -eq 0 ]]; then
        # The default plugin directory
        local zsh_plugin=~/.zsh/plugin

    fi

    echo "Plugins will be installed in ${zsh_plugin}"

    git clone https://github.com/agnoster/agnoster-zsh-theme ${zsh_plugin}/agnoster-zsh-theme
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ${zsh_plugin}/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ${zsh_plugin}/zsh-autosuggestions

}

install_plugins
