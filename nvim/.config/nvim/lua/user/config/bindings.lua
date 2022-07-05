local wk = require("which-key")

vim.g.mapleader = " "

local bindings = {
    e = {
	name = "Editor",
	e = { "<cmd>NvimTreeToggle<cr>", "Toggle NvimTree"},
    },
    f = {
	name = "File",
	f = { "<cmd>Telescope find_files<cr>", "Find File" },
	r = { "<cmd>Telescope oldfiles<cr>", "Open Recent Files" },
    },
    s = {
	name = "Session",
	s = { "<cmd>Telescope persisted<cr>", "Open Session Picker"},
	l = { "<cmd>SessionLoadLast<cr>", "Load Last Session"},
    }
}

wk.register(bindings, { prefix = "<leader>" })
