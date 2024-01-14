local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'lua_ls',
  'html',
  'angularls@15.2.1'
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()


local cmp = require('cmp')


local completion_actions = lsp.cmp_action()


local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<Up>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<Down>'] = cmp.mapping.select_next_item(cmp_select),
  ['<CR>'] = cmp.mapping.confirm({ select = false }),
  ['<C-Space>'] = cmp.mapping(
    function()
      if cmp.visible() then
        cmp.mapping.select_next_item()
      else
        cmp.complete()
      end
    end
  ),
  ['<Tab>'] = completion_actions.luasnip_supertab()
})


lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
  snippet = {
    expand = function(args)
      require 'luasnip'.lsp_expand(args.body)
    end
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
  -- window = {
  --   documentation = cmp.config.window.bordered()
  -- }
})

require('luasnip.loaders.from_vscode').lazy_load()


lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })

  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("i", "<M-S-f>", function() vim.lsp.buf.format() end)
  vim.keymap.set("n", "<M-S-f>", function() vim.lsp.buf.format() end)
end)


lsp.setup()


vim.diagnostic.config({ virtual_text = true })
