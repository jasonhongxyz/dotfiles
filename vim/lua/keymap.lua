local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<C-n>", '<cmd>NvimTreeToggle<cr>')
map("n", "ff", '<cmd>lua require("telescope.builtin").find_files()<cr>')
map("n", "fg", '<cmd>lua require("telescope.builtin").live_grep()<cr>')
map("n", "fb", '<cmd>lua require("telescope.builtin").buffers()<cr>')
map("n", "fh", '<cmd>lua require("telescope.builtin").help_tags()<cr>')
map("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/luasnip-config.lua<cr>")

map("n", "ar", '<cmd>copen|AsyncRun ./mvnw spring-boot:run<cr>')
map("n", "aq", '<cmd>AsyncStop')

map("n", "<leader>n", ':lua require("config.scratches").open_scratch_file_floating()<CR>',
  { noremap = true, silent = true})

map("n", " b", '<cmd>:buffers<cr>:buffer<Space>')
