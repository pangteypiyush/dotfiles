HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize
shopt -s histappend

function parse_git_branch {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
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

# color_prompt=yes
# if [ "$color_prompt" = yes ]; then
#     PS1="${debian_chroot:+($debian_chroot)}\[\033[01;37m\]\[\e[38;5;242m\]\n(\$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\]\342\234\223\"; else echo \"\[\033[01;31m\]\342\234\227\"; fi)\[\e[38;5;242m\])-(\[\e[38;5;254m\]\u\[\e[38;5;242m\])-(\[\e[38;5;82m\]\w\[\e[38;5;242m\])\n\[\e[38;5;220m\]\$ \[\e[0m\]"
# fi
# unset color_prompt 

PS1="\n\[\e[38;5;250m\]\[\e[48;5;240m\] \u \[\e[48;5;31m\]\[\e[38;5;240m\]\[\e[38;5;15m\]\[\e[48;5;31m\] \w \[\e[0m\]\[\e[38;5;31m\]\n\[\e[38;5;220m\]\[\e[48;5;236m\]\$(if [[ \$? == 0 ]]; then echo \" \$ \"; else echo \" x_x \"; fi)\$(parse_git_branch)\[\e[0m\]\[\e[38;5;236m\]\[\e[0m\] " 

# function _update_ps1() {
#         PS1="\n$(~/powerline-shell/powerline-shell.py $? 2> /dev/null)"
# }

# if [ "$TERM" != "linux" ]; then
#         PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
# fi

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

motd

