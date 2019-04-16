alias zshconfig="vi ~/.zshrc"
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
alias maps='cd IdeaProjects/maps-reactor/maps-business/'
alias eop='cd com.avon.maps.editoffer.persistence.service'
alias eoj='cd com.avon.maps.editoffer.persistence.jooq'
alias eod='cd com.avon.maps.editoffer.domain'
alias eor='cd com.avon.maps.editoffer.rest'

alias ppp='cd com.avon.maps.paginationplanning.persistence.service'
alias ppd='cd com.avon.maps.paginationplanning.domain'
alias ppr='cd com.avon.maps.paginationplanning.rest'
alias ppj='cd com.avon.maps.paginationplanning.persistence.jooq'

alias pbp='cd com.avon.maps.packedbundle.persistence.service'
alias pbd='cd com.avon.maps.packedbundle.domain'
alias pbr='cd com.avon.maps.packedbundle.rest'
alias pbj='cd com.avon.maps.packedbundle.persistence.jooq'
alias pbw='cd com.avon.maps.packedbundle.webcontent'
