return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
  },

  {
    'folke/tokyonight.nvim',
    name = 'tokyonight',
  },

  {
    'navarasu/onedark.nvim',
    lazy = false,
    name = 'onedark',
    opts = { style = "darker" },
    config = function(_, opts)
      require('onedark').setup(opts)
      require('onedark').load()
    end,
  },

}

