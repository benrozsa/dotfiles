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
# Dotfiles root defaults to this script's folder (no hardcoding)
export DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
CODE_USER_DIR="$HOME/Library/Application Support/Code/User"

# --------- Dotfiles ---------
info "Symlinking dotfiles to home directory..."
link "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
link "$DOTFILES_DIR/.bash_aliases" "$HOME/.bash_aliases"
link "$DOTFILES_DIR/.vimrc" "$HOME/.vimrc"
ok "Dotfiles symlinked."

# --------- VS Code Settings ---------
info "Symlinking VS Code settings..."
mkdir -p "$CODE_USER_DIR"
link "$DOTFILES_DIR/.vscode/settings.json" "$CODE_USER_DIR/settings.json"
# If you want recommendations in user dir as well, uncomment:
# link "$DOTFILES_DIR/.vscode/extensions.json" "$CODE_USER_DIR/extensions.json"
ok "Editor settings linked."

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
set +u # allow unset during plugin install
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
ok "🎉 Setup complete."

info "Open this repo in VS Code and click: Extensions → 'Install All' from workspace recommendations (.vscode/extensions.json)."
