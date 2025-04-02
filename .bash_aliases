#!/bin/bash


function Attach() {
    ~/bin/grabssh
    screen -d -R "$@"
}

alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l='ls -CF'
alias ll='ls -alF'
alias la='ls -A'
alias ls='ls --color=auto'
alias ..='cd ..'


alias acs='apt search'
alias agi='sudo apt install'
alias agp='sudo apt purge'
alias vim2space='VIMINIT="source ~/.vimrc-2space" vim'

alias bc='bc -l'

function json-validate() {
    if [[ $# -eq 0 ]]; then
        echo "$0 <filename.json>"
        return 1
    fi
    file="$1"
    sed 's/\\//g' < $file | jq .
}

# fabric
alias myfab='fab --show=output --hide=running -P -I -z 5  -w'

function json2yaml {
  python3 -c 'import sys, yaml, json; print(yaml.dump(json.loads(sys.stdin.read())))'
}

if [ -d ~/bin ]; then
	export PATH=~/bin:${PATH}
fi

# increase history size
export     HISTSIZE=1000000
export HISTFILESIZE=1000000
# append commands to history file
shopt -s histappend
# save each command right after execution
PROMPT_COMMAND='history -a'

export EDITOR=vim

for file in  ~/.bash_aliases.d/*; do
    if [ -r $file ]; then
        . $file
    fi
done


# make grep work most files as text
# alias grep='grep --color=auto -a'

# advent of code helpers
function aot() {
	if [[ $# -lt 1 ]]; then
		# no arguments
		return
	fi
	f="$1"

    if [ -t 1 ]; then
        tput setaf 12
        pypy3 ${f}.py < "${f}.input.sample"
        tput sgr0
    else
        # stdout is pipe, don't use colors
        pypy3 ${f}.py < "${f}.input.sample"
    fi
}

function aoc() {
	if [[ $# -lt 1 ]]; then
        # no arguments
        return
    fi
	f="$1"

    if [ -t 1 ]; then
        tput setaf 6
        tput bold
        pypy3 ${f}.py < "${f}.input"
        tput sgr0
    else
        # stdout is pipe, don't use colors
        pypy3 ${f}.py < "${f}.input"
    fi
}

# minikube for kubernetes
alias mk='minikube'
alias kc='kubectl'

PATH=$PATH:/usr/local/go/bin
