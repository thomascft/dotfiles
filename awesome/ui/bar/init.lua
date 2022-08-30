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

	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()

	-- Create an imagebox widget which will contain an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox {
		screen  = s,
		buttons = {
			awful.button({}, 1, function() awful.layout.inc(1) end),
			awful.button({}, 3, function() awful.layout.inc(-1) end),
			awful.button({}, 4, function() awful.layout.inc(-1) end),
			awful.button({}, 5, function() awful.layout.inc(1) end),
		}
	}
	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist {
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
		position = "top",
		screen   = s,
		widget   = {
			widget = wibox.container.margin,
			left = 20,
			right = 20,
			{
				layout = wibox.layout.align.horizontal,
				require("ui.bar.clock").setup(),
				require("ui.bar.taglist").setup(s),
				{ -- Right widgets
					layout = wibox.layout.fixed.horizontal,
					mykeyboardlayout,
					wibox.widget.systray(),
					s.mylayoutbox,
				},
			}
		}
	}

end

return _M
