[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
    echo " (${BRANCH}${STAT})"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "Changes to be committed:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1="\[\033[32m\]\w\[\033[36m\]\$(parse_git_branch)\[\033[00m\] $ "


bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

# terminal alias

alias c="clear"
alias chrome='open -a "Google Chrome"'
alias vim="vi"
alias weather="curl wttr.in/Chicago"
alias bashc='vim ~/.bashrc'
alias bashs='source ~/.bashrc'

# git alias

alias gs='git status'
alias gp='git push'
alias gpl='git pull'
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit'
alias gco='git checkout'
alias gd='git diff'
alias gds='git diff --staged'
alias gb='git branch'
alias gg='git grep'
alias gpfwl='git push origin head --force-with-lease'
alias noedit='git commit --amend --no-edit'
alias gcap='git commit --amend --no-edit && git push --force-with-lease'


# alias for personal (wo)man pages
alias pman='cat ~/.pman | less'
alias pmanc='vim ~/.pman'



PATH=$PATH:/usr/local/sbin

# added by travis gem
[ -f /Users/karakelley/.travis/travis.sh ] && source /Users/karakelley/.travis/travis.sh
