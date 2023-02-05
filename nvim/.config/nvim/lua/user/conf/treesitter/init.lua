local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
	ensure_installed = { "lua", "c", "rust" },
	highlight = {enable = true}
})
