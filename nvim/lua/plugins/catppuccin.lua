return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato",
        transparent_background = true,
        integrations = {
          which_key = true,
          telescope = true,
          gitsigns = true,
          cmp = true,
          nvimtree = true,
          harpoon = true,
          mason = true,
          treesitter = true,
          native_lsp = {
            enabled = true,
            -- virtual_text = {
            --   errors = { "italic" },
            --   hints = { "italic" },
            --   warnings = { "italic" },
            --   information = { "italic" },
            -- },
            underlines = {
              errors = { "undercurl" },
              hints = { "undercurl" },
              warnings = { "undercurl" },
              information = { "undercurl" },
            },
          },
        },
        -- highlight_overrides = {
        --   macchiato = function(macchiato)
        --     return {
        --       NvimTreeNormal = { bg = macchiato.none },
        --     }
        --   end,
        -- },
      })
    end
  },
}
