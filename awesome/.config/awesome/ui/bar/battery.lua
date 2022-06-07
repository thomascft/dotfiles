local wibox = require("wibox")
local beautiful = require("beautiful")
local lain = require("modules.lain")

local bat = lain.widget.bat({
    settings = function ()
	bat_header = " BAT "
	widget:set_markup("BAT " .. bat_now.perc)
    end
})

local _M = {}

_M.init = function() 
    return wibox.container.margin {
	margins = 5,
	widget = bat.widget
    }

end
return _M
