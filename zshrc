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
#PROMPT='
#%F{069}%m%f %F{140}%1~%f %F{037}%L%f %# '

#RPROMPT='%F{180}%D %*%f'
SPACESHIP_CHAR_SYMBOL="❯ "
SPACESHIP_TIME_SHOW=true
SPACESHIP_EXEC_TIME_ELAPSED=0
SPACESHIP_BATTERY_SHOW=always
SPACESHIP_EXIT_CODE_SHOW=true

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  package       # Package version
  node          # Node.js section
  exec_time     # Execution time
  line_sep      # Line break
  # vi_mode       # Vi-mode indicator
  # jobs          # Background jobs indicator
  char          # Prompt character
)

SPACESHIP_RPROMPT_ORDER=(
  exit_code
  battery
  time
)


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


# Use ZSH Plugins
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source <(antibody init)
antibody bundle < "$DOTFILES/antibody_plugins"


# Change Key Bindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


# Add "zstyles" for Completions & Other Things
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':plugin:history-search-multi-word' clear-on-cancel 'yes'


# Load "New" Completion System
autoload -Uz compinit && compinit