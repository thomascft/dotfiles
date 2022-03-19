local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")

local right = function(s)
    return {
    {
        {
            layout = wibox.layout.fixed.horizontal,
            require("widgets.seperator"),
            require("widgets.panel.layoutbox") (s),
            wibox.widget.systray(),
            wibox.widget.textclock(),
            require("widgets.seperator"),
            
        },
        widget = wibox.container.background,
        bg = beautiful.bg_widget,
        shape = beautiful.widget_shape
    },
    widget = wibox.container.margin,
    left = 2,
    rith = 2
}
    
    
end
return right
