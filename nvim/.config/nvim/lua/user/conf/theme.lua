local tokyonight = require("tokyonight")

local options = {
	style = "night"
}

tokyonight.setup(options)

vim.cmd("colorscheme tokyonight")
