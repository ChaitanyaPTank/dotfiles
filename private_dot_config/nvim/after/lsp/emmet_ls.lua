local existing_filetypes = require('lspconfig.configs.html').default_config.filetypes
return {
  filetypes = vim.list_extend(existing_filetypes, { 'gothmltmpl' })
}
