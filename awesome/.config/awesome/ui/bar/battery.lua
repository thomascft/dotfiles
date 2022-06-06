local wibox = require("wibox")
local beautiful = require("beautiful")
local vicious = require("modules.vicious")

local _M = {}

_M.init = function() 
    return wibox.container.margin {
	margins = 5,
	widget = vicious.widgets.bat()
    }

end
return _M
