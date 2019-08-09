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
export BUNDLE_GITHUB__COM=94ae125ba619925755c3f5ef881c92b6df991efe:x-oauth-basic


## -- Aliases -- 
alias sudo="sudo "
alias g="git"
alias vim="nvim"
alias cat="bat"


# set fuzzy finder
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

autoload -U promptinit; promptinit
prompt pure

# Set vim mode
set -o vi

