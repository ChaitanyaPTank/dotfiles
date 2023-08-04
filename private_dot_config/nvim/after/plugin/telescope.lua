-- change keymaps
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.git_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>h', builtin.help_tags, {})

-- ignore node modules and other stuff
require('telescope').setup({
  defaults = {
    file_ignore_patterns = { "node_modules" },
  },
  pickers = {
    find_files = {
      theme = "dropdown"
    },
  }
})
