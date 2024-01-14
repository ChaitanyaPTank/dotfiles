require('chaitanya')

vim.cmd [[ colorscheme gruvbox ]]

vim.api.nvim_create_autocmd(
  'BufWritePost',
  {
    group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
    pattern = 'packer.lua',
    command = 'source <afile> | PackerCompile',
  }
)


--[[
vim.cmd [[
  autocmd BufEnter * if &buftype ==# 'terminal' | startinsert! | endif
]]
-- ]]


vim.cmd [[
  autocmd BufWinEnter,WinEnter term://* startinsert
]]
