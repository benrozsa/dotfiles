# Changelog

All notable changes to this project are documented here. This project follows a simple, consistent format for releases during 0.x. Versions use SemVer‑lite: patch for docs/CI/metadata, minor for new features, major for breaking changes.

## v0.1.1 — Docs and CI badges

Highlights

- Clarify VS Code uses shfmt from PATH; wrapper optional
- Add CI badges (ShellCheck, Yamllint, Actionlint) to README
- Add a short Reverting note to README

Changes

- Docs: update README and CONTRIBUTING for PATH‑based shfmt; mention optional wrapper for Flatpak/macOS/Linux portability
- Docs: add badges and Reverting section in README
- Meta: update GitHub repo description and topics

Breaking Changes

- None

How To Update

- Ensure `shfmt` is installed and on your PATH (e.g., `brew install shfmt` or `sudo dnf install shfmt`). No other action required.

Compare

https://github.com/benrozsa/dotfiles/compare/v0.1.0...v0.1.1

## v0.1.0 — Initial 0.x release

Highlights

- Safe, idempotent installer with backups and symlinks
- Shell, Git, Vim, and VS Code configuration
- Optional Oh My Zsh plugins ensured

Changes

- Scripts: add `install.sh` with backups and symlink logic; add `git-config-setup.sh`
- Config: add `.zshrc`, `.bash_aliases`, `.vimrc`, and VS Code settings + recommendations
- CI: add ShellCheck, Yamllint, and Actionlint workflows

Breaking Changes

- None

How To Update

- Clone repo, run `./install.sh`. Existing files are backed up with `.bak` suffix.

Compare

https://github.com/benrozsa/dotfiles/releases/tag/v0.1.0

