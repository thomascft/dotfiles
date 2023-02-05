local battery_widget = require("modules.battery")
local wibox = require("wibox")

-- Create the battery widget:
local _M = {}

_M.setup = function(s)
		local battery = battery_widget {
    	screen = s,
    	use_display_device = true,
    	widget_template = wibox.widget.textbox
	}

	battery:connect_signal('upower::update', function (widget, device)
    	widget.text = string.format('%3d', device.percentage) .. '%'
	end)
	return battery
end

return _M
