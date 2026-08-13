# dotfiles

[![ShellCheck](https://github.com/benrozsa/dotfiles/actions/workflows/shellcheck.yml/badge.svg)](https://github.com/benrozsa/dotfiles/actions/workflows/shellcheck.yml)
[![Yamllint](https://github.com/benrozsa/dotfiles/actions/workflows/yamllint.yml/badge.svg)](https://github.com/benrozsa/dotfiles/actions/workflows/yamllint.yml)
[![Actionlint](https://github.com/benrozsa/dotfiles/actions/workflows/actionlint.yml/badge.svg)](https://github.com/benrozsa/dotfiles/actions/workflows/actionlint.yml)

Personal configuration files for macOS **and** Linux.
Modernized for the **2026 Post-AI era**—designed to streamline setups where you let AI agents do the coding.

---

## Features

- **Post-AI Optimization**
  - **RTK (Rust Token Killer)** integration to reduce command-line output bloat, cutting LLM/Agent token consumption by up to 90%!
  - `Brewfile` for standardized macOS package setup, instantly bootstrapping essential development & AI CLI utilities.
  - `CLAUDE.md` and custom instructions (`AGENTS.md`) detailing workspace rules and commands specifically for AI coding agents (e.g., Claude Code, Kilo).
- **Shell Configuration**
  - `.zshenv` for PATH/env — loaded by every shell, including non-interactive subshells (AI agents, scripts)
  - `.zshrc` for interactive setup — framework-free; plugins cloned directly into `~/.zsh/plugins`
  - `.bash_aliases` with handy shortcuts (portable across macOS/Linux)
  - Portable `open` alias → `open .` on macOS, `xdg-open .` on Linux

- **Git Configuration**
  - `git-config-setup.sh` sets up:
    - identity (name/email)
    - sensible defaults (editor, rebase workflow, prune, autosquash)
    - aliases for common commands (`co`, `c`, `st`, `hist`, `lg`, …)
    - global ignore file (`.DS_Store` on macOS, space for Linux ignores too)
    - cross‑platform credential helper (macOS: `osxkeychain`; Linux: `libsecret` if available)

- **Editor & MCP Configuration**
  - `.vimrc` — minimal, no plugins: line numbers, search, indentation, system clipboard, persistent undo, `jk`→Esc
  - `.vscode/settings.json` for consistent VS Code behavior
  - `.vscode/extensions.json` listing recommended extensions
  - `mcp.json` for workspace/project metadata & Model Context Protocol server configuration

- **Setup Script**
  - `install.sh`:
    - On macOS, automatically runs `brew bundle` with the provided `Brewfile` to install all utilities.
    - Safely symlinks dotfiles into your home directory
    - Backs up existing files as `.bak` before linking
    - Ensures Zsh plugins are installed/updated
    - Runs personal Git setup if `git-config-setup.sh` is present
    - Detects platform for VS Code settings path (macOS vs Linux)
    - Sets up global auto-rewrite hooks for **RTK** to automatically optimize agent sessions.

---

## Requirements

- **macOS** or **Fedora/Linux**
- Git
- Vim
- Homebrew (recommended for macOS auto-provisioning)
- [VS Code](https://code.visualstudio.com/) (with CLI `code` available in `$PATH`)
- Optional tools:
  - shfmt (shell formatter) for on-save formatting in VS Code — install via `brew install shfmt` (macOS) or `sudo dnf install shfmt` (Fedora)
  - [fzf](https://github.com/junegunn/fzf) for `vf`/`cf` aliases

---

## Usage

1. **Clone this repository:**

   ```sh
   git clone https://github.com/benrozsa/dotfiles.git ~/Dev/dotfiles
   cd ~/Dev/dotfiles
   ```

2. **Install (symlink + backups):**

   ```sh
   ./install.sh
   ```

   This links your dotfiles, sets up VS Code user settings, and clones the Zsh plugins into `~/.zsh/plugins`.

3. **Git setup:** Already run by `./install.sh` when `git-config-setup.sh` is present.

   - Re-run manually any time with: `./git-config-setup.sh`
   - macOS uses Keychain; Linux uses `libsecret` when available.
   - Security note (Linux): if `libsecret` isn't installed, credentials won't be stored. Install `git-credential-libsecret` (e.g., `sudo dnf install git-credential-libsecret` on Fedora) or build from Git's contrib if needed.

4. **VS Code:** Open the repo and install the recommended extensions. Formatting uses `shfmt` from your PATH. Ensure it’s installed (e.g., `brew install shfmt` on macOS or `sudo dnf install shfmt` on Fedora).

5. **Extras:** `fzf` enables `vf`/`cf` helpers. See `.bash_aliases` for more.

More implementation details are in `CONTRIBUTING.md`.

---

## Reverting

- The installer backs up any replaced files with a `.bak` suffix in your home directory. To revert, remove the symlink and restore from the matching `.bak` file.
