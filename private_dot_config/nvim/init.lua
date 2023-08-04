require('chaitanya')

vim.cmd [[ colorscheme rose-pine ]]

vim.api.nvim_create_autocmd(
  'BufWritePost',
  {
    group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
    pattern = 'plugins.lua',
    command = 'source <afile> | PackerCompile',
  }
)

