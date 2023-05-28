return {
  {
    "mfussenegger/nvim-dap",
    dependencies = { "rcarriga/nvim-dap-ui" },
    config = function()
      local dap = require("dap")
      dap.adapters.dart = {
        type = "executable",
        command = "node",
        args = {"~/Tools/Dart-Code/out/dist/debug.js", "flutter"}
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
      require("dapui").setup()
    end
  },
}
