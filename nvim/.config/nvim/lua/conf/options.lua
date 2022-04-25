vim.opt.clipboard = 'unnamedplus' -- System clipboard config
vim.opt.completeopt = {'menuone', 'noselect'} -- Autocomplete Setting
vim.opt.shiftwidth=4

vim.opt.mouse = 'a' -- Allows mouse navigation

-- UI Options
vim.opt.number = true -- Numbered lines
vim.opt.signcolumn = 'yes'
vim.opt.cursorline = true

-- Window Behavior
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.scrolloff = 8

vim.opt.iskeyword:append('-')

vim.opt.foldmethod='expr'
vim.opt.foldexpr='nvim_treesitter#foldexpr()'
