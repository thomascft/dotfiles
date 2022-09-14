local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")

-- {{{ Wibar

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- Create a textclock widget


-- }}}

local _M = {}

_M.setup = function(s)
	awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

	local layoutbox = wibox.widget {
		widget = wibox.container.margin,
		margins = 5,
		{
			widget = awful.widget.layoutbox {
				screen  = s,
				buttons = {
					awful.button({}, 1, function() awful.layout.inc(1) end),
					awful.button({}, 3, function() awful.layout.inc(-1) end),
					awful.button({}, 4, function() awful.layout.inc(-1) end),
					awful.button({}, 5, function() awful.layout.inc(1) end),
				}
			}

		}
	} -- Create a tasklist widget
	local tasklist = awful.widget.tasklist {
		screen  = s,
		filter  = awful.widget.tasklist.filter.currenttags,
		buttons = {
			awful.button({}, 1, function(c)
				c:activate { context = "tasklist", action = "toggle_minimization" }
			end),
			awful.button({}, 3, function() awful.menu.client_list { theme = { width = 250 } } end),
			awful.button({}, 4, function() awful.client.focus.byidx(-1) end),
			awful.button({}, 5, function() awful.client.focus.byidx(1) end),
		}
	}

	-- Create the wibox
	return awful.wibar {
		position = "left",
		screen   = s,
		margins  = {
			left = beautiful.useless_gap * 2,
			top = beautiful.useless_gap * 2,
			bottom = beautiful.useless_gap * 2,
		},
		height   = s.geometry.height - beautiful.useless_gap * 4,
		shape = function(self, width, height ) gears.shape.rounded_rect(self, width, height, beautiful.radius) end,
		widget   = {
			widget = wibox.container.margin,
			margins = { top = 8, bottom = 8 },
			{
				layout = wibox.layout.align.vertical,
				require("ui.bar.clock").setup(),
				require("ui.bar.taglist").setup(s),
				{ -- Right widgets
					layout = wibox.layout.fixed.vertical,
					require("ui.bar.battery"),
					wibox.widget.systray(),
					layoutbox,
				},
			}
		}
	}

end

return _M
