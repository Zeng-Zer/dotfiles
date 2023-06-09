return {
  {
    'akinsho/flutter-tools.nvim',
    ft = { 'dart' },
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim',
      "neovim/nvim-lspconfig",
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = function()
      local on_attach = function()
        local api = vim.api
        local toggle_log = function()
          local wins = api.nvim_list_wins()

          for _, id in pairs(wins) do
            local bufnr = api.nvim_win_get_buf(id)
            if api.nvim_buf_get_name(bufnr):match '.*/([^/]+)$' == '__FLUTTER_DEV_LOG__' then
              return vim.api.nvim_win_close(id, true)
            end
          end

          pcall(function()
            vim.api.nvim_command 'sb + __FLUTTER_DEV_LOG__ | resize 15'
          end)
        end
        vim.keymap.set("n", "<leader>rl", toggle_log, { desc = "Flutter tools: Toggle Dev Log" })
      end

      require("flutter-tools").setup({
        dev_log = {
          enabled = true,
          open_cmd = "15new",
        },
        debugger = {
          enabled = true,
          run_via_dap = true,
          exception_breakpoints = {},
        },
        lsp = {
          color = { -- show the derived colours for dart variables
            enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
            background = true, -- highlight the background
            background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
            foreground = true, -- highlight the foreground
            virtual_text = true, -- show the highlight using virtual text
            virtual_text_str = "■", -- the virtual text character to highlight
          },
          on_attach = on_attach(),
          settings = {
            analysisExcludedFolders = {
              vim.fn.expand("$HOME/.pub-cache"),
              vim.fn.expand("/opt/homebrew/"),
            },
            lineLength = 100,
          }
        }
      })

      require("telescope").load_extension("flutter")
      vim.keymap.set('n', '<leader>rf', ":Telescope flutter commands<CR>", { desc = "telescope run flutter commands" })
    end
  },
  {
    "f-person/nvim-sort-dart-imports",
    ft = "dart",
  }
}
