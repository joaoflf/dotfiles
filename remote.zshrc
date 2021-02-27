# --- zsh settings ---

HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=HISTSIZE
export LC_CTYPE=en_US.UTF-8
setopt autocd # cd by typing directory name
setopt auto_list # automatically list choices
setopt always_to_end # move cursor to end if word has one match
set -o vi # vi mode
TERM="xterm-256color"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin/:/opt/cuda-10.2/bin/:$PATH"
eval "$(pyenv init -)"

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
alias l="ls -la --color=auto"
alias tmux='tmux -u'
