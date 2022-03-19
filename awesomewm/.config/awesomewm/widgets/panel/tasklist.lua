local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")

local tasklist = function(s)

    return wibox.widget {
        left = 2,
        right = 2,
        widget = wibox.container.margin {
            widget = wibox.container.background,
            shape = gears.shape.rounded_bar,
            awful.widget.tasklist {
                bg = beautiful.transparent,
                screen = s,
                filter = awful.widget.tasklist.filter.currenttags,
                buttons = {
                    awful.button({}, 1, function(c)
                        c:activate{
                            context = "tasklist",
                            action = "toggle_minimization"
                        }
                    end), awful.button({}, 3, function()
                        awful.menu.client_list {theme = {width = 250}}
                    end),
                    awful.button({}, 4,
                                 function()
                        awful.client.focus.byidx(-1)
                    end),
                    awful.button({}, 5,
                                 function()
                        awful.client.focus.byidx(1)
                    end)
                }
            }
        }
    }
end

return tasklist
