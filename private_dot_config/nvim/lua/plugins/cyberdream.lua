return {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    -- Enable transparent background
    transparent = true,

    -- Enable italics comments
    italic_comments = true,

    -- Replace all fillchars with ' ' for the ultimate clean look
    hide_fillchars = false,

    -- Modern borderless telescope theme - also applies to fzf-lua
    borderless_pickers = false,

    saturation = 0.7, -- accepts a value between 0 and 1. 0 will be fully desaturated (greyscale) and 1 will be the full color (default)

    -- Disable or enable colorscheme extensions
    extensions = {
      telescope = true,
      notify = true,
      mini = true,
    },

  }
}
