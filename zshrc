alias sudo="sudo "
alias g="git"
alias cat="bat"
alias vim="nvim"
alias l="ls -la"
alias tmux='tmux -u'
alias start-zscaler="open -a /Applications/Zscaler/Zscaler.app --hide; sudo find /Library/LaunchDaemons -name '*zscaler*' -exec launchctl load {} \;"
alias kill-zscaler="find /Library/LaunchAgents -name '*zscaler*' -exec launchctl unload {} \;;sudo find /Library/LaunchDaemons -name '*zscaler*' -exec launchctl unload {} \;"

# load antibody plugins
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
antidote bundle < $HOME/dotfiles/zsh_plugins.txt >~/.zsh_plugins.zsh
source ~/.zsh_plugins.zsh

source <(fzf --zsh)

export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh

#fix gpg issue
export GPG_TTY=$(tty)

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
      tmux attach-session -t default || tmux new-session -s default
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/joafer1/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/joafer1/Downloads/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/joafer1/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/joafer1/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

