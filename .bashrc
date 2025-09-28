# Minimal Fedora-focused Bash config

# Source global definitions (present on Fedora)
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User local bins
if [ -d "$HOME/.local/bin" ]; then
  case ":$PATH:" in *":$HOME/.local/bin:"*) ;; *) PATH="$HOME/.local/bin:$PATH" ;; esac
fi
if [ -d "$HOME/bin" ]; then
  case ":$PATH:" in *":$HOME/bin:"*) ;; *) PATH="$HOME/bin:$PATH" ;; esac
fi
export PATH

# Source user aliases
if [ -f "$HOME/.bash_aliases" ]; then
  . "$HOME/.bash_aliases"
fi

# Go tools bin on PATH (for tools installed via `go install`, e.g., shfmt)
# Ensures editor tooling is available across repos without per-workspace wrappers
GOPATH_DIR="${GOPATH:-$HOME/go}"
if [ -d "$GOPATH_DIR/bin" ]; then
  case ":$PATH:" in *":$GOPATH_DIR/bin:"*) ;; *) PATH="$GOPATH_DIR/bin:$PATH" ;; esac
  export PATH
fi

# fnm
FNM_PATH="/home/brozsa/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi
