return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "dart" },
        highlight = {
          enable = true, -- false will disable the whole extension
        },
        indent = {
          enable = true,
        },
        autotag = {
          enable = true,
        }
      })
    end
  }
}
