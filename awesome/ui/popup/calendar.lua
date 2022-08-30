local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")

local _M = {}

_M.setup = function(s)

	local calendar = awful.popup {
		screen = s,
		visible = false,
		forced_width = 200,
		forced_height = 200,
		ontop = true,
		shape = gears.shape.rounded_rect,
		placement = function(self) awful.placement.top_left(self, { offset = { x = 10 , y =  beautiful.wibar_height + beautiful.useless_gap * 2 } }) end,
		widget = {
			widget = wibox.container.margin,
			margins = 5,
			{
				widget = wibox.widget.calendar.month(os.date("*t"))
			}
		}
	}

	awesome.connect_signal("widget::calendar:toggle", function()
		calendar.visible = not calendar.visible
	end)

	return calendar
end



return _M
