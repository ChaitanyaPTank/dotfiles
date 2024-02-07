-- Pull in the wezterm API
local wezterm = require 'wezterm'

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
config.keys = {
  {
    key = 'd',
    mods = 'ALT|SHIFT',
    action = wezterm.action.SplitVertical({ domain = 'CurrentPaneDomain' }),
  },
  {
    key = 'd',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitHorizontal({ domain = 'CurrentPaneDomain' }),
  },
  {
    key = 'F11',
    action = wezterm.action.ToggleFullScreen,
  },
  {
    key = 'r',
    mods = 'CMD|SHIFT',
    action = wezterm.action.ReloadConfiguration,
  },
  {
    key = 'w',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentTab({ confirm = false })
  },
  {
    key = 'LeftArrow',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection('Prev')
  },
  {
    key = 'RightArrow',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection('Next')
  },
  {
    key = 'Z',
    mods = 'SHIFT',
    action = wezterm.action.TogglePaneZoomState,
  },
  {
    key = 'P',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateCommandPalette,
  },
}


config.color_scheme = 'Chalk'


-- allow resize by mouse
config.window_decorations = 'RESIZE'


-- 1.0 line height is too much
config.line_height = 1


-- no audible bell
config.audible_bell = 'Disabled'


-- config.font = wezterm.font('JetBrains Mono')
config.font = wezterm.font('Maple Mono NF')


config.window_frame = {
  -- The font used in the tab bar.
  -- Roboto Bold is the default; this font is bundled
  -- with wezterm.
  -- Whatever font is selected here, it will have the
  -- main font setting appended to it to pick up any
  -- fallback fonts you may have used there.
  font = wezterm.font { family = 'Roboto', weight = 'Bold' },

  -- The size of the font in the tab bar.
  -- Default to 10.0 on Windows but 12.0 on other systems
  font_size = 14,

  -- The overall background color of the tab bar when
  -- the window is focused
  active_titlebar_bg = '#333333',

  -- The overall background color of the tab bar when
  -- the window is not focused
  inactive_titlebar_bg = '#333333',
}


config.font_size = 14


config.initial_rows = 30
config.initial_cols = 100


config.colors = {
  tab_bar = {
    -- The color of the inactive tab bar edge/divider
    inactive_tab_edge = '#575757',
  },
}

-- and finally, return the configuration to wezterm
return config
