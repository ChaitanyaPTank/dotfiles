local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'lua_ls',
  'html',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()


local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end


local cmp = require('cmp')


function space_tab_mapping()
  return cmp.mapping(
    function(fallback)
      local col = vim.fn.col('.')
      if cmp.visible() then
        cmp.select_next_item(cmp_select)
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end,
    { 'i', 's' }
  )
end

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<Up>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<Down>'] = cmp.mapping.select_next_item(cmp_select),
  ['<CR>'] = cmp.mapping.confirm({ select = false }),
  ['<C-Space>'] = space_tab_mapping(),
  ['<Tab>'] = space_tab_mapping(),
})


lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
  window = {
    documentation = cmp.config.window.bordered()
  }
})


lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })

  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnonnic.goto_next() end, opts)
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
