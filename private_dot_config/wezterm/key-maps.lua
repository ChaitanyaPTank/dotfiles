local wezterm = require "wezterm"

local M = {}

function M.apply_to_config(config)
  config.leader = { key = "a", mods = "ALT", timeout_milliseconds = 1000 }
  config.keys = {
    {
      key = "t",
      mods = "LEADER",
      action = wezterm.action.EmitEvent("toggle-tabbar")
    },
    {
      key = "b",
      mods = "LEADER",
      action = wezterm.action.ActivateKeyTable({
        name = "background",
        one_shot = false,
      }),
    },
    {
      key = "-",
      mods = "LEADER",
      action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
    },
    {
      key = "|",
      mods = "LEADER",
      action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
    },
    {
      key = "F11",
      action = wezterm.action.ToggleFullScreen,
    },
    {
      key = "r",
      mods = "CMD|SHIFT",
      action = wezterm.action.ReloadConfiguration,
    },
    {
      key = "w",
      mods = "CTRL|SHIFT",
      action = wezterm.action.CloseCurrentTab({ confirm = false })
    },
    {
      key = "LeftArrow",
      mods = "ALT",
      action = wezterm.action.ActivatePaneDirection("Prev")
    },
    {
      key = "RightArrow",
      mods = "ALT",
      action = wezterm.action.ActivatePaneDirection("Next")
    },
    {
      key = "z",
      mods = "LEADER",
      action = wezterm.action.TogglePaneZoomState,
    },
    {
      key = "m",
      mods = "LEADER",
      action = wezterm.action.TogglePaneZoomState,
    },
    {
      key = "P",
      mods = "CTRL|SHIFT",
      action = wezterm.action.ActivateCommandPalette,
    },
    {
      key = " ",
      mods = "CTRL",
      action = wezterm.action.SendKey({
        key = " ",
        mods = "CTRL",
      }),
    },
    {
      key = "n",
      mods = "ALT",
      action = wezterm.action.PromptInputLine({
        description = wezterm.format({
          { Attribute = { Intensity = "Bold" } },
          { Foreground = { AnsiColor = "Fuchsia" } },
          { Text = "Enter name for new workspace" },
        }),
        action = wezterm.action_callback(function(window, pane, line)
          if line then
            window:perform_action(
              wezterm.action.SwitchToWorkspace({ name = line }),
              pane
            )
          end
        end),
      }),
    },
    {
      key = "l",
      mods = "ALT",
      action = wezterm.action.ShowLauncherArgs({
        flags = "WORKSPACES"
      })
    },
    {
      key = "f",
      mods = "LEADER",
      action = wezterm.action.EmitEvent("change-font")
    },
    {
      key = "[",
      mods = "ALT",
      action = wezterm.action.SwitchWorkspaceRelative(-1)
    },
    {
      key = "]",
      mods = "ALT",
      action = wezterm.action.SwitchWorkspaceRelative(1)
    }
  }
  config.key_tables = {
    background = {
      { key = "b", action = wezterm.action.EmitEvent("toggle-bg-image") },
      { key = "n", action = wezterm.action.EmitEvent("next-image") },
      {
        key = "n", mods = "SHIFT", action = wezterm.action.EmitEvent("prev-image")
      },
      {
        key = "_", mods = "SHIFT", action = wezterm.action.EmitEvent("inc-brightness")
      },
      { key = "-",      action = wezterm.action.EmitEvent("dec-brightness") },
      { key = "Escape", action = "PopKeyTable" },
    }
  }
end

return M
