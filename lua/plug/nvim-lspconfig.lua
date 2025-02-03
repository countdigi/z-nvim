return {
  "neovim/nvim-lspconfig",
  config = function()
    require('lspconfig').pyright.setup{
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
  end,
}
