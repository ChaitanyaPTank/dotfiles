return {
  'nvim-tree/nvim-tree.lua',
  config = false,
  opts = {
    filters = {
      custom = { "^.git$", "^.angular" },
      dotfiles = true
    }
  }
}
