#!/usr/bin/env bash
set -euo pipefail

# --------- Logging ---------
log() { printf "%b\n" "$*"; }
ok() { log "✅ $*"; }
warn() { log "⚠️  $*"; }
info() { log "ℹ️  $*"; }

trap 'echo "⚠️  Failed at line $LINENO"; exit 1' ERR

# --------- Helpers ---------
have() { command -v "$1" >/dev/null 2>&1; }
need() { have "$1" || { echo "Missing: $1"; exit 1; }; }

backup() {
  local tgt="$1" bak="${tgt}.bak"
  if [[ -e "$tgt" || -L "$tgt" ]]; then
    if [[ ! -e "$bak" && ! -L "$bak" ]]; then
      mv -f -- "$tgt" "$bak"
      warn "Backed up $tgt -> $bak"
    else
      warn "Backup exists, skipping: $bak"
    fi
  fi
}

link() {
  local src="$1" tgt="$2"
  [[ -e "$src" || -L "$src" ]] || { warn "Skip (missing src): $src"; return 0; }
  mkdir -p -- "$(dirname "$tgt")"
  if [[ -L "$tgt" && "$(readlink "$tgt")" == "$src" ]]; then
    ok "Already linked: $tgt -> $src"
    return 0
  fi
  backup "$tgt"
  ln -sfn -- "$src" "$tgt"
  ok "Linked: $tgt -> $src"
}

# --------- Paths ---------
export DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"

# Detect VS Code user settings dir
case "$(uname -s)" in
  Darwin) CODE_USER_DIR="$HOME/Library/Application Support/Code/User" ;;
  Linux)  CODE_USER_DIR="$HOME/.config/Code/User" ;;
  *)      CODE_USER_DIR="$HOME/.config/Code/User" ;;
esac

# --------- Dotfiles ---------
info "Symlinking dotfiles to home directory..."
link "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
link "$DOTFILES_DIR/.bash_aliases" "$HOME/.bash_aliases"
link "$DOTFILES_DIR/.vimrc" "$HOME/.vimrc"
ok "Dotfiles symlinked."

# --------- Fedora Bash (.bashrc) ---------
if [ -f /etc/os-release ]; then
  # shellcheck disable=SC1091
  . /etc/os-release
  if [ "${ID:-}" = "fedora" ]; then
    info "Linking Fedora Bash config (~/.bashrc)..."
    link "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
    ok "Bash config linked for Fedora."
  fi
fi

# --------- Vim Undo Dir ---------
info "Ensuring Vim undo directory exists..."
mkdir -p -- "$HOME/.vim/undodir"
ok "Vim undo dir ready."

# --------- VS Code Settings ---------
info "Symlinking VS Code settings..."
if have code || [ -d "$CODE_USER_DIR" ]; then
  mkdir -p -- "$CODE_USER_DIR"
  link "$DOTFILES_DIR/.vscode/settings.json" "$CODE_USER_DIR/settings.json"
  link "$DOTFILES_DIR/.vscode/mcp.json" "$CODE_USER_DIR/mcp.json"
  ok "Editor settings linked."
  if [[ -f "$DOTFILES_DIR/.vscode/vscode-extensions.txt" ]]; then
    while IFS= read -r ext; do
      [[ -n "$ext" && "$ext" != \#* ]] && code --install-extension "$ext" || true
    done < "$DOTFILES_DIR/.vscode/vscode-extensions.txt"
  fi
else
  warn "VS Code not found; skipping Code links."
fi

# --------- shfmt Wrapper (workspace-scoped) ---------
# VS Code now uses the workspace wrapper at .vscode/bin/shfmt directly.
# No user-level symlink is required.

# --------- Git Config (optional) ---------
if [[ -f "$DOTFILES_DIR/git-config-setup.sh" ]]; then
  chmod +x "$DOTFILES_DIR/git-config-setup.sh" || true
  info "Running personal Git configuration setup..."
  "$DOTFILES_DIR/git-config-setup.sh"
  ok "Git configuration applied."
else
  info "git-config-setup.sh not found; skipping."
fi

# --------- Zsh Plugins (Oh My Zsh essentials) ---------
info "Ensuring Zsh plugins are installed..."
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
if [[ ! -d "${ZSH_CUSTOM%/}/.." ]]; then
  info "Oh My Zsh not found. Install: https://ohmyz.sh"
else
  need git
  plugins=(
    "zsh-autosuggestions|https://github.com/zsh-users/zsh-autosuggestions.git"
    "fast-syntax-highlighting|https://github.com/zdharma-continuum/fast-syntax-highlighting.git"
    "zsh-autocomplete|https://github.com/marlonrichert/zsh-autocomplete.git"
  )
  for entry in "${plugins[@]}"; do
    name="${entry%%|*}"; url="${entry#*|}"
    dest="$ZSH_CUSTOM/plugins/$name"
    if [[ -d "$dest/.git" ]]; then
      git -C "$dest" fetch --depth=1 origin main || git -C "$dest" fetch --depth=1
      git -C "$dest" reset --hard FETCH_HEAD || true
    else
      mkdir -p -- "$(dirname "$dest")"
      git clone --depth=1 "$url" "$dest" || echo "Clone failed: $name"
    fi
    ok "$name ready"
  done
fi

ok "🎉 Setup complete."

info "Open this repo in VS Code → Extensions → 'Install All' (from .vscode/extensions.json)."
