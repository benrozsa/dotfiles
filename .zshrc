# Set environment variables
BREW_HOME="/usr/local/Cellar"
MAVEN_VERSION="$(ls "$BREW_HOME/maven/")"
HOME="/Users/rozsabence"

# Java version
export JAVA_VERSION=11
export JAVA_HOME=`/usr/libexec/java_home -v ${JAVA_VERSION}`
export M2_HOME="$BREW_HOME/maven/$MAVEN_VERSION/libexec"
export MAVEN_HOME=$M2_HOME
export M2=$M2_HOME/bin
export NVM_DIR="$HOME/.nvm"
export PKG_CONFIG_PATH="${BREW_HOME}/ncurses/6.1/lib/pkgconfig"

# Zshell
export ZSH="${HOME}/.oh-my-zsh"

# Default text editor
export EDITOR="$(command -v vim)"

# VSCode
export CODE="/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Binary Locations
export PATH=/bin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:${PATH}
export PATH="/usr/local/sbin:$PATH"

# Python
export PYTHON_BIN="${HOME}/Library/Python/3.7/bin"
export PATH="$PYTHON_BIN:$CODE:${PATH}"

# Rust Package Manager
export PATH="$HOME/.cargo/bin:$PATH"

# LLVM
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"
export PATH="/usr/local/opt/llvm/bin:$PATH"

# Localization
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Load aliases
if [ -f "$HOME/.bash_aliases" ]; then
source "$HOME/.bash_aliases"
fi

# Configure zshell
ZSH_THEME="robbyrussell"
plugins=(
        git
        zsh-syntax-highlighting
        zsh-autosuggestions
        )

# Run additional scripts
source "$HOME/.nvm/nvm.sh"
source $ZSH/oh-my-zsh.sh

# YVM env
export YVM_DIR=/Users/rozsabence/.yvm
[ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh

# GHC env
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

# Yarn env
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# VLC
export DISPLAY=:0

