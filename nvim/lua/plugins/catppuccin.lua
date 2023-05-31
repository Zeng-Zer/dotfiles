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
          which_key = { enabled = true, border = false },
          telescope = true,
          gitsigns = true,
          cmp = true,
          nvimtree = true,
          harpoon = true,
          mason = true,
          treesitter = true,
          noice = true,
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { "undercurl" },
              hints = { "undercurl" },
              warnings = { "undercurl" },
              information = { "undercurl" },
            },
          },
        },
      })
    end
  },
}
