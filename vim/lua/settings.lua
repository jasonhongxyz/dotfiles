local opt = vim.opt
local g = vim.g

opt.updatetime = 300

-- sidebar
opt.number = true
opt.relativenumber = true
opt.colorcolumn = "80"

-- search
opt.ignorecase = true
opt.smartcase = true

-- tabs
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- background
opt.background = "dark"

-- colors
-- g.dracula_italic = 0
-- vim.cmd [[ colorscheme dracula ]]
-- g.termguicolors = true
-- g.tokyonight_style = "night"
-- g.tokyonight_italic_comments = false
-- g.tokyonight_italic_keywords = false
-- g.tokyonight_italic_functions = false
-- g.tokyonight_italic_variables = false
vim.g.catppuccin_flavor = ""
vim.cmd [[ colorscheme catppuccin]]
-- vim.cmd [[ colorscheme tokyonight ]]

-- plugins settings

-- go
g.go_doc_popup_window = 1

-- vimwiki
g.vimwiki_list = { { path = '~/projects/knowledge/src/', syntax = 'markdown', ext = '.md',
                          nested_syntaxes = { python = 'python' } , auto_tags = 1 } }
g.vimwiki_global_ext = 0

-- nvimtree
g.nvim_tree_group_empty = 1

-- codefmt
vim.api.nvim_create_autocmd("VimEnter", { command = "call glaive#Install()", group = group})
vim.api.nvim_create_autocmd("VimEnter", { command = "Glaive codefmt plugin[mappings]", group = group})
vim.api.nvim_create_autocmd("VimEnter", { command = 'Glaive codefmt google_java_executable="java -jar /Users/jasonhong/Downloads/google-java-format-1.15.0-all-deps.jar"'})

g.asyncrun_open = 8

vim.cmd [[ highlight ColorColumn ctermbg=0 guibg=lightgrey ]]
