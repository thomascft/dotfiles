local ok, treesitter = pcall (require, "treesitter")

if not ok then
	return
end

local settings = {

	highlight = { enable = true },

	ensure_installed = { "lua", "nix", "rust", "css", "yaml" },
	
	auto_install = true,
}

treesitter.setup(settings)
