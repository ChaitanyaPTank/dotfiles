local wezterm = require('wezterm')
local M = {}
function M.apply_to_config(config)
  -- avoid changing window resize when you change font size
  config.adjust_window_size_when_changing_font_size = false

  config.font_dirs = { 'fonts' }

  config.font_locator = 'ConfigDirsOnly'

  config.font_size = 16

  config.line_height = 1.2

  config.font = wezterm.font_with_fallback({
    { family = "Rec Mono Linear",       weight = 'Regular' },
    { family = "Symbols Nerd Font Mono" },
    { family = 'Noto Sans Symbols 2' },
    { family = "Noto Color Emoji" }
  })
end

return M
