local awful = require("awful")
local config_dir = require("gears").filesystem.get_configuration_dir()

awful.spawn.once("picom --config " .. config_dir .. "conf/picom.conf")
