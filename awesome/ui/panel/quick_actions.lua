local wibox = require("wibox")

return Helpers.rounded_container({
	layout = wibox.layout.fixed.horizontal,
	{
		widget = Helpers.quick_action({
			label = "Test",
		})
	}
})
