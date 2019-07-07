# -- Configs
alias zshconfig="vi ~/.zshrc"
alias aliasconfig="vi ~/.bash_aliases"
alias bashconfig="vi ~/.bash_aliases"
alias vimconfig="vi ~/.vimrc"

# Git
alias s="git status"
alias a="git add ."
alias d="git diff HEAD"
alias p="git push"
alias log="git log"

# Other
alias dot="cd ~/.dotfiles; git st"
alias dfh='df -h | grep "/dev/"'
alias grep='grep --color=auto'
alias c="clear"

# Python
alias python='python3'
alias pip='pip3'

# -- Maven --
alias mvnci='mvn clean install'
alias cl='mvn clean install -Dmaven.test.skip'
alias ci='mvn install -Dmaven.test.skip'
alias cls='mvn clean install sling:install -Dmaven.test.skip'
alias clj='mvn clean install -Dmaven.test.skip -Pjooq-generation'

# -- Working Directories --
alias ws='cd ~/WebstormProjects'
alias is='cd ~/IdeaProjects'
alias maps='cd ~/IdeaProjects/maps-reactor/maps-business'
