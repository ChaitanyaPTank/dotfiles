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
  -- { 'akinsho/bufferline.nvim' },
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
  { 'elgiano/nvim-treesitter-angular', branch = 'topic/jsx-fix' },
  {
    'nvim-neorg/neorg',
    build = ':Neorg sync-parsers',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('neorg').setup {
        load = {
          ['core.defaults'] = {},
          ['core.concealer'] = {},
          ['core.dirman'] = {
            config = {
              workspaces = {
                notes = '~/notes',
              },
              default_workspace = 'notes',
            },
          },
        },
      }

      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 2
    end,
  },
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',         -- required
      'nvim-telescope/telescope.nvim', -- optional
      'sindrets/diffview.nvim',        -- optional
      'ibhagwan/fzf-lua',              -- optional
    },
    config = true
  },
  'nyoom-engineering/oxocarbon.nvim',
  'equalsraf/neovim-gui-shim',
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },
  'hrsh7th/cmp-buffer',
  'HiPhish/rainbow-delimiters.nvim',
  {
    'glacambre/firenvim',

    -- Lazy load firenvim
    -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    lazy = not vim.g.started_by_firenvim,
    build = function()
      vim.fn["firenvim#install"](0)
    end
  },
  'stevearc/dressing.nvim',
})
