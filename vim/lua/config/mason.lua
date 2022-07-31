require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }

})

local all_servs = { "bashls", "pyright", "gopls", "sumneko_lua", "jdtls", "ccls", "rust_analyzer", "tsserver"}

require("mason-lspconfig").setup({
  ensure_installed = all_servs,
  automatic_installation = true,
})

for _, lsp in pairs (all_servs) do
  if lsp == 'sumneko_lua' then
    require ('lspconfig')[lsp].setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    }
  else require ('lspconfig')[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
  end
end
