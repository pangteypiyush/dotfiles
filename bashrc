# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm) color_prompt=yes;;
esac

# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
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
	PS1="\033[01;37m\]\[\e[38;5;242m\]\n(\$(if [[ \$? == 0 ]]; then echo \"\[\033[38;5;82m\]\342\234\223\"; else echo \"\[\033[38;5;226m\]\342\234\227\";fi)\[\e[38;5;242m\])-(\[\e[38;5;166m\]\u\[\e[38;5;242m\])-(\[\e[38;5;82m\]\w\[\e[38;5;242m\])\n\[\e[0m\]\[\e[38;5;82m\]\$(git branch 2> /dev/null | grep ^* | cut -c 3- )\[\e[38;5;166m\]$ \[\e[0m\]"
	;;
esac


# uncomment for a colored prompt, if the terminal has the capability; turned
# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u : \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#Fuck i need this bitch3$
alias macc="sudo macchanger -m 90:21:81:66:6b:a5 eth0"
alias search="grep -inr"
alias lsd="ls -altr | grep ^d"
alias cdi='cd /usr/include'
alias cdg='cd $HOME/GIT'
alias bb='cd ..'
alias cdh='cd $HOME'
alias cdk='cd /lib/modules/$(uname -r)'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#'
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
# enable programmable completion features (you dont need to enable
# this, if its already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


#env vars
export PATH=$PATH:/usr/local/jdk1.8.0_74/bin
export JAVA_HOME=/usr/local/jdk1.8.0_74

# effects startup time :(
# case $(shuf -e 0 1 -n 1) in
#         1)
#         fortune | cowsay -$(shuf -e b d g p s t y -n 1);;
# esac
