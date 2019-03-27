# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/usr/bin:$M2_HOME/bin$PATH

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# List Today's namedays
if [ -f ~/.nevnap ]; then
    source ~/.nevnap
fi

# -- Application PATHs --
export M2_HOME=/usr/local/Cellar/maven/3.6.0/libexec
export M2=$M2_HOME/bin
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# Path to your oh-my-zsh installation.
export ZSH="/Users/rozsabence/.oh-my-zsh"

ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"

plugins=(
  git 
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

#alias ll="ls -oa"
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
