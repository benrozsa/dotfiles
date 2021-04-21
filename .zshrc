# Localization
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Load aliases
if [ -f "$HOME/.bash_aliases" ]; then
source "$HOME/.bash_aliases"
fi

# VSCode
export CODE="/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Java
export JAVA_VERSION=8
export JAVA_HOME=`/usr/libexec/java_home -v ${JAVA_VERSION}`

# Deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Flutter
export FLUTTER_INSTALL="$HOME/Dev/flutter"
export PATH="$FLUTTER_INSTALL/bin:$PATH"

# Android Platform Tools
export PATH="$HOME/Library/Android/sdk/platform-tools/:$PATH"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE="nerdfont-complete"

# plugins=(git)
plugins=(
        git
        zsh-syntax-highlighting
        zsh-autosuggestions
        mongodb
        )

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export YVM_DIR=/usr/local/opt/yvm
[ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
