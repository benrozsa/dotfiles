# CLAUDE.md - Rules for Claude Code and AI Assistants

This file contains guides and requirements for AI assistants (like Claude Code) working on this repository.

## Commands

### Installer and Git Setup
- Run installer: `./install.sh`
- Set up personal Git config: `./git-config-setup.sh`

### Diagnostics & Validation
- Run ShellCheck: `shellcheck install.sh git-config-setup.sh` (if available)
- Format shell scripts: `shfmt -i 2 -ci -bn -sr -w install.sh git-config-setup.sh` (if available)

## Coding Standards

### Shell Scripts
- Use Bash for scripts (`#!/usr/bin/env bash`).
- Always use `set -euo pipefail` to ensure robust error handling.
- Format all shell files using `shfmt` with flags: `shfmt -i 2 -ci -bn -sr`.
- Resolve all ShellCheck warnings where possible, or add inline exceptions (e.g. `# shellcheck disable=SCxxxx`).
- Provide cross-platform compatibility where possible (macOS/Linux).

### Code Style & Workflow
- **Commit Titles**: Follow Conventional Commits: `type(scope): message`.
- **Branch Strategy**: Branch names should be structured as `type/scope/short-description` (e.g., `feat/rtk/add-token-killer`).
- **Never Push to main**: Always develop on branch and submit PR.
- **Safety**: Provide a dry-run or reversible backups for installer actions.
