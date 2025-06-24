--- @module 'snacks'

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    local vscode_custom = {
      preview = false,
      layout = {
        backdrop = false,
        row = 2,
        width = 0.4,
        min_width = 80,
        height = 0.4,
        border = "none",
        box = "vertical",
        {
          win = "input",
          height = 1,
          border = "rounded",
          title = "{title} {live} {flags}",
          title_pos = "center"
        },
        { win = "list",    border = "rounded" },
        { win = "preview", title = "{preview}", border = "rounded" },
      },
    }

    require('snacks.picker.config.layouts')['vscode_custom'] = vscode_custom

    ---@type snacks.Config
    local opts = {
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = false },
      indent = { enabled = false },
      input = { enabled = true },
      picker = {
        matcher = { frecency = true, history_bonus = true },
        layout = { preset = "vscode_custom" },
        win = {
          input = {
            keys = {
              ["<Esc>"] = { "close", mode = { "n", "i" } },
            }
          },
        },
      },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
      words = { enabled = true },
    }
    Snacks.setup(opts)
  end,
  keys = {
    {
      "<leader>f",
      function() Snacks.picker.files() end,
      desc = "Smart Find Files"
    },
    {
      "<leader>b",
      function()
        Snacks.picker.buffers({
          win = {
            input = {
              keys = { ["<C-d>"] = { "bufdelete", mode = { "n", "i" } } }
            }
          }
        })
      end,
      desc = "Smart Find Files"
    },
    {
      "fg",
      function()
        Snacks.picker.grep({ layout = { preset = "dropdown" } })
      end,
      desc = "Grep from files"
    },
    {
      "<leader>o",
      function()
        Snacks.picker.lsp_symbols()
      end
    },
    {
      "<leader>h",
      function()
        Snacks.picker.help()
      end
    },
    {
      "<leader>k",
      function()
        Snacks.picker.keymaps()
      end
    },
    {
      "<leader>n",
      function()
        Snacks.picker.notifications({ layout = { preset = "ivy" } })
      end
    }
  }
}
