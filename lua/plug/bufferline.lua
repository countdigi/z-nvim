

return {
  'akinsho/bufferline.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  opts = { 
    options = {
      mode = 'buffers', -- set to "tabs" to only show tabpages instead
      persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
      separator_style = "thin" 
    },

    highlights = {
      background = {
	fg = '#607050',
      },
   },
  }
}
