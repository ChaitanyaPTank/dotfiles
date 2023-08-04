-- empty setup using defaults
require("nvim-tree").setup({
  filters = {
    custom = { "^.git$", "^.angular" },
    dotfiles = true
  }
})
