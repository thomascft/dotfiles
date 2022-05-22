local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

local _M = {}

local buttons = gears.table.join(
		awful.button({ }, 1, function(t) t:view_only() end),
		awful.button({ modkey }, 1, function(t)
		                                if client.focus then
			                            client.focus:move_to_tag(t)
			                        end
				            end),
		awful.button({ }, 3, awful.tag.viewtoggle),
		awful.button({ modkey }, 3, function(t)
		                                if client.focus then
			                            client.focus:toggle_tag(t)
			                        end
				            end),
		awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
		awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end)
	    )


_M.init = function(s)
    return wibox.container.place {
	valign = "center",
        halign = "center",
        widget = awful.widget.taglist {
	    screen  = s,
	    filter  = awful.widget.taglist.filter.all,
	    widget_template = {
		widget = wibox.container.background,
		shape = gears.shape.rounded_rect,
	    },
	    buttons = buttons,
	}
    }
end

return _M
