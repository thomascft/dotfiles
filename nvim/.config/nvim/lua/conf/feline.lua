local colors = require("tokyonight.colors").setup(config)

 local tokyo_night = {
    bg = colors.bg_statusline,
    fg = colors.fg,
    yellow = colors.yellow,
    cyan = colors.cyan,
    darkblue = colors.blue0,
    green = colors.green,
    orange = colors.orange,
    violet = colors.purple,
    magenta = colors.magenta,
    blue = colors.blue,
    red = colors.red,
    light_bg = colors.bg_highlight,
    primary_blue = colors.blue5,
  }

local lsp = require "feline.providers.lsp"
local lsp_severity = vim.diagnostic.severity

require('feline').setup{
    theme = tokyo_night
}
