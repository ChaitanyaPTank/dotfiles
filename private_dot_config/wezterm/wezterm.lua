-- Pull in the wezterm API
local wezterm = require('wezterm')

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.default_prog = {
  "bash",
  "--login"
}


-- we don't want paddings
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0
}


-- avoid changing window resize when you change font size
config.adjust_window_size_when_changing_font_size = false


-- key bindings
config.keys = require('key-maps')


-- config.color_scheme = 'Chalk'
-- config.color_scheme = 'OneDark (base16)'
config.color_scheme = 'Catppuccin Frappe'


-- allow resize by mouse
config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'


-- 1.0 line height is too much
config.line_height = 1


-- no audible bell
config.audible_bell = 'Disabled'


-- config.font = wezterm.font('JetBrains Mono')
config.font = wezterm.font('Maple Mono SC NF')

config.window_frame = require('window-frame')


config.font_size = 12
config.initial_rows = 30
config.initial_cols = 100


local function toggle_tab_bar(window, _)
  local overrides = window:get_config_overrides() or {}

  if overrides.enable_tab_bar == false then
    overrides.enable_tab_bar = true
  else
    overrides.enable_tab_bar = false
  end
  window:set_config_overrides(overrides)
end


wezterm.on("toggle-tabbar", toggle_tab_bar)

config.use_fancy_tab_bar = true

config.colors = require('tab-bar')

-- and finally, return the configuration to wezterm
return config
