return {
  {
    "folke/noice.nvim",
    lazy = false,
    -- event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
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
        messages = {
          enabled = true,
          view_search = "virtualtext",
        },
        lsp = {
          progress = {
            enabled = true,
          },
          signature = {
            enabled = true,
            -- lsp_doc_border = true,
          },
        },
        views = {
          mini = {
            align = "message-left",
            position = {
              col = 0
            },
            win_options = {
              winblend = 0
            },
          }
        }
      })
    end,
  }
}
