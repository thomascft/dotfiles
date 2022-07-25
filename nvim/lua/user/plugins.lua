return require("packer").startup(function()

	use { "wbthomason/packer.nvim" }
    use "lewis6991/impatient.nvim"

    -- Themes
    use {"rktjmp/lush.nvim", config = function() require("lush") end}
    use "rebelot/kanagawa.nvim"
    use "marko-cerovac/material.nvim"
    use "folke/tokyonight.nvim"
    use "tiagovla/tokyodark.nvim"

    -- Common Libraries
    use "nvim-lua/plenary.nvim"
    use "kyazdani42/nvim-web-devicons"

    -- Core Plugins
    use {"kyazdani42/nvim-tree.lua", config = function() require("user.config.plugins.nvim-tree") end}
    use "folke/which-key.nvim"
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function() require("user.config.plugins.treesitter") end}
    use {"nvim-telescope/telescope.nvim", config = function() require("user.config.plugins.telescope") end}
    use {"goolord/alpha-nvim", config = function() require("user.config.plugins.alpha") end}
    use "rcarriga/nvim-notify"
    use {"olimorris/persisted.nvim", config = function() require("user.config.plugins.persisted") end}
    use {"akinsho/bufferline.nvim", config = function() require("user.config.plugins.bufferline") end}
    use {"lukas-reineke/indent-blankline.nvim", config = function() require("user.config.plugins.indent-blankline") end}
    use {"akinsho/toggleterm.nvim", config = function() require("toggleterm").setup {} end}
	
	-- use {"kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async", config = function() require("ufo").setup {} end}

    use {"windwp/nvim-autopairs", config = function() require("user.config.plugins.autopairs") end}

    use {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
        {"hrsh7th/nvim-cmp", config = function() require("user.config.plugins.cmp") end}
    }
    -- use {"hrsh7th/nvim-cmp",config = function() require("user.config.plugins.cmp") end, }

    use {
        "neovim/nvim-lspconfig",
        {"williamboman/nvim-lsp-installer", config = function() require("user.config.plugins.lsp") end}
    }
end)


