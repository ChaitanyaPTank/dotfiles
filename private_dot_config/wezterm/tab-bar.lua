return {
  tab_bar = {
    -- The color of the strip that goes along the top of the window
    -- (does not apply when fancy tab bar is in use)
    background = '#2b2042',

    active_tab = {
      bg_color = '#2b2042',
      fg_color = '#c0c0c0',
      intensity = 'Bold',
      underline = 'Single',
      italic = false,
      strikethrough = false,
    },

    -- Inactive tabs are the tabs that do not have focus
    inactive_tab = {
      bg_color = '#1b1032',
      fg_color = '#808080',
      underline = 'Single',
    },

    inactive_tab_hover = {
      bg_color = '#3b3052',
      fg_color = '#909090',
      italic = true,
    },

    -- The new tab button that let you create new tabs
    new_tab = {
      bg_color = '#1b1032',
      fg_color = '#808080',
    },

    new_tab_hover = {
      bg_color = '#3b3052',
      fg_color = '#909090',
      italic = true,
    },
  },
}
