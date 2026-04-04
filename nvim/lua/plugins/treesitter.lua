return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/playground",
    },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "dart",
          "query",
          "markdown",
          "markdown_inline",
          "html",
          "css",
          "javascript",
          "typescript",
          "tsx",
          "json",
          "lua"
        },
        highlight = { enable = true, },
        indent = { enable = true, },
        autotag = { enable = true, },
        playground = { enable = true, },
        query_linter = {
          enable = true,
          use_virtual_text = true,
          lint_events = {"BufWrite", "CursorHold"},
        },
      })
    end
  }
}

