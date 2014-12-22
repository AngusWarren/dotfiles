# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


shopt -s histappend
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=100000
HISTFILESIZE=100000
eh () { history -a ; vim ~/.bash_history ; history -r ; }

export EDITOR='vim'

alias cdns='cd /etc/sysconfig/network-scripts/'

# Source local definitions
if [ -f ~/.bashrc.local ]; then
	. ~/.bashrc.local
fi
