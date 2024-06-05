return {
  {
    'fatih/vim-go',
  },

  {
    'rust-lang/rust.vim',
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
      { "<leader>s", function() require("harpoon.mark").add_file() end, desc = "[<leader>s] Harpoon mark"  },
      { "<C-e>", function() require("harpoon.ui").toggle_quick_menu() end, desc = "[C-e] Harpoon menu"  },
      { "<leader>n", function() require("harpoon.ui").nav_next() end, desc = "[<leader>n] Harpoon next"  },
      { "<leader>hN", function() require("harpoon.ui").nav_prev() end, desc = "[<leader>hN] Harpoon prev"  },
    },
  },

  {
    'windwp/nvim-ts-autotag',
  },

  -- {
  --   'github/copilot.vim',
  -- },

  {
    dir = '~/projects/signal.nvim',
  },

  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('mini.align').setup()
      require('mini.comment').setup()
      require('mini.pairs').setup()
      require('mini.statusline').setup()
      require('mini.surround').setup()
      -- require('mini.files').setup(
      --   {
      --     mappings = {
      --       close = '<C-[>',
      --       go_in = 'L',
      --       go_in_plus = 'l',
      --       reset = 'r',
      --     },
      --     windows = {
      --       preview = true,
      --       width_focus = 25,
      --       width_nofocus = 25,
      --       width_preview = 40,
      --     }
      --   }
      -- )

      --vim.keymap.set('n', '<C-n>', function() if not MiniFiles.close() then MiniFiles.open() end end)
    end,
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.keymap.set('n', '<leader>tt', function()
        require("trouble").toggle()
      end)
    end,
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-go",
    },
    config = function()
      local neotest = require("neotest")
      -- get neotest namespace (api call creates or returns namespace)
      local neotest_ns = vim.api.nvim_create_namespace("neotest")
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message =
              diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
          end,
        },
      }, neotest_ns)
      neotest.setup({
        -- your neotest config here
        adapters = {
          require("neotest-go"),
        },
      })

      vim.keymap.set('n', '<leader>tm', function()
        neotest.run.run()
      end)

      vim.keymap.set('n', '<leader>tf', function()
        neotest.run.run(vim.fn.expand("%"))
      end)

    end,
  },

}


