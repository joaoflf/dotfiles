local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "Snazzy"
config.window_background_opacity = 0.9
config.font = wezterm.font_with_fallback({
	{
		family = "JetBrains Mono",
		weight = "Medium",
		harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	},
	{ family = "Terminus", weight = "Bold" },
	"Noto Color Emoji",
})
config.font_size = 12.0
config.hide_tab_bar_if_only_one_tab = true

return config
