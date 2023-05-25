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
      require("flutter-tools").setup({
        lsp = {
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
