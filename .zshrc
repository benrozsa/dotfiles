# -- Application PATHs --
export M2_HOME=/usr/local/Cellar/maven/3.6.0/libexec
export M2=$M2_HOME/bin
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export NVM_DIR=~/.nvm
export ZSH="/Users/rozsabence/.oh-my-zsh"

export PATH=$HOME/bin:$PATH
export PATH=$M2_HOME/bin:$PATH
export PATH=/usr/bin:$PATH
export PATH=/usr/local/bin:$PATH

# Load aliases
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# List Today's namedays
if [ -f ~/.nevnap ]; then
    source ~/.nevnap
fi

ZSH_THEME="robbyrussell"
plugins=(
  git 
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source ~/.nvm/nvm.sh
source $ZSH/oh-my-zsh.sh
