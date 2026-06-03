local wezterm = require('wezterm')

local M = {}

local colors = {
  BG = "#1A1A1A",
  FG = "#808080",
  FG_ACTIVE = '#2C1B19',
  BG_ACTIVE = "#FBB829",
  FG_INACTIVE = "#1C1B19",
  BG_INACTIVE = "#4E4E4E",
  BG_HOVER = "#FF8700",
  FG_HOVER = "#1C1B19",
}

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
    local dir = string.match(cwd.path, "([^/\\]+)[/\\]*$")
    return dir
  end
  return tab_info.active_pane.title
end

---@diagnostic disable-next-line: unused-local, redefined-local
wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local edge_background = colors.BG
  local background = colors.BG_INACTIVE
  local foreground = colors.FG_INACTIVE
  local dim_foreground = "#3A3A3A"

  if tab.is_active then
    background = colors.BG_ACTIVE
    foreground = colors.FG_ACTIVE
  elseif hover then
    background = colors.BG_HOVER
    foreground = colors.FG_HOVER
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

local function toggle_tab_bar(window, _)
  local overrides = window:get_config_overrides() or {}

  if overrides.enable_tab_bar == false then
    overrides.enable_tab_bar = true
  else
    overrides.enable_tab_bar = false
  end
  window:set_config_overrides(overrides)
end

wezterm.on('update-status', function(window, pane)
  local background = '#FBB829'
  local foreground = '#1A1A1A'
  local pre = SOLID_RIGHT_ARROW
  local panes = window:active_tab():panes()
  -- if pane is still in mux then only try to setup status
  for p in ipairs(panes) do
    if p == pane.pane_id then
      local cwd = pane:get_current_working_dir()
      if cwd then
        window:set_right_status(
          wezterm.format({
            { Background = { Color = background } },
            { Foreground = { Color = foreground } },
            { Text = pre .. window:active_workspace() .. ' ' }
          })
        )
      end
    end
  end
end)

wezterm.on("toggle-tabbar", toggle_tab_bar)

function M.apply_to_config(config)
  config.use_fancy_tab_bar = false
  config.tab_bar_at_bottom = true
  config.tab_max_width = 24
  config.colors = {
    tab_bar = {
      -- The color of the strip that goes along the top of the window
      -- (does not apply when fancy tab bar is in use)
      background = colors.BG,
      active_tab = {
        bg_color = colors.BG_ACTIVE,
        fg_color = colors.FG_ACTIVE,
        intensity = 'Bold',
        underline = 'None',
        italic = false,
        strikethrough = false,
      },
      inactive_tab = {
        bg_color = colors.BG,
        fg_color = colors.FG,
        underline = 'None',
      },
      inactive_tab_hover = {
        bg_color = colors.BG_ACTIVE,
        fg_color = colors.FG_ACTIVE,
        italic = true,
      },
      new_tab = {
        bg_color = colors.BG,
        fg_color = colors.FG_ACTIVE,
      },
      new_tab_hover = {
        bg_color = colors.BG_ACTIVE,
        fg_color = colors.FG_ACTIVE,
      },
    }
  }
end

return M
