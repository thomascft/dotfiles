local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")

local menu = wibox.widget {
    {
		{
			{
				image = beautiful.awesome_icon,
				resize = true,
				-- forced_height = beautiful.wibar_icon_size,
				-- forced_width = beautiful.wibar_icon_size,
				widget = wibox.widget.imagebox
			},
			margins = 4,
			widget = wibox.container.margin
		},
		bg = beautiful.bg_normal,
		widget = wibox.container.background
	},
    widget = wibox.widget.background
}
return menu