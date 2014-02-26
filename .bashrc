#!/bin/bash
#
# Author: jupiter
# Last Edit: 2013/12/24
#
# WARNING!! Many of these commands and settings are linux only!
#

# ============================================================
# GENERAL
# ============================================================

# set cmdsline to use vi keystrokes
set -o vi

# ============================================================
# ALIAS
# ============================================================
alias cls='clear'          # clear
alias rm='rm -Iv'           # remove ask for permision
alias mkdir='mkdir -p'     # make directory with parents
alias ..='cd ..'           # go up one directory
alias c-='cd -'            # go to last directory
alias umount='umount -v'   # always verbose
alias mount='mount -v'     # always verbose

alias du='du -kh'          # folder usage (human readable)
alias df='df -kTh'         # partition list and usage

# bad commands
alias ifconfig='echo DEPRICATED. Use ip addr'
alias ipconfig='echo ipconfig is a Windows command'

# Add colors for filetype and  human-readable sizes by default on 'ls':
alias ls='ls --color'
alias lsr='lx src/'        # print the contents of the src directory
alias lx='ls -lXB'         # Sort by extension.
alias lk='ls -lSr'         # Sort by size, biggest last.
alias lt='ls -ltr'         # Sort by date, most recent last.
alias lc='ls -ltcr'        # Sort by/show change time,most recent last.
alias lu='ls -ltur'        # Sort by/show access time,most recent last.

# 'll': directories first, with alphanumeric sorting:
alias ll="ls -lv --group-directories-first"
alias lm='ll | more'       # Pipe through 'more'
alias le='ll | less'       # pipe through 'less'
alias lr='ll -R'           # Recursive ls.
alias la='ll -Aa'           # Show hidden files.

# tar alias's
alias tart='tar tf'        # view contents of tar
alias tarx='tar xfv'       # extract tar archive
alias tarc='tar cfv'       # create tar archive

# other
alias ebashrc='gvim ~/.bashrc'
alias tty-clock='tty-clock -s -x  -c -C 5'

# ============================================================
# FUNCTION CMDS
# ============================================================

# change directory to home/bin
function cdb () {

    if [ -d $HOME/bin ] ; then
        cd $HOME/bin
        la
    else
        echo "$HOME/bin does not exist"
    fi
}

# change directory and list contents
function cdl () {

    if [ -n $1 ] ; then
        cd $1 && la
    fi
}

# list commands in less
function cmds () {

    CMDS="$HOME/adata/cmds"
    if [ -e $CMDS ] ; then
        if [ $# -gt 0 ] ; then
            cmds | grep $1
        else
            cat $CMDS | less
        fi
    else
        echo there was an error. file must not exist
    fi
}

# list arch specific commands in less
function acmds () {

    ACMD="$HOME/adata/cmds_arch"
    if [ -e $ACMD ] ; then

        if [ $# -gt 0 ] ; then
            acmds | grep $1
        else
            cat $ACMD | less
        fi
    else
        echo there was an error. file must not exist
    fi
}

function plutonium () {

    cd $HOME/jupiter_data/cs_related/projects/libplutonium/
    if [ $# -gt 0 ] ; then
        if [ -e src/PLUTONIUM/$1 ] ; then
            gvim src/PLUTONIUM/$1
        else
            echo "! file $1 does not exist"
            echo "--> cd to src directory"
            cd src && la
        fi
    else
        dir=`pwd`
        echo "$dir"
        la
    fi
}

function comnurse () {

    NURSE_DIR=$HOME/jupiter_data/cs_related/projects/nursing_simulation/com.regis.nursingsimulation/
    if [ -d $NURSE_DIR ] ; then
        cd $NURSE_DIR && la
    else
        echo -e "the directory:\n$NURSE_DIR\ndoes not exist"
    fi
    if [ $# -gt 0 ] ; then
        if [ $1 == "ide" ] ; then
            ~/jmonkeyplatform/bin/jmonkeyplatform
            echo "use jmonkey as a job by ctrl-z && bg"
        else
            echo "$(tput setaf 1) ERROR! $(tput sgr0)unknown argument $(tput setaf 3)$1$(tput sgr0)"
            echo "usage: comnurse ide"
            echo "option ide will open the jmonkey ide"
        fi
    fi
}

# move a program or script to home/bin
function mvbin () {

    BIN="$HOME/bin"
    if [ ! -d $BIN ] ; then
        echo "--> making directory $BIN"
        mkdir $BIN
    fi

    if [ -e $1 ] ; then
        mv $1 $BIN
        echo "--> $1 moved"
    else
        echo "--> file $1 does not exist"
    fi
}

# copy a program or a script to home/bin
function cpbin () {

    BIN="$HOME/bin"
    if [ ! -d $BIN ] ; then
        echo "--> making directory $BIN"
        mkdir $BIN
    fi

    if [ -e $1 ] ; then
        cp $1 $BIN
        echo "--> $1 copied"
    else
        echo "--> file $1 does not exist"
    fi
}

# change directory to mounted usb
function usb () {

    USBDIR="/mnt/usb"
    if [ ! -d ${USBDIR}$1 ] ; then
        echo ${USBDIR}$1 does not exist
    else
        cd ${USBDIR}$1 && la
    fi
}

# ============================================================
# BASH PROMPT STUFF
#
# TODO
# number of files, and folder size
# number of users currently logged into the system
# history number of current command
# ============================================================

# NO COLOR
NO_NONE="\[\033[00m\]"

# REGULAR FONT COLORS
COL_DEFAULT="\[\033[00;039m\]"
COL_BLACK="\[\033[00;030m\]"
COL_RED="\[\033[00;031m\]"
COL_GREEN="\[\033[00;032m\]"
COL_YELLOW="\[\033[00;033m\]"
COL_BLUE="\[\033[00;034m\]"
COL_MAGENTA="\[\033[00;035m\]"
COL_CYAN="\[\033[00;036m\]"
COL_LGRAY="\[\033[00;037m\]"
COL_DGRAY="\[\033[00;090m\]"
COL_LRED="\[\033[00;091m\]"
COL_LGREEN="\[\033[00;092m\]"
COL_LYELLOW="\[\033[00;093m\]"
COL_LBLUE="\[\033[00;094m\]"
COL_LMAGENTA="\[\033[00;095m\]"
COL_LCYAN="\[\033[00;096m\]"
COL_WHITE="\[\033[00;097m\]"

# BOLD FONT COLORS
COLB_DEFAULT="\[\033[01;039m\]"
COLB_BLACK="\[\033[01;030m\]"
COLB_RED="\[\033[01;031m\]"
COLB_GREEN="\[\033[01;032m\]"
COLB_YELLOW="\[\033[01;033m\]"
COLB_BLUE="\[\033[01;034m\]"
COLB_MAGENTA="\[\033[01;035m\]"
COLB_CYAN="\[\033[01;036m\]"
COLB_LGRAY="\[\033[01;037m\]"
COLB_DGRAY="\[\033[01;090m\]"
COLB_LRED="\[\033[01;091m\]"
COLB_LGREEN="\[\033[01;092m\]"
COLB_LYELLOW="\[\033[01;093m\]"
COLB_LBLUE="\[\033[01;094m\]"
COLB_LMAGENTA="\[\033[01;095m\]"
COLB_LCYAN="\[\033[01;096m\]"
COLB_WHITE="\[\033[01;097m\]"

# BACKGROUND COLORS
BAK_DEFAULT="\[\033[00;049m\]"
BAK_BLACK="\[\033[00;040m\]"
BAK_RED="\[\033[00;041m\]"
BAK_GREEN="\[\033[00;042m\]"
BAK_YELLOW="\[\033[00;043m\]"
BAK_BLUE="\[\033[00;044m\]"
BAK_MAGENTA="\[\033[00;045m\]"
BAK_CYAN="\[\033[00;046m\]"
BAK_LGRAY="\[\033[00;047m\]"
BAK_DGRAY="\[\033[00;100m\]"
BAK_LRED="\[\033[00;101m\]"
BAK_LGREEN="\[\033[00;102m\]"
BAK_LYELLOW="\[\033[00;103m\]"
BAK_LBLUE="\[\033[00;104m\]"
BAK_LMAGENTA="\[\033[00;105m\]"
BAK_LCYAN="\[\033[00;106m\]"
BAK_WHITE="\[\033[00;107m\]"

# PS1 VARS
#export PS1='[\h]$'
export PS1="[ ${COLB_CYAN}\t${COL_LGRAY} ] [ ${COL_CYAN}jobs: ${COLB_LCYAN}\j${COL_LGRAY} ] [ ${COL_CYAN}\w${COL_LGRAY} ]\n( \`if [ \$? = 0 ]; then echo \[\e[94m\]\$?\[\e[0m\]; else echo \[\e[91m\]\$?\[\e[00m\]; fi\` ) ${COL_CYAN}\u${COL_LGRAY}::${COLB_MAGENTA}\h ${COL_CYAN}$ ${NO_NONE}"

# export PS1='\e[s\e[0;0H\e[1;33m\h    \t\n\e[1;32mThis is my computer\e[u[\u@\h:  \w]\$ '
export PS2="-->"

# export PROMPT_COMMAND='cowsay -e @@ "do you promise the funk, the whole funk, and nothing but the funk?"'
