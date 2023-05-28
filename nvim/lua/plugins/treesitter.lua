return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
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
