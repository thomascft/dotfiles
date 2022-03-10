local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")

local panel = function(s)

    local wibar = awful.wibar ({
        position = beautiful.wibar_position,
        x = s.geometry.x + 10,
        screen = s,
        bg = "#00000000",
        height = 40,
        width = s.geometry.width - 20,
        widget ={
            {
                layout = wibox.layout.align.horizontal,
                {
                    layout = wibox.layout.align.horizontal,
                    require("widgets.panel.taglist")(s)
                },
                require("widgets.panel.tasklist")(s),
                {
                    layout = wibox.layout.fixed.horizontal,
                    require("widgets.panel.right") (s),
                }
            },
            widget = wibox.container.margin,
            top = 8
        }
    })
    return wibar
end
return panel
