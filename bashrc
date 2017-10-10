HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize
shopt -s histappend
# bind 'set show-mode-in-prompt on'
set -o vi
# shopt -s dotglob nullglob #( include hidden files in globs, but []regex fails)

function parse_git_branch {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1 /'
}

function motd(){
	if [ $(command -v fortune) ] && [ $(command -v cowsay) ]; then
		fortune | cowsay -f $(ls /usr/share/cows/ | shuf -n1)
	fi
}

function gitpulls(){
	clear
	echo "batch pull : $PWD"
	echo "------------"
	echo ""
	for dir in $(find . -name ".git")
	do cd ${dir%/*}
		echo $PWD
		git pull
		echo ""
		cd - > /dev/null
	done
}

function check_if_ssh_tty(){
	if [ $(who -m |grep -o "([0-9.]*)$") ] ; then echo '[SSH]'; fi
}

ACCENT_COLOR="236m"
PS1="\n\[\e[38;5;250m\]\[\e[48;5;240m\]\$(check_if_ssh_tty) \u@\h \[\e[48;5;$ACCENT_COLOR\]\[\e[38;5;240m\]\[\e[38;5;15m\]\[\e[48;5;$ACCENT_COLOR\] \w \[\e[0m\]\[\e[38;5;$ACCENT_COLOR\]\n\[\e[38;5;220m\]\[\e[48;5;236m\]\$(if [[ \$? == 0 ]]; then echo \" \$ \"; else echo \" x_x \"; fi)\$(parse_git_branch)\[\e[0m\]\[\e[38;5;236m\]\[\e[0m\] "

if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi
if [ -f ~/.bash_exports ]; then
	. ~/.bash_exports
fi

# motd

