#  _____   _____   _____
# |_   _| | ___ \ /  ___|    I B Srinivas
#   | |   | |_/ / \ `--.     Github: IBS27
#   | |   | ___ \  `--. \
#  _| |_  | |_/ / /\__/ /
#  \___/  \____/  \____/
#
# My zsh config

source $HOME/.cargo/env

# some useful options (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')

# beeping is annoying
unsetopt BEEP

# Colors
autoload -Uz colors && colors

# completions
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)		# Include hidden files.

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Useful functions
source "$ZDOTDIR/zsh-functions"

# Plugins
zsh_add_plugin "zsh-users/zsh-completions"
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "zsh-users/zsh-history-substring-search"
zsh_add_plugin "hlissner/zsh-autopair"
zsh_add_completion "esc/conda-zsh-completion" false

# Normal files to source
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-exports"
zsh_add_file "zsh-vim-mode"
zsh_add_file "zsh-prompt"

# Key-bindings
bindkey -s '^o' 'ranger^M'
bindkey -s '^f' 'zi^M'
bindkey -s '^s' 'ncdu^M'
bindkey -s '^z' 'zi^M'
bindkey -s "^l" "clear^M"
bindkey '^[[P' delete-char
bindkey "^p" up-line-or-beginning-search # Up
bindkey "^n" down-line-or-beginning-search # Down
bindkey "^k" up-line-or-beginning-search # Up
bindkey "^j" down-line-or-beginning-search # Down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -r "^u"
bindkey -r "^d"

# Init completion
compinit

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line

# Nice startup info
neofetch
