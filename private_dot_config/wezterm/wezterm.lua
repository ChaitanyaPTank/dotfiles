-- Pull in the wezterm API
local wezterm = require('wezterm')
local config = wezterm.config_builder()
local utils = require('utils')

config.term = "wezterm"

if utils.is_apple() or utils.is_linux() then
  config.default_prog = { "zsh", "--login" }
else
  config.default_prog = { "bash", "--login" }
end

config.front_end = "WebGpu"

config.window_padding = {
  left = '8px',
  right = '8px',
  top = '8px',
  bottom = '8px'
}

-- no audible bell
config.audible_bell = 'Disabled'
config.initial_rows = 24
config.initial_cols = 100

config.color_scheme = 'Catppuccin Frappe'

-- allow resize by mouse
config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'

require('fonts').apply_to_config(config)
require('tab-bar').apply_to_config(config)
require('key-maps').apply_to_config(config)
require('background').apply_to_config(config)

config.native_macos_fullscreen_mode = true

-- and finally, return the configuration to wezterm
return config
