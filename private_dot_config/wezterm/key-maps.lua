local wezterm = require 'wezterm'

return {
  {
    key = 't',
    mods = 'CTRL',
    action = wezterm.action.EmitEvent('toggle-tabbar')
  },
  {
    key = 'd',
    mods = 'ALT|SHIFT',
    action = wezterm.action.SplitVertical({ domain = 'CurrentPaneDomain' }),
  },
  {
    key = 'd',
    mods = 'CTRL|SHIFT',
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
    key = 'Z',
    mods = 'CTRL | ALT',
    action = wezterm.action.TogglePaneZoomState,
  },
  {
    key = 'P',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateCommandPalette,
  },
}
