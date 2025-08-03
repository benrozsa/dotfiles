# -- Configs
alias zshconfig="vi ~/.zshrc"
alias aliasconfig="vi ~/.bash_aliases"
alias vimconfig="vi ~/.vimrc"

# Shell
alias ll='ls -lh'
alias l='ls -la'
alias la='ls -lah'
alias ..='cd ..'
alias ...='cd ../..'
alias o='open .'
alias c="clear && printf '\e[3J'"

# Python
alias python="python3"
alias pip="pip3"

# Git
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

# Yarn
alias y="yarn"
alias yd="yarn dev"
alias yb="yarn build"
alias yt="yarn test"

# Other
alias grep='grep --color=auto'
alias vf='vim $(fzf)'     # fájl megnyitása vim-ben kiválasztással
alias cf='cd $(find . -type d | fzf)'  # könyvtárválasztás
