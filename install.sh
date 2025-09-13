#!/usr/bin/env bash
set -euo pipefail

# --------- Logging ---------
log() { printf "%b\n" "$*"; }
ok() { log "✅ $*"; }
warn() { log "⚠️  $*"; }
info() { log "ℹ️  $*"; }

trap 'warn "Script failed at line $LINENO"' ERR

# --------- Helpers ---------
backup() {
  local tgt="$1"
  if [[ (-e "$tgt" || -L "$tgt") && ! -e "$tgt.bak" && ! -L "$tgt.bak" ]]; then
    mv -f "$tgt" "$tgt.bak"
    warn "Backed up $tgt → $tgt.bak"
  fi
}

link() {
  local src="$1" tgt="$2"
  if [[ ! -e "$src" ]]; then
    warn "Source missing, skip link: $src → $tgt"
    return 0
  fi
  local dir
  dir="$(dirname "$tgt")"
  mkdir -p "$dir"

  if [[ -L "$tgt" && "$(readlink "$tgt")" == "$src" ]]; then
    ok "Already linked: $tgt → $src"
    return 0
  fi

  backup "$tgt"
  ln -sfn "$src" "$tgt"
  ok "Linked: $tgt → $src"
}

# --------- Paths ---------
export DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# Detect VS Code user settings dir
case "$(uname -s)" in
Darwin) CODE_USER_DIR="$HOME/Library/Application Support/Code/User" ;;
Linux) CODE_USER_DIR="$HOME/.config/Code/User" ;;
*) CODE_USER_DIR="$HOME/.config/Code/User" ;; # fallback
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
mkdir -p "$HOME/.vim/undodir"
ok "Vim undo dir ready."

# --------- VS Code Settings ---------
info "Symlinking VS Code settings..."
if command -v code >/dev/null 2>&1 || [ -d "$CODE_USER_DIR" ]; then
  mkdir -p "$CODE_USER_DIR"
  link "$DOTFILES_DIR/.vscode/settings.json" "$CODE_USER_DIR/settings.json"
  link "$DOTFILES_DIR/.vscode/mcp.json" "$CODE_USER_DIR/mcp.json"
  # link "$DOTFILES_DIR/.vscode/extensions.json" "$CODE_USER_DIR/extensions.json"
  ok "Editor settings linked."
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
if [ -d "$HOME/.oh-my-zsh" ]; then
  set +u
  ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
  plugins=(
    "zsh-autosuggestions|https://github.com/zsh-users/zsh-autosuggestions.git"
    "fast-syntax-highlighting|https://github.com/zdharma-continuum/fast-syntax-highlighting.git"
    "zsh-autocomplete|https://github.com/marlonrichert/zsh-autocomplete.git"
  )
  for entry in "${plugins[@]}"; do
    pname="${entry%%|*}"
    purl="${entry#*|}"
    dest="$ZSH_CUSTOM/plugins/$pname"
    if [[ -d "$dest/.git" ]]; then
      info "Updating $pname ..."
      git -C "$dest" pull --ff-only || warn "Update failed for $pname"
    elif [[ -d "$dest" ]]; then
      info "$pname already present (non-git)."
    else
      info "Cloning $pname ..."
      mkdir -p "$(dirname "$dest")"
      git clone --depth=1 "$purl" "$dest" || warn "Clone failed for $pname"
    fi
    ok "$pname ready."
  done
  set -u
else
  info "Oh My Zsh not found; skipping plugin install."
fi

ok "🎉 Setup complete."

info "Open this repo in VS Code → Extensions → 'Install All' (from .vscode/extensions.json)."
