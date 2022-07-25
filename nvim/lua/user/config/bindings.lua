local wk = require("which-key")
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new {
  	cmd = "lazygit",
	hidden = true,
  	direction = "float", 
  	float_opts = {
		border = "double",
	},
}

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
	g = { function() lazygit:toggle() end, "Toggle lazygit"}
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
    },
	b = {
		-- f = {"<cmd>fold<cr>", "Toggle Fold"}
	}
}

local command_bindings = {
	name = "Command Mode",
	["<C-v>"] = {"<C-r>+", "Paste"},
}

local terminal_bindings = {
	name = "Terminal Mode",
	["<Esc>"] = { termcode("<C-\\><C-N>"), "   escape terminal mode" },
	["<C-V>"] = { termcode("\"+p")},
}
wk.register(normal_bindings, { prefix = "<leader>" })
wk.register(terminal_bindings, { mode = "t" })
wk.register(command_bindings, { mode = "c" })


