pcall(require, "luarocks.loader")
-- require("awful.hotkeys_popup.keys")

require("theme")
require("config")
require("core")
require("bindings")

client.connect_signal("mouse::enter", function(c)
    c:activate { context = "mouse_enter", raise = false }
end)
