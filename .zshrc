export ZSH="$HOME/.oh-my-zsh"

export EDITOR="vim"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions fast-syntax-highlighting zsh-autocomplete)
source $ZSH/oh-my-zsh.sh

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

zstyle ':completion:*' rehash true
autoload -Uz compinit && compinit -C

### Aliases (merged from .bash_aliases and previous .zshrc)
[ -f "$HOME/.bash_aliases" ] && source "$HOME/.bash_aliases"
