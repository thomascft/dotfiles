#!/usr/bin/sh

case $1 in
	up)
		wpctl set-volume @DEFAULT_SINK@ 5%+
		;;
	down)
		wpctl set-volume @DEFAULT_SINK@ 5%-
		;;
	mute) 
		wpctl set-mute @DEFAULT_SINK@ toggle
		;;
esac


volume=$(wpctl get-volume @DEFAULT_SINK@ | sed s/"Volume: 0."//)

dunstify "Volume: $volume" -r 30319 -h int:value:$volume
