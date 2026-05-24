# shellcheck shell=bash
# ~/.zshenv — sourced for every shell (interactive, scripts, AI agent subshells).
# PATH and env vars belong here so non-interactive callers see them.

export EDITOR="vim"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Dotfiles root (portable default)
export DOTFILES_DIR="${DOTFILES_DIR:-$HOME/Dev/dotfiles}"

# --- Homebrew (macOS) ---
if [[ "$OSTYPE" == darwin* ]] && [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# --- User local bins ---
[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"

# --- nvm (path only; nvm.sh is sourced in .zshrc to keep script-launch cheap) ---
export NVM_DIR="$HOME/.nvm"

# --- pyenv (shims on PATH so non-interactive `python` resolves correctly) ---
export PYENV_ROOT="$HOME/.pyenv"
[ -d "$PYENV_ROOT/bin" ] && export PATH="$PYENV_ROOT/bin:$PATH"
[ -d "$PYENV_ROOT/shims" ] && export PATH="$PYENV_ROOT/shims:$PATH"
