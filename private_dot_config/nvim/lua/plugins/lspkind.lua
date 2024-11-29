return {
  'onsails/lspkind.nvim',
  config = function()
    require('lspkind').init({ preset = 'codicons' })
  end
}
