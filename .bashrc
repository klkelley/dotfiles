[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

parse_svn_branch() {
  parse_svn_url | sed -e 's#^'"$(parse_svn_repository_root)"'##g' | awk '{print " ["$1"]" }'
}

parse_svn_url() {
  svn info 2>/dev/null | sed -ne 's#^URL: ##p'
}

parse_svn_repository_root() {
  svn info 2>/dev/null | sed -ne 's#^Repository Root: ##p'
}


export PS1="\[\033[32m\]\w\[\033[36m\]\$(parse_git_branch)\$(parse_svn_branch)\[\033[00m\] $ "

bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

alias c="clear"
alias chrome='open -a "Google Chrome"'

# git alias

alias gs='git status'
alias gp='git push'
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit'
alias gco='git checkout'
alias gd='git diff'
alias gds='git diff --staged'
alias gb='git branch'
alias gg='git grep'


alias mocks='cd ~/Work/_git/Tools/MockRestServices && ./restartMockServiceMac.sh'
