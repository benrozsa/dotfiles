#!/usr/bin/env bash
set -euo pipefail

# --------- Args ---------
DRY_RUN=0
for arg in "$@"; do
  case "$arg" in
    --dry-run)
      DRY_RUN=1
      shift || true
      ;;
    *) ;;
  esac
done

# --------- Logging ---------
log() { printf "%b\n" "$*"; }
ok() { log "✅ $*"; }
warn() { log "⚠️  $*"; }
info() { log "ℹ️  $*"; }

# Execute a command or just print it in dry-run mode
run() {
  if [[ "$DRY_RUN" -eq 1 ]]; then
    info "[dry-run] $*"
  else
    "$@"
  fi
}

trap 'echo "⚠️  Failed at line $LINENO"; exit 1' ERR

# --------- Helpers ---------
have() { command -v "$1" >/dev/null 2>&1; }
need() { have "$1" || { echo "Missing: $1"; exit 1; }; }

backup() {
  local tgt="$1" bak="${tgt}.bak"
  if [[ -e "$tgt" || -L "$tgt" ]]; then
    if [[ ! -e "$bak" && ! -L "$bak" ]]; then
      if [[ "$DRY_RUN" -eq 1 ]]; then
        info "[dry-run] mv -f -- '$tgt' '$bak'"
      else
        mv -f -- "$tgt" "$bak"
      fi
      warn "Backed up $tgt -> $bak"
    else
      warn "Backup exists, skipping: $bak"
    fi
  fi
}

link() {
  local src="$1" tgt="$2"
  [[ -e "$src" || -L "$src" ]] || { warn "Skip (missing src): $src"; return 0; }
  if [[ "$DRY_RUN" -eq 1 ]]; then
    info "[dry-run] mkdir -p -- '$(dirname "$tgt")'"
  else
    mkdir -p -- "$(dirname "$tgt")"
  fi
  if [[ -L "$tgt" && "$(readlink "$tgt")" == "$src" ]]; then
    ok "Already linked: $tgt -> $src"
    return 0
  fi
  backup "$tgt"
  if [[ "$DRY_RUN" -eq 1 ]]; then
    info "[dry-run] ln -sfn -- '$src' '$tgt'"
  else
    ln -sfn -- "$src" "$tgt"
  fi
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
run mkdir -p -- "$HOME/.vim/undodir"
ok "Vim undo dir ready."

# --------- VS Code Settings ---------
info "Symlinking VS Code settings..."
if have code || [ -d "$CODE_USER_DIR" ]; then
  run mkdir -p -- "$CODE_USER_DIR"
  link "$DOTFILES_DIR/.vscode/settings.json" "$CODE_USER_DIR/settings.json"
  link "$DOTFILES_DIR/.vscode/mcp.json" "$CODE_USER_DIR/mcp.json"
  ok "Editor settings linked."
  if [[ -f "$DOTFILES_DIR/.vscode/vscode-extensions.txt" ]]; then
    while IFS= read -r ext; do
      if [[ -n "$ext" && "$ext" != \#* ]]; then
        if [[ "$DRY_RUN" -eq 1 ]]; then
          info "[dry-run] code --install-extension '$ext'"
        else
          code --install-extension "$ext" || true
        fi
      fi
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
  if [[ "$DRY_RUN" -eq 1 ]]; then
    info "[dry-run] chmod +x '$DOTFILES_DIR/git-config-setup.sh'"
  else
    chmod +x "$DOTFILES_DIR/git-config-setup.sh" || true
  fi
  info "Running personal Git configuration setup..."
  if [[ "$DRY_RUN" -eq 1 ]]; then
    info "[dry-run] '$DOTFILES_DIR/git-config-setup.sh'"
  else
    "$DOTFILES_DIR/git-config-setup.sh"
  fi
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
      # Determine remote default branch (avoid noisy failures on repos using master)
      default_branch="$(git -C "$dest" symbolic-ref --quiet --short refs/remotes/origin/HEAD 2>/dev/null | awk -F/ '{print $2}')"
      if [[ -z "$default_branch" ]]; then
        default_branch="$(git -C "$dest" remote show origin 2>/dev/null | sed -n 's/.*HEAD branch: //p')"
      fi
      [[ -z "$default_branch" ]] && default_branch=main
      if [[ "$DRY_RUN" -eq 1 ]]; then
        info "[dry-run] git -C '$dest' fetch --prune --depth=1 origin '$default_branch'"
        info "[dry-run] git -C '$dest' reset --hard FETCH_HEAD"
      else
        git -C "$dest" fetch --prune --depth=1 origin "$default_branch" || git -C "$dest" fetch --prune --depth=1 origin
        git -C "$dest" reset --hard FETCH_HEAD || true
      fi
    else
      run mkdir -p -- "$(dirname "$dest")"
      # Clone the remote's default branch if detectable; fall back to default
      db="$(git ls-remote --symref "$url" HEAD 2>/dev/null | awk '/^ref:/ {print $3}' | sed 's!.*/!!')"
      if [[ -n "$db" ]]; then
        if [[ "$DRY_RUN" -eq 1 ]]; then
          info "[dry-run] git clone --depth=1 --branch '$db' '$url' '$dest'"
        else
          git clone --depth=1 --branch "$db" "$url" "$dest" || git clone --depth=1 "$url" "$dest" || echo "Clone failed: $name"
        fi
      else
        if [[ "$DRY_RUN" -eq 1 ]]; then
          info "[dry-run] git clone --depth=1 '$url' '$dest'"
        else
          git clone --depth=1 "$url" "$dest" || echo "Clone failed: $name"
        fi
      fi
    fi
    ok "$name ready"
  done
fi

ok "🎉 Setup complete."

info "Open this repo in VS Code → Extensions → 'Install All' (from .vscode/extensions.json)."

if [[ "$DRY_RUN" -eq 1 ]]; then
  info "Ran in dry-run mode. No changes were made."
fi
