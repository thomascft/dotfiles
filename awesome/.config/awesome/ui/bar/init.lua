local awful = require('awful')
local wibox = require('wibox')
local beautiful = require("beautiful")
local taglist = require("ui.bar.taglist")
local tasklist = require("ui.bar.tasklist")
local battery = require("ui.bar.battery")
-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- Create a textclock widgets
clock = wibox.widget.textclock()

local layoutbox = function (s) return awful.widget.layoutbox {
        screen  = s,
        buttons = {
            awful.button({ }, 1, function () awful.layout.inc( 1) end),
            awful.button({ }, 3, function () awful.layout.inc(-1) end),
            awful.button({ }, 4, function () awful.layout.inc(-1) end),
            awful.button({ }, 5, function () awful.layout.inc( 1) end),
        }
    }
end
local left = function (s) 
    return {
    layout = wibox.layout.fixed.horizontal,
    clock,
    }
end
local center = function(s) return taglist.init(s) end
local right = function (s) 
    return {
	layout = wibox.layout.fixed.horizontal,
                -- mykeyboardlayout,
                wibox.widget.systray(),
		--battery.init(),
		layoutbox(s),
    }
end
local _M = {}

 -- screen.connect_signal("request::desktop_decoration",
_M.init = function(s)
    -- Each screen has its own tag table.

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.


        -- Create the wibox
    s.mywibox = awful.wibar {
        position = "top",
        screen   = s,
        widget   = 
	{
            layout = wibox.layout.align.horizontal,
	    left(s),
	    center(s),
	    right(s),
        }
    }
end

return _M
