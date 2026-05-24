# shellcheck shell=bash
# ~/.zshrc — interactive zsh config. Env/PATH lives in ~/.zshenv.

# --- Plugins (no framework; clone directly into ~/.zsh/plugins) ---
for p in zsh-autosuggestions fast-syntax-highlighting; do
  src="$HOME/.zsh/plugins/$p/$p.zsh"
  [ -f "$src" ] && source "$src"
done

# --- History ---
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE INC_APPEND_HISTORY

# --- Homebrew zsh completions (macOS) ---
if [[ "$OSTYPE" == darwin* ]]; then
  if [ -d /opt/homebrew/share/zsh/site-functions ]; then
    fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
  elif [ -d /usr/local/share/zsh/site-functions ]; then
    fpath=(/usr/local/share/zsh/site-functions $fpath)
  fi
fi

# --- Completion ---
# -C skips the insecure-dir check; brew/pyenv dirs are 755 by design.
autoload -Uz compinit && compinit -C
zstyle ':completion:*' rehash true

# --- Aliases ---
[ -f "$HOME/.bash_aliases" ] && source "$HOME/.bash_aliases"

# --- nvm (lazy: sourcing nvm.sh on every shell costs ~600ms; defer to first use) ---
_nvm_lazy() {
  unset -f nvm node npm npx yarn 2>/dev/null
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
  # bash_completion.d/nvm is bash-only — sourcing it in zsh prints `zle` setopt errors.
}
for _c in nvm node npm npx yarn; do
  eval "${_c}() { _nvm_lazy; ${_c} \"\$@\"; }"
done
unset _c

# --- pyenv (interactive completion + rehash hooks; shims are on PATH via .zshenv) ---
command -v pyenv >/dev/null && eval "$(pyenv init - zsh)"

# --- FZF integration ---
if command -v fzf >/dev/null; then
  if [[ -d /opt/homebrew/opt/fzf ]]; then
    source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
    source /opt/homebrew/opt/fzf/shell/completion.zsh
  fi
  [ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"
fi
