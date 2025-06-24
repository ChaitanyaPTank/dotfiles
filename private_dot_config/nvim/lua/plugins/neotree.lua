return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = true,
  keys = {
    {
      "<leader>e",
      ":Neotree toggle reveal<CR>",
      desc = "Neotree with current buffer focused"
    },
    {
      "<Bslash>e",
      ":Neotree toggle reveal<CR>",
      desc = "Neotree with current buffer focused"
    },
    {
      "<Bslash>g",
      ":Neotree source=git_status toggle reveal<CR>",
      desc = "Neotree with git files"
    },
    {
      "<Bslash>b",
      ":Neotree source=buffers toggle<CR>",
      desc = "Neotree with open buffers"
    }
  }
}
