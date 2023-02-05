local wezterm = require("wezterm")

local colors = {
	bg = "#1a1b26",
	bg_dark = "#16161e",
  	bg_highlight = "#292e42",
  	terminal_black = "#414868",
  	fg = "#c0caf5",
  	fg_dark = "#a9b1d6",
 	fg_gutter = "#3b4261",
  	dark3 = "#545c7e",
  	comment = "#565f89",
  	dark5 = "#737aa2",
  	blue0 = "#3d59a1",
  	blue = "#7aa2f7",
 	cyan = "#7dcfff",
  	blue1 = "#2ac3de",
  	blue2 = "#0db9d7",
	blue5 = "#89ddff",
	blue6 = "#b4f9f8",
	blue7 = "#394b70",
	magenta = "#bb9af7",
	magenta2 = "#ff007c",
	purple = "#9d7cd8",
	orange = "#ff9e64",
	yellow = "#e0af68",
	green = "#9ece6a",
	green1 = "#73daca",
	green2 = "#41a6b5",
	teal = "#1abc9c",
	red = "#f7768e",
	red1 = "#db4b4b",
	git = { change = "#6183bb", add = "#449dab", delete = "#914c54" },
	gitSigns = {
		add = "#266d6a",
    	change = "#536c9e",
    	delete = "#b2555b",
	},

}


local options = {
  font = wezterm.font "Victor Mono SemiBold",
  color_scheme = "tokyonight_night",

  enable_tab_bar = true,
  use_fancy_tab_bar = true,
  tab_bar_at_bottom = true,
  tab_max_width = 24,

  	window_frame = {
		active_titlebar_bg = colors.bg,
		inactive_titlebar_bg = colors.bg_dark,

	},
	colors = {tab_bar = {
		background = colors.bg,
		active_tab = {
			bg_color = colors.bg,
			fg_color = colors.fg
		},
		inactive_tab = {
			bg_color = colors.bg_dark,
			fg_color = colors.comment,
		},
		inactive_tab_hover = {
			bg_color = colors.bg_dark,
			fg_color = colors.fg,
		},
		new_tab = {
			bg_color = colors.bg_dark,
			fg_color = colors.comment,
		},
		new_tab_hover = {
			bg_color = colors.bg,
			fg_color = colors.fg,
		},
	}} 
}

-- Process icon inspiration from https://github.com/thanhvule0310/dotfiles
local get_process_icon = function(tab, process) 
	local process_icons = {
		["nvim"] = {
			{ Foreground = { Color = colors.green } },
			{ Text = wezterm.nerdfonts.custom_vim },
		},
		["zsh"] = {
			{ Foreground = { Color = colors.blue } },
			{ Text = wezterm.nerdfonts.dev_terminal, },
		},
		["paru"] = {
			{ Foreground = { Color = colors.magenta } },
			{ Text = wezterm.nerdfonts.mdi_package_variant_closed, },
		},
	}

	local process = string.gsub(tab.active_pane.foreground_process_name, '(.*[/\\])(.*)', '%2')
	return wezterm.format(process_icons[process] or {{Text = process}})
end

local function get_current_working_dir(tab)
	local cwd = string.gsub(tab.active_pane.current_working_dir, ".*/([%w.]+)/", "%1")
	local HOME_DIR = string.gsub(os.getenv("HOME"), "/%w+/(%w+)", "%1")

	return cwd == HOME_DIR and "   ~ "
		or string.format("   %s ", cwd)
end

wezterm.on("format-tab-title", function(tab)

	return wezterm.format({
		{ Attribute = { Intensity = "Half" } },
		{ Text = string.format(" %s ", tab.tab_index + 1) },
		"ResetAttributes",
		{ Text = get_process_icon(tab) },
		{ Text = " " },
		{ Text = get_current_working_dir(tab) },
		{ Text = " " },
	})	
end)

return options
