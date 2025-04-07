pwd_short() {
    echo ${PWD/~/\~} | sed -r -e 's|([^/])[^/]*/|\1/|g'
}

prompt() {
    unset PROMPT_COMMAND

    PS1='\u@\h:$(eval "pwd_short") $ '
}

test -n "$PS1" && prompt
