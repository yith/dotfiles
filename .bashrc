set -o vi

# Python
export PYTHONSTARTUP=~/.pythonrc.py

alias ll='ls -l'
alias la='ll -a'

cl()
{
    cd $1 && pwd && ll
}
