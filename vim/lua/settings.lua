-- See `:help vim.o`

-- set highlight on search
vim.o.hlsearch = false

-- make line numbers default
vim.wo.number = true

-- enable break indent
vim.o.breakindent = true

-- save undo history
vim.o.undofile = true

-- case insensitive search
vim.o.ignorecase = true
vim.o.smartcase = true

-- decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- 2 spaces tabs
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- colorscheme
vim.o.termguicolors = true
vim.cmd [[ colorscheme onedark ]]

-- set completeopt for completion
vim.o.completeopt = 'menuone,noselect'

-- set right column
vim.o.colorcolumn = "80"
vim.cmd [[ highlight ColorColumn ctermbg=0 guibg=lightgrey ]]

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
