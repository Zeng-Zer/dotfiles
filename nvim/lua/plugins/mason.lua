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
        ensure_installed = {
          "lua_ls"
        },
      })

      local lspconfig = require("lspconfig")

      require("mason-lspconfig").setup_handlers {
        -- This is a default handler that will be called for each installed server (also for new servers that are installed during a session)
        function (server_name)
          lspconfig[server_name].setup {}
        end,
        ["lua_ls"] = function(_)
          lspconfig.lua_ls.setup({
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
              }
            }
          })
        end,
        ["rust_analyzer"] = function(_)
          lspconfig.rust_analyzer.setup({
          })
        end,
      }
    end
  },
}
