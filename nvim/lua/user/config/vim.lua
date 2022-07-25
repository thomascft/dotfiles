vim.opt.number = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.wrap = false
vim.notify = require("notify")

vim.opt.foldmethod= "expr"
vim.opt.foldexpr= "nvim_treesitter#foldexpr()"

--Completion
vim.opt.completeopt="menu,menuone,noselect"

-- Neovide
vim.g.neovide_cursor_vfx_mode = "railgun"
