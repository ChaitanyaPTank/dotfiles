require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager
  use {
    'm4xshen/autoclose.nvim',
    config = function() require('autoclose').setup() end
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    requires = { { 'nvim-lua/plenary.nvim' }, },
  } -- file finder type
  use 'onsails/lspkind.nvim'
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
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
        }
      })
    end
  }
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
  -- use 'nvim-treesitter/nvim-treesitter-angular'
  use {
    'kylechui/nvim-surround',
    tag = '*',
    config = function() require('nvim-surround').setup() end
  }
  use 'doums/darcula'
  use 'folke/zen-mode.nvim'
  use({ 'rose-pine/neovim', as = 'rose-pine' })
  use {
    'VonHeikemen/lsp-zero.nvim',
    -- branch = 'v2.x',
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
  use 'lukas-reineke/indent-blankline.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use { 'akinsho/bufferline.nvim' }
  use { 'ellisonleao/gruvbox.nvim' }
  use { 'akinsho/toggleterm.nvim' }
  use 'LunarVim/horizon.nvim'
  use {
    'lewis6991/gitsigns.nvim',
    config = function() require('gitsigns').setup({}) end
  }
  use 'folke/tokyonight.nvim'
  use 'navarasu/onedark.nvim'
  use 'rafamadriz/friendly-snippets'
  use { 'saadparwaiz1/cmp_luasnip' }
  use 'Bekaboo/dropbar.nvim'
  use 'folke/neodev.nvim'
  use { "elgiano/nvim-treesitter-angular", branch = "topic/jsx-fix" }
end)
