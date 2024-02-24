return {
  'nvim-tree/nvim-tree.lua',
  opts = {
    filters = {
      custom = { "^.git$", "^.angular" },
      dotfiles = true
    }
  }
}
