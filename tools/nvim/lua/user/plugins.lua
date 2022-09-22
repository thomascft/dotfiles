local ok, packer = pcall(require, "packer")

if not ok then
	return
end

local plugins = {{
	-- Packer will update itself
	{"wbthomason/packer.nvim"},

	-- Core Plugins
	{
		{"nvim-treesitter/nvim-treesitter", run = ":TSInstall"},
		{
			{"neovim/nvim-lspconfig"},
			{"williamboman/mason.nvim"},
			{"williamboman/mason-lspconfig.nvim"},
			{"jose-elias-alvarez/null-ls.nvim"}
		},
		{
			{"hrsh7th/cmp-nvim-lsp"},
			{"hrsh7th/cmp-buffer"},
			{"hrsh7th/cmp-path"},
			{"hrsh7th/cmp-cmdline"},
			{"L3MON4D3/LuaSnip", requires = "rafamadriz/friendly-snippets"},
			{"saadparwaiz1/cmp_luasnip"},
			{"hrsh7th/nvim-cmp"},
		},
		{"folke/which-key.nvim"},
	},
	-- Ui
	{	-- Themes
		{"tiagovla/tokyodark.nvim"},
		{"kyazdani42/nvim-tree.lua"},
		{"akinsho/bufferline.nvim"},
		{"akinsho/toggleterm.nvim"},
	},
	-- Extra
	{
		{"nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim"},
		{"olimorris/persisted.nvim"},
		{"windwp/nvim-autopairs", config = function () require("nvim-autopairs").setup {} end},
		{"numToStr/Comment.nvim"}
	}
}}


packer.startup(plugins)
