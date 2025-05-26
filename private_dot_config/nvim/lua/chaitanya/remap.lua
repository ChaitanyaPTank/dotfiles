local options = {
  noremap = true,
  silent = true
}

local function toggle_inlay_hints()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end

-- Keymaps defined here
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', options)
vim.keymap.set('n', '<C-x>', ':bd%<CR>', options)
vim.cmd [[ onoremap <silent> ie :normal! gg0VG<CR> ]]
vim.cmd [[ vnoremap <silent> ie :normal! gg0VG<CR> ]]
vim.cmd [[ xnoremap <silent> ie :normal! gg0VG<CR> ]]

vim.keymap.set('n', '<Bslash><Bslash>', toggle_inlay_hints, options)

vim.lsp.config('*', {
  on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover({ border = 'rounded' }) end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol("") end, opts)
    vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
    vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("i", "<M-S-f>", function() vim.lsp.buf.format() end)
    vim.keymap.set("n", "<M-S-f>", function() vim.lsp.buf.format() end)
  end
})
