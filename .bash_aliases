# --- Config shortcuts ---
alias zshconfig="vi ~/.zshrc"
alias aliasconfig="vi ~/.bash_aliases"
alias vimconfig="vi ~/.vimrc"

if ls --version >/dev/null 2>&1; then
  alias ll='ls -lh --group-directories-first --color=auto'
  alias la='ls -lah --group-directories-first --color=auto'
else
  alias ll='ls -lhG'
  alias la='ls -lahG'
fi
alias l='ls -la'
alias ..='cd ..'
alias ...='cd ../..'
alias c="clear && printf '\e[3J'"

if command -v open >/dev/null 2>&1; then
  alias o='open .'
elif command -v xdg-open >/dev/null 2>&1; then
  alias o='xdg-open . >/dev/null 2>&1 &'
fi

# --- Python (simple; venvs still override these) ---
alias python="python3"
alias pip="pip3"

# --- Git ---
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gl="git log --oneline --graph --decorate"
alias gd="git diff HEAD"
alias gf="git fetch"
alias gsp="git stash pop"
alias gst="git stash"
alias gpl="git pull --rebase --autostash"

# --- Yarn (only if present) ---
command -v yarn >/dev/null 2>&1 && {
  alias y="yarn"
  alias yd="yarn dev"
  alias yb="yarn build"
  alias yt="yarn test"
}

# --- Grep color (GNU or Homebrew coreutils on macOS) ---
if grep --version 2>/dev/null | grep -q GNU; then
  alias grep='grep --color=auto'
elif command -v ggrep >/dev/null 2>&1; then
  alias grep='ggrep --color=auto'
fi

# --- FZF helpers (safer: handle spaces & cancel) ---
vf() {
  command -v fzf >/dev/null || {
    echo "fzf not installed"
    return 1
  }
  local f
  f="$(fzf)" || return
  [ -n "$f" ] && vim -- "$f"
}
cf() {
  command -v fzf >/dev/null || {
    echo "fzf not installed"
    return 1
  }
  local d
  d="$(find . -type d -not -path '*/.*' | fzf)" || return
  [ -n "$d" ] && cd -- "$d"
}

# --- Codex CLI (only if installed) ---
command -v codex >/dev/null 2>&1 && alias cx='codex'
