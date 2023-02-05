export XDG_CURRENT_DESKTOP=awesome

systemctl --user import-environment DISPLAY XDG_CURRENT_DESKTOP

exec awesome
