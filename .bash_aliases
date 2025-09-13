# --- Config shortcuts ---
alias zshconfig="vi ~/.zshrc"
alias aliasconfig="vi ~/.bash_aliases"
alias vimconfig="vi ~/.vimrc"

# --- Shell ---
alias ll='ls -lh'
alias l='ls -la'
alias la='ls -lah'
alias ..='cd ..'
alias ...='cd ../..'
alias c="clear && printf '\e[3J'"

# Open current dir (macOS vs Linux)
case "$(uname -s)" in
Darwin) alias o='open .' ;;
Linux) alias o='xdg-open .' ;;
*) alias o='xdg-open .' ;; # fallback
esac

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
    [ -n "$f" ] && "${EDITOR:-vim}" -- "$f"
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
