# oh-my-zsh
export ZSH=$HOME/dotfiles/oh-my-zsh
ZSH_THEME="wezm"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# key bindings
bindkey -v

# auto completion
fpath=($HOME/dotfiles/zsh-completions/src(N-/) $fpath)
autoload -U compinit; compinit

# history search
function peco-select-history() {
  local tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi
  BUFFER=$(\history -n 1 | eval $tac | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}

function search-history() {
  if type peco > /dev/null 2>&1; then
    peco-select-history
  else
    # peco not found
    zle history-incremental-search-backward
  fi
}
zle -N search-history
bindkey "^r" search-history
bindkey "^s" history-incremental-search-forward

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

# directory
setopt auto_cd
alias ...='cd ../..'
alias ....='cd ../../..'

setopt auto_pushd
setopt pushd_ignore_dups

setopt extended_glob

# history
export HISTFILE=~/.zsh_history
export HISTSIZE=100000000
export SAVEHIST=100000000
setopt hist_ignore_dups
setopt share_history
setopt hist_ignore_space

zstyle ':completion:*:default' menu select=2
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# ls
alias ll='ls -l'
alias la='ll -a'
cl()
{
  # lazily expand ll, because ls can be aliased later
  cd $1 && pwd && eval ll
}

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

# python
export PYTHONSTARTUP=~/.pythonrc.py

alias tree='tree -C'
#alias diff='colordiff'

alias ctags='ctags -f tags --fields=+iaS'

