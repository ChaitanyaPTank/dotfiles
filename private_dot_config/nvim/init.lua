-- mapleader to space
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end


vim.opt.rtp:prepend(lazypath)

require('chaitanya')

require('lazy').setup("plugins")

vim.diagnostic.config({ virtual_text = true })

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = '',
      [vim.diagnostic.severity.HINT] = '󰌵',
    },
  },
})

-- vim.cmd("colorscheme darcula-solid")
vim.cmd("colorscheme cyberdream")
-- vim.cmd("colorscheme catppuccin-mocha")

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls' },
  automatic_enable = { exclude = { "rust_analyzer" } }
})

require('luasnip.loaders.from_vscode').lazy_load()
