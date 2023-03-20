-- code

return {
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },

  {
    'fatih/vim-go',
  },

  {
    'godlygeek/tabular',
  },

  {
    'preservim/vim-markdown',
    config = function()
      vim.cmd( [[ let g:vim_markdown_folding_disabled = 1 ]] )
    end,
  },

  {
    'iamcco/markdown-preview.nvim',
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreview<cr>", desc = "[mp] MarkdownPreview" },
    },
    ft = "markdown",
  },

  {
    'ThePrimeagen/harpoon',
    keys = {
      { "<leader>a", function() require("harpoon.mark").add_file() end, desc = "[hk] Harpoon mark"  },
      { "<C-e>", function() require("harpoon.ui").toggle_quick_menu() end, desc = "[hm] Harpoon menu"  },
      { "<leader>n", function() require("harpoon.ui").nav_next() end, desc = "[hn] Harpoon next"  },
      { "<leader>hN", function() require("harpoon.ui").nav_prev() end, desc = "[hN] Harpoon prev"  },
    },
  },

  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end,
  },

  {
    'windwp/nvim-ts-autotag',
  },
}
