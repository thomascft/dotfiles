local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")

local layoutbox = function(s)
   local content = wibox.container.margin{
       widget = wibox.container.place {widget = awful.widget.layoutbox(s),},
       margins = beautiful.padding
    }
   return content 
end

return layoutbox
