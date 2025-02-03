return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    'hrsh7th/cmp-path',
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local cmp = require 'cmp'

    cmp.setup {
      completion = { completeopt = 'menu,menuone,noinsert' },
      mapping = cmp.mapping.preset.insert {
        ['<c-j>'] = cmp.mapping.select_next_item(),       -- Select the [n]ext item
        ['<c-k>'] = cmp.mapping.select_prev_item(),       -- Select the [p]revious item
        ['<c-c>'] = cmp.mapping.complete {},              -- Manually trigger a completion from nvim-cmp.
        ['<tab>'] = cmp.mapping.confirm { select = true },


        -- Think of <c-l> as moving to the right of your snippet expansion.
        --  So if you have a snippet that's like:
        --  function $name($args)
        --    $body
        --  end
        --
        -- <c-l> will move you to the right of each of the expansion locations.
        -- <c-h> is similar, except moving you backwards.

        -- Select next/previous item with Tab / Shift + Tab
        --
        -- ['<Tab>'] = cmp.mapping(function(fallback)
        --   if cmp.visible() then
        --     cmp.select_next_item()
        --   else
        --     fallback()
        --   end
        -- end, { 'i', 's' }),
        -- ['<S-Tab>'] = cmp.mapping(function(fallback)
        --   if cmp.visible() then
        --     cmp.select_prev_item()
        --   else
        --     fallback()
        --   end
        -- end, { 'i', 's' }),
      },

      sources = {
        { name = 'buffer' },
        { name = 'path' },
        { name = 'nvim_lsp' },
      },
    }
  end,
}

-- config = function()
--     local cmp = require("cmp")
--
--     cmp.setup({
--       completion = {
--         autocomplete = false,
--         completeopt = "menu,menuone,preview,noselect"
--       },
--       mapping = cmp.mapping.preset.insert({
--         ["<tab>"] = cmp.mapping.confirm({ select = true }),
--         ["<C-k>"] = cmp.mapping.select_prev_item(),
--         ["<C-j>"] = cmp.mapping.select_next_item(),
--       }),
--
--       sources = cmp.config.sources({
--         { name = "buffer",
--           option = {
--             keyword_pattern = [[\k\+]],
--           }
--         },
--       }),
--     })
--   end
-- }
