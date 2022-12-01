local ok, packer = pcall(require, "packer")

if not ok then
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false

end

local plugins = { {
	-- Packer will update itself
	{ "wbthomason/packer.nvim" },

	-- Core Plugins
	{
		{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
		{
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "jose-elias-alvarez/null-ls.nvim" }
		},
		{
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "L3MON4D3/LuaSnip", requires = "rafamadriz/friendly-snippets" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/nvim-cmp" },
		},
		{ "folke/which-key.nvim" },
	},
	-- Ui
	{
		-- Themes
		{ "folke/tokyonight.nvim" },
		{ "~/Projects/horizon.nvim" },
		{ "tiagovla/tokyodark.nvim" },
		{ "catppuccin/nvim", as = "catppuccin" },
		-- Other Stuff
		{ "kyazdani42/nvim-web-devicons" },
		{ "nvim-telescope/telescope-symbols.nvim" },
		{ "kyazdani42/nvim-tree.lua" },
		{ "akinsho/bufferline.nvim" },
		{ "akinsho/toggleterm.nvim" },
		{ "nvim-lualine/lualine.nvim" },
		-- { "feline-nvim/feline.nvim" },
		{ "lewis6991/gitsigns.nvim" },
		{ "lukas-reineke/indent-blankline.nvim" },
		{ "norcalli/nvim-colorizer.lua", config = function() require("colorizer").setup{} end },
	},
	-- Extra
	{
		{ "nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim" },
		{ "olimorris/persisted.nvim" },
		{ "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end },
		{ "numToStr/Comment.nvim" }
	}
} }


packer.startup(plugins)
