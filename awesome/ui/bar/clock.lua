local wibox = require("wibox")
local awful = require("awful")
local _M = {}


local clock = wibox.widget {
	widget = wibox.container.background,
	buttons = {
		awful.button({}, 1, function()
			awesome.emit_signal("widget::calendar:toggle")
		end)
	},
	{
		widget = wibox.widget.textclock("%l:%M"),
	}
}

_M.setup = function ()
	return clock
end

return _M
