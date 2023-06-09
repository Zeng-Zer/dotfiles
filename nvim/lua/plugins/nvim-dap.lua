return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-telescope/telescope-dap.nvim",
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/cmp-dap",
      "LiadOz/nvim-dap-repl-highlights",
    },
    config = function()
      local dap = require("dap")
      dap.adapters.dart = {
        type = "executable",
        command = "node",
        args = {"~/Dev/Dart-Code/out/dist/debug.js", "flutter"}
      }
      dap.configurations.dart = {
        {
          type = "dart",
          request = "launch",
          name = "Launch flutter",
          dartSdkPath = "/opt/homebrew/opt/dart/libexec",
          flutterSdkPath = "/opt/homebrew/Caskroom/flutter/3.10.1/flutter",
          program = "${workspaceFolder}/lib/main.dart",
          cwd = "${workspaceFolder}",
        }
      }

      require("nvim-dap-virtual-text").setup({
        enabled = true,
        all_references = true,
        show_stop_reason = true,
      })

      require("dapui").setup({
        floating = {
          border = "rounded",
        }
      })

      local macchiato = require("catppuccin.palettes").get_palette "macchiato"
      local sign = vim.fn.sign_define
      local set_hl = vim.api.nvim_set_hl

      set_hl(0, "DapBreakpointRejectedTexthl", { fg = macchiato.peach })
      set_hl(0, "DapStoppedTexthl", { fg = macchiato.yellow })
      set_hl(0, "DapStoppedLinehl", { bg = macchiato.surface0 })
      sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
      sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
      sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})
      sign('DapBreakpointRejected', { text = '●', texthl = 'DapBreakpointRejectedTexthl', linehl = '', numhl = '' })
      sign('DapStopped', { text = '', texthl = 'DapStoppedTexthl', linehl = 'DapStoppedLinehl', numhl = '' })

      require("cmp").setup({
        enabled = function()
          return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
            or require("cmp_dap").is_dap_buffer()
        end
      })

      require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
        sources = {
          { name = "dap" },
        },
      })

      require('nvim-dap-repl-highlights').setup()
    end
  },
}
