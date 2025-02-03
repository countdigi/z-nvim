return {
  'nvim-treesitter/nvim-treesitter',

  build = ':TSUpdate',

  opts = {
    ensure_installed = {
      'bash',
      'json',
      'lua',
      'make',
      'markdown',
      'markdown_inline',
      'python',
      'regex',
      'toml',
      'vim',
      'vimdoc',
      'yaml',
    },
    highlight = { enable = true },
    indent = { enable = true },
  },

  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
  end,
}
