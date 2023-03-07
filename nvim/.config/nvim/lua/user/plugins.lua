local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])



return require("packer").startup(function(use)
  	use "wbthomason/packer.nvim"

	use {
		"nvim-treesitter/nvim-treesitter",
		config = function() require("user.conf.treesitter") end,
	}

	use {
		"hrsh7th/nvim-cmp",
		requires = {
 			"L3MON4D3/LuaSnip",
 			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
		},
		config = function() require("user.conf.cmp") end,
	}

	use { "mfussenegger/nvim-lint", config = function() require("user.conf.lint") end }
	use { "windwp/nvim-autopairs", config = function() require("user.conf.autopairs") end }

	use {
		"williamboman/mason.nvim",
		requires = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function() require("user.conf.lsp") end,
	}

	use {
		"folke/which-key.nvim",
		config = function() require("user.conf.which-key") end,
	}

	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- file icons
		},
		config = function() require("user.conf.nvim-tree") end
	}
	use {
    	"feline-nvim/feline.nvim",
    	requires = {
      		"nvim-tree/nvim-web-devicons",
    	},
    	config = function() require("user.conf.feline") end,
  	}

	use {
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-telescope/telescope-symbols.nvim",
			"nvim-lua/plenary.nvim",
      		"nvim-tree/nvim-web-devicons",
		},
		config = function() require("user.conf.telescope") end,
	}

	use {
		"goolord/alpha-nvim",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function() require("user.conf.alpha") end,
	}

	use {"norcalli/nvim-colorizer.lua", config = function () require("colorizer").setup() end}

	use "folke/tokyonight.nvim"

  	if packer_bootstrap then
		require("packer").sync()
  	end
end)
