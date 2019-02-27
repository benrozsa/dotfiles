# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/usr/bin:$M2_HOME/bin$PATH

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

# Path to your oh-my-zsh installation.
export ZSH="/Users/rozsabence/.oh-my-zsh"

ZSH_THEME="powerlevel9k/powerlevel9k"

# Customise the Powerlevel9k prompts
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  custom_javascript 
  context
  battery
  newline
  dir
  vcs
)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
# Create a custom JavaScript prompt section
POWERLEVEL9K_CUSTOM_JAVASCRIPT="echo -n '\ue781' JavaScript"
POWERLEVEL9K_CUSTOM_JAVASCRIPT_FOREGROUND="black"
POWERLEVEL9K_CUSTOM_JAVASCRIPT_BACKGROUND="yellow"
# Load Nerd Fonts with Powerlevel9k theme for Zsh
POWERLEVEL9K_MODE='nerdfont-complete'
source ~/powerlevel9k/powerlevel9k.zsh-theme

plugins=(git)
plugins=(zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias zshconfig="vi ~/.zshrc"
alias ohmyzsh="vi ~/.oh-my-zsh"
alias ll="ls -oa"

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
