local awful = require("awful")
local beautiful = require("beautiful")

tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
        awful.layout.suit.spiral,
        awful.layout.suit.spiral.dwindle,
        awful.layout.suit.floating,
        awful.layout.suit.tile,
        awful.layout.suit.tile.left,
        awful.layout.suit.tile.bottom,
        awful.layout.suit.tile.top,
        awful.layout.suit.fair,
        awful.layout.suit.fair.horizontal,
        awful.layout.suit.max,
        awful.layout.suit.max.fullscreen,
        awful.layout.suit.magnifier,
        awful.layout.suit.corner.nw,
    })
end)

client.connect_signal("request::manage", function (c)
    c.shape = beautiful.client_shape    
end) 
awful.screen.connect_for_each_screen(function(s)
    awful.tag({"いち", "に", "さん", "よん", "ご", "ろく", "なな", "はち", "jゆう", "きゅう"}, s, awful.layout.layouts[1])
    require("widgets.panel") (s)
end)
