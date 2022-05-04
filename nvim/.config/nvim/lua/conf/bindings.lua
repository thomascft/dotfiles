local opts = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)

vim.g.mapleader = " "

keymap("n", "<leader>e", ":NvimTreeToggle <cr>", opts)
keymap("n", "<leader>/", ":ToggleTerm <cr>", opts)

--Sessions
keymap("n", "<leader>sl", [[<cmd>lua require("persistence").load({ last = true })<cr>]], opts)
keymap("n", "<leader>sp", ":Telescope projects <cr>", opts)
