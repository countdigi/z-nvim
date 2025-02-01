------------------------------------------------------------------------------------------------------
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
------------------------------------------------------------------------------------------------------

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

------------------------------------------------------------------------------------------------------
-- Install package manager
------------------------------------------------------------------------------------------------------

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    '--filter=blob:none',
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  require 'plug.gitsigns',
  require 'plug.lualine',
  require 'plug.nvim-lastplace',
  require 'plug.telescope',
  require 'plug.theme-nord',
  require 'plug.treesitter',
})

------------------------------------------------------------------------------------------------------

vim.opt.number = true
vim.opt.relativenumber = true

------------------------------------------------------------------------------------------------------

vim.keymap.set("n", "<leader><tab>", ":bnext<enter>")

vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")
vim.keymap.set("n", "<leader>o", "<C-w>o")

vim.keymap.set("n", "<C-j>", "20jz.")
vim.keymap.set("n", "<C-k>", "20kz.")
vim.keymap.set("n", "q", "<nop>")

------------------------------------------------------------------------------------------------------

-- require(themes[env_var_nvim_theme]),
-- require 'plugins.telescope',
-- require 'plugins.treesitter',
-- require 'plugins.lsp',
-- require 'plugins.autocompletion',
-- require 'plugins.none-ls',
-- require 'plugins.lualine',
-- require 'plugins.bufferline',
-- require 'plugins.neo-tree',
-- require 'plugins.alpha',
-- require 'plugins.indent-blankline',
-- require 'plugins.lazygit',
-- require 'plugins.comment',
-- require 'plugins.debug',
-- require 'plugins.gitsigns',
-- require 'plugins.database',
-- require 'plugins.misc',
-- require 'plugins.harpoon',


-- require "u/options"
-- require "u/lazy"
-- require "u/keymaps"
-- require "u/autocommands"
--
-- require("lualine").setup {
--   options = {
--     theme = "codedark",
--   }
-- }
--
-- vim.cmd([[
--   highlight! link @markup.raw Special
--   highlight! link @string.special Title
--   highlight! link @markup.raw.ledger Title
-- ]])


-- vim.treesitter.query.set("snakemake", "injections", [[
-- ;; extends
-- (directive @label (#any-of? @label "shell")
--   )
-- )
-- ]])
--
-- ((wildcard
--   (identifier) @label)
--   (#any-of? @label "input" "log" "output" "params" "resources" "threads" "wildcards"))
--
--       (directive ; [209, 4] - [231, 11]
--         arguments: (directive_parameters ; [209, 10] - [231, 11]
--           (string ; [210, 8] - [231, 11]

-- (shebang_recipe
--   (shebang_body) @injection.content (#set! injection.language "bash"))


-- vim.cmd([[
--   highlight clear
--   highlight Number      ctermfg=Grey  ctermbg=None
--   highlight String      ctermfg=250    ctermbg=None
--   highlight Comment     ctermfg=245   ctermbg=None
--   highlight Statement   ctermfg=28   ctermbg=None
--   highlight @variable   ctermfg=76    ctermbg=None
--   highlight Normal      ctermfg=None  ctermbg=None cterm=None gui=None
--   highlight Colorcolumn ctermfg=None  ctermbg=235   cterm=None
--   highlight Cursorline  ctermfg=None  ctermbg=235   cterm=None gui=None
--   highlight Special     ctermfg=110  ctermbg=None
--
--   highlight link StatusLine  Normal
--   highlight link StatuslineNC Normal
--   highlight link TablineFill Normal
-- ]])

--
--
--

-- vim.cmd([[
-- highlight PreProc guifg=green
-- highlight Special guifg=green
-- ]])
