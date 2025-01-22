local wezterm = require 'wezterm'

local BG_COLOR = "#3A3A3A"
local BG_COLOR_ACTIVE = "#38393B"

return {
  -- The font used in the tab bar.
  -- Roboto Bold is the default; this font is bundled
  -- with wezterm.
  -- Whatever font is selected here, it will have the
  -- main font setting appended to it to pick up any
  -- fallback fonts you may have used there.
  font = wezterm.font { family = 'Inter', weight = 'Regular' },

  -- The size of the font in the tab bar.
  font_size = 16,

  -- The overall background color of the tab bar when
  -- the window is focused
  active_titlebar_bg = BG_COLOR,

  -- The overall background color of the tab bar when
  -- the window is not focused
  inactive_titlebar_bg = BG_COLOR_ACTIVE,
}
