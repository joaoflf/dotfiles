## -- UI and Plugins --
ZSH_THEME=""

plugins=(
  zsh-autosuggestions
)

. $HOME/dotfiles/z.sh

## -- Exports --
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
export TERM=xterm-256color
export PATH="/usr/local/bin:$PATH"

## -- Aliases -- 
alias sudo="sudo "
alias g="git"
alias vim="nvim"
alias cat="bat"


# set fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# setup pure theme
fpath+=('$PWD/functions')
fpath+=('/usr/local/lib/node_modules/pure-prompt/functions')
autoload -U promptinit; promptinit
# optionally define some options
PURE_CMD_MAX_EXEC_TIME=10
prompt pure

# Set vim mode
set -o vi
