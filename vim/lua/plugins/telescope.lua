  -- utilities
  return {
    {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      dependencies = { {'nvim-lua/plenary.nvim'} },
      keys = {
        { '<leader>sf', '<cmd>Telescope find_files<cr>', desc = '[sf] Search files' },
        { '<leader>sh', '<cmd>Telescope help_tags<cr>', desc = '[sh] Search help tags' },
        { '<leader>sw', '<cmd>Telescope grep_string<cr>', desc = '[sw] Search for current word' },
        { '<leader>sg', '<cmd>Telescope live_grep<cr>', desc = '[sg] Search using grep' },
        { '<leader>sd', '<cmd>Telescope diagnostics<cr>', desc = '[sd] Search diagnostics' },
        { '<leader>sk', '<cmd>Telescope keymaps<cr>' , desc = '[sk] Search keymaps' },
        { '<leader>sb', '<cmd>Telescope buffers<cr>', desc = '[sb] Find existing buffers' },
        { '<leader>?', '<cmd>Telescope oldfiles<cr>', desc = '[?] Find recently opened files' },
        { '<C-t>', ':Telescope file_browser default_selection_index=2<cr>' , desc = '[<C-t>] File browser' },
      },
      config = function()
        vim.keymap.set('n', '<leader>/', function()
          require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
            winblend = 10,
            previewer = false,
          })
        end, { desc = '[/] Fuzzily search in current buffer' })

        require('telescope').setup()
        require('telescope.builtin')
        require('telescope').load_extension('fzf')
        require('telescope').load_extension('file_browser')
      end,
    },

    { 'nvim-telescope/telescope-file-browser.nvim' },

    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

  }
