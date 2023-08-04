
local options = {
  noremap = true,
  silent = true
}

-- Keymaps defined here
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", options)


vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", options)

-- key mappings
vim.keymap.set("n",'<leader>n', ':bn<CR>')
vim.keymap.set("n",'<leader>p', ':bprev<CR>')

