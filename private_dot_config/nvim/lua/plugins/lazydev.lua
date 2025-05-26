return {
  'folke/lazydev.nvim',
  opts = {
    library = {
      { path = "wezterm-types",      mods = { "wezterm" } },
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    }
  }
}
