# shellcheck shell=bash
# ~/.zshrc — interactive zsh config. Env/PATH lives in ~/.zshenv.

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

# --- Plugins (no framework; clone directly into ~/.zsh/plugins) ---
# Loaded after compinit per upstream guidance (fast-syntax-highlighting hooks ZLE widgets).
# Prefer $name.plugin.zsh (standard convention); fall back to $name.zsh.
for p in zsh-autosuggestions fast-syntax-highlighting; do
  for src in "$HOME/.zsh/plugins/$p/$p.plugin.zsh" "$HOME/.zsh/plugins/$p/$p.zsh"; do
    [ -f "$src" ] && { source "$src"; break; }
  done
done

# --- less (wheel-driven paging in iTerm2) ---
# -R keeps color escapes; --mouse + --wheel-lines makes less consume wheel events
# itself and scroll N lines per tick, bypassing iTerm2's linear wheel→arrow path.
export LESS='-R --mouse --wheel-lines=5'

# --- Aliases ---
[ -f "$HOME/.bash_aliases" ] && source "$HOME/.bash_aliases"

# --- fnm (fast Rust-based Node version manager; auto-switches on `cd` via .nvmrc/.node-version) ---
command -v fnm >/dev/null && eval "$(fnm env --use-on-cd --shell zsh)"

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
