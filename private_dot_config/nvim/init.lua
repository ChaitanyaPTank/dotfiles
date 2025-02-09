-- mapleader to space
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
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

vim.cmd("colorscheme darcula-solid")
vim.cmd("colorscheme cyberdream")
-- vim.cmd("colorscheme catppuccin-mocha")
