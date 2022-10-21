local bufferline = require("bufferline")

local opts = {
    offsets = {
        {
            filetype = "NvimTree",
            text = "File Explorer ",
      		-- highlight = "Directory",
			padding = 1,
			-- separator = ""
        },
		show_close_icon = false
    }
}

bufferline.setup({options = opts})
