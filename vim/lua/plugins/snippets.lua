local ls = require"luasnip"
local extras = require"luasnip.extras.fmt"

local snippet = ls.snippet
local textn = ls.text_node
local insertn = ls.insert_node
local fmt = extras.fmt
-- local snippetn = ls.snippet_node

ls.add_snippets("all", {
  snippet("test", { textn("--this is a test") } ),
  snippet("lf", fmt("local {} = function({})\n {}\nend", { insertn(1), insertn(2) , insertn(0)}) ),
  snippet("lol", fmt("local {} = function({})\n {}\nend", { insertn(1), insertn(2) , insertn(0)}) ),
})

return {
  {
	  "L3MON4D3/LuaSnip",
	  version = "v2.*",
	  build = "make install_jsregexp",
    lazy = false,
    keys = {
      { "<leader><leader>s", "<cmd>so %<cr>", desc = "Source current file"},
    },
    config = function()
      vim.keymap.set({"i", "s"}, "<c-s>", function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end, { silent = true })
    end,
  }
}

