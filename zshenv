echo 'Hello from .zshenv'

export HOMEBREW_CASK_OPTS="--no-quarantine --no-binaries"
export N_PREFIX="$HOME/.n"
export PREFIX="$N_PREFIX"


#Exist function
function exists() {
  # 'command -v' is similar to 'which'
  command -v $1 >/dev/null 2>&1

  # More explicitly written:
  # command -v $1 1>/dev/null 2>/dev/null
}

# Initialize conda
# Contents within this block are managed by 'conda init'
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
