pcall(require, "luarocks.loader")
require("awful.autofocus")
local naughty = require("naughty")
naughty.connect_signal("request::display_error", function(message, startup)
    naughty.notification {
        urgency = "critical",
        title   = "Oops, an error happened"..(startup and " during startup!" or "!"),
        message = message
    }
end)

client.connect_signal("mouse::enter", function(c)
    c:activate { context = "mouse_enter", raise = false }
end)

require("theme")
require("helpers")
require("signals")
require("config")
