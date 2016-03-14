case $- in
    *i*) ;;
      *) return;;
esac
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
    xterm) color_prompt=yes;;
esac
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1="${debian_chroot:+($debian_chroot)}\[\033[01;37m\]\[\e[38;5;242m\]\n(\$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\]\342\234\223\"; else echo \"\[\033[01;31m\]\342\234\227\"; fi)\[\e[38;5;242m\])-(\[\e[38;5;254m\]\u\[\e[38;5;242m\])-(\[\e[38;5;94m\]\h\[\e[38;5;242m\])-(\[\e[38;5;82m\]\w\[\e[38;5;242m\])\[\e[38;5;220m\]\n \$ \[\e[0m\]"
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt 

case "$TERM" in
	rxvt-unicode-256color|screen*)
	PS1="\033[01;37m\]\[\e[38;5;242m\]\n(\$(if [[ \$? == 0 ]]; then echo \"\[\033[38;5;82m\]\342\234\223\"; else echo \"\[\033[38;5;226m\]\342\234\227\";fi)\[\e[38;5;242m\])-(\[\e[38;5;166m\]\u\[\e[38;5;242m\])-(\[\e[38;5;82m\]\w\[\e[38;5;242m\])\n\[\e[0m\]\[\e[38;5;166m\]$ \[\e[0m\]"
	;;
esac

case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u : \w\a\]$PS1"
    ;;
*)
    ;;
esac

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias macc="sudo macchanger -m 90:21:81:66:6b:a5 eth0"
alias search="grep -inr"
alias lsd="ls -altr | grep ^d"
alias cdi='cd /usr/include'
alias cdg='cd $HOME/GIT'
alias bb='cd ..'
alias cdh='cd $HOME'
alias cdk='cd /lib/modules/$(uname -r)'

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export PATH=$PATH:/usr/local/jdk1.8.0_74/bin
export JAVA_HOME=/usr/local/jdk1.8.0_74
