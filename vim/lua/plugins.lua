-- automatic installation with packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

function get_config(name)
  return string.format('require("config/%s")', name)
end

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- packer can manage itself
  use 'wbthomason/packer.nvim'

  -- tpope
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'

  -- wiki
  use 'vimwiki/vimwiki'

  -- language
  use ({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = get_config("treesitter") })
  use { "williamboman/mason.nvim" , config = get_config("mason")}
  use { "williamboman/mason-lspconfig.nvim" }
  use { "neovim/nvim-lspconfig"}

  -- util
  use ({'L3MON4D3/LuaSnip', config = get_config("lualine")})
  use ({ 'numToStr/Comment.nvim', config = get_config("comment") })
  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} }, config = get_config("telescope")}
  use { 'nvim-telescope/telescope-ui-select.nvim' }
  use ({
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = get_config("nvimtree")
  })
  use ({
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons', opt = true
    },
    config = get_config("lualine")
  })
  use 'google/vim-maktaba'
  use 'google/vim-codefmt'
  use 'google/vim-glaive'
  use 'dhruvasagar/vim-table-mode'

  -- completion
  use ({
    'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
    },
    config = get_config("cmp"),
  })
  use ({ 'ray-x/lsp_signature.nvim', require = { "neovim/nvim-lspconfig" }, config = get_config("lsp-signature") })
  use ({ 'windwp/nvim-autopairs', config = get_config("autopairs")})
  use ({ 'jose-elias-alvarez/null-ls.nvim', config = get_config("nullls")})

  -- gui
  use 'junegunn/goyo.vim'

  -- git
  use ({ 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' }, config = get_config("gitsigns") })

  -- golang
  use { 'fatih/vim-go', run = ':GoUpdateBinaries' }

  -- run
  use 'skywind3000/asyncrun.vim'

  -- colors
  use { 'dracula/vim',  as = 'dracula' }
  use 'morhetz/gruvbox'
  use 'folke/tokyonight.nvim'
  use({
	"catppuccin/nvim",
	as = "catppuccin", config = get_config("catppuccin")
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

