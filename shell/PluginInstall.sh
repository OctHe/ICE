#!/bin/zsh
#
# Plugins for zsh

if [[ $# -ge 1 ]]; then
    local zsh_plugins=$1

elif [[ $# -eq 0 ]]; then
    # The default plugin directory
    local zsh_plugins=~/.zsh/plugins

fi

echo "Plugins will be installed in ${zsh_plugins}"

git clone https://github.com/agnoster/agnoster-zsh-theme ${zsh_plugins}/agnoster-zsh-theme
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${zsh_plugins}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${zsh_plugins}/zsh-autosuggestions/zsh-autosuggestions.zsh
