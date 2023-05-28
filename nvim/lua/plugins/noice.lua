return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      {"MunifTanjim/nui.nvim", lazy = false},
    },
    config = function()
      require("noice").setup({
        cmdline = {
          enabled = true,
          view = "cmdline",
          format = {
            search_down = false,
            search_up = false,
            help = false,
          },
        },
        lsp = {
          progress = {
            enabled = true,
          },
          signature = {
            enabled = false,
          },
        },
        views = {
          mini = {
            win_options = {
              winblend = 0
            },
          }
        }
      })
    end,
  }
}
