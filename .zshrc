# --- Oh My Zsh ---
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="vim"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
ZSH_THEME="robbyrussell"

# --- Dotfiles root (portable default) ---
# macOS default was hardcoded; now it falls back to ~/Dev/dotfiles on Linux
export DOTFILES_DIR="${DOTFILES_DIR:-$HOME/Dev/dotfiles}"

# --- Plugins ---
plugins=(git zsh-autosuggestions fast-syntax-highlighting zsh-autocomplete)
[ -s "$ZSH/oh-my-zsh.sh" ] && source "$ZSH/oh-my-zsh.sh"

# --- PATH ---
export PATH="$HOME/.local/bin:$PATH"

# --- FZF (optional) ---
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"

# --- Completion (single init) ---
zstyle ':completion:*' rehash true

# --- Homebrew zsh completions (macOS only) ---
if [ -d /opt/homebrew/share/zsh/site-functions ]; then
  fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
elif [ -d /usr/local/share/zsh/site-functions ]; then
  fpath=(/usr/local/share/zsh/site-functions $fpath)
fi

autoload -Uz compinit && compinit -C

# --- Aliases ---
[ -f "$HOME/.bash_aliases" ] && source "$HOME/.bash_aliases"

# --- NVM (optional) ---
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# --- Pyenv (optional) ---
# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init --path)"
# eval "$(pyenv init -)"
