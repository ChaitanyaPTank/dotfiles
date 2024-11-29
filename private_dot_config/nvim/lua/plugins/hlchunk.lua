return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    chunk = { enable = true },
    blank = { enable = false },
  }
}
