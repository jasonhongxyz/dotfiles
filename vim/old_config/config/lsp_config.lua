-- LSP settings

local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[<leader>rn] Rename')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[<leader>ca] Code action')

  nmap('gd', vim.lsp.buf.definition, '[gd] Go to definition')
  nmap('gD', vim.lsp.buf.declaration, '[gD] Go to declaration')
  nmap('gr', vim.lsp.buf.references, '[gr] Go to references')
  nmap('gI', vim.lsp.buf.implementation, '[gI] Go to implementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, '[<leader>D] Type definition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[<leader>ds] Document symbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_workspace_symbols, '[<leader>ws] Workspace symbols')

  nmap('K', vim.lsp.buf.hover, '[K] Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, '[<C-k>] Signature documentation')


  -- :Format command local to LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    if vim.lsp.buf.format then
      vim.lsp.buf.format()
    elseif vim.lsp.buf.formatting then
      vim.lsp.buf.formatting()
    end
  end, { desc = 'Format current buffer with LSP' })

end

require('mason').setup()

local servers = { "bashls", "pyright", "gopls", "sumneko_lua", "jdtls", "clangd", "rust_analyzer", "tsserver" }

require("mason-lspconfig").setup({
  ensure_installed = servers,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require('mason-lspconfig').setup_handlers {
  function (server_name)
    require('lspconfig')[server_name].setup{
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end,

  ['sumneko_lua'] = function ()
    require('lspconfig')['sumneko_lua'].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file('', true),
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        }
      }
    }
  end
}

