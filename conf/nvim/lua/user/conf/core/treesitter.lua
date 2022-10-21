local ok, treesitter = pcall (require, "treesitter")

if not ok then
	return
end

local settings = {
	ensure_installed = { "lua", "rust", "css", "yaml" },
	
	auto_install = true,
}

treesitter.setup(settings)
