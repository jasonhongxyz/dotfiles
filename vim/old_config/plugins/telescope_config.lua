local config = {
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    initial_mode = "normal",
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
    file_browser = {
      theme = "dropdown",
    },
  }
}

vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[sf] Search files' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[sh] Search help tags' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[sw] Search for current word' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[sg] Search using grep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[sd] Search diagnostics' })
vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps , { desc = '[sk] Search keymaps' })
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[sb] Find existing buffers' })
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<C-t>', ':Telescope file_browser default_selection_index=2<cr>' , { desc = '[<C-t>] File browser' })

require('telescope').setup(config)

require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')

