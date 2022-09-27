local awful = require("awful")

-- {{{ Mouse bindings
awful.mouse.append_global_mousebindings({
	awful.button({}, 3, function() mymainmenu:toggle() end),
	awful.button({}, 4, awful.tag.viewprev),
	awful.button({}, 5, awful.tag.viewnext),
})
-- }}}

-- {{{ Key bindings

-- General Awesome keys
awful.keyboard.append_global_keybindings({
	awful.key({ modkey, "Shift" }, "r", awesome.restart,
		{ description = "reload awesome", group = "awesome" }),
	awful.key({ modkey, "Shift" }, "q", awesome.quit,
		{ description = "quit awesome", group = "awesome" }),
	awful.key({ modkey }, "Return", function() awful.spawn(terminal) end,
		{ description = "open a terminal", group = "launcher" }),
	awful.key({ modkey }, "space", function() awful.spawn("rofi -show drun") end,
		{ description = "run launcher", group = "launcher" }),
	awful.key({ }, "XF86AudioRaiseVolume", function() awesome.emit_signal("volume::increase") end),
	awful.key({ }, "XF86AudioLowerVolume", function() awesome.emit_signal("volume::decrease") end),
	awful.key({ }, "XF86AudioMute", function() awful.spawn("pamixer -t") end),
	awful.key({ }, "XF86AudioPlay", function() awful.spawn("playerctl play-pause") end),
	awful.key({ }, "XF86AudioPause", function() awful.spawn("playerctl play-pause") end),
	awful.key({ }, "XF86AudioNext", function() awful.spawn("playerctl next") end),
	awful.key({ }, "XF86AudioPrev", function() awful.spawn("playerctl previous") end),
})

-- Tags related keybindings
awful.keyboard.append_global_keybindings({
	awful.key({ modkey, }, "Left", awful.tag.viewprev,
		{ description = "view previous", group = "tag" }),
	awful.key({ modkey, }, "Right", awful.tag.viewnext,
		{ description = "view next", group = "tag" }),
	awful.key({ modkey, }, "Escape", awful.tag.history.restore,
		{ description = "go back", group = "tag" }),
})

-- Focus related keybindings
awful.keyboard.append_global_keybindings({
	awful.key({ modkey, }, "Tab",
		function()
			awful.client.focus.history.previous()
			if client.focus then
				client.focus:raise()
			end
		end,
		{ description = "go back", group = "client" }),
})

-- Layout related keybindings
awful.keyboard.append_global_keybindings({
	awful.key({ modkey, "Shift" }, "right", function() awful.client.swap.byidx(1) end,
		{ description = "swap with next client by index", group = "client" }),
	awful.key({ modkey, "Shift" }, "left", function() awful.client.swap.byidx(-1) end,
		{ description = "swap with previous client by index", group = "client" }),
})


awful.keyboard.append_global_keybindings({
	awful.key {
		modifiers   = { modkey },
		keygroup    = "numrow",
		description = "only view tag",
		group       = "tag",
		on_press    = function(index)
			local screen = awful.screen.focused()
			local tag = screen.tags[index]
			if tag then
				tag:view_only()
			end
		end,
	},
	awful.key {
		modifiers   = { modkey, "Control" },
		keygroup    = "numrow",
		description = "toggle tag",
		group       = "tag",
		on_press    = function(index)
			local screen = awful.screen.focused()
			local tag = screen.tags[index]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end,
	},
	awful.key {
		modifiers   = { modkey, "Shift" },
		keygroup    = "numrow",
		description = "move focused client to tag",
		group       = "tag",
		on_press    = function(index)
			if client.focus then
				local tag = client.focus.screen.tags[index]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end,
	},
	awful.key {
		modifiers   = { modkey, "Control", "Shift" },
		keygroup    = "numrow",
		description = "toggle focused client on tag",
		group       = "tag",
		on_press    = function(index)
			if client.focus then
				local tag = client.focus.screen.tags[index]
				if tag then
					client.focus:toggle_tag(tag)
				end
			end
		end,
	},
})

client.connect_signal("request::default_mousebindings", function()
	awful.mouse.append_client_mousebindings({
		awful.button({}, 1, function(c)
			c:activate { context = "mouse_click" }
		end),
		awful.button({ modkey }, 1, function(c)
			c:activate { context = "mouse_click", action = "mouse_move" }
		end),
		awful.button({ modkey }, 3, function(c)
			c:activate { context = "mouse_click", action = "mouse_resize" }
		end),
	})
end)

client.connect_signal("request::default_keybindings", function()
	awful.keyboard.append_client_keybindings({
		awful.key({ modkey, }, "f",
			function(c)
				c.fullscreen = not c.fullscreen
				c:raise()
			end,
			{ description = "Toggle fullscreen", group = "client" }),
		awful.key({ modkey, }, "w", function(c) c:kill() end,
			{ description = "close", group = "client" }),
		awful.key({ modkey, }, "s", awful.client.floating.toggle,
			{ description = "Toggle floating", group = "client" }),
	})
end)

-- }}}
