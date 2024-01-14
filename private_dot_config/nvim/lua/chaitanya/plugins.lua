require('lazy').setup({
  {
    'm4xshen/autoclose.nvim',
    config = function() require('autoclose').setup() end
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  'onsails/lspkind.nvim',
  'nvim-tree/nvim-tree.lua',
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      local ts_update = require('nvim-treesitter.install')
          .update({ with_sync = true })
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
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', opt = true },
  },
  --  'nvim-treesitter/nvim-treesitter-angular',
  {
    'kylechui/nvim-surround',
    version = '*',
    config = function() require('nvim-surround').setup() end
  },
  'doums/darcula',
  'folke/zen-mode.nvim',

  { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },

  -- LSP Support
  { 'neovim/nvim-lspconfig' },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },

  -- Autocompletion
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'L3MON4D3/LuaSnip' },

  'rcarriga/nvim-notify',
  'lukas-reineke/indent-blankline.nvim',
  'jose-elias-alvarez/null-ls.nvim',
  { 'akinsho/bufferline.nvim' },
  { 'ellisonleao/gruvbox.nvim' },
  { 'akinsho/toggleterm.nvim' },
  'LunarVim/horizon.nvim',
  {
    'lewis6991/gitsigns.nvim',
    config = function() require('gitsigns').setup({}) end
  },
  'folke/tokyonight.nvim',
  'navarasu/onedark.nvim',
  'rafamadriz/friendly-snippets',
  { 'saadparwaiz1/cmp_luasnip' },
  'Bekaboo/dropbar.nvim',
  'folke/neodev.nvim',
  { "elgiano/nvim-treesitter-angular", branch = "topic/jsx-fix" },
})
