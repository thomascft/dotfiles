local _M = {}

_M.plug = function(name)
    local ok, module = pcall(require, name)
    if not ok then
	vim.notify("The plugin " .. name .. " failed to start.")
	return
    else
	return module
    end
end

return _M
