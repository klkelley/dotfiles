if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
# export CATALINA_HOME="/Users/karakelley/code/tomcat"
export CATALINA_HOME="/usr/local/Cellar/tomcat@8/8.5.32/libexec/"
JAVA_HOME="$(/usr/libexec/java_home -v 1.11)"
export PATH=$JAVA_HOME/bin:$PATH
export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh" 
export TERM=xterm-256color

export PATH=$MIGRATIONS/bin:$PATH
export python=python3
