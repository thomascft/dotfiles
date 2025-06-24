return {
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	{
		"echasnovski/mini.surround",
		opts = {},
	},
	{
		"echasnovski/mini.pairs",
		opts = {},
	},
	{
		"windwp/nvim-ts-autotag",
		opts = {},
	},
	{
		"saghen/blink.cmp",
		version = "1.*",
		lazy = false,
		opts = {
			keymap = { preset = "default" },
		},
	},
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
	},
	{
		"folke/ts-comments.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		cmd = "LazyDev",
		opts = {
			library = {
				{ path = "snacks.nvim", words = { "Snacks" } },
			},
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			spec = {
				mode = { "n", "v" },
				{ "<leader>c", group = "code" },
				{ "<leader>x", group = "diagnostics" },
				{ "<leader>f", group = "find" },
				{ "<leader>s", group = "symbols" },
				{ "[", group = "prev" },
				{ "]", group = "next" },
				{ "g", group = "goto" },
				{ "sa", group = "surround" },
				{ "z", group = "fold" },
			},
		},
		keys = {
			{ "<leader>?", function() require("which-key").show({global = false}) end, desc = "Show Keymaps" },
		}
	},
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = {}
	},
	{
		"https://github.com/lewis6991/gitsigns.nvim",
		opts = {},
	},
}
