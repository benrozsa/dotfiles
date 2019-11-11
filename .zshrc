# Set environment variables
BREW_HOME="/usr/local/Cellar"
MAVEN_VERSION="$(ls "$BREW_HOME/maven/")"

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export M2_HOME="$BREW_HOME/maven/$MAVEN_VERSION/libexec"
export MAVEN_HOME=$M2_HOME
export M2=$M2_HOME/bin
export NVM_DIR=~/.nvm

export ZSH="/Users/rozsabence/.oh-my-zsh"
export EDITOR="$(command -v vim)"
export PATH=/bin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:${PATH}

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Load aliases
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# List Today's namedays
if [ -f ~/.nevnap ]; then
    source ~/.nevnap
fi

# Configure zshell
ZSH_THEME="spaceship"
plugins=(
  git 
  zsh-syntax-highlighting
  zsh-autosuggestions
)

# Configure spaceship
SPACESHIP_PROMPT_ADD_NEWLINE="false"

# Run additional scripts
source ~/.nvm/nvm.sh
source $ZSH/oh-my-zsh.sh

export YVM_DIR=/Users/rozsabence/.yvm
[ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh
