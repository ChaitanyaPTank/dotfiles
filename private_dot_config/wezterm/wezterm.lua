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
  left = '8px',
  right = '8px',
  top = '8px',
  bottom = '8px'
}

-- avoid changing window resize when you change font size
config.adjust_window_size_when_changing_font_size = false


-- key bindings
config.keys = require('key-maps')


-- config.color_scheme = 'Chalk'
-- config.color_scheme = 'OneDark (base16)'
-- config.color_scheme = 'Catppuccin Frappe'
config.color_scheme = 'Darcula (base16)'


-- allow resize by mouse
config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'


-- 1.0 line height is too much
config.line_height = 1.2


-- no audible bell
config.audible_bell = 'Disabled'


config.font = wezterm.font('Rec Mono Semicasual', { weight = 'Regular' })
-- config.font = wezterm.font('JetBrains Mono', { weight = 'Regular' })
-- config.font = wezterm.font('Maple Mono NF', { weight = 'Regular' })
-- config.font = wezterm.font('DM Mono', { weight = 'Regular' })

config.window_frame = require('window-frame')


config.font_size = 14
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
