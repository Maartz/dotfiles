local wezterm = require("wezterm")
require("utils")

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Rosé Pine Moon"
	else
		return "Rosé Pine Dawn"
	end
end

local function bg_opacity(appearance)
	if appearance:find("Dark") then
		return 0.6
	else
		return 0.3
	end
end

return {
	font = wezterm.font("JetBrains Mono"),
	font_size = 16,
	color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),
	window_background_opacity = bg_opacity(wezterm.gui.get_appearance()),
	window_decorations = "RESIZE",
	hide_tab_bar_if_only_one_tab = true,
	macos_window_background_blur = 69,
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	keys = {
		{
			key = "|",
			mods = "CMD|SHIFT",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "_",
			mods = "CMD|SHIFT",
			action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{ key = "l", mods = "ALT", action = wezterm.action.ShowLauncher },
		{ key = "w", mods = "CMD", action = wezterm.action({ CloseCurrentPane = { confirm = false } }) },
		{ key = "w", mods = "CMD|SHIFT", action = wezterm.action({ CloseCurrentTab = { confirm = true } }) },
	},
	launch_menu = {
		{},
	},
}
