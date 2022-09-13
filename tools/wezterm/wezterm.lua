local wezterm = require("wezterm")

return {
	font = wezterm.font_with_fallback({{family="Iosevka Semibold"}, "FreeMono"}),
	font_size = 12,
	color_scheme = "tokyodark",
	window_background_opacity = 1,
	--hide_tab_bar_if_only_one_tab = true,
	colors = {
		tab_bar = {
			active_tab = {
				bg_color = "#11121D",
				fg_color = "#A0A8CD"
			},
			inactive_tab = {
				bg_color = "#212234",
				fg_color = "#A0A8CD"
			},
			inactive_tab_hover = {
				bg_color = "#1A1B2A",
				fg_color = "#A0A8CD"
			},
			new_tab = {
				bg_color = "#212234",
				fg_color = "#A0A8CD"
			},
			new_tab_hover = {
				bg_color = "#11121D",
				fg_color = "#A0A8CD"
			},
			inactive_tab_edge = "#212234"
		}
	},
	window_frame = {
		--font = wezterm.font { family = 'Iosevka Bold' },
		font_size = 11,
		active_titlebar_bg = "#212234",
		inactive_titlebar_bg = "#212234",
	},
}
