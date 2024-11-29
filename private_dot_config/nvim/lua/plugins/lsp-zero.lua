vim.opt.signcolumn = 'yes'

return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v4.x',
  config = function()
    require('neodev').setup()
    require('mason').setup()
    require('mason-lspconfig').setup()

    local lsp_zero = require('lsp-zero')

    local lsp_attach = function(client, bufnr)
      lsp_zero.default_keymaps({ buffer = bufnr })
    end

    lsp_zero.extend_lspconfig({
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
      lsp_attach = lsp_attach,
      float_border = 'rounded',
      sign_text = true,
    })

    lsp_zero.set_sign_icons({
      error = '✘',
      warn = '',
      hint = '⚑',
      info = '»'
    })

    local cmp = require('cmp')

    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    local cmp_mappings = cmp.mapping.preset.insert({
      ['<Up>'] = cmp.mapping.select_prev_item(cmp_select),
      ['<Down>'] = cmp.mapping.select_next_item(cmp_select),
      ['<CR>'] = cmp.mapping.confirm(cmp_select),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<Tab>'] = cmp.mapping(function(fallback)
        local col = vim.fn.col('.') - 1
        if cmp.visible() then
          cmp.select_next_item(cmp_select)
        elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
          fallback()
        else
          cmp.complete()
        end
      end, { 'i', 's' }),

      -- Go to previous item
      ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
      ['<C-k>'] = cmp.mapping(function()
        local luasnip = require('luasnip')
        if luasnip.expand_or_locally_jumpable() then
          print("expandable")
          luasnip.expand_or_jump()
        end
      end, { 'i', 's' }),
      ['<C-j>'] = cmp.mapping(function(fallback)
        local luasnip = require('luasnip')
        if luasnip.locally_jumpable(1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' })
    })

    cmp.setup({
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
      },
      snippet = {
        expand = function(args)
          -- vim.snippet.expand(args.body)
          require('luasnip').lsp_expand(args.body)
        end
      },
      preselect = 'item',
      completion = {
        completeopt = 'menu,menuone,preview',
        side_padding = 1
      },
      mapping = cmp_mappings,
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = require('lspkind').cmp_format({
          mode = 'symbol',
          maxwidth = 10,
          ellipsis_char = '...'
        }),
        expandable_indicator = true
      }
    })

    lsp_zero.on_attach(function(client, bufnr)
      lsp_zero.default_keymaps({ buffer = bufnr })

      local opts = { buffer = bufnr, remap = false }

      vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
      vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
      vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol("") end, opts)
      vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, opts)
      vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
      vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
      vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
      vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
      vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
      vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
      vim.keymap.set("i", "<M-S-f>", function() vim.lsp.buf.format() end)
      vim.keymap.set("n", "<M-S-f>", function() vim.lsp.buf.format() end)
    end)

    lsp_zero.setup()

    vim.diagnostic.config({ virtual_text = true })

    require('lspconfig').lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    })

    require('luasnip.loaders.from_vscode').lazy_load()
    require('mason-lspconfig').setup_handlers({
      function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
      end,
      -- Next, you can provide a dedicated handler for specific servers.
      -- For example, a handler override for the `rust_analyzer`:
      -- ["rust_analyzer"] = function()
      --   require("rust-tools").setup {}
      -- end


      ['jsonls'] = function()
        require('lspconfig').jsonls.setup({
          setttings = {
            json = {
              schemas = require('schemastore').json.schemas(),
              validate = { enable = true }
            }
          }
        })
      end

    })
  end
}
