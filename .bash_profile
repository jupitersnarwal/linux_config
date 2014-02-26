# Author: jupiter
# Last Edit: 2014/01/25
#
# This file is used primarily with the .bashrc
# You MUST take this file with you, otherwise you WILL lose a LOT of
# good configurations.
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# my path ($HOME/bin reserved for user created scripts and programs)
if [ -d $HOME/bin ] ; then
    export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl:$HOME/bin"
fi

# load /usr/local/lib as a library directory
if [ -d /usr/local/lib ] ; then
    export LD_LIBRARY_PATH="/usr/local/lib"
fi

# colorize grep
export GREP_OPTIONS='--color=auto'

# set default editor
export EDITOR=gvim

# set history
export HISTCONTROL=erasedups
export HISTSIZE=100000
shopt -s histappend

# set ls colors (NO BLINK ALLOWED)
export LS_COLORS='di=1;96:fi=0:ln=31:ex=92;100:pi=4:so=0:bd=0:cd=0:or=36:*.cpp=37;100:*.o=91;40:*.h=33;100'

# ssh-agent initializtion 
# this agent is used to store password information to decrypt your ssh keys
# it ensures that you only have to type in your password once every session
#SSH_AGENT=/usr/bin/ssh-agent
#SSH_AGENT_ARGS="-s"
#if [ -z "$SSH_AUTH_SOCK" -a -x "$SSH_AGENT" ] ; then
#    eval `$SSH_AGENT $SSH_AGENT_ARGS`
#    trap "kill $SSH_AGENT_PID" 0
#fi

# or use this from the bitbucket site
#SSH_ENV=$HOME/.ssh/environment
#   
## start the ssh-agent
#function start_agent {
#    echo "Initializing new SSH agent..."
#    # spawn ssh-agent
#    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
#    echo succeeded
#    chmod 600 "${SSH_ENV}"
#    . "${SSH_ENV}" > /dev/null
#    /usr/bin/ssh-add
#}
#   
#if [ -f "${SSH_ENV}" ]; then
#     . "${SSH_ENV}" > /dev/null
#     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
#        start_agent;
#    }
#else
#    start_agent;
#fi
