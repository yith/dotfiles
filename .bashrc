export PATH=~/bin:~/Library/Haskell/bin:/Applications/play-2.1.1:/opt/local/bin:/opt/local/sbin:${PATH}
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:/opt/local/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages:${PYTHONPATH}
export PYTHONSTARTUP=~/.pythonrc.py
export JAVA_HOME=`/usr/libexec/java_home`
export CPLUS_INCLUDE_PATH=/opt/local/include/:${CPLUS_INCLUDE_PATH}

# virtualenv
export WORKON_HOME=~/.virtualenvs
source /opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin/virtualenvwrapper.sh
export PATH=/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}

alias javac="javac -J-Dfile.encoding=UTF8"
alias ls='ls -G'
alias la='ls -a'
alias ll='ls -l'
alias tree='tree -C'
alias diff='colordiff'

cl()
{
    cd $1
    pwd
    ll
}

alias ctags='ctags -f tags --fields=+iaS'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# sbt option
export JAVA_OPTS="-Xmx4G -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=4G -Xss2M -Dfile.encoding=UTF8"
