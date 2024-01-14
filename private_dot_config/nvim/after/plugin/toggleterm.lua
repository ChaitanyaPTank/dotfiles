local terminal = require("toggleterm")

terminal.setup({
  size = function()
    return vim.o.columns / 2
  end,
  start_in_insert = true,
  direction = "vertical",
  open_mapping = "<Bslash>t",
})
