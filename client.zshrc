# --- zsh settings ---

HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=HISTSIZE
export LC_CTYPE=en_US.UTF-8
setopt autocd # cd by typing directory name
setopt correct_all # autocorrect commands
setopt auto_list # automatically list choices
setopt always_to_end # move cursor to end if word has one match
set -o vi # vi mode
TERM="xterm-256color"

#launc tmux on startup
if [ -z "$TMUX" ]
then
    tmux -u attach -t TMUX || tmux -u new -s TMUX
fi

# --- Plugins ---

# Pure theme
fpath+=("$HOME/.zsh/pure")
autoload -U promptinit; promptinit
prompt pure

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # launch fuzzy finder

# load antibody plugins
source <(antibody init)
antibody bundle < $HOME/.zsh_plugins.txt


## --- Aliases ---
alias sudo="sudo "
alias g="git"
alias cat="bat"
alias vim="nvim"
alias l="ls -la"
alias tmux='tmux -u'
