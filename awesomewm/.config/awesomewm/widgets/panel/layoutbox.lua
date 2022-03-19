local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")

local layoutbox = function(s)
   local content = wibox.widget{
       widget = wibox.container.margin {widget = awful.widget.layoutbox(s),},
       margins = 4
    }
   return content 
end

return layoutbox
