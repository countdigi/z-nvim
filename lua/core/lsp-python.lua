local launch_ruff_server = function()
  local autocmd

  local filetypes = {
    'python',
  }

  local config = {
    cmd = {'/home/countskm/.local/share/mamba/bin/ruff', 'server'},
    name = 'ruff_server',
    root_dir = vim.fn.getcwd(),
    capabilities = vim.lsp.protocol.make_client_capabilities(),
  }

  config.on_init = function(client, results)
    local buf_attach = function()
    vim.lsp.buf_attach_client(0, client.id)

    vim.print(client)
    vim.print(results)

  end

  autocmd = vim.api.nvim_create_autocmd('FileType', {
    desc = string.format('Attach LSP: %s', client.name),
    pattern = {'python'},
    callback = buf_attach
  })

  if vim.v.vim_did_enter == 1 and
    vim.tbl_contains(filetypes, vim.bo.filetype)
    then
      buf_attach()
    end
  end

  config.on_exit = vim.schedule_wrap(function(code, signal, client_id)
    vim.api.nvim_del_autocmd(autocmd)
  end)

  vim.lsp.start_client(config)
end

vim.api.nvim_create_user_command(
  'LaunchRuff',
  launch_ruff_server,
  {desc = 'Start ruff_server'}
)


-- 
-- print(ruff_root)
-- print(ruff_bin)
-- print(ruff_cmd)
-- 
-- 
-- client_id = vim.lsp.start({
--   name = 'ruff',
--   cmd = ruff_cmd,
--   root_dir = ruff_root, 
-- })
-- 
-- print(client_id)
-- 
-- 
-- -- vim.lsp.buf_attach_client(0, 1)
-- 
-- 
-- --   root_dir = vim.fs.dirname(
-- --     vim.fs.find({'setup.py', 'pyproject.toml'}, { upward = true })[1]
-- --   ),
-- -- })
-- 
-- 
-- -- Start a language server process and create a client for that language server.
-- -- “Attach” the client to a buffer. Once this has been done, many features are available:
--   -- Display method documentation in a floating window.
--   -- Show errors from the language server in line with your code, or in a separate window.
--   -- Jump to definitions, show references.
--   -- Show LSP-driven smart autocomplete using Neovim’s omni-completion.
--   -- Format the buffer using the language server.
--   -- Show available “code actions” — generally refactorings.
