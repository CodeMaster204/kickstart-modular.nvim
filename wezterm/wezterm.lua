-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 12
config.harfbuzz_features = { "calt", "clig", "liga=1" } -- Enable ligatures
config.color_scheme = "Breath Silverfox (Gogh)"

function alt_switcher(n)
	return {
		key = n,
		mods = "ALT",
		action = wezterm.action.ActivateTab(tonumber(n) - 1),
	}
end

config.keys = {
	-- Turn off the default CMD-m Hide action, allowing CMD-m to
	-- be potentially recognized and handled by the tab
	{
		key = "K",
		mods = "CTRL|SHIFT",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "L",
		mods = "CTRL|SHIFT",
		action = wezterm.action.DisableDefaultAssignment,
	},
	alt_switcher("1"),
	alt_switcher("2"),
	alt_switcher("3"),
	alt_switcher("4"),
	alt_switcher("5"),
	alt_switcher("6"),
	alt_switcher("7"),
	alt_switcher("8"),
	alt_switcher("9"),
}

-- Finally, return the configuration to wezterm:
return config
