return {
  'akinsho/toggleterm.nvim',
  config = function()
    require('toggleterm').setup({
      size = function()
        return vim.o.columns / 2
      end,
      start_in_insert = true,
      direction = "vertical",
      open_mapping = "<Bslash>t",
      shell = vim.o.shell
    })

    vim.keymap.set('n', '<Bslash>t', ':ToggleTerm<CR>')
    vim.keymap.set('n', '<leader>t', ':TermSelect<CR>')
    -- vim.keymap.set('t', '<Bslash>t', '<C-\\><C-n>:ToggleTerm<CR>')
  end,
}
