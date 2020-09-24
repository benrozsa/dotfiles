# Localization
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Ruby
set -x PATH $PATH /usr/local/lib/ruby/gems/2.7.0/bin

# Go
set -x -U GOPATH $HOME/Dev/go

# Rust Package Manager
set -x CARGO_PATH $HOME/.cargo/bin
set -x PATH $CARGO_PATH:$PATH

# Deno
set -x DENO_PATH $HOME/.deno
set -x PATH $DENO_PATH/bin:$PATH

# Flutter
set FLUTTER_PATH $HOME/Dev/Github/flutter/bin
set -x PATH $PATH $FLUTTER_PATH 
set -x PATH $PATH $FLUTTER_PATH/cache/dart-sdk
set -x PATH $PATH $FLUTTER_PATH/cache/dart-sdk/bin


# Aliases
alias c="clear && printf '\e[3J'"
alias l="ls -la"
alias vi="nvim"

alias fishconfig="nvim ~/.config/fish/config.fish"
alias sshconfig="nvim ~/.ssh/config"
alias vimconfig="nvim ~/.vimrc"
alias nvimconfig="nvim ~/.config/nvim/init.vim"
alias zshconfig="nvim ~/.zshrc"
alias gitconfig="nvim ~/.gitconfig"
alias aliasconfig="nvim ~/.bash_aliases"

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
alias gs="git stash --all"
alias gsp="git stash pop"
alias gsl="git stash list"

# Yarn
alias y="yarn"
alias ys="yarn start"
alias yd="yarn dev"
alias yb="yarn build"
alias yt="yarn test"
alias yl="yarn lint"

# Gatsby
alias gd="gatsby develop"
alias gb="gatsby build"
alias gs="gatsby serve"
