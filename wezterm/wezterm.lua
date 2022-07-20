local wezterm = require("wezterm")

return {
	font = wezterm.font_with_fallback({{family="Victor Mono", weight="Medium"}, "FreeMono"}),
	font_size = 13,
	color_scheme = "OceanicMaterial"
}
