local wk = require("which-key")

vim.g.mapleader = " "

local bindings = {
    f = {
	name = "File",
	f = { "<cmd>Telescope find_files<cr>", "Find File" },
    }
}

wk.register(bindings, { prefix = "<leader>" })
