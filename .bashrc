# System-wide bashrc
test -r /etc/bash.bashrc && source /etc/bash.bashrc

# Environments
export TERM=xterm-256color

# Command shortcuts
alias rot13='tr "a-zA-Z" "n-za-mN-ZA-M"'

# Others
git_branch() {
    test -d .git || return 1

    echo "($(git rev-parse --abbrev-ref HEAD))"
}

pwd_short() {
    echo ${PWD/~/\~} | sed -r -e 's|([^/])[^/]*/|\1/|g'
}

prompt() {
    unset PROMPT_COMMAND

    PS1='\u@\h:$(pwd_short) $(git_branch) $ '
}

test -n "$PS1" && prompt
