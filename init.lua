------------------------------------------------------------------------------------------------------
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
------------------------------------------------------------------------------------------------------

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

------------------------------------------------------------------------------------------------------
-- Install package manager
------------------------------------------------------------------------------------------------------

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.uv.fs_stat(lazypath) then
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
  require 'plug.bufferline',
  require 'plug.hop',
  require 'plug.lspconfig',
  require 'plug.nvim-cmp',
  -- require 'plug.trouble',
})

------------------------------------------------------------------------------------------------------

vim.opt.autoindent = true -- copy indent from current line when starting new one
vim.opt.backspace = 'indent,eol,start' -- allow backspace on
vim.opt.backup = false
vim.opt.breakindent = true
vim.opt.clipboard = {'unnamedplus'}
vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.opt.completeopt = {'menuone', 'longest'}
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.cursorline = false -- highlight the current line
vim.opt.fileencoding = 'utf-8' -- the encoding written to a file
vim.opt.formatoptions:remove { 'c', 'r', 'o' }
vim.opt.hlsearch = false -- Set highlight on search
vim.opt.ignorecase = true
vim.opt.iskeyword:append '-' -- hyphenated words recognized by searches
vim.opt.linebreak = true -- companion to wrap don't split words
vim.opt.number = true
vim.opt.numberwidth = 3
vim.opt.pumheight = 62 -- pop up menu height
vim.opt.relativenumber = true
vim.opt.scrolloff = 4 -- minimal number of screen lines to keep above and below the cursor
vim.opt.shortmess:append 'c' -- don't give |ins-completion-menu| messages
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 2 -- always show tabs
vim.opt.sidescrolloff = 8 -- minimal number of screen columns either side of cursor if wrap is `false`
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.undofile = true
vim.opt.whichwrap = 'bs<>[]hl' -- which "horizontal" keys are allowed to travel to prev/next line
vim.opt.wrap = true
vim.opt.writebackup = false -- if file edited by another

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

-- vim.o.whichwrap = 'bs<>[]hl' -- which "horizontal" keys are allowed to travel to prev/next line
-- vim.o.updatetime = 250 -- Decrease update time
-- vim.o.timeoutlen = 300 -- time to wait for a mapped sequence to complete (in milliseconds)
-- vim.opt.runtimepath:remove '/usr/share/vim/vimfiles' -- separate vim plugins from neovim in case vim still in use

------------------------------------------------------------------------------------------------------

vim.keymap.set('n', '<leader><tab>', ':bnext<enter>')

vim.keymap.set('n', '<leader>h', '<C-w>h')
vim.keymap.set('n', '<leader>j', '<C-w>j')
vim.keymap.set('n', '<leader>k', '<C-w>k')
vim.keymap.set('n', '<leader>l', '<C-w>l')
vim.keymap.set('n', '<leader>o', '<C-w>o')

vim.keymap.set('n', '<C-j>', '20jz.')
vim.keymap.set('n', '<C-k>', '20kz.')
vim.keymap.set('n', 'q', '<nop>')

vim.keymap.set('n', '<right>', '<cmd>cnext<cr>')
vim.keymap.set('n', '<left>', '<cmd>cprev<cr>')


-- vim.keymap.set('n', 'grn', vim.lsp.buf.rename)
-- vim.keymap.set('n', 'gra', vim.lsp.buf.code_action)
-- vim.keymap.set('n', 'grr', vim.lsp.buf.references)

------------------------------------------------------------------------------------------------------
-- autocommands
------------------------------------------------------------------------------------------------------

local mygrp = vim.api.nvim_create_augroup('mygrp', {clear = true})

vim.api.nvim_create_autocmd({'BufWritePre'}, {
  -- remove trailing whitespace from all lines before saving a file
  group = mygrp,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd({'TextYankPost'}, {
  group    = mygrp,
  pattern  = '*',
  callback = function() vim.highlight.on_yank{timeout=1000} end
})


------------------------------------------------------------------------------------------------------

-- require(themes[env_var_nvim_theme]),
-- require 'plugins.telescope',
-- require 'plugins.treesitter',
-- require 'plugins.lsp',
-- require 'plugins.autocompletion',
-- require 'plugins.none-ls',
-- require 'plugins.lualine',
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
