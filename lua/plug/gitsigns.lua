return {
  'lewis6991/gitsigns.nvim',

  keys = {
    { '<up>', function() require("gitsigns").nav_hunk("prev") end },
    { '<down>', function() require("gitsigns").nav_hunk("next") end },
  },

  opts = {
    -- See `:help gitsigns.txt`

    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },

    signs_staged = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
  },
}
