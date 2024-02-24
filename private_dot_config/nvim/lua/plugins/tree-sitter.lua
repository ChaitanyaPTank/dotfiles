return {

  'nvim-treesitter/nvim-treesitter',
  build = function()
    local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
    ts_update()
  end,
  config = function()
    local config = require('nvim-treesitter.configs')
    config.setup({
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
      },
    })
  end

}
