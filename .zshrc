bindkey -e

autoload -U compinit; compinit

setopt auto_cd
alias ...='cd ../..'
alias ....='cd ../../..'

setopt auto_pushd
setopt pushd_ignore_dups

setopt extended_glob

setopt hist_ignore_all_dups
setopt hist_ignore_space

zstyle ':completion:*:default' menu select=1
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'



alias ls='ls -Gh'
alias ll='ls -l'
alias la='ll -a'

cl()
{
    cd $1 && pwd && ll
}

export PATH=~/bin:~/Library/Haskell/bin:/opt/local/bin:/opt/local/sbin:${PATH}
export PYTHONSTARTUP=~/.pythonrc.py

alias tree='tree -C'
alias diff='colordiff'

alias ctags='ctags -f tags --fields=+iaS'

