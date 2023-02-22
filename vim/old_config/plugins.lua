  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'j-hui/fidget.nvim',
    },
    config = get_config('lsp_config'),
  }
  { 'ray-x/lsp_signature.nvim', config = get_config('lsp_signature_config') }


  -- autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = get_config('cmp_config'),
  }

  -- highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
    config = get_config('nvim-treesitter_config'),
  }

  -- additional text objects
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = 'nvim-treesitter'
  }

  -- git related
  'tpope/vim-fugitive'
  'tpope/vim-rhubarb'
  { 'lewis6991/gitsigns.nvim', config = get_config('gitsigns_config') }

  -- utilities
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.x',
    dependencies = { {'nvim-lua/plenary.nvim'} },
    config = get_config('telescope_config'),
  }
  {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }
  { 'nvim-telescope/telescope-file-browser.nvim' }
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  { 'nvim-lualine/lualine.nvim', config = get_config('lualine_config') }
  { 'lukas-reineke/indent-blankline.nvim', config = get_config('indent-blankline_config') }
  'numToStr/Comment.nvim'
  'tpope/vim-sleuth'
  'tpope/vim-surround'
  'fatih/vim-go'
  'godlygeek/tabular'
  'preservim/vim-markdown'


  -- colorschemes
  {'catppuccin/nvim', name = 'catppuccin'}
  {'folke/tokyonight.nvim', name = 'tokyonight'}
  {'navarasu/onedark.nvim', name = 'onedark', config = get_config('onedark_config') }
