local wezterm = require('wezterm')
local M = {}

local common_family = {
  { family = "Symbols Nerd Font Mono" },
  { family = 'Noto Sans Symbols 2' },
  { family = 'DejaVu Sans Mono - Bront' },
}

local recursive_font_config = {
  { family = "Rec Mono Linear" },
  table.unpack(common_family)
}

local jetbrains_font_config = {
  { family = 'JetBrains Mono' },
  table.unpack(common_family)
}

wezterm.on('change-font', function(window, _)
  local current_font = window:effective_config().font
  local overrides = window:get_config_overrides()
  for _, cfg in ipairs(current_font.font) do
    local rec_mono = cfg.family:find('Rec Mono Linear')
    if rec_mono then
      overrides.font = wezterm.font_with_fallback(jetbrains_font_config)
      overrides.line_height = 1
      break
    else
      overrides.font = wezterm.font_with_fallback(recursive_font_config)
      overrides.line_height = 1.2
      break
    end
  end
  window:set_config_overrides(overrides)
end)

function M.apply_to_config(config)
  config.adjust_window_size_when_changing_font_size = false
  config.font_dirs = { 'fonts' }
  config.font_size = 16
  config.line_height = 1.2
  config.font = wezterm.font_with_fallback(recursive_font_config)
end

return M
