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


-- Install Plugins
return require('packer').startup(function()
	use 'wbthomason/packer.nvim' -- Have packer update itself

	-- Auto-Complete
	use {'hrsh7th/nvim-cmp', requires = {
	--	'hrsh7th/cmp-nvim-lsp', 
		'hrsh7th/cmp-buffer', 
		'hrsh7th/cmp-path', 
		'hrsh7th/cmp-cmdline',
		'saadparwaiz1/cmp_luasnip' -- Luasnip Completion Source
		}
	}
	
	-- Themes!
	use {"catppuccin/nvim", as = "catppuccin"}
	use {'rose-pine/neovim', as = 'rose-pine',}
	use 'kyazdani42/nvim-web-devicons'	

	-- Snippets
	use 'L3MON4D3/LuaSnip'	
	use 'rafamadriz/friendly-snippets'

	-- Ui 
	use 'akinsho/bufferline.nvim'
	use 'kyazdani42/nvim-tree.lua'

	--Utilities
	use {'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup{} end}	
	use {'feline-nvim/feline.nvim', config = function() require("feline").setup(
		{components = require('catppuccin.core.integrations.feline'),})
	end}
	use 'akinsho/toggleterm.nvim' 
	use 'elkowar/yuck.vim'	
end)
