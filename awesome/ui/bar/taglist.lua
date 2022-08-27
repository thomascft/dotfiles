local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local rubato = require("modules.rubato")
local gears = require("gears")

local _M = {}

local buttons = {
	awful.button({}, 1, function(t) t:view_only() end),
	awful.button({ modkey }, 1, function(t)
		if client.focus then
			client.focus:move_to_tag(t)
		end
	end),
	awful.button({}, 3, awful.tag.viewtoggle),
	awful.button({ modkey }, 3, function(t)
		if client.focus then
			client.focus:toggle_tag(t)
		end
	end),
	awful.button({}, 4, function(t) awful.tag.viewprev(t.screen) end),
	awful.button({}, 5, function(t) awful.tag.viewnext(t.screen) end),
}


_M.setup = function(s)
	return wibox.container.place {
		widget = wibox.container.background,
		shape = gears.shape.rounded_bar,
		bg = beautiful.colorscheme.bg2,
		{
		margins = 5,
		widget = wibox.container.margin,
		{
			widget = awful.widget.taglist {
				screen = s,
				filter = awful.widget.taglist.filter.all,
				style = {
					spacing = 5,
				},
				widget_template = {
					create_callback = function(self, tag, _)
						self.animate = rubato.timed {
							intro = 0.1,
							duration = 0.2,
							subscribed = function(w)
								self.children[1].forced_width = w
							end
						}

						self.update = function()
							if tag.selected then
								self.animate.target = 20
								self.children[1].bg = beautiful.accent
							elseif #tag:clients() > 0 then
								self.animate.target = 10
								self.children[1].bg = beautiful.accent
							else
								self.animate.target = 10
								self.children[1].bg = beautiful.colorscheme.bg4
							end
						end
						self.update()
					end,
					update_callback = function(self, _)
						self.update()
					end,
					widget = wibox.container.place,
					{
						widget = wibox.container.background,
						forced_width = 10,
						forced_height = 10,
						shape = gears.shape.rounded_bar,
					}
				}
			}
		}
	}}
end

return _M
