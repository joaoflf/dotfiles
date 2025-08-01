local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "rose-pine"
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
config.font_size = 13.0
config.hide_tab_bar_if_only_one_tab = true
config.colors = {

	selection_fg = "#000000",
	selection_bg = "#FFFFFF",
}

config.quick_select_patterns = {
	-- Git commit hashes
	"[0-9a-f]{7,40}",

	-- URLs with various protocols
	"https?://\\S+",

	-- File paths
	"[\\w\\.\\-/]+\\.[\\w\\-]+",

	-- IP addresses
	"\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}",

	-- Docker container IDs
	"[0-9a-f]{12}",
}

return config
