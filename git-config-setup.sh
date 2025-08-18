#!/usr/bin/env bash
set -euo pipefail

# --- Identity (personal) ---
git config --global user.name "Ben Rozsa"
git config --global user.email "benrozsame@gmail.com"

# --- Core ---
git config --global core.editor vim
git config --global color.ui auto
git config --global init.defaultBranch main

# macOS Keychain for credentials
git config --global credential.helper osxkeychain

# --- Fetch / Push behavior ---
git config --global fetch.prune true
git config --global fetch.pruneTags true

git config --global push.autoSetupRemote true
git config --global push.default current

# --- Rebase-centric workflow ---
git config --global pull.rebase true
git config --global rebase.autostash true
# Helpful for fixup!/squash! commits in interactive rebase
git config --global rebase.autosquash true

# --- Merge UX ---
# 3-way conflict style with base context
git config --global merge.conflictstyle zdiff3

# --- Global ignore (macOS noise) ---
GIG="$HOME/.gitignore_global"
if [[ ! -f "$GIG" ]]; then
  touch "$GIG"
fi
# Ensure .DS_Store is listed exactly once
grep -qxF ".DS_Store" "$GIG" || echo ".DS_Store" >>"$GIG"
git config --global core.excludesfile "$GIG"

# --- Aliases (lean, generic) ---
# Shortcuts most people use; skip anything surprising
git config --global alias.co checkout
git config --global alias.c commit
git config --global alias.st status
git config --global alias.br branch
# Pretty graph views
git config --global alias.hist "log --graph --pretty=format:'%C(auto)%h -%d %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global alias.lg "log --oneline --graph --decorate"
git config --global alias.s "status -sb"

echo "✅ Personal Git config applied."
