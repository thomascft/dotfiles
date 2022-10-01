local bufferline = require("bufferline")

local opts = {
    offsets = {
        {
            filetype = "NvimTree",
            text = "File Explorer",
			separator = true
        }
    }
}

bufferline.setup({options = opts})
