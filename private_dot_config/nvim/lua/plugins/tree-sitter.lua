local ensure_installed_parsers = {
  'lua',
  'go',
  'gotmpl',
  'goctl',
  'gomod',
  'gosum',
  'javascript',
  'jsdoc',
  'typescript',
  'typst',
  'angular',
  'svelte',
  'tsx',
  'html',
  'css',
  'rust'
}
return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  config = function()
    local has_tree_sitter = vim.fn.executable('tree-sitter') == 1
    if has_tree_sitter then
      require('nvim-treesitter').install(ensure_installed_parsers)
    else
      vim.notify('`tree-sitter` cli is not found, not installing configured parsers')
    end

    ---@diagnostic disable-next-line: assign-type-mismatch
    vim.api.nvim_create_autocmd({ 'Filetype' }, {
      callback = function(event)
        local ok, nvim_treesitter = pcall(require, 'nvim-treesitter')
        if not ok then return end
        local parsers = require('nvim-treesitter.parsers')
        if not parsers[event.match] or not nvim_treesitter.install then return end
        local ft = vim.bo[event.buf].ft
        local lang = vim.treesitter.language.get_lang(ft)
        nvim_treesitter.install({ lang }):await(function(err)
          if err then
            vim.notify('Treesitter install error for ft: ' .. ft .. ' err: ' .. err)
            return
          end
          pcall(vim.treesitter.start, event.buf)
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        end)
      end,
    })
  end
}
