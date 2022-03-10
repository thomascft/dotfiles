local awful = require("awful")
modkey = "Mod4"
altkey = "Mod1"

-- Media Keys
awful.keyboard.append_global_keybindings({
    awful.key({ }, "XF86AudioPlay", function () awful.spawn("playerctl play-pause") end),
    awful.key({ }, "XF86AudioNext", function () awful.spawn("playerctl next") end),
    awful.key({ }, "XF86AudioPrev", function () awful.spawn("playerctl previous") end),
    awful.key({ }, "XF86AudioRaiseVolume", function () awful.spawn("pamixer -i 5") end),
    awful.key({ }, "XF86AudioLowerVolume", function () awful.spawn("pamixer -d 5") end),
    awful.key({ }, "XF86AudioMute", function () awful.spawn("pamixer -t") end),

}
)

awful.keyboard.append_global_keybindings({
    awful.key({}, "XF86MonBrightnessUp", function () awful.spawn("brightnessctl set +5%") end),
    awful.key({}, "XF86MonBrightnessDown", function () awful.spawn("brightnessctl set 5%-") end),
    awful.key({}, "Print", function () awful.spawn("maim ~/Pictures/screenshots/$(date +%s).png | xclip -selection clipboard -t $(date +%s).png") end),
    awful.key({"Control"}, "Print", function () awful.spawn("maim -s ~/Pictures/screenshots/$(date +%s).png | xclip -selection clipboard -t $(date +%s).png") end),
})

awful.mouse.append_global_mousebindings({
    -- awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewprev),
    awful.button({ }, 5, awful.tag.viewnext),
})
-- General Awesome keys
awful.keyboard.append_global_keybindings({
    awful.key({ modkey, "Shift" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey },            "space",     function () awful.spawn("rofi -show run") end,
              {description = "run launcher", group = "launcher"}),
})
-- Tags related keybindings
awful.keyboard.append_global_keybindings({
    awful.key({ modkey,           }, "[",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "]",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),
})
-- Focus related keybindings
awful.keyboard.append_global_keybindings({
    awful.key({ modkey,           }, "Right", function () awful.client.focus.byidx( 1) end,
        {description = "focus next by index", group = "client"}),
    awful.key({ modkey,           }, "Left", function () awful.client.focus.byidx(-1) end,
        {description = "focus previous by index", group = "client"}),
    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:activate { raise = true, context = "key.unminimize" }
                  end
              end,
              {description = "restore minimized", group = "client"}),
})
-- Layout related keybindings
awful.keyboard.append_global_keybindings({
    awful.key({ modkey, "Shift"   }, "Right", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "Left", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
})
awful.keyboard.append_global_keybindings({
    awful.key {
        modifiers   = { modkey },
        keygroup    = "numrow",
        description = "only view tag",
        group       = "tag",
        on_press    = function (index)
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
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end,
    },
    awful.key {
        modifiers = { modkey, "Shift" },
        keygroup    = "numrow",
        description = "move focused client to tag",
        group       = "tag",
        on_press    = function (index)
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
        on_press    = function (index)
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
        awful.button({ }, 1, function (c) c:activate { context = "mouse_click" } end),
        awful.button({ modkey }, 1, function (c) c:activate { context = "mouse_click", action = "mouse_move"  } end),
        awful.button({ modkey }, 3, function (c) c:activate { context = "mouse_click", action = "mouse_resize"} end),
    })
end)

client.connect_signal("request::default_keybindings", function()
    awful.keyboard.append_client_keybindings({
        awful.key({ modkey,           }, "f",
            function (c)
                c.fullscreen = not c.fullscreen
                c:raise()
            end,
            {description = "toggle fullscreen", group = "client"}),
        awful.key({ modkey,           }, "w",      function (c) c:kill()                         end,
                {description = "close", group = "client"}),
        awful.key({ modkey,   "Shift" }, "w", function (c)
            if c.pid then awful.spawn("kill -9 " .. c.pid) end end),
        awful.key({ modkey,           }, "s",  awful.client.floating.toggle                     ,
                {description = "toggle floating", group = "client"}),
        awful.key({ modkey, "Shift" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
                {description = "move to master", group = "client"}),
        awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
                {description = "toggle keep on top", group = "client"}),
        awful.key({ modkey,           }, "n", function (c) c.minimized = true end ,
            {description = "minimize", group = "client"}),
    })
end)