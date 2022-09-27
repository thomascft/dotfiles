local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local volume = {}
volume.widget = Helpers.slider({
	handle_widget = wibox.widget {
		widget = wibox.widget.imagebox,
		forced_height = 25,
		forced_width = 25,
		image = beautiful.volume_icon,
	},
})
volume.update = function()
	awful.spawn.easy_async_with_shell("pamixer --get-volume-human", function(stdout)
		local level = string.gsub(stdout, "%%", "")
		volume.widget.c.bar:set_value(tonumber(level))
	end)
end

volume.update()
volume.widget.c.bar:connect_signal("property::value", function()
	local level = math.floor(volume.widget.c.bar:get_value())
	awful.spawn("pamixer --set-volume " .. level)
end)
awesome.connect_signal("volume::changed", function()
	volume.update()
end)

local brightness = {}

brightness.widget = Helpers.slider({
	handle_widget = wibox.widget {
		widget = wibox.widget.imagebox,
		forced_height = 25,
		forced_width = 25,
		image = beautiful.brightness_icon,
	}
})
brightness.update = function()
	awful.spawn.easy_async_with_shell("brightnessctl | grep -i  'Current' | awk '{ print $4}' | tr -d \\(%\\)", function(stdout)
		local level = stdout
		brightness.widget.c.bar:set_value(tonumber(level))
	end)
end
brightness.update()
brightness.widget.c.bar:connect_signal("property::value", function()
	local level = math.floor(brightness.widget.c.bar:get_value())
	awful.spawn.with_shell("brightnessctl s " .. tostring(level) .. "%")
end)
return Helpers.rounded_container({
	layout = wibox.layout.fixed.vertical,
	{
		widget = Helpers.padding_container(volume.widget)
	},
	{
		widget = Helpers.padding_container(brightness.widget),
	}
})
