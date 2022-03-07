local awful = require("awful")
local autoStartList = {"pipewire", "pipewire-pulse", "wireplumber", "picom"}

-- for i = 1, 4 do
-- awful.util.spawn(autoStartList[i])
-- end

for i,v in ipairs(autoStartList) do 
    awful.spawn.once(v)
end
