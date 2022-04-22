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

	-- Themes!
	use 'folke/tokyonight.nvim'
	use 'kyazdani42/nvim-web-devicons'	

	-- Ui 
	use {'kyazdani42/nvim-tree.lua', config = function() require('nvim-tree').setup() end}

	--Utilities
	use {'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup{} end}	
	use 'akinsho/toggleterm.nvim'
	use {"folke/zen-mode.nvim", config = function() require("zen-mode").setup () end}
	use 'folke/twilight.nvim'
end)
