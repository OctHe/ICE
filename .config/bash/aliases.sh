# Aliases for bash and zsh
#
# Copyright(C) OctHe
#

# This project
alias onepoint='/usr/bin/git --git-dir=$HOME/.onepoint/ --work-tree=$HOME'

# ls
alias l='ls --color=always -lh'
alias ls='ls --color=always'
alias ll='ls --color=always -alh'

# Git
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'
alias gd='git diff'
alias gp='git push'
alias gpl='git pull'

# Grep
alias rgrep='grep --color=always --exclude-dir=.git -arn'

# if which vim > /dev/null 2>&1; then
#     alias svim='vim -u ~/.config/svim/vimrc --cmd "set runtimepath-=~/.vim" --cmd "set runtimepath-=~/.vim/after" --cmd "set runtimepath^=~/.config/svim" --cmd "set runtimepath+=~/.config/svim/after"  --cmd "set packpath-=~/.vim" --cmd "set packpath-=~/.vim/after" --cmd "set packpath^=~/.config/svim" --cmd "set packpath+=~/.config/svim/after"'
# fi
if which vim > /dev/null 2>&1; then
    alias svim='vim -u ~/.config/svim/vimrc'
fi

if which nvim > /dev/null 2>&1; then
    alias darkvim='NVIM_APPNAME=darkvim nvim'
fi
if which nvim > /dev/null 2>&1; then
    alias nvimini='NVIM_APPNAME=nvimini nvim'
fi
