local awful = require("awful")

awesome.connect_signal("volume::increase", function()
	awful.spawn("pamixer -i 5")
	awesome.emit_signal("volume::changed")
end)
awesome.connect_signal("volume::decrease", function()
	awful.spawn("pamixer -d 5")
	awesome.emit_signal("volume::changed")
end)

