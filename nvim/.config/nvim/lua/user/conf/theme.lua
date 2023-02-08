local catppuccin = require("catppuccin")

local options = {
	flavour = "mocha"
}

catppuccin.setup(options)

vim.cmd("colorscheme catppuccin")
