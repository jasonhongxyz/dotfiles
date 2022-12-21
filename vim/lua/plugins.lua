local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local function get_config(name)
  return string.format('require("config/%s")', name)
end

require('packer').startup(function(use)
  -- package manager
  use 'wbthomason/packer.nvim'

  -- lsp configuration & plugins
  use {
    'neovim/nvim-lspconfig',
    requires = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'j-hui/fidget.nvim',
    },
    config = get_config('lsp_config'),
  }
  use { 'ray-x/lsp_signature.nvim', config = get_config('lsp_signature_config') }


  -- autocompletion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = get_config('cmp_config'),
  }

  -- highlight, edit, and navigate code
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
    config = get_config('nvim-treesitter_config'),
  }

  -- additional text objects
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter'
  }

  -- git related
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use { 'lewis6991/gitsigns.nvim', config = get_config('gitsigns_config') }

  -- utilities
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = get_config('telescope_config'),
  }
  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }
  use { 'nvim-telescope/telescope-file-browser.nvim' }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'nvim-lualine/lualine.nvim', config = get_config('lualine_config') }
  use { 'lukas-reineke/indent-blankline.nvim', config = get_config('indent-blankline_config') }
  use 'numToStr/Comment.nvim'
  use 'tpope/vim-sleuth'
  use 'tpope/vim-surround'
  use 'fatih/vim-go'

  -- colorschemes
  use {'catppuccin/nvim', as = 'catppuccin'}
  use {'folke/tokyonight.nvim', as = 'tokyonight'}
  use {'navarasu/onedark.nvim', as = 'onedark'}

  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

require("config/general")

