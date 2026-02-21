local wezterm = require('wezterm')
local theme = wezterm.plugin.require('https://github.com/neapsix/wezterm').main

local config = wezterm.config_builder()
config.font = wezterm.font("Source Code Pro")
config.font_size = 13

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.colors = theme.colors()
config.window_frame = theme.window_frame()

config.window_background_opacity = 0.95
config.macos_window_background_blur = 10

return config
