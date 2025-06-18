vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
vim.opt.cursorline = true
vim.opt.smoothscroll = true

vim.opt.mouse = "a"
vim.opt.number = true

vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  eob = " ",
}
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		}
	}
})

-- Folding
vim.opt.foldmethod = "expr"
vim.opt.foldlevelstart = 4
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = ""
