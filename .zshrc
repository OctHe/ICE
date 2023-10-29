# Zsh configuration
#
# Copyright(C) Shiyue He (hsy1995313@gmail.com)
#
# If the OS distribution only has bash, install zsh with packet manager
#
# Change the default user with
#   chsh -s /bin/zsh <USER_NAME>
#
# Test of the startup time. The time can be 0.01s with no plugins
#   time zsh -i -c exit

# Options. Get help by running
#   run-help zshoptions
setopt nobeep
setopt extended_history         # Record timestamp of command
setopt hist_ignore_dups         # Ignore duplicated commands history list
setopt hist_ignore_space        # Ignore commands that start with space
setopt hist_verify              # Show command with history expansion to user before running it
setopt complete_in_word         # Allow completion from within a word/phrase
setopt prompt_subst             # Make PROMPT works right

# Alias
local graphicless=~
test -s .alias && source .alias 

# zsh-specific alias
alias ...='../..'
alias ....='../../..'
alias .....='../../../..'
alias ......='../../../../..'


# Autoload functions
autoload -U compinit && compinit	# Completion initalization 
autoload -U colors && colors 		# Functions to easily use colors

# ls color
eval `dircolors`

# zsh completion (from manjaro zsh configuration)
# Run 'run-help zshmodules' to get help for zstyle
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|=*' 'l:|=* r:|=*'   # Coomplete partial words
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)

# History file
HISTFILE=~/.zhistory
HISTSIZE=20000
SAVEHIST=20000

# Colored man when the PAGER=less
# Redefine the man command so the follow environment variables changes only for man page
function man() {

    # mb: start blinking
    # md: Start bold mode
    # me: End mb, md
    # so: Start standout mode
    # se: End so
    # us: Start underlining
    # ue: End us
    local environment=(
        LESS_TERMCAP_mb=${fg_bold[blue]} \
        LESS_TERMCAP_md=${fg_bold[blue]} \
        LESS_TERMCAP_me=${reset_color} \
        LESS_TERMCAP_so=${fg_bold[white]}${bg[green]}   \
        LESS_TERMCAP_se=${reset_color} \
        LESS_TERMCAP_us=${fg_bold[yellow]} \
        LESS_TERMCAP_ue=${reset_color}
    )

    # Set groffy's legacy output format
    # Use `man groffy` to see detail
    environment+=( GROFF_NO_SGR=1 )

    env $environment $0 $@
}

# zinit: A fast zsh plugin manager
ZINIT_HOME="${HOME}/.local/share/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Autocompletion for zinit
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Plugins that are managed by zinit
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions

# Remind the alias after using a command
zinit light MichaelAquilina/zsh-you-should-use

# New cd command for zsh
# z plugin has a man page (i.e., z.1) in the plugin directory, but zinit cannot manage it
# The follow command manual use man page for z command
#   zinit cd rupa/z; man ./z.1
zinit light rupa/z

# List directory with git features
zinit light supercrabtree/k

# agnoster prompt requires powerline-fonts
#   sudo apt install fonts-powerline
zinit light agnoster/agnoster-zsh-theme

# Remove segment 2 of agnoster prompt. Default segments are :
#     1	prompt_status
#     2	prompt_context
#     3	prompt_virtualenv
#     4	prompt_dir
#     5	prompt_git
#     6	prompt_end
AGNOSTER_PROMPT_SEGMENTS[2]=

