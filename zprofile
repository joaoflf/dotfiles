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

eval "$(/opt/homebrew/bin/brew shellenv)"
