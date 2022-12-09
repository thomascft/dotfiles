local wezterm = require("wezterm")

return {
	font = wezterm.font_with_fallback({"Iosevka Semibold", "Symbols Nerd Font", "FreeMono"}),
	font_size = 12,
	window_background_opacity = 1,
	hide_tab_bar_if_only_one_tab = true,
	colors = {
		foreground = '#cce9ea',
		background = '#040c16',

		cursor_bg = '#d9d7d6',
        	cursor_border = '#d9d7d6',

        	selection_fg = '#040c16',
        	selection_bg = '#cce9ea',

        	ansi = {
               		'#323949',
                	'#E6676B',
                	'#A2E4B8',
                	'#e2d06a',
               		'#92bbed',
                	'#ecc6e8',
                	'#80ffff',
                	'#cfebec',
        	},

        	brights = {
                	'#3d3e51',
               		'#FF7377',
                	'#AAF0C1',
                	'#eadd94',
                	'#bdd6f4',
                	'#f9ecf7',
                	'#b3ffff',
                	'#edf7f8',
        	},
	},
	window_frame = {
		--font = wezterm.font { family = 'Iosevka Bold' },
		font_size = 11,
		active_titlebar_bg = "#212234",
		inactive_titlebar_bg = "#212234",
	},
}
