local wezterm = require("wezterm")
local M = {}

local bg_image_enabled = true
local images = {}

local image_dir = wezterm.config_dir .. "/images/*.{jpg,jpeg,png,webp}"

local function get_base_image_config(image)
  return {
    {
      source = { File = image },
      hsb = { brightness = 0.04 }
    }
  }
end

local current_image = 1

local function set_bg_overrides(window)
  local bg = bg_image_enabled and images[current_image] or {}
  local overrides = window:get_config_overrides() or {}
  overrides.background = bg
  window:set_config_overrides(overrides)
end

local function toogle_background_image(window)
  bg_image_enabled = not bg_image_enabled
  set_bg_overrides(window)
end


local function next_image(window, pane)
  current_image = (current_image) == #images and 1 or (current_image + 1)
  if bg_image_enabled then
    set_bg_overrides(window)
  end
  window:perform_action(
    wezterm.action.ActivateKeyTable({
      name = "background",
      one_shot = false,
    }),
    pane
  )
end

local function prev_image(window, pane)
  current_image = (current_image) == 1 and #images or (current_image - 1)
  if bg_image_enabled then
    set_bg_overrides(window)
  end
  window:perform_action(
    wezterm.action.ActivateKeyTable({
      name = "background",
      one_shot = false,
    }),
    pane
  )
end

local function inc_brightness(window, pane)
  if not bg_image_enabled then
    return
  end
  local overrides  = window:get_config_overrides() or {}
  local brightness = overrides["background"][1]["hsb"]["brightness"]
  brightness       = brightness + 0.02
  if brightness >= 1 then
    brightness = 1
  end
  overrides["background"][1]["hsb"]["brightness"] = brightness
  window:set_config_overrides(overrides)
  window:perform_action(
    wezterm.action.ActivateKeyTable({
      name = "background",
      one_shot = false,
    }),
    pane
  )
end

local function dec_brightness(window, pane)
  wezterm.log_info("dec_brightness")
  if not bg_image_enabled then
    return
  end
  local overrides  = window:get_config_overrides() or {}
  local brightness = overrides["background"][1]["hsb"]["brightness"]
  brightness       = brightness - 0.02
  if brightness <= 0 then
    brightness = 0
  end
  overrides["background"][1]["hsb"]["brightness"] = brightness
  window:set_config_overrides(overrides)
  window:perform_action(
    wezterm.action.ActivateKeyTable({
      name = "background",
      one_shot = false,
    }),
    pane
  )
end

function M.apply_to_config(config)
  local success, files = pcall(wezterm.glob, image_dir)
  if success then
    for _, file_path in ipairs(files) do
      table.insert(images, file_path)
    end
    table.sort(images, function(a, b) return a < b end)
    for _, path in ipairs(images) do
      images[_] = get_base_image_config(path)
    end
    config.background = images[current_image]
  end
  wezterm.on("toggle-bg-image", toogle_background_image)
  wezterm.on("next-image", next_image)
  wezterm.on("prev-image", prev_image)
  wezterm.on("inc-brightness", inc_brightness)
  wezterm.on("dec-brightness", dec_brightness)
end

return M
