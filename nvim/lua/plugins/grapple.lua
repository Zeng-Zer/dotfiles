return {
  {
    "cbochs/grapple.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    config = function()
      require("grapple").setup({
        scope = require("grapple").resolvers.git,
        popup_options = {
          border = "rounded",
        },
      })
    end
  }
}
