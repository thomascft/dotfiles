local ok, telescope = pcall (require, "telescope")

if not ok then
	return
end

local settings = {

}

telescope.setup(settings)