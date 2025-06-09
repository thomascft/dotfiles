return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			explorer = { enabled = true },
			indent = { enabled = true },
			input = { enabled = true },
			picker = { enabled = true },
			dashboard = { enabled = true },
		},
		keys = {
			{ "<leader>e", function() Snacks.explorer() end, desc = "Explorer" },
			{ "<leader>h", function() Snacks.picker.help() end, desc = "Search Help"},
			{ "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },

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
	}
}
