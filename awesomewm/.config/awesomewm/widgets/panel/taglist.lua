local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

local taglist = function(s)
    return {
        {
            {
                awful.widget.taglist {
                    screen = s,
                    filter = awful.widget.taglist.filter.all,
                    buttons = {
                        awful.button({}, 1, function(t)
                            t:view_only()
                        end), awful.button({modkey}, 1, function(t)
                            if client.focus then
                                client.focus:move_to_tag(t)
                                t:view_only()
                            end
                        end), awful.button({}, 3, awful.tag.viewtoggle),
                        awful.button({modkey}, 3, function(t)
                            if client.focus then
                                client.focus:toggle_tag(t)
                            end
                        end), awful.button({}, 4, function(t)
                            awful.tag.viewprev(t.screen)
                        end), awful.button({}, 5, function(t)
                            awful.tag.viewnext(t.screen)
                        end)
                    }
                },
                widget = wibox.container.background

            },
            shape = gears.shape.rounded_bar,
            widget = wibox.container.background,
            bg = beautiful.bg_normal

        },
        widget = wibox.container.margin,
        right = 2,
        left = 2
    }

end
return taglist
