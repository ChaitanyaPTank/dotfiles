return {

  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').install({
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
    })

    vim.api.nvim_create_autocmd({ 'Filetype' }, {
      callback = function(event)

        -- make sure nvim-treesitter is loaded
        local ok, nvim_treesitter = pcall(require, 'nvim-treesitter')

        -- no nvim-treesitter, maybe fresh install
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
