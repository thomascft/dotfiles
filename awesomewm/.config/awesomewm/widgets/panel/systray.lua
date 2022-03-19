local wibox = require("wibox")
local beautiful = require("beautiful")

local systray = function (s)
    wibox.widget {
        {
            {
                wibox.widget.systray()
            },
            widget = container.background
        },
        widget = wibox.container.margin,

    }
end
return systray