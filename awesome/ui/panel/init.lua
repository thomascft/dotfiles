local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local _M = {}

_M.setup = function (s)
	local panel = awful.popup {
	type = "dock",
	ontop = true,
	visible = false,
	screen = s,
	minimum_width = dpi(560),
	minimum_height = beautiful.wibar_height,
		shape = function(self, width, height ) gears.shape.rounded_rect(self, width, height, beautiful.radius) end,
	placement = function(self)
		awful.placement.left(self, { margins = { left = beautiful.useless_gap * 4 + beautiful.wibar_width } }) end,
	widget = {
		widget = wibox.container.background,
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
