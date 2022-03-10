local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")

local right = function(s)
    return {
        {
            layout = wibox.layout.fixed.horizontal,
            require("widgets.panel.layoutbox") (s),
            wibox.widget.textclock(),
            wibox.widget.systray()
        },
        widget = wibox.container.background,
        bg = beautiful.bg_widget
    }
end
return right
