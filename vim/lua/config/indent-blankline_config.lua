vim.opt.list = true
vim.opt.listchars:append "eol:↴"

require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = true,
  show_end_of_line = true,
}
