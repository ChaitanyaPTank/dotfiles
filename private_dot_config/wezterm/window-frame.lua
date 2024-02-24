local wezterm = require 'wezterm'

return {
  -- The font used in the tab bar.
  -- Roboto Bold is the default; this font is bundled
  -- with wezterm.
  -- Whatever font is selected here, it will have the
  -- main font setting appended to it to pick up any
  -- fallback fonts you may have used there.
  font = wezterm.font { family = 'Inter', weight = 'Regular' },

  -- The size of the font in the tab bar.
  -- Default to 10.0 on Windows but 12.0 on other systems
  font_size = 14,

  -- The overall background color of the tab bar when
  -- the window is focused
  active_titlebar_bg = '#292c3c',

  -- The overall background color of the tab bar when
  -- the window is not focused
  inactive_titlebar_bg = '#0b0022',
}
