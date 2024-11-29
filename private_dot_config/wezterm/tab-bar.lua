local BG_COLOR = "#1A1A1A"
local FG_COLOR = "#808080"
local FG_COLOR_ACTIVE = "#FAFAFA"
local BG_COLOR_ACTIVE = "#38393b"

return {
  tab_bar = {
    -- The color of the strip that goes along the top of the window
    -- (does not apply when fancy tab bar is in use)
    background = BG_COLOR,

    active_tab = {
      bg_color = BG_COLOR_ACTIVE,
      fg_color = FG_COLOR_ACTIVE,
      intensity = 'Bold',
      underline = 'Single',
      italic = false,
      strikethrough = false,
    },

    -- Inactive tabs are the tabs that do not have focus
    inactive_tab = {
      bg_color = BG_COLOR,
      fg_color = FG_COLOR,
      underline = 'Single',
    },

    inactive_tab_hover = {
      bg_color = BG_COLOR_ACTIVE,
      fg_color = FG_COLOR_ACTIVE,
      italic = true,
    },

    -- The new tab button that let you create new tabs
    new_tab = {
      bg_color = BG_COLOR,
      fg_color = FG_COLOR_ACTIVE,
    },

    new_tab_hover = {
      bg_color = BG_COLOR_ACTIVE,
      fg_color = FG_COLOR_ACTIVE,
      italic = true,
    },
  },
}
