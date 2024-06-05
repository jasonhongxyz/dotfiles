return {
  {
    'neovim/nvim-lspconfig',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'j-hui/fidget.nvim',
    },
    keys = {
      { '<leader>rn', vim.lsp.buf.rename,          desc = '[<leader>rn] Rename' },
      { '<leader>ca', vim.lsp.buf.code_action,     desc = '[<leader>ca] Code action' },

      { 'gd',         vim.lsp.buf.definition,      desc = '[gd] Go to definition' },
      { 'gD',         vim.lsp.buf.declaration,     desc = '[gD] Go to declaration' },
      { 'gr',         vim.lsp.buf.references,      desc = '[gr] Go to references' },
      { 'gI',         vim.lsp.buf.implementation,  desc = '[gI] Go to implementation' },
      { '<leader>D',  vim.lsp.buf.type_definition, desc = '[<leader>D] Type definition' },
      -- { '<leader>ds', '<cmd>Telescope lsp_document_symbols<cr>', desc = '[<leader>ds] Document symbols' },
      -- { '<leader>ws', '<cmd>Telescope lsp_workspace_symbols<cr>', desc = '[<leader>ws] Workspace symbols' },

      { 'K',          vim.lsp.buf.hover,           desc = '[K] Hover Documentation' },
      { '<C-k>',      vim.lsp.buf.signature_help,  desc = '[<C-k>] Signature documentation' },
    },
    -- config = get_config('lsp_config'),
    config = function()
      local on_attach = function(_, bufnr)
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

      local servers = { "bashls", "pyright", "gopls", "lua_ls", "jdtls", "clangd", "rust_analyzer", "tsserver", "astro" }

      require("mason-lspconfig").setup({
        ensure_installed = servers,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      require'lspconfig'.sourcekit.setup{
        cmd = {'/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp'}
      }

      require('mason-lspconfig').setup_handlers {
        function(server_name)
          require('lspconfig')[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities,
          }
        end,

        ['lua_ls'] = function()
          require('lspconfig')['lua_ls'].setup {
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
        end,

        ['rust_analyzer'] = function()
          capabilities.textDocument.completion.completionItem.resolveSupport = {
            properties = { "documentation", "detail", "additionalTextEdits" },
          }
          require('lspconfig')['rust_analyzer'].setup {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
              ['rust-analyzer'] = {
                imports = {
                  granularity = {
                    group = "module",
                  },
                  prefix = "self",
                },
                cargo = {
                  buildScripts = {
                    enable = true,
                  },
                },
                procMacro = {
                  enable = true
                },
                -- inlayHints = {
                --   typeHints = {
                --     enable = true,
                --   },
                -- },
              }
            },
          }
        end,

        ['clangd'] = function()
          require('lspconfig')['clangd'].setup {
            on_attach = on_attach,
            filetypes = { "c", "cpp", "objc", "objcpp", "cuda"},
          }
        end
      }
    end,
  },

  {
    'ray-x/lsp_signature.nvim',
    config = function()
      require('lsp_signature').setup()
    end,
  },

  -- autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function(_, opts)
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'

      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local config = {
        preselect = cmp.PreselectMode.None,
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-d>'] = cmp.mapping.scroll_docs( -4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<C-h>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              local entry = cmp.get_selected_entry()
              if not entry then
                cmp.select_next_item()
              else
                cmp.confirm()
              end
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'lsp_signature' },
        }),
      }

      cmp.setup(config)
    end,
  },

}
