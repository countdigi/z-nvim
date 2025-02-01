return {
  "nvim-lualine/lualine.nvim",

  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },

  opts = {
    sections = {
      lualine_c = {
        { "filename", path = 4, },
      }
    }
  },
  config = true
}
