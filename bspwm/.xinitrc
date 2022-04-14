/usr/lib/xfce-polkit/xfce-polkit &
setxkbmap -model pc105 -layout us,us -variant ,colemak -option grp:ctrls_toggle,shift:both_capslock,caps:backspace
exec $2
