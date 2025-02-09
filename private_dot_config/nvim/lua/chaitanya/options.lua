vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.hlsearch = false
vim.opt.colorcolumn = "80"
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.scrolloff = 2

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


local os = vim.loop.os_uname().sysname:lower()
local is_windows = os:find('windows')

if is_windows then
  vim.opt.shellcmdflag = "-s"
end


vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 100 }
  end,
})
