-- colorschemes

return {

  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = true,
  },

  {
    'folke/tokyonight.nvim',
    name = 'tokyonight',
    lazy = true,
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

