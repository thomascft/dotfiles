local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local _M = {}

_M.setup = function(c)

	local titlebar = awful.titlebar(c, {
		position = "left",
		bg = beautiful.colorscheme.bg0
	})
	titlebar.widget = {
		layout = wibox.layout.align.vertical,
		{
			layout = wibox.layout.fixed.vertical,
			awful.titlebar.widget.closebutton(c),
			awful.titlebar.widget.minimizebutton(c),
			awful.titlebar.widget.maximizedbutton(c),
			--awful.titlebar.widget.stickybutton   (c),
			--awful.titlebar.widget.ontopbutton    (c),
		},
		{
			layout = wibox.layout.fixed.vertical,
			buttons = {
				awful.button({}, 1, function()
					c:activate { context = "titlebar", action = "mouse_move" }
				end),
			}

		},
		{
			widget = awful.titlebar.widget.floatingbutton(c),
		}
		--{},
		--{}
	}
end

return _M
