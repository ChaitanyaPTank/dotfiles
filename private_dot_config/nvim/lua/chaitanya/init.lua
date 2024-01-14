require('chaitanya.packer')
require('chaitanya.options')
require('chaitanya.remap')
require('chaitanya.nvim-qt')

require('neodev').setup()

-- vim.cmd [[ colorscheme gruvbox ]]
vim.cmd([[ colorscheme onedark ]])

vim.api.nvim_create_autocmd(
  'BufWritePost',
  {
    group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
    pattern = 'packer.lua',
    command = 'source <afile> | PackerCompile',
  }
)
