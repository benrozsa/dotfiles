#!/usr/bin/env bash
set -euo pipefail

# Link ~/.bashrc to repo version, but only on Fedora.

if [[ -f /etc/os-release ]]; then
  # shellcheck disable=SC1091
  . /etc/os-release
  [[ "${ID:-}" == "fedora" ]] || exit 0
else
  exit 0
fi

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ln -sfn "$repo_dir/.bashrc" "$HOME/.bashrc"
echo "Linked ~/.bashrc -> $repo_dir/.bashrc"
