export PATH="~/bin:/Applications/play-2.1.1:/opt/local/bin:/opt/local/sbin:${PATH}"
export PYTHONPATH="/usr/local/lib/python2.7/site-packages:/opt/local/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages:${PYTHONPATH}"
export JAVA_HOME=`/usr/libexec/java_home`

alias javac="javac -J-Dfile.encoding=UTF8"
alias ls='ls -G'
alias la='ls -a'
alias ll='ls -l'

cl()
{
    cd $1
    ll
}

alias ctags='ctags -f .tags'

alias scala='scala-2.10'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
