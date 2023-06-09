return {
  {
    -- "nvim-treesitter/nvim-treesitter",
    "Zeng-Zer/nvim-treesitter",
    -- commit = "46ddea9deccb0608df416822228786d1a5a2b7d1",
    -- dir = "~/Dev/nvim/treesitter/",
    dependencies = {
      "nvim-treesitter/playground",
    },
    build = ":TSUpdate",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "dart", "query", "dap_repl" },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        autotag = {
          enable = true,
        },
        playground = {
          enable = true,
        },
        query_linter = {
          enable = true,
          use_virtual_text = true,
          lint_events = {"BufWrite", "CursorHold"},
        },
      })
    end
  }
}
