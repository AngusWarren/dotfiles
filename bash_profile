# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH

# Source local definitions
if [ -f ~/.bash_profile.local ]; then
        . ~/.bash_profile.local
fi
