local opts = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)

vim.g.mapleader = " "

keymap("n", "<leader>e", ":NvimTreeToggle <cr>", opts)
keymap("n", "<leader>/", ":ToggleTerm <cr>", opts)
