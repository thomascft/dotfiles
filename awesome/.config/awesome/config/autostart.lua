local awful = require("awful")
local fs = require("gears.filesystem")

awful.spawn.single_instance("picom --config " .. fs.get_configuration_dir() .. "config/picom.conf")
