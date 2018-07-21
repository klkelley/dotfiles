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

alias mocks='cd ~/Work/_git/Tools/MockRestServices && ./restartMockServiceMac.sh'
