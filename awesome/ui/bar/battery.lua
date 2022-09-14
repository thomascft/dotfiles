local wibox = require("wibox")
local upower_widget = require 'modules.battery'
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi
local gears = require("gears")


local upower_widget = require("modules.battery")



local battery_template = wibox.widget {
	widget = wibox.widget.progressbar,

	max_value        = 100,
	-- forced_height = dpi(5),
	background_color = beautiful.colorscheme.bg2,
	margins          = dpi(1),
	color            = beautiful.colorscheme.green,
	shape            = function(self, width, height) gears.shape.rounded_rect(self, width, height, dpi(4)) end,
	value            = 25,

}


local battery_widget = upower_widget {
	device_path = '/org/freedesktop/UPower/devices/battery_BAT1',
	instant_update = true,
	widget_template = battery_template
}


local battery_container = wibox.container.place {
	layout = wibox.layout.fixed.vertical,
	{
		widget = wibox.container.place,
		{
			widget = wibox.container.margin,
			margins = dpi(2),
			{
				widget = wibox.container.background,
				shape = gears.shape.rounded_bar,
				bg = beautiful.colorscheme.bg4,
				forced_height = dpi(2),
				forced_width = dpi(8),
			}
		}
	},
	{
		widget = wibox.container.background,
		shape = function(self, width, height) gears.shape.rounded_rect(self, width, height, dpi(4)) end,
		bg = beautiful.colorscheme.bg2,
		border_width = dpi(2),
		border_color = beautiful.colorscheme.bg4,
		forced_width = dpi(20),
		forced_height = dpi(36),
		{
			widget = wibox.container.margin,
			margins = dpi(2),
			{
				widget = wibox.container.rotate,
				direction = "east",
				{
					widget = battery_widget
				}
			}
		}
	}
}

battery_widget:connect_signal('upower::update', function(widget, device)
	widget.value = device.percentage
	-- widget.color = "#ff0000"
end)

return battery_container
