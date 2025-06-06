return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'kyazdani42/nvim-web-devicons', opts = true },
  opts = {
    options = {
      -- section_separators = { left = '', right = '' },
      -- component_separators = { left = '╲', right = '' },
      section_separators = { left = ' ', right = ' ' },
      component_separators = { left = ' ', right = ' ' },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { { 'branch', icon = " " }, 'diff', 'diagnostics' },
      lualine_c = { { 'filename', path = 1 } },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' }
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { { 'filename', path = 1 } },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {}
    },
    -- tabline = {},
    -- winbar = {},
    -- inactive_winbar = {},
    -- extensions = {}
  }
}
