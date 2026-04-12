-- Pull in the wezterm API
local wezterm = require('wezterm')

-- This table will hold the configuration.
local config = {}

config.term = "wezterm"

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

if wezterm.target_triple:find("window") then
  config.default_prog = {
    "bash",
    "--login"
  }
else
  config.default_prog = {
    "zsh",
    "--login"
  }
end

-- config.webgpu_preferred_adapter = wezterm.gui.enumerate_gpus()[1]
config.front_end = "WebGpu"

-- we don't want paddings
config.window_padding = {
  left = '8px',
  right = '8px',
  top = '8px',
  bottom = '8px'
}

-- avoid changing window resize when you change font size
config.adjust_window_size_when_changing_font_size = false


-- key bindings
config.keys = require('key-maps')


-- config.color_scheme = 'Chalk'
-- config.color_scheme = 'OneDark (base16)'
-- config.color_scheme = 'Catppuccin Frappe'
config.color_scheme = 'Darcula (base16)'


-- allow resize by mouse
config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'


-- 1.0 line height is too much
config.line_height = 1.2


-- no audible bell
config.audible_bell = 'Disabled'


config.font = wezterm.font_with_fallback({
  { family = "Rec Mono Linear", weight = 'Regular' },
})
-- config.font = wezterm.font('JetBrains Mono', { weight = 'Regular' })
-- config.font = wezterm.font('Maple Mono NF', { weight = 'Regular' })
-- config.font = wezterm.font('DM Mono', { weight = 'Regular' })

-- config.window_frame = require('window-frame')


config.font_size = 16
config.initial_rows = 24
config.initial_cols = 100


local function toggle_tab_bar(window, _)
  local overrides = window:get_config_overrides() or {}

  if overrides.enable_tab_bar == false then
    overrides.enable_tab_bar = true
  else
    overrides.enable_tab_bar = false
  end
  window:set_config_overrides(overrides)
end


wezterm.on("toggle-tabbar", toggle_tab_bar)

config.use_fancy_tab_bar = false

config.tab_bar_at_bottom = true

config.colors = require('tab-bar')

config.background = {
  {
    source = {
      File = wezterm.config_dir .. "/2023_07_10_5456.jpeg",
    },
    hsb = { brightness = 0.04 }
  }
}

config.tab_max_width = 24

local SOLID_LEFT_ARROW = ""
local SOLID_RIGHT_ARROW = "" .. " "

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
local function tab_title(tab_info)
  local pane = tab_info.active_pane
  local cwd = pane.current_working_dir


  local title = tab_info.tab_title

  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end

  if cwd then
    local dir = string.match(cwd.path, "([^/\\]+)$")
    return dir
  end

  return tab_info.active_pane.title
end

wezterm.on('update-status', function(window, pane)
  local background = '#FBB829'
  local foreground = '#2C1B19'
  local pre = SOLID_RIGHT_ARROW .. ' '
  local cwd = pane:get_current_working_dir()
  if cwd then
    window:set_right_status(
      wezterm.format({
        { Background = { Color = background } },
        { Foreground = { Color = foreground } },
        { Text = pre .. cwd.path .. ' ' }

      })
    )
  end
end)

---@diagnostic disable-next-line: unused-local, redefined-local
wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local edge_background = "#121212"
  local background = "#4E4E4E"
  local foreground = "#1C1B19"
  local dim_foreground = "#3A3A3A"

  if tab.is_active then
    background = '#FBB829'
    foreground = '#2C1B19'
  elseif hover then
    background = "#FF8700"
    foreground = "#1C1B19"
  end

  local edge_foreground = background

  local title = tab_title(tab)

  -- ensure that the titles fit in the available space,
  -- and that we have room for the edges.
  if #title > (max_width - 4) then
    title = " " .. wezterm.truncate_right(title, max_width - 6) .. ".. "
  else
    title = " " .. wezterm.truncate_right(title, max_width - 2) .. " "
  end

  return wezterm.format({
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_LEFT_ARROW },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },
    { Foreground = { Color = dim_foreground } },
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_RIGHT_ARROW },
  })
end)


-- and finally, return the configuration to wezterm
return config
