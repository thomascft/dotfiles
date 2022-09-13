local awful = require("awful")
local config_dir = require("gears").filesystem.get_configuration_dir()

awful.spawn.once("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
awful.spawn.once("picom --experimental-backends --config " .. config_dir .. "config/picom.conf")
awful.spawn.once("mopidy")
