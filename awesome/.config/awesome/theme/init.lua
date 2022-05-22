local beautiful = require("beautiful")
local gears = require("gears")
local bling = require("modules.bling")

beautiful.init(gears.filesystem.get_configuration_dir() .. "theme/dark.lua")
bling.module.wallpaper.setup {
    wallpaper = {"Pictures/wallpapers/TokyoBlobClean.png"},
    position = "maximized"
}

