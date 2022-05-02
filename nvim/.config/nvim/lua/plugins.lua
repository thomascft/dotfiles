-- Automatically install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end
-- Auto-Reload nvim plugins.lua
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install Plugins
return require('packer').startup(function()
	use 'wbthomason/packer.nvim' -- Have packer update itself

	-- Themes!
	use 'folke/tokyonight.nvim'
	use 'kyazdani42/nvim-web-devicons'	

	-- Ui
	use 'kyazdani42/nvim-tree.lua'
	use {"ahmedkhalf/project.nvim", config = function() require("project_nvim").setup{show_hidden = true,} require('telescope').load_extension('projects') end}
	use {'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} }
}

	--Syntax
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'

	use 'L3MON4D3/LuaSnip'
	use 'rafamadriz/friendly-snippets'
	use 'saadparwaiz1/cmp_luasnip'

	--Utilities
	use {'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup{} end}
	use 'windwp/nvim-ts-autotag'
	use 'akinsho/toggleterm.nvim'
	use {"folke/zen-mode.nvim", config = function() require("zen-mode").setup () end}
	use 'folke/twilight.nvim'
	use {'lewis6991/gitsigns.nvim', config = function() require('gitsigns').setup() end}
end)
