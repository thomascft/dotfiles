local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi


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
	bg = beautiful.colorscheme.bg_dark,
	shape = gears.shape.rounded_rect,
        widget = wibox.container.background {
	    margins = 5,
	    widget = wibox.container.margin {
		    widget = awful.widget.taglist {
	    screen  = s,
	    filter  = awful.widget.taglist.filter.all,
	    style = {
		shape = gears.shape.rounded_rect,
		spacing = 10,
	    },
	    widget_template = {
		    widget = wibox.container.background,
		    shape = gears.shape.rounded_rect,
		    forced_height = 15,
		    bg = "#cccccc",
		create_callback = function (self, c3, _)
		    if c3.selected then
			self.bg = beautiful.colorscheme.accent
			self.forced_width = 20
		    elseif #c3:clients() == 0 then
			self.bg = beautiful.colorscheme.bg_highlight
			self.forced_width = 15
		    else
			self.bg = beautiful.colorscheme.black
			self.forced_width = 15
		    end
		end,
		update_callback = function (self, c3, _)
		    if c3.selected then	
			self.bg = beautiful.colorscheme.accent
			self.forced_width = 20
		    elseif #c3:clients() == 0 then
			self.bg = beautiful.colorscheme.bg_highlight
			self.forced_width = 15
		    else
			self.bg = beautiful.colorscheme.black
			self.forced_width = 15

		    end
		end
	    },

	    buttons = buttons,
	}}}
    }
end

return _M
