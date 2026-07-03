local function get_cwd()
  return vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'kyazdani42/nvim-web-devicons', opts = true },
  --- @module "lualine.config"
  opts = {
    options = {
      section_separators = { left = ' ', right = ' ' },
      component_separators = { left = ' ', right = ' ' },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { { 'branch', icon = " " }, 'diff', 'diagnostics' },
      lualine_c = { { get_cwd, icon = ' ', color = 'Character' }, { 'filename', path = 1 } },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { { get_cwd, icon = ' ', color = 'Character' }, { 'filename', path = 1 } },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {}
    },
    -- tabline = { },
    -- winbar = { },
    -- inactive_winbar = {},
    -- extensions = {}
  },
}
