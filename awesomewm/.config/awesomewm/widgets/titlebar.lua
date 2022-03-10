local awful = require("awful")
local wibox = require("wibox")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local beautiful = require("beautiful")

client.connect_signal("request::titlebars", function(c)

    wibox.container.margin {
        layout = wibox.layout.align.horizontal,
        widget = awful.titlebar(c):setup {
            layout = wibox.layout.align.horizontal,
            {
                awful.titlebar.widget.iconwidget(c),
                layout = wibox.layout.fixed.horizontal
            }, {
                {
                    widget = awful.titlebar.widget.titlewidget(c),
                    align = "center"
                },
                layout = wibox.layout.flex.horizontal
            },
            {
                awful.titlebar.widget.closebutton(c),
                layout = wibox.layout.fixed.horizontal
            }
        },
        left = dpi(12)
    }
end)
