require('ibl').setup({
  indent = { char = "│" },
  exclude = {
    filetypes = {
      "help",
      "terminal",
      "lazy",
      "lspinfo",
      "TelescopePrompt",
      "TelescopeResults",
      "mason",
      "nvdash",
      "nvcheatsheet",
      "packer",
    }
  },
  scope = { enabled = false }
})
