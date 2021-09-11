echo "Hello from .zshrc"

# Set Variables
export HOMEBREW_CASK_OPTS="--no-quarantine"
export NULLCMD=bat
export N_PREFIX="$HOME/.n"
export PREFIX="$N_PREFIX"
export DOTFILES="$HOME/.dotfiles"


# Adjust History Variables & Options
[[ -z $HISTFILE ]] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=5000
SAVEHIST=4000

setopt histNoStore
setopt extendedHistory
setopt histIgnoreAllDups
unsetopt appendHistory
setopt incAppendHistoryTime


# Line Editor Options (Completion, Menu, Directory, etc.)
# autoMenu & autoList are on by default
setopt autoCd
setopt globDots


# Create Aliases
alias ls='exa -laFh --git'
alias exa='exa -laFh --git'
alias man=batman
alias bbd='brew bundle dump --force --describe'
alias trail='<<<${(F)path}'
alias ftrail='<<<${(F)fpath}'
alias rm=trash
# Load history into shell (shareHistory alternative)
alias lh='fc -RI; echo "loaded and showing..."; history;'


# Customize Prompt(s)
PROMPT='
%F{069}%m%f %F{140}%1~%f %F{037}%L%f %# '

RPROMPT='%F{180}%D %*%f'


# Add Locations to $path array
typeset -U path

path=(
  "$N_PREFIX/bin"
  "/opt/homebrew/bin"
  $path
  "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
)

# Write Handy Functions
function mkcd() {
  mkdir -p "$@" && cd "$_";
}


$ Use ZSH Plugins
source <(antibody init)
antibody bundle < "$DOTFILES/antibody_plugins"


# Change Key Bindings
bindkey "^[[A" up-line-or-search
bindkey "^[[B" down-line-or-search


# Add "zstyles" for Completions & Other Things
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


# Load "New" Completion System
autoload -Uz compinit && compinit