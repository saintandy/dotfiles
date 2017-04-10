local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

display_battery() {
    local percent=$(pmset -g batt | egrep "([0-9]+\%).*" -o --colour=auto | cut -f1 -d";")
    percent="$(echo $percent | rev | cut -c 2- | rev)"

    if [ "$percent" -gt "0" ]; then
        bar="▁"
        color="%F{red}"
    fi
    if [ "$percent" -gt "12" ]; then
        bar="▂"
    fi
    if [ "$percent" -gt "25" ]; then
        bar="▃"
        color="%F{yellow}"
    fi
    if [ "$percent" -gt "37" ]; then
        bar="▄"
    fi
    if [ "$percent" -gt "50" ]; then
        bar="▅"
    fi
    if [ "$percent" -gt "62" ]; then
        bar="▆"
    fi
    if [ "$percent" -gt "75" ]; then
        bar="▇"
        color="%F{green}"
    fi
    if [ "$percent" -gt "87" ]; then
        bar="█"
    fi
    
    echo "$color‹$percent%%› $bar%f"
}

PROMPT='%F{magenta}‹$(users | wc -w | cut -c 8-):$(ls ~/Notes | wc -w | cut -c 8-)› \
$(virtualenv_prompt_info)%{$fg[cyan]%}%c \
$(git_prompt_info) 
$(display_battery) %{$fg[red]%}%(!.#.»)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='%{$fg[blue]%}%~%{$reset_color%} ${return_code} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$fg[yellow]%}"
ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%{$reset_color%}%{[03m%}%{$fg[blue]%}"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="!%{$reset_color%} "
