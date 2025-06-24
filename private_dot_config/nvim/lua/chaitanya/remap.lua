local options = {
  noremap = true,
  silent = true
}

local function toggle_diagnostics()
  local current_config = vim.diagnostic.config().virtual_text
  vim.diagnostic.config({ virtual_text = not current_config })
end

vim.keymap.set('n', '<BSlash>d', toggle_diagnostics, { noremap = true, silent = true, desc = "Toggle Diagnostics" })

local function toggle_inlay_hints()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end

-- Keymaps defined here
vim.keymap.set(
  't',
  '<Esc>',
  '<C-\\><C-n>',
  { noremap = true, silent = true, desc = "Terminal normal mode" }
)

vim.keymap.set(
  'n',
  '<C-x>',
  ':bd%<CR>',
  { noremap = true, silent = true, desc = "Delete current buffer" }
)

vim.cmd [[ onoremap <silent> ie :normal! gg0VG<CR> ]]
vim.cmd [[ vnoremap <silent> ie :normal! gg0VG<CR> ]]
vim.cmd [[ xnoremap <silent> ie :normal! gg0VG<CR> ]]

vim.keymap.set(
  'n',
  '<BSlash><BSlash>',
  toggle_inlay_hints,
  { noremap = true, silent = true, desc = "Toggle inlay hints" }
)


vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local bufnr = ev.buf

    local function get_opts(desc)
      return { buffer = bufnr, remap = false, desc = desc or "" }
    end

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, get_opts("Goto definition"))
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover({ border = 'rounded' }) end, get_opts("Hover definition"))
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol("") end, get_opts("Workspace Symbol"))
    vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end,
      get_opts("Open diagnostic in floating window"))
    vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end,
      get_opts("Goto next diagnostic"))
    vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end,
      get_opts("Goto prev diagnostic"))
    vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, get_opts("Lsp code actions"))
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, get_opts("Lsp references"))
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, get_opts("Rename symbol"))
    vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, get_opts("Rename symbol"))
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, get_opts("Signature help"))
    vim.keymap.set({ "i", "n" }, "<M-S-f>", function() vim.lsp.buf.format() end, get_opts("Format current buffer"))
  end
})
