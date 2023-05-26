return {
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
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
        lsp = {
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
    end
  }
}
