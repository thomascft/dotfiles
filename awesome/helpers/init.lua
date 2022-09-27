local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")

Helpers = {}

Helpers.rounded_container = function(widget, opt)
	local opt = opt or {}
	opt.bg = opt.bg or nil
	opt.padding = opt.padding or beautiful.container_padding
	opt.margins = opt.margins or beautiful.container_margins
	opt.border_radius = opt.border_radius or beautiful.radius

	local container = wibox.widget {
		widget = wibox.container.margin,
		margins = opt.margins,
		{
			widget = wibox.container.background,
			bg = opt.bg,
			shape = function(self, width, height)
				gears.shape.rounded_rect(self, width, height, opt.border_radius)
			end,
			{
				widget = wibox.container.margin,
				margins = opt.padding,
				widget
			}
		}
	}

	if opt.action then
		widget.buttons = {
			awful.button({}, 1, opt.action())
		}
	end

	return container
end
Helpers.padding_container = function(widget)
	return wibox.widget {
		widget = wibox.container.margin,
		margins = beautiful.container_padding,
		{
			widget = widget
		}
	}
end

Helpers.slider = function(opts)
	local opts = opts or {}
	return wibox.widget {
		layout = wibox.layout.stack,
		{
			widget = wibox.container.place,
			content_fill_horizontal = true,
			{
				widget = wibox.container.background,
				shape = gears.shape.rounded_bar,
				bg = beautiful.colorscheme.bg3,
				forced_height = 5,
			}
		},
		{
			id = "c",
			widget = wibox.container.constraint,
			height = 50,
			{
				id               = "bar",
				widget           = wibox.widget.slider,
				bar_shape        = gears.shape.rounded_bar,
				shape            = gears.shape.rounded_bar,
				bar_height       = 50,
				bar_color        = "transparent",
				bar_active_color = beautiful.accent .. "88",
				handle_color     = beautiful.accent .. "88",
				handle_shape     = gears.shape.circle,
				handle_widget    = opts.handle_widget or nil,
				bar_widget		 = opts.bar_widget or nil,
				value            = 50,
				maximum          = 100,
				handle_width     = 50,
			}
		}
	}
end

Helpers.quick_action = function(opts)
	local opts = opts or nil

	local widget = wibox.widget {
		layout = wibox.layout.fixed.horizontal,
		{
			id = "icon",
			widget = wibox.widget.imagebox,
			image = opts.icon,
		},
		{
			id = "label",
			widget = wibox.widget.textbox,
			text = opts.label
		}
	}
	return Helpers.rounded_container(widget, { action = opts.action, bg = beautiful.accent })
end

