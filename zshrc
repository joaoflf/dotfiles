## -- UI and Plugins --
ZSH_THEME=""

plugins=(
  git,
  zsh-autosuggestions
)

. $HOME/dotfiles/z.sh

# -- Exports --
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
export PATH=/usr/local/cuda-9.0/bin${PATH:+${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH:+${LD_LIBRARY_PATH}}
export PATH="$HOME/anaconda3/bin:$PATH"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export TERM=xterm-256color
export PATH="/usr/local/bin:$PATH"

# -- Aliases -- 
alias g="git"
alias vim="nvim"
alias cat="bat"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# setup pure theme
fpath+=('$PWD/functions')
fpath+=('/usr/local/lib/node_modules/pure-prompt/functions')
autoload -U promptinit; promptinit
# optionally define some options
PURE_CMD_MAX_EXEC_TIME=10
prompt pure
