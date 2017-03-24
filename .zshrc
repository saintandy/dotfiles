# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
EDITOR=vi
editor=vi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="suvash"

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
mkcd() {
    mkdir -p "$*"
    cd "$*"
}

cdl() {
    cd "$*"
    ls -lha
}

swap() {
    # hackish as fuck
    mv "$1" "FOOFOOFOO.fooaux"
    mv "$2" "$1"
    mv "FOOFOOFOO.fooaux" "$2"
}

git_diff_wrapper() {
    vimdiff "$1" "$2"
}

# subdirectory-grep
sgrep() {
    grep -nir "$1" .
}

fuckslow() {
    pkill -15 -u saintandy
}

#subdirectory-find
sfind() {
	find . | grep -i "$1"
}

alias sg=sgrep
alias sf=sfind

alias -s html=vi
alias -s php=vi
alias -s css=vi
alias -s js=vi
alias -s jsx=vi
alias -s py=vi
alias -s sql=vi
alias -s cpp=vi
alias -s y=vi
alias -s c=vi
alias -s h=vi
alias -s txt=vi
alias -s log=tail

alias vi="nvim --cmd \"lang en_US\""
alias python="python3"

setopt AUTO_PUSHD
setopt BRACE_CCL

bindkey -v
bindkey '^R' history-incremental-search-backward

export MAVEN_OPTS="-Xmx2048m -XX:MaxPermSize=512m"
export _JAVA_OPTIONS="-Xmx2g"

# setopt shwordsplit
# setopt PROMPT_SUBST
# export PROMPT='$FG[blue]%(!.%{$fg_bold[green]%}.%{$fg_bold[green]%}%n@)%m %{$fg_bold[red]%}%(!.%1~.%~) %{$fg[blue]%}·> $fg[white]'


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

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM
# rbenv setup - https://github.com/sstephenson/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export PIP_VIRTUALENV_BASE=$WORKON_HOME

export NVM_DIR="/home/dionyziz/.nvm"

nvm() {
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    nvm $@
}
alias vi='nvim --cmd "lang en_US" --cmd "source ~/.vimrc"'

# Steppenwolf
sudo() {
    if ! (command sudo -n true 2>/dev/null) ; then
        echo "ENTRANCE NOT FOR EVERYBODY. FOR MADMEN ONLY!"
    fi
    command sudo "$@" 1>/dev/null
}
