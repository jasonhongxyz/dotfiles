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
    'rust-lang/rust.vim',
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
      { "<leader>s", function() require("harpoon.mark").add_file() end, desc = "[hk] Harpoon mark"  },
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

  {
    'github/copilot.vim',
  },

  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
              },
            },
          },
        },
      }
    end,
  },
}
