return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			dashboard = { enabled = true },
			input = { enabled = true },
			notifier = { enabled = true },
			indent = { enabled = true },
			statuscolumn = { enabled = true },

			explorer = { enabled = true },
			picker = { enabled = true },
		},
		keys = {
			-- General
			{ "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
			{ "<leader>e", function() Snacks.explorer() end, desc = "Explorer" },
			{ "<leader>/", function () Snacks.picker.grep() end, desc = "Grep" },
			{ "<leader>h", function() Snacks.picker.help() end, desc = "Search Help"},

			-- Find
			{ "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
			{ "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
			{ "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },

			-- LSP
			{ "gd", function () Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
			{ "gD", function () Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
			{ "gr", function () Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
			{ "gI", function () Snacks.picker.lsp_implementations() end, desc = "Implementation" },
			{ "gy", function () Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
			{ "<leader>ss", function () Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
			{ "<leader>sS", function () Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },

		},
	},
	{
		"echasnovski/mini.icons",
		lazy = true,
		opts = {},
		init = function()
			package.preload["nvim-web-devicons"] = function()
				require("mini.icons").mock_nvim_web_devicons()
				return package.loaded["nvim-web-devicons"]
			end
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		init = function ()
			vim.cmd[[colorscheme tokyonight-night]]
		end
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
		opts = {
			completions = { lsp = { enabled = true } },
			code = {
				border = "thin"
			},
		}
	},
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "echasnovski/mini.icons" },
		opts = {},
	}
}
