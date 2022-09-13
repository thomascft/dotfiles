local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local _M = {}


local clock = wibox.widget {
	widget = wibox.container.place,
	-- buttons = {
	--	awful.button({}, 1, function()
	--		awesome.emit_signal("widget::calendar:toggle")
	--	end)
	--},
	{
		shape = gears.shape.rounded_rect,
		bg = beautiful.colorscheme.bg2,
		widget = wibox.container.background,
		{
			margins = 5,
			widget = wibox.container.margin,
			{
				widget = wibox.widget.textclock("%I\n%M"),
			}
		}
	}
}

_M.setup = function()
	return clock
end

return _M
