local wezterm = require 'wezterm'

local M = {}

function M.apply_to_config(config)
  config.leader = { key = 'a', mods = 'ALT', timeout_milliseconds = 1000 }
  config.keys = {
    {
      key = 't',
      mods = 'LEADER',
      action = wezterm.action.EmitEvent('toggle-tabbar')
    },
    {
      key = 'b',
      mods = 'LEADER',
      action = wezterm.action.EmitEvent('toggle-bg-image')
    },
    {
      key = '-',
      mods = 'LEADER',
      action = wezterm.action.SplitVertical({ domain = 'CurrentPaneDomain' }),
    },
    {
      key = '|',
      mods = 'LEADER',
      action = wezterm.action.SplitHorizontal({ domain = 'CurrentPaneDomain' }),
    },
    {
      key = 'F11',
      action = wezterm.action.ToggleFullScreen,
    },
    {
      key = 'r',
      mods = 'CMD|SHIFT',
      action = wezterm.action.ReloadConfiguration,
    },
    {
      key = 'w',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.CloseCurrentTab({ confirm = false })
    },
    {
      key = 'LeftArrow',
      mods = 'ALT',
      action = wezterm.action.ActivatePaneDirection('Prev')
    },
    {
      key = 'RightArrow',
      mods = 'ALT',
      action = wezterm.action.ActivatePaneDirection('Next')
    },
    {
      key = '`',
      mods = 'CTRL',
      action = wezterm.action.TogglePaneZoomState,
    },
    {
      key = 'm',
      mods = 'LEADER',
      action = wezterm.action.TogglePaneZoomState,
    },
    {
      key = 'P',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.ActivateCommandPalette,
    },
    {
      key = ' ',
      mods = 'CTRL',
      action = wezterm.action.SendKey({
        key = ' ',
        mods = 'CTRL',
      }),
    },
    {
      key = "n",
      mods = "LEADER",
      action = wezterm.action.SwitchToWorkspace({
        name = "terminal"
      })
    },
    {
      key = '9',
      mods = 'ALT',
      action = wezterm.action.ShowLauncherArgs({
        flags = 'FUZZY|WORKSPACES',
      }),
    },
    {
      key = 'f',
      mods = 'LEADER',
      action = wezterm.action.EmitEvent('change-font')
    }
  }
end

return M
