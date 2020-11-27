export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

set PATH /usr/local/bin /usr/local/sbin /usr/bin /bin /usr/sbin /sbin

# add MacPorts to PATH
set PATH $PATH /opt/local/bin /opt/local/sbin

# Global Node packages
set PATH $PATH ~/.nvm/versions/node/v12.16.1/bin

# Java version
# set JAVA_VERSION 1.8
# set JAVA_HOME `/usr/libexec/java_home -v {$JAVA_VERSION}`
set -x JAVA_HOME (/usr/libexec/java_home -d64 -v1.8)

# Rust Package Manager
set CARGO_PATH $HOME/.cargo/bin
set PATH $PATH $CARGO_PATH

# Deno
set DENO_INSTALL $HOME/.deno
set PATH $PATH $DENO_INSTALL/bin

alias c="clear && printf '\e[3J'"

alias fishconfig="nvim ~/.config/fish/config.fish"
alias sshconfig="nvim ~/.ssh/config"
alias vimconfig="nvim ~/.vimrc"
alias nvimconfig="nvim ~/.config/nvim/init.vim"


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

# set -x YVM_DIR /usr/local/opt/yvm
set -x YVM_DIR /Users/ben/.yvm
[ -r $YVM_DIR/yvm.fish ]; and source $YVM_DIR/yvm.fish
