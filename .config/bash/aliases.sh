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

if which vim > /dev/null 2>&1; then
    alias cvim='vim -u ~/.config/cvim/vimrc --cmd "set runtimepath-=~/.vim" --cmd "set runtimepath-=~/.vim/after" --cmd "set runtimepath^=~/.config/cvim" --cmd "set runtimepath+=~/.config/cvim/after" '
fi

if which nvim > /dev/null 2>&1; then
    alias nvimini='NVIM_APPNAME=nvimini nvim'
fi
