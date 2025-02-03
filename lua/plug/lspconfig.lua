return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        }
      }
    }
  },

  config = function()
    require('lspconfig').basedpyright.setup {
      cmd = {'/home/countskm/.local/share/mamba/bin/basedpyright-langserver', '--stdio'},
      settings = {
        basedpyright = {
          typeCheckingMode = 'standard',
        }
      },
      on_attach = function()
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer = true})
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer = true})
        vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, {buffer = true})
        vim.keymap.set('n', 'gc', vim.lsp.buf.incoming_calls, {buffer = true})
        vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, {buffer = true})
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, {buffer = true})
        vim.keymap.set('n', 'gn', vim.lsp.buf.rename, {buffer = true})
      end,
    }
    --
    -- require('lspconfig').ruff.setup {
    --   cmd = {'/home/countskm/.local/share/mamba/bin/ruff', 'server'},
    -- }
    --
    require('lspconfig').lua_ls.setup {
      cmd = {'/home/countskm/opt/lua-language-server/3.13.5/bin/lua-language-server'},
      -- on_init = function(client)
      --   client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      --     runtime = {
      --       version = 'LuaJIT'
      --     },
      --     workspace = {
      --       checkThirdParty = false,
      --       library = {
      --        vim.env.VIMRUNTIME 
      --     }
      --     }
      --   })
      -- end
    }
  end
}

-- function M.setup(on_attach)
--   require('lspconfig').pyright.setup({
--     on_attach = on_attach,
--     flags = { debounce_text_changes = 150 },
--     root_dir = util.root_pattern('.venv', 'venv', 'pyrightconfig.json'),
--     settings = {
--       pyright = { disableLanguageServices = false, disableOrganizeImports = true },
--       python = {
--         analysis = {
--           useLibraryCodeForTypes = true,
--           diagnosticMode = 'openFilesOnly',
--         },
--       },
--     },
--   })
-- end
--
--
-- :lua vim.print(vim.lsp.get_active_clients({name = 'ruff'})[1].server_capabilities)
--
-- :lua vim.lsp.buf.code_action{context = { only = { 'source.fixAll.ruff' }, apply = true }}
