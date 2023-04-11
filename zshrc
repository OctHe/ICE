# Zsh configuration for ICE
#
# Copyright(C) Shiyue He
#
# If the OS distribution only has bash, install zsh with packet manager
#
# Change the default user with
#     chsh -s /bin/zsh <USER_NAME>
# Install zshrc file
#     ln -s /absolute/path/to/zshrc ~/.zshrc
#

# Options
setopt nobeep

# Aliases
alias ls='ls --color=always'

# Autoload functions
autoload -U compinit colors
compinit	# Completion initalization 
colors 		# Functions to easily use colors

# ls color
eval `dircolors`

# zsh completion (from manjaro zsh configuration)
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)

# History file
HISTFILE=~/.zhistory
HISTSIZE=20000
SAVEHIST=20000

# Plugins
local zsh_plugins=~/.zsh/plugins

[[ -e ${zsh_plugins}/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && \
	source ${zsh_plugins}/zsh-autosuggestions/zsh-autosuggestions.zsh

[[ -e ${zsh_plugins}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
	source ${zsh_plugins}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if [[ -e ${zsh_plugins}/powerlevel10k/powerlevel10k.zsh-theme ]]; then 
	source ${zsh_plugins}/powerlevel10k/powerlevel10k.zsh-theme

	# Configuration of powerlevel10k theme
	[[ -e ~/.p10k.zsh ]] && source ~/.p10k.zsh
fi