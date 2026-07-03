local wezterm = require("wezterm")
local M = {}

local bg_image_enabled = true

local background_image = {
  {
    source = {
      File = wezterm.config_dir .. "/2023_07_10_5456.jpeg",
    },
    hsb = { brightness = 0.04 }
  }
}

function M.apply_to_config(config)
  config.background = background_image

  local function toogle_background_image(window)
    bg_image_enabled = not bg_image_enabled
    local bg = bg_image_enabled and background_image or {}
    local overrides = window:get_config_overrides() or {}
    overrides.background = bg
    window:set_config_overrides(overrides)
  end

  wezterm.on("toggle-bg-image", toogle_background_image)
end

return M
