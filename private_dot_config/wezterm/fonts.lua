local wezterm = require("wezterm")
local utils = require("utils")

local M = {}

local selected_family_idx = 1

local common_family = {
  { family = "Symbols Nerd Font Mono" },
  { family = "Noto Sans Symbols 2" },
  { family = "DejaVu Sans Mono - Bront" },
}

local recursive_font_config = {
  { family = "Rec Mono Linear" },
  table.unpack(common_family)
}

local jetbrains_font_config = {
  { family = "JetBrains Mono" },
  table.unpack(common_family)
}

local input_font_config = {
  { family = "Input" },
  table.unpack(common_family)
}

local iosevka_font_config = {
  { family = "Iosevka Term" },
  table.unpack(common_family)
}

local ibm_plex_font_config = {
  { family = "IBM Plex Mono" },
  table.unpack(common_family)
}

local monaspace_neon_config = {
  { family = "Monaspace Neon Var", weight = 300 },
  table.unpack(common_family)
}

local font_map = {
  [1] = recursive_font_config,
  [2] = jetbrains_font_config,
  [3] = input_font_config,
  [4] = iosevka_font_config,
  [5] = ibm_plex_font_config,
  [6] = monaspace_neon_config,
}

local function set_line_height(id, overrides)
  if id == 2 or id == 4 or id == 5 or id == 6 then
    overrides.line_height = 1
  else
    overrides.line_height = 1.1
  end
end

wezterm.on("change-font", function(window, pane)
  window:perform_action(wezterm.action.InputSelector({
    title = "Select Font",
    choices = {
      { id = "1", label = "Recursive Mono" },
      { id = "2", label = "JetBrains Mono" },
      { id = "3", label = "Input Mono" },
      { id = "4", label = "Iosevka Term" },
      { id = "5", label = "IBM Plex Mono" },
      { id = "6", label = "Mona Space Neon" },
    },
    ---@diagnostic disable-next-line: unused-local, redefined-local
    action = wezterm.action_callback(function(window, pane, id, label)
      local overrides = window:get_config_overrides() or {}
      selected_family_idx = tonumber(id) or 1
      set_line_height(id, overrides)
      overrides.font = wezterm.font_with_fallback(font_map[id])
      window:set_config_overrides(overrides)
    end)
  }), pane)
end)


wezterm.on("next-font", function(window, pane)
  local overrides = window:get_config_overrides() or {}
  selected_family_idx = (selected_family_idx == #font_map) and 1 or (selected_family_idx + 1)
  set_line_height(selected_family_idx, overrides)
  overrides.font = wezterm.font_with_fallback(font_map[selected_family_idx])
  window:set_config_overrides(overrides)
  window:perform_action(wezterm.action.ActivateKeyTable({ name = "fonts", one_shot = false }), pane)
end)

wezterm.on("prev-font", function(window, pane)
  local overrides = window:get_config_overrides() or {}
  selected_family_idx = (selected_family_idx == 1) and (#font_map) or (selected_family_idx - 1)
  set_line_height(selected_family_idx, overrides)
  overrides.font = wezterm.font_with_fallback(font_map[selected_family_idx])
  window:set_config_overrides(overrides)
  window:perform_action(wezterm.action.ActivateKeyTable({ name = "fonts", one_shot = false }), pane)
end)

function M.apply_to_config(config)
  config.adjust_window_size_when_changing_font_size = false
  config.font_dirs = { "fonts" }
  config.font_size = utils.is_apple() and 16 or 12
  config.line_height = 1.2
  config.font = wezterm.font_with_fallback(recursive_font_config)
end

return M
