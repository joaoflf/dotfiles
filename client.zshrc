# --- zsh settings ---

HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=HISTSIZE
export LC_CTYPE=en_US.UTF-8
setopt autocd # cd by typing directory name
setopt correct_all # autocorrect commands
setopt auto_list # automatically list choices
setopt always_to_end # move cursor to end if word has one match
TERM="xterm-256color"

# --- Plugins ---
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # launch fuzzy finder

# load antibody plugins
source <(antibody init)
antibody bundle < $HOME/dotfiles/zsh_plugins.txt

## -- Go paths --
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin


## --- Aliases ---
alias sudo="sudo "
alias g="git"
alias cat="bat"
alias vim="nvim"
alias l="ls -la"
alias tmux='tmux -u'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/joaofernandes/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/joaofernandes/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/joaofernandes/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/joaofernandes/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
