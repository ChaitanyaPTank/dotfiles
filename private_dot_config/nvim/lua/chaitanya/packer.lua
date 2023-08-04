require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager
  use { 'm4xshen/autoclose.nvim', config = function() require('autoclose').setup() end }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' }, },
  } -- file finder type
  use 'onsails/lspkind.nvim'
  use({ 'projekt0n/github-nvim-theme', tag = 'v0.0.7' })
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'nvim-treesitter/nvim-treesitter-angular'
  use {
    'kylechui/nvim-surround',
    tag = "*",
    config = function() require('nvim-surround').setup() end
  }
  use 'doums/darcula'
  use "folke/zen-mode.nvim"
  use({ 'rose-pine/neovim', as = 'rose-pine' })
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {

      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
    }
  }
  use 'rcarriga/nvim-notify'
  use "lukas-reineke/indent-blankline.nvim"
end)
