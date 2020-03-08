# PATH
# set -x PATH $PATH /user/local/bin/
# set -x PATH $PATH /sbin/

# Flutter
set -x PATH $PATH $HOME/Github/flutter/bin

# Localization
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Functions
function ll
    ls -lh $argv
end

# Aliases
alias c="clear && printf '\e[3J'"
alias l="ls -la"

alias hs="cd ~/HobbyProjects/"
alias ws="cd ~/WebstormProjects/"

alias fishconfig="vi ~/.config/fish/config.fish"
alias sshconfig="vi ~/.ssh/config"
alias vimconfig="vi ~/.vimrc"
alias zshconfig="vi ~/.zshrc"
alias gitconfig="vi ~/.gitconfig"

alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'

# Git
alias a="git add ."
alias s="git status"
alias d="git diff"
alias f="git fetch"
alias b="git branch -a"
alias p="git pull"
alias pu="git push"
alias br="git branch -a"
alias lo="git log"

