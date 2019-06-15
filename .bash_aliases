# -- Comfy
alias zshconfig="vi ~/.zshrc"
alias aliasconfig="vi ~/.bash_aliases"
alias bashconfig="vi ~/.bash_aliases"
alias vimconfig="vi ~/.vimrc"
alias dfh='df -h | grep "/dev/"'
alias grep='grep --color=auto'
alias c='clear'

alias python='python3'
alias pip='pip3'

# -- Maven --
alias mvnci='mvn clean install'
alias cl='mvn clean install -Dmaven.test.skip'
alias cls='mvn clean install sling:install -Dmaven.test.skip'
alias clj='mvn clean install -Dmaven.test.skip -Pjooq-generation'

# -- Working Directories --
alias ws='cd ~/WebstormProjects'
