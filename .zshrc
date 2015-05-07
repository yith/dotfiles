# key bindings
bindkey -v
bindkey "^R" history-incremental-search-backward

autoload -U compinit; compinit

setopt auto_cd
alias ...='cd ../..'
alias ....='cd ../../..'

setopt auto_pushd
setopt pushd_ignore_dups

setopt extended_glob

export HISTFILE=~/.zsh_history
export HISTSIZE=100000000
export SAVEHIST=100000000
setopt hist_ignore_dups
setopt share_history
setopt hist_ignore_space

zstyle ':completion:*:default' menu select=1
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

alias ls='ls -Gh'
alias ll='ls -l'
alias la='ll -a'

# git
alias ga='git add'
alias gb='git branch'
alias gbd='git branch -d'
alias gc='git commit'
alias gcm='git commit -m'
alias go='git checkout'
alias gob='git checkout -b'
alias gom='git checkout master'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdh='git diff HEAD'
alias gl='git log'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gm='git merge'
alias gp='git pull'
alias gs='git status'
alias gss='git status -s'

cl()
{
    cd $1 && pwd && ll
}


export PYTHONSTARTUP=~/.pythonrc.py

alias tree='tree -C'
#alias diff='colordiff'

alias ctags='ctags -f tags --fields=+iaS'
