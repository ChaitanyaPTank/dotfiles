local bufnr = vim.api.nvim_get_current_buf()
local opts = { buffer = bufnr, remap = false, silent = true }

vim.keymap.set('n', 'K', function() vim.cmd.RustLsp({ 'hover', 'action' }) end, opts)
vim.keymap.set('n', '<leader>a', function() vim.cmd.RustLsp({ 'codeAction' }) end, opts)
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
vim.keymap.set("n", "K", function() vim.lsp.buf.hover({ border = 'rounded' }) end, opts)
vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol("") end, opts)
vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, opts)
vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, opts)
vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
vim.keymap.set("i", "<M-S-f>", function() vim.lsp.buf.format() end)
vim.keymap.set("n", "<M-S-f>", function() vim.lsp.buf.format() end)
