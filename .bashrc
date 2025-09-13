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
