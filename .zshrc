# Set environment variables
BREW_HOME="/usr/local/Cellar"
MAVEN_VERSION="$(ls "$BREW_HOME/maven/")"
HOME="/Users/rozsabence"

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export M2_HOME="$BREW_HOME/maven/$MAVEN_VERSION/libexec"
export MAVEN_HOME=$M2_HOME
export M2=$M2_HOME/bin
export NVM_DIR=~/.nvm
export PKG_CONFIG_PATH="${BREW_HOME}/ncurses/6.1/lib/pkgconfig"

export ZSH="${HOME}/.oh-my-zsh"
export EDITOR="$(command -v vim)"
export CODE="/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PYTHON_BIN="${HOME}/Library/Python/3.7/bin"

export PATH=/bin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:${PATH}
export PATH="$PYTHON_BIN:$CODE:${PATH}"

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

echo ""
echo $(motivate) | fold -s -w76 | while read -r a; do echo "$a"; done
echo ""


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
