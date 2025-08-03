#!/bin/bash

set -e

ln -sf "$PWD/.bash_aliases" "$HOME/.bash_aliases"
ln -sf "$PWD/.bashrc" "$HOME/.bashrc"
ln -sf "$PWD/.zshrc" "$HOME/.zshrc"
ln -sf "$PWD/.vimrc" "$HOME/.vimrc"
"$PWD/.gitconfigs.sh"
mkdir -p "$HOME/.vscode"
ln -sf "$PWD/.vscode/settings.json" "$HOME/.vscode/settings.json"
