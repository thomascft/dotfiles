local wk = require("which-key")

local termcode = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

vim.g.mapleader = " "


local normal_bindings = {
	t = {
	name = "Terminal",
	t = { "<cmd>ToggleTerm<cr>", "Toggle Terminal" }
	},
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

wk.register(normal_bindings, { prefix = "<leader>" })