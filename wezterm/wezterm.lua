local wezterm = require("wezterm")
local act = wezterm.action
local mod = "CTRL|SHIFT"
local config = {}

config.color_scheme = "nordfox"
config.scrollback_lines = 10000
config.font_size = 10
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.show_tab_index_in_tab_bar = false

config.default_prog = { "wsl", "-d", "Ubuntu-22.04", "--cd", "~" }
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
	{ mods = "LEADER", key = "n", action = act.ActivatePaneDirection("Up") },
	{ mods = "LEADER", key = "t", action = act.ActivatePaneDirection("Down") },
	{ mods = "LEADER", key = "r", action = act.ActivatePaneDirection("Right") },
	{ mods = "LEADER", key = "d", action = act.ActivatePaneDirection("Left") },
	{ mods = "LEADER", key = "c", action = act.SpawnTab("CurrentPaneDomain") },
	{ mods = "LEADER", key = "|", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ mods = "LEADER", key = "-", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ mods = "LEADER", key = "z", action = act.TogglePaneZoomState },
	{ mods = mod, key = "r", action = act({ ActivateTabRelative = 1 }) },
	{ mods = mod, key = "d", action = act({ ActivateTabRelative = -1 }) },
	{ mods = "LEADER", key = "f", action = act.ToggleFullScreen },
}

return config
