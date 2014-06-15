# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
EDITOR=vim
editor=vim

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gentoo"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(gitfast)

source $ZSH/oh-my-zsh.sh

# mkdir, cd into it
mkcd () {
    mkdir -p "$*"
    cd "$*"
}

cdl () {
    cd "$*"
    ls -la
}

alias -s html=vim
alias -s php=vim
alias -s css=vim
alias -s js=vim
alias -s py=vim
alias -s sql=vim
alias -s cpp=vim
alias -s y=vim
alias -s c=vim
alias -s h=vim
alias -s txt=vim

setopt AUTO_PUSHD

bindkey -v
bindkey '^R' history-incremental-search-backward

export MAVEN_OPTS="-Xmx2048m -XX:MaxPermSize=512m"
export _JAVA_OPTIONS="-Xmx2g"

`zinc -J"-Xmx2G" -nailed`

setopt shwordsplit
setopt PROMPT_SUBST
export PROMPT='$FG[088]($(date "+%a %d %h - %r")) $FG[018]<$(pmset -g batt | egrep "([0-9]+\%).*" -o --colour=auto | cut -f1 -d";")%> $FG[029][$(users | wc -w | cut -c 8-):$(ls ~/Notes | wc -w | cut -c 8-)] %(!.%{$fg[red]%}.%{$FG[023]%}%n@)%m %{$FG[018]%}%(!.%1~.%~) $(git_prompt_info)%#%{$reset_color%} '

schedprompt() {
    emulate -L zsh
    zmodload -i zsh/sched

    # Remove existing event, so that multiple calls to
    # "schedprompt" work OK.  (You could put one in precmd to push
    # the timer 30 seconds into the future, for example.)
    integer i=${"${(@)zsh_scheduled_events#*:*:}"[(I)schedprompt]}
    (( i )) && sched -$i

    # Test that zle is running before calling the widget (recommended
    # to avoid error messages).
    # Otherwise it updates on entry to zle, so there's no loss.
    zle && zle reset-prompt

    # This ensures we're not too far off the start of the minute
    sched +1 schedprompt
}

schedprompt

# rbenv setup - https://github.com/sstephenson/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
