return {
  {
    "williamboman/mason.nvim",
    -- cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
    lazy = false,
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason-lspconfig.nvim",
      { "folke/neodev.nvim", opts = {} }
    },
    config = function()
      require("neodev").setup({
        library = {
          plugins = {
            "nvim-dap-ui"
          },
          types = true
        },
      })

      require("mason").setup({
        ui = {
          border = "rounded",
        }
      })
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

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help, {
          border = "rounded",
          silent = true,
          focusable = false
        }
      )

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover, {
          border = "rounded",
          -- add the title in hover float window
          title = ""
        }
      )
    end
  },
}
