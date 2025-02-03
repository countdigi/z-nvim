return {
  'nvim-telescope/telescope.nvim',

  branch = '0.1.x',

  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-frecency.nvim"},
  },

  init = function()
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("frecency")
  end,

  keys = {
    { '<leader>fb', function() require('telescope.builtin').buffers() end },
    { '<leader>ff', function() require('telescope.builtin').find_files() end },
    { '<leader>fg', function() require('telescope.builtin').live_grep() end },
    { '<leader>fh', function() require('telescope.builtin').help_tags() end },
    { '<leader>fm', function() require('telescope').extensions.frecency.frecency {} end },
    { '<leader>fr', function() require('telescope.builtin').find_files({ no_ignore = true }) end },
    { '<leader>fs', function() require('telescope.builtin').current_buffer_fuzzy_find() end },
  },

  opts = { 
    -- The table will be passed to the Plugin.config() function

    defaults = {
      layout_strategy = "vertical",
      layout_config = { height=0.99, width=0.99 },
      mappings = {
        i = {
          ["<C-k>"] = "move_selection_previous",
          ["<C-j>"] = "move_selection_next",
        }
      }
    },

    pickers = {
      find_files = { previewer = true },
    },

    extensions = {
      fzf = {
       fuzzy = true,                    -- false will only do exact matching
       override_generic_sorter = true,  -- override the generic sorter
       override_file_sorter = true,     -- override the file sorter
       case_mode = "smart_case",        -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
      },
      frecency = {
        ignore_patterns = { '*/nvim/*' },
        show_scores = true,
      }
    },
  },
}
