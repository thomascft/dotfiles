local wibox = require("wibox")
local upower_widget = require 'modules.battery'
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi
local gears = require("gears")


local upower_widget = require("modules.battery")



local battery_template = wibox.widget {
	widget = wibox.widget.progressbar,

	max_value        = 1,
	-- forced_height = dpi(5),
	background_color = beautiful.colorscheme.bg2,
	--margins          = dpi(5),
	color            = beautiful.colorscheme.green,
	value            = 0.25,

}


local battery_widget = upower_widget {
	device_path = '/org/freedesktop/UPower/devices/battery_BAT1',
	instant_update = true,
	widget_template = battery_template
}
local battery_container = wibox.widget {
	widget = wibox.container.margin,
	margins = dpi(5),
	{
		widget = wibox.container.background,
		bg = beautiful.colorscheme.bg2,
		shape = gears.shape.rounded_rect,
		{
			widget = wibox.container.place {
				layout = wibox.layout.fixed.vertical,
				{
					widget = wibox.container.place,
					{
						widget = wibox.container.background,
						shape = gears.shape.rounded_bar,
						forced_width = dpi(8),
						forced_height = dpi(2),
						bg = beautiful.colorscheme.bg4,
					}
				},

				{ widget = wibox.container.background,
					border_width = dpi(3),
					border_color = beautiful.colorscheme.bg4,
					forced_height = dpi(40),
					forced_width = dpi(20),
					shape = function(cr, width, height)
						gears.shape.rounded_rect(cr, width, height, dpi(3.5))
					end,
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

	}
}


battery_widget:connect_signal('upower::update', function(widget, device)
	widget.value = device.percentage
end)

return battery_container
