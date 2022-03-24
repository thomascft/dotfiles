#! /bin/sh

killall -q polybar

polybar -c ~/.config/bspwm/polybar.ini main &
#polybar tray &
