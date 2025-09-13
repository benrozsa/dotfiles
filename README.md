# dotfiles

Personal configuration files for macOS **and** Linux (tested on Fedora Workstation).  
Provides a simple, repeatable setup for shell, Git, Vim, and VS Code.

---

## Features

- **Shell Configuration**
  - `.zshrc` with [Oh My Zsh](https://ohmyz.sh/), plugins, and environment variables
  - `.bash_aliases` with handy shortcuts (portable across macOS/Linux)
  - Portable `open` alias → `open .` on macOS, `xdg-open .` on Linux

- **Git Configuration**
  - `git-config-setup.sh` sets up:
    - identity (name/email)
    - sensible defaults (editor, rebase workflow, prune, autosquash)
    - aliases for common commands (`co`, `c`, `st`, `hist`, `lg`, …)
    - global ignore file (`.DS_Store` on macOS, space for Linux ignores too)
    - cross‑platform credential helper (macOS: `osxkeychain`; Linux: `libsecret` if available, else `store`)

- **Editor Configuration**
  - `.vimrc` for a clean, minimal Vim setup (UTF-8, sane defaults, clipboard)
  - `.vscode/settings.json` for consistent VS Code behavior
  - `.vscode/extensions.json` listing recommended extensions
  - `mcp.json` for workspace/project metadata

- **Setup Script**
  - `install.sh`:
    - Safely symlinks dotfiles into your home directory
    - Backs up existing files as `.bak` before linking
    - Ensures Zsh plugins are installed/updated
    - Detects platform for VS Code settings path (macOS vs Linux)

---

## Requirements

- **macOS** or **Fedora/Linux**
- Git
- Vim
- [Oh My Zsh](https://ohmyz.sh/)
- [VS Code](https://code.visualstudio.com/) (with CLI `code` available in `$PATH`)
- Optional tools:
  - shfmt (shell formatter) for on-save formatting in VS Code — install via `brew install shfmt` (macOS) or `sudo dnf install shfmt` (Fedora)
  - [fzf](https://github.com/junegunn/fzf) for `vf`/`cf` aliases
  - Yarn if you use the Node.js aliases
  - Codex CLI (`cx`) if installed

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

   This links your dotfiles, sets up VS Code user settings, and installs/updates core Zsh plugins (if Oh My Zsh is present).

3. **Optional Git setup:** `./git-config-setup.sh` (macOS uses Keychain; Linux prefers libsecret, else store).

   Security note (Linux): if `libsecret` is not available, the fallback `credential.helper store` saves credentials in plaintext at `~/.git-credentials`. Prefer installing `libsecret` (e.g., on Fedora: `sudo dnf install libsecret` and `git-credential-libsecret`).

4. **VS Code:** Open the repo and install the recommended extensions. Formatting uses a workspace‑scoped `shfmt` wrapper at `.vscode/bin/shfmt` (portable across macOS, Fedora, and Flatpak VS Code).

5. **Extras:** `fzf` enables `vf`/`cf` helpers. See `.bash_aliases` for more.

More implementation details are in `CONTRIBUTING.md`.
