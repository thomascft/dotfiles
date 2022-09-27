local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local rubato = require("modules.rubato")

local _M = {}


_M.setup = function(s)
	local panel = awful.popup {
		type = "dock",
		ontop = true,
		visible = false,
		screen = s,
		maximum_width = dpi(560),
		maximum_height = beautiful.wibar_height,
		minimum_width = dpi(560),
		minimum_height = beautiful.wibar_height,
		shape = function(self, width, height) gears.shape.rounded_rect(self, width, height, beautiful.radius) end,
		placement = function(self)
			awful.placement.left(self, { margins = { left = beautiful.useless_gap * 4 + beautiful.wibar_width } })
		end,
		widget = {
			layout = wibox.layout.fixed.vertical,
			{
				widget = require("ui.panel.sliders")
			},
			{
				widget = require("ui.panel.quick_actions")
			},
		}
	}

	awesome.connect_signal("control_panel::toggle", function(screen)
		if screen == s then
			panel.visible = not panel.visible
		end
	end)

	return panel
end

return _M
