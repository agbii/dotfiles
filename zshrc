echo "Hello from .zshrc"

# Set Variables
export HOMEBREW_CASK_OPTS="--no-quarantine"
export NULLCMD=bat
export $N_PREFIX="$HOME/.n"
export PREFIX="$N_PREFIX"


# Source installed zsh configurations
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Create Aliases
alias ls='exa -laFh --git'
alias exa='exa -laFh --git'
alias man=batman
alias bbd='brew bundle dump --force --describe'
alias trail='<<<${(F)path}'
alias rm=trash


# Customize Prompt(s)
PROMPT='
%F{069}%m%f %F{140}%1~%f %F{037}%L%f %# '

RPROMPT='%F{180}%D %*%f'


# Add Locations to $PATH Variable
export PATH="$N_PREFIX:$PATH"
export PATH=/opt/homebrew/bin:$PATH
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"


# Write Handy Functions
function mkcd() {
  mkdir -p "$@" && cd "$_";
}
