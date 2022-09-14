local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local _M = {}


_M.setup = function()
	return wibox.widget {
		widget = wibox.container.place,
		{
			shape = gears.shape.rounded_rect,
			bg = beautiful.colorscheme.bg2,
			widget = wibox.container.background,
			buttons = {
				awful.button({}, 1, function()
					awesome.emit_signal("control_panel::toggle", awful.screen.focused())
				end)
			},

			{
				margins = 5,
				widget = wibox.container.margin,
				{
					widget = wibox.widget.textclock("%I\n%M"),
				}
			}
		}
	}
end

return _M
