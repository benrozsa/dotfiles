# Brewfile - AI & Agent-Optimized macOS Setup
# Focused entirely on high-performance tools that LLM agents use to find, read, edit, format, and run code.
# Install all tools with: brew bundle --no-lock

# --- Homebrew Taps ---
tap "homebrew/bundle"

# --- Essential VCS ---
brew "git"
brew "gh"           # GitHub CLI for agent-initiated PRs and issue management

# --- High-Performance Agent Search & Filter Utilities ---
brew "ripgrep"      # 'rg' is the primary tool agents use for fast workspace-wide code searches
brew "fd"           # 'fd' is a lightning-fast tool agents use to locate files
brew "jq"           # JSON parser essential for agent tool calling and structured output parsing
brew "fzf"          # Fuzzy finder

# --- Modern, Fast Runtime Managers for Agents ---
# Instead of slow, shell-heavy runtimes (like pyenv/nvm), we focus on modern, lightweight tools.
brew "uv"           # Lightning-fast, single-binary Rust tool for Python installs, environments, and runs (perfect for agents)

# --- Agent Quality & Formatting Tools ---
# These ensure that agent-generated shell/code files are automatically formatted and verified.
brew "shfmt"        # Shell script formatter (agents use this to auto-format their code)
brew "shellcheck"   # Shell script static analyzer (agents use this to auto-validate shell commands)

# --- AI Token & Output Compression ---
brew "rtk"          # Rust Token Killer - cuts up to 90% of bash output agent reads
