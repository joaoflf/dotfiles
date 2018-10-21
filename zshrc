## -- UI and Plugins --
ZSH_THEME="robbyrussell"

plugins=(
  git,
  zsh-autosuggestions
)

# -- Exports --
export ZSH="/home/bridge/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
export PATH=/usr/local/cuda-9.0/bin${PATH:+${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH:+${LD_LIBRARY_PATH}}
export PATH="/home/bridge/anaconda3/bin:$PATH"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export TERM=xterm-256color

# -- Aliases -- 
alias g="git"
