# Activate Aliases.
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# List Today's namedays
if [ -f ~/.nevnap ]; then
    source ~/.nevnap
fi

# -- Application PATHs --
export M2_HOME=/usr/local/Cellar/maven/3.6.0/libexec
export M2=$M2_HOME/bin
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

export PATH=$PATH:$M2_HOME/bin
export PATH=/usr/local/bin:$PATH
export PATH=/usr/bin:$PATH

# test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

