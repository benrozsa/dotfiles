# Contributing / Developer Notes

This repo aims to stay simple for users. Detailed setup notes for contributors live here.

## VS Code Settings

- The installer (`install.sh`) symlinks repo settings into your VS Code User dir so they apply to any folder you open.
- Recommended extensions are listed in `.vscode/extensions.json`.

## Shell Formatting (shfmt)

- VS Code uses `shfmt` from your PATH.
- Ensure `shfmt` is installed and accessible:
  - macOS: `brew install shfmt`
  - Fedora: `sudo dnf install shfmt`
  - Any: `go install mvdan.cc/sh/v3/cmd/shfmt@latest`
- Optional wrapper: the repo includes `.vscode/bin/shfmt` to aid Flatpak/macOS/Linux portability. If needed (e.g., Flatpak VS Code), point settings to it: `"shfmt.executablePath": "${workspaceFolder}/.vscode/bin/shfmt"`.
- Formatting args (2‑space indent, etc.) are set in VS Code settings. CLI usage can pass the same flags: `shfmt -i 2 -ci -bn -sr`.

## Fedora / Linux Notes

- `~/.local/bin` is used for user‑level binaries; no sudo required.
- `git-config-setup.sh` prefers `libsecret`; falls back to `store` for credentials.

## macOS Notes

- Homebrew `shfmt` is detected by the wrapper.
- Keychain is used for Git credentials.

## Scripts

- `install.sh` is idempotent: backs up existing files as `.bak` and symlinks.
- `git-config-setup.sh` applies a rebase‑centric Git workflow and helpful aliases.
