vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.termguicolors = true
vim.o.ignorecase = true
vim.o.hlsearch = false
vim.o.colorcolumn = "80"
vim.o.expandtab = true
vim.o.cursorline = true
vim.o.wrap = false
vim.o.scrolloff = 2
vim.o.foldcolumn = "auto"
vim.o.foldlevel = 100
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.lsp.foldexpr()"
vim.o.sessionoptions = "buffers,folds,tabpages,terminal"

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local os = vim.uv.os_uname().sysname:lower()
local is_windows = os:find('windows')

if is_windows then
  vim.opt.shellcmdflag = "-s"
end

vim.diagnostic.config({ virtual_text = false, float = { border = 'rounded' } })

vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 100 }
  end,
})
