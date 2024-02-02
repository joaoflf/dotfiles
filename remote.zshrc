# --- zsh settings ---

HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=HISTSIZE
export LC_CTYPE=en_US.UTF-8
setopt autocd # cd by typing directory name
setopt auto_list # automatically list choices
setopt always_to_end # move cursor to end if word has one match

# launch tmux on incoming ssh connection
if [[ "$TMUX" == "" ]] &&
        [[ "$SSH_CONNECTION" != "" ]]; then
    WHOAMI=$(whoami)
    if tmux has-session -t $WHOAMI 2>/dev/null; then
    tmux -u -2 attach-session -t $WHOAMI
    else
        tmux -u  -2 new-session -s $WHOAMI
    fi
fi

# --- Plugins ---

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # launch fuzzy finder

# load antibody plugins
source <(antibody init)
antibody bundle < $HOME/dotfiles/zsh_plugins.txt


## --- Aliases ---
alias sudo="sudo "
alias g="git"
alias cat="bat"
alias vim="nvim"
alias l="ls -la --color=auto"
alias tmux='tmux -u'
