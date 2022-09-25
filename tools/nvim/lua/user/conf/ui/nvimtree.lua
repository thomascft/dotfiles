local nvim_tree = require("nvim-tree")

local options = {
	view = {
		side = "left",
		signcolumn = "yes",
	},
	renderer = {
		group_empty = false,
		root_folder_modifier = ":~",
		indent_width = 2,
		icons = {
			webdev_colors = true,
			padding = "  ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = false,
			},
		},
	},
}

nvim_tree.setup(options)
