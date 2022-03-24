clipit &
xsetroot -cursor_name left_ptr &
/usr/lib/xfce-polkit/xfce-polkit &

picom --config ~/.config/berry/picom.conf &
sxhkd -c $HOME/.config/berry/sxhkdrc &
exec berry
