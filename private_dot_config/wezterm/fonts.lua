local wezterm = require('wezterm')
local utils = require('utils')

local M = {}

local common_family = {
  { family = 'Symbols Nerd Font Mono' },
  { family = 'Noto Sans Symbols 2' },
  { family = 'DejaVu Sans Mono - Bront' },
}

local recursive_font_config = {
  { family = 'Rec Mono Linear' },
  table.unpack(common_family)
}

local jetbrains_font_config = {
  { family = 'JetBrains Mono' },
  table.unpack(common_family)
}

local input_font_config = {
  { family = 'Input' },
  table.unpack(common_family)
}

local font_map = {
  ['1'] = recursive_font_config,
  ['2'] = jetbrains_font_config,
  ['3'] = input_font_config,
}

wezterm.on('change-font', function(window, pane)
  window:perform_action(wezterm.action.InputSelector({
    title = 'Select Font',
    choices = {
      { id = '1', label = 'Recursive Mono' },
      { id = '2', label = 'JetBrains Mono' },
      { id = '3', label = 'Input Mono' },
    },
    ---@diagnostic disable-next-line: unused-local, redefined-local
    action = wezterm.action_callback(function(window, pane, id, label)
      local overrides = window:get_config_overrides() or {}
      if id == '2' then
        overrides.line_height = 1.1
      else
        overrides.line_height = 1.2
      end
      overrides.font = wezterm.font_with_fallback(font_map[id])
      window:set_config_overrides(overrides)
    end)
  }), pane)
end)

function M.apply_to_config(config)
  config.adjust_window_size_when_changing_font_size = false
  config.font_dirs = { 'fonts' }
  config.font_size = utils.is_apple() and 16 or 12
  config.line_height = 1.2
  -- config.font = wezterm.font_with_fallback(recursive_font_config)
  config.font = wezterm.font_with_fallback(recursive_font_config)
end

return M
