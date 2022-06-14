local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local function copy(args)
	return args[1]
end

local function prequire(...)
local status, lib = pcall(require, ...)
if (status) then return lib end
    return nil
end

local luasnip = prequire('luasnip')
local cmp = prequire("cmp")

local term = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

_G.ck_complete = function()
    if luasnip and luasnip.expand_or_jumpable() then
        return term("<Plug>luasnip-expand-or-jump")
    elseif check_back_space() then
        return term "<C-k>"
    else
        cmp.complete()
    end
    return ""
end

_G.cj_previous = function()
    if luasnip and luasnip.jumpable(-1) then
        return term("<Plug>luasnip-jump-prev")
    else
        return term "<C-j>"
    end
    return ""
end

vim.api.nvim_set_keymap("i", "<C-k>", "v:lua.ck_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<C-k>", "v:lua.ck_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<C-j>", "v:lua.cj_previous()", {expr = true})
vim.api.nvim_set_keymap("s", "<C-j>", "v:lua.cj_previous()", {expr = true})
vim.api.nvim_set_keymap("i", "<C-l>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-l>", "<Plug>luasnip-next-choice", {})


ls.config.set_config({
	history = true,
	update_events = "TextChanged,TextChangedI",
})

ls.add_snippets(nil, {
  all = {
	-- trigger is `fn`, second argument to snippet-constructor are the nodes to insert into the buffer on expansion.
	s("paramtest", {
		-- Simple static text.
		t("//Parameters: "),
		-- function, first parameter is the function, second the Placeholders
		-- whose text it gets as input.
		f(copy, 2),
		t({ "", "function " }),
		-- Placeholder/Insert.
		i(1),
		t("("),
		-- Placeholder with initial text.
		i(2, "int foo"),
		-- Linebreak
		t({ ") {", "\t" }),
		-- Last Placeholder, exit Point of the snippet.
		i(0),
		t({ "", "}" }),
	}),
  s("req", fmt("local {} = require('{}')", {i(1), rep(1)} ))
}})
