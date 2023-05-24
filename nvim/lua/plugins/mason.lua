return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
      })
    end
  },
}
