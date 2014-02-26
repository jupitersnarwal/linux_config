#
# Author: jupiter
# Last modified: 2013/11/10
#

# to start the teamviewer daemon
# sudo teamviwer --daemon start

# add option --no-xinerama "$@" for dual screen
# no idea what the $@ is for though
# feh --bg-scale $HOME/pictures/ISS_astro.jpg
paper_changer -w 300 &

# allow java apps to work properly with dwm
wmname LG3D

# load urxvt config
xrdb -merge ~/.Xresources

# pretty windows shit
compton -cGb

# start xscreensaver
xscreensaver -no-splash &

# start the urxvt daemon
urxvtd -q -o -f

# start dwm
exec ~/bin/dwm/dwm_start
