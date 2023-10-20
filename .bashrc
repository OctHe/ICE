# Bash configuration
# Copyright (c) Shiyue He (hsy1995313@gmail.com)

# Alias
test -s .alias && . .alias

# Enable a fold work directory in PS1
function fold_pwd() 
{

    if [[ $PWD == $HOME ]]; then
        echo "~"
        return
    fi

    # Match substring under the HOME
    # Replace the char of HOME with ~
    local pwd=$PWD
    [[ $pwd == $HOME/* ]] && pwd="~${pwd:${#HOME}}"

    # Split word with /
    local IFS="/"
    # Get the directory words
    local words=($pwd)

    for ((i = 0; i < ${#words[@]} -1; i++)); do
        local word=${words[$i]}
        words[$i]=${word:0:1}
    done

    echo "${words[*]}"
}

# Swap Ctrl and Caplock, if available
[[ -f ~/.xmodmap-`uname -n` ]] && xmodmap ~/.xmodmap-`uname -n`

# Enable \u and \h to show the user and host
export PS1=$'\[\e[32m\]$(fold_pwd)\[\e[0m\] > '

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# Use gitprompt, if available
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    source $HOME/.bash-git-prompt/gitprompt.sh
fi

# Colored man when the PAGER=less
# Redefine the man command so the follow environment variables changes only for man page
#   mb: start blinking
#   md: Start bold mode
#   me: End mb, md
#   so: Start standout mode
#   se: End so
#   us: Start underlining
#   ue: End us
#   GROFF_NO_SCR: Set groffy's legacy output format. Use `man groffy` to see detail
function man() {
        LESS_TERMCAP_mb=$'\e[01;31m' \
        LESS_TERMCAP_md=$'\e[01;31m' \
        LESS_TERMCAP_me=$'\e[0m' \
        LESS_TERMCAP_se=$'\e[0m' \
        LESS_TERMCAP_so=$'\e[45;93m' \
        LESS_TERMCAP_ue=$'\e[0m' \
        LESS_TERMCAP_us=$'\e[4;93m' \
        GROFF_NO_SGR=1 \
        command man "$@"

}
