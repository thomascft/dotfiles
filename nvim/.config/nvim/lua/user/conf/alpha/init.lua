local alpha = require("alpha")

local button = function(txt, sc, cmd)

	return {
		type = "button",
		val = txt,

		on_press = function() 
			if not cmd then
				local sc_ = vim.api.nvim_replace_termcodes(sc, true, false, true)
				vim.api.nvim_feedkeys(sc_, "normal", false)
			else 
				vim.cmd(cmd)
			end
		end,

		opts = {
			shortcut = sc,
		},
	}

end

local section = {}

section.header = {
	type = "text",
	val = {
		"Header Here."
	},
	opts = {
		hl = "DashboardHeader",
		position = "center",
	},
}

section.top_btns = {
	type = "group",
	val = {
		button("Open Dotfiles", "d", "cd ~/.dotfiles"),
		button("Quit", "q", "quit"),
		button("Open Recents", "<leader>fr")
	},
}


local config = {
	layout = {
		section.header,
		section.top_btns,
	},
}

alpha.setup(config)
