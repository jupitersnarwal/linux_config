#
# Author: jupiter
# Last modified: 2013/10/28
#

# to start the teamviewer daemon
# sudo teamviwer --daemon start

# allow java apps to work properly with dwm
wmname LG3D
# load urxvt config
xrdb -merge ~/.Xresources

compton -cGb
 
# add option --no-xinerama "$@" for dual screen
# no idea what the $@ is for though
# feh --bg-scale $HOME/pictures/ISS_astro.jpg
paper_changer -w 300 &

exec ~/bin/dwm/dwm_start
