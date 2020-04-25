# Ruby
set -x PATH $PATH /usr/local/lib/ruby/gems/2.7.0/bin

# Go
# set -x GOPATH $HOME/go/bin
set -x -U GOPATH $HOME/Dev/go

# Flutter
set FLUTTER_PATH $HOME/Dev/Github/flutter/bin
set -x PATH $PATH $FLUTTER_PATH 
set -x PATH $PATH $FLUTTER_PATH/cache/dart-sdk
set -x PATH $PATH $FLUTTER_PATH/cache/dart-sdk/bin

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
alias aliasconfig="vi ~/.bash_aliases"

alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'

# Git
alias a="git add ."
alias s="git status"
alias d="git diff"
alias dh="git diff HEAD"
alias f="git fetch"
alias b="git branch -a"
alias p="git pull"
alias pu="git push"
alias br="git branch -a"
alias lo="git log"
alias gs="git stash"
alias gsp="git stash pop"
alias gsl="git stash list"

# Yarn
alias y="yarn"
alias ys="yarn start"
alias yd="yarn dev"

# Gatsby
alias gd="gatsby develop"
