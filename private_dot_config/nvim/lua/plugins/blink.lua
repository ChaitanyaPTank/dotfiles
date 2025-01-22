return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = 'v0.*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    snippets = {
      preset = 'luasnip',
      expand = function(snippet) require('luasnip').lsp_expand(snippet) end,
      active = function(filter)
        if filter and filter.direction then
          return require('luasnip').jumpable(filter.direction)
        end
        return require('luasnip').in_snippet()
      end,
      jump = function(direction) require('luasnip').jump(direction) end
    },
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- see the "default configuration" section below for full documentation on how to define
    -- your own keymap.
    keymap = {
      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
      ['<Tab>'] = { 'select_next', 'fallback' },
      ['<CR>'] = { 'accept', 'fallback' },
      ['<C-k>'] = {
        ---@diagnostic disable-next-line: unused-local
        function(_cmp)
          vim.schedule(function()
            local luasnip = require('luasnip')
            if luasnip.expandable() then luasnip.expand() end
          end)
        end,
        'snippet_forward',
      },
      ['<C-j>'] = { 'snippet_backward', },
    },

    appearance = {
      -- Sets the fallback highlight groups to nvim-cmp's highlight groups
      -- Useful for when your theme doesn't support blink.cmp
      -- will be removed in a future release
      use_nvim_cmp_as_default = true,
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },



    -- default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'buffer', 'snippets', 'path' },
      -- optionally disable cmdline completions
      cmdline = {},
    },

    completion = {
      menu = {
        border = 'rounded',
        draw = {
          treesitter = { "lsp" },
          components = {
            kind_icon = {
              ellipsis = false,
              text = function(ctx)
                local kind_icon = require('lspkind').presets.codicons[ctx.kind]
                return kind_icon .. " "
              end,
            }
          },
          -- gap = 2,
          columns = {
            { "kind_icon" },
            { "label",    "label_description", gap = 1 }
          }
        }
      }
    }
    -- experimental signature help support
    -- signature = { enabled = true }
  },
  -- allows extending the providers array elsewhere in your config
  -- without having to redefine it
  opts_extend = { "sources.default" }
}
