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

## Pre-commit Hooks

Use pre-commit to run ShellCheck and shfmt locally before each commit.

- Install: `pip install pre-commit` (or `brew install pre-commit` on macOS, `sudo dnf install pre-commit` on Fedora)
- Enable in this repo: `pre-commit install`
- Run on all files once: `pre-commit run --all-files`

Hooks configured in `.pre-commit-config.yaml`:
- `shellcheck` (lint shell scripts)
- `shfmt` (format shell scripts with: `-i 2 -ci -bn -sr`)

## Release Process

This project uses a simple, consistent process for releases during 0.x.

- Versioning: SemVer‑lite — patch for docs/CI/meta; minor for new features; major for breaking changes.
- Changelog: `CHANGELOG.md` is the source of truth. Keep notes under a new version section.
- Release steps:
  1) Update `CHANGELOG.md` with the new version section (Highlights, Changes, etc.)
  2) Commit with `release: vX.Y.Z` or `docs(changelog): update for vX.Y.Z`
  3) Tag: `git tag vX.Y.Z && git push --tags`
  4) Create GitHub release with short Highlights and a link to the matching changelog section
     - If using `gh`: `gh release create vX.Y.Z -t "vX.Y.Z — <summary>" -n "See CHANGELOG.md for full notes."`
  5) Optionally announce or pin the release
