local options = {
  noremap = true,
  silent = true
}

-- Keymaps defined here
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', options)

vim.keymap.set('n', '<C-x>', ':bd%<CR>', options)


-- vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', options)

-- key mappings
vim.keymap.set('n', '<leader>n', ':bn<CR>')
vim.keymap.set('n', '<leader>p', ':bprev<CR>')

vim.cmd [[ onoremap <silent> ie :normal! gg0VG<CR> ]]
vim.cmd [[ vnoremap <silent> ie :normal! gg0VG<CR> ]]
vim.cmd [[ xnoremap <silent> ie :normal! gg0VG<CR> ]]
