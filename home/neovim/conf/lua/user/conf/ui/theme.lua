vim.opt.guifont = "Victor Mono:h10"
vim.opt.termguicolors = true

require("tokyonight").setup {
	style = "night",
	transparent = true,
}

vim.cmd("colorscheme tokyonight")
