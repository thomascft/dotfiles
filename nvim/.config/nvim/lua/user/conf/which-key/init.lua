local wk = require("which-key")

vim.g.mapleader = " "

local binds = {
	f = {
		name = "File",
		f = { "<cmd>Telescope find_files<cr>", "Find File" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recents" },
	},
	e = { "<cmd>NvimTreeToggle<cr>", "Toggle File Tree" },
	
}

wk.register(binds, { prefix = "<leader>", mode = "n" })
