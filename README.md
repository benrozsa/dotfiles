# dotfiles

Personal configuration files. To set up

1. update Git in `git-config-setup.sh` if necessary.

2. run:

```sh
./install.sh
```

Personal configuration files for macOS.  
Provides a simple, repeatable setup for shell, Git, Vim, and VS Code.

---

## Features

- **Shell Configuration**
  - `.zshrc` with Oh My Zsh, plugins, and environment variables
  - `.bash_aliases` with handy shortcuts

- **Git Configuration**
  - Script (`git-config-setup.sh`) to set up identity, aliases, and defaults

- **Editor Configuration**
  - `.vimrc` for a clean, minimal Vim setup
  - `.vscode/settings.json` for consistent VS Code behavior
  - `vscode-extensions.txt` listing recommended extensions
  - `mcp.json` for workspace and project metadata

- **Setup Script**
  - `install.sh` safely symlinks dotfiles into your home directory
  - Ensures Zsh plugins are installed/updated
  - Backs up existing files before linking

---

## Requirements

- macOS
- [Oh My Zsh](https://ohmyz.sh/)
- [VS Code](https://code.visualstudio.com/) (with CLI `code` available in PATH)
- Git
- Vim (preinstalled on macOS)

---

## Usage

1. **Clone or download this repository.**
2. **Review and update Git identity in `git-config-setup.sh` if needed.**
3. **Run the setup script:**

   ```sh
   bash install.sh
   ```

4. **Open this repo in VS Code and install all recommended extensions** from the workspace recommendations.

---

## Files

- `.zshrc` — Zsh configuration
- `.bash_aliases` — shell and Git aliases
- `.vimrc` — Vim configuration
- `git-config-setup.sh` — Git identity/config setup
- `.vscode/settings.json` — VS Code settings
- `mcp.json` — workspace/project metadata and configuration
- `install.sh` — main setup script

---

## Notes

- Safe to re-run — existing files are backed up as `.bak`.
- Keeps your development environment consistent across reinstalls.
- The `install.sh` script name is just convention; GitHub does not auto-run it.
