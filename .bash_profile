# Author: jupiter
# Last Edit: 2013/10/25
#
# This file is used primarily with the .bashrc
# You MUST take this file with you, otherwise you WILL lose a LOT of
# good configurations.
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# my path ($HOME/bin reserved for user created scripts and programs)
if [ -d $HOME/bin ] ; then
    export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl:$HOME/bin:$PATH"
fi

# colorize grep
export GREP_OPTIONS='--color=auto'

# set default editor
export EDITOR=gvim

# set history
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

# set ls colors (NO BLINK ALLOWED)
export LS_COLORS='di=1;96:fi=0:ln=31:ex=92;100:pi=4:so=0:bd=0:cd=0:or=36:*.cpp=37;100:*.o=91;100:*.h=33;100'
