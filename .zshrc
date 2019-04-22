# Set environment variables
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export M2_HOME="/usr/local/Cellar/maven/"$(ls "/usr/local/Cellar/maven/")"/libexec"
export MAVEN_HOME=$M2_HOME
export M2=$M2_HOME/bin
export NVM_DIR=~/.nvm
export ZSH="/Users/rozsabence/.oh-my-zsh"
export EDITOR="$(command -v vim)"
export PATH=/bin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:${PATH}

# Load aliases
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# List Today's namedays
if [ -f ~/.nevnap ]; then
    source ~/.nevnap
fi

# Configure zshell
ZSH_THEME="robbyrussell"
plugins=(
  git 
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source ~/.nvm/nvm.sh
source $ZSH/oh-my-zsh.sh
