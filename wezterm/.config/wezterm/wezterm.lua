local wezterm = require("wezterm")

local colorscheme = "Catppuccin Mocha"
local colors = wezterm.color.get_builtin_schemes()[colorscheme]

local options = {
  font = wezterm.font "Victor Mono SemiBold",
  color_scheme = colorscheme,

  window_frame = {
	  font = wezterm.font { family = "Victor Mono SemiBold", style = "Italic" },
	  font_size = 11,

	  inactive_titlebar_bg = colors["tab_bar"]["inactive_tab"]["bg_color"],
	  active_titlebar_bg = colors["tab_bar"]["inactive_tab"]["bg_color"]
  },

	colors = {
		tab_bar = {
	  		background = colors["tab_bar"]["inactive_tab"]["bg_color"],
			active_tab = {
				bg_color = colors["background"],
				fg_color = colors["tab_bar"]["active_tab"]["fg_color"]
			},
			inactive_tab = {
				bg_color = colors["tab_bar"]["inactive_tab"]["bg_color"],
				fg_color = colors["tab_bar"]["active_tab"]["fg_color"]
			},
			inactive_tab_hover = {
				bg_color = colors["background"],
				fg_color = colors["tab_bar"]["active_tab"]["fg_color"]
			},
			new_tab = {
				bg_color = colors["tab_bar"]["inactive_tab"]["bg_color"],
				fg_color = colors["tab_bar"]["active_tab"]["fg_color"]
			},
			new_tab_hover = {
				bg_color = colors["background"],
				fg_color = colors["tab_bar"]["active_tab"]["fg_color"]
			}


		}
	},

  enable_tab_bar = true,
  use_fancy_tab_bar = true,
--  tab_bar_at_bottom = true,
  tab_max_width = 24,

}

-- Process icon inspiration from https://github.com/thanhvule0310/dotfiles
local get_process_icon = function(tab, process)
	local process_icons = {
		["nvim"] = {
			{ Foreground = { Color = colors["ansi"][3] } },
			{ Text = wezterm.nerdfonts.custom_vim },
		},
		["zsh"] = {
			{ Foreground = { Color = colors["ansi"][4] } },
			{ Text = wezterm.nerdfonts.dev_terminal, },
		},
		["paru"] = {
			{ Foreground = { Color = colors["ansi"][6] } },
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
