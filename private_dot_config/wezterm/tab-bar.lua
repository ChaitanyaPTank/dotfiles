-- module
local M = {}

local wezterm = require('wezterm')

local file_handler = require('json-handler')

-- tab setting is used in settings.json
local settings_file_path = wezterm.config_dir .. '/settings.json'

-- toggle function, this will toggle the value of tab_bar_enabled and
-- save settings to file
local function toggle()
  local settings = file_handler.read(settings_file_path)

  -- I personally find the ternary `x and y or z` confusing when booleans are
  -- involved, so I prefer to check the nil-ness directly
  local tab_bar_is_visible = settings.tab_bar_is_visible
  if tab_bar_is_visible == nil then
    tab_bar_is_visible = true -- This is the default
  end

  settings.tab_bar_is_visible = not tab_bar_is_visible
  file_handler.write(settings, settings_file_path)
end

M.toggle = toggle

M.enabled = file_handler.read(settings_file_path).tab_bar_is_visible

return M
