return {
  -- theme
  "MunifTanjim/nui.nvim",
  { "rebelot/kanagawa.nvim", event = "VeryLazy" },
  { "NvChad/nvim-colorizer.lua", ft = { "css" } },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    event = "VeryLazy",
    config = function(_, opts)
      require("catppuccin").setup({
        integrations = {
          which_key = true,
          telescope = true,
        }
      })
    end
  },
  -- editor
  {
    "ThePrimeagen/harpoon",
    lazy = false,
  },
  {
    "windwp/nvim-autopairs",
    lazy = false,
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,
        ts_config = {
          lua = { "string" },
          javascript = { "template_string" },
          java = false,
        }
      })
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end
  },
  {
    "windwp/nvim-ts-autotag",
    lazy = false
  },
  { "szw/vim-maximizer", lazy = false }, -- maximizes and restores current window
  { "tpope/vim-surround", lazy = false },
  { "vim-scripts/ReplaceWithRegister", lazy = false },
  {
    "folke/which-key.nvim",
    lazy = false,
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
      require("which-key").setup()
    end,
  },
  "j-hui/fidget.nvim",
  -- coding
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    config = function()
      require("gitsigns").setup()
    end
  },
  { "github/copilot.vim", lazy = false },
  {
    "mbbill/undotree",
    cmd = { "UndotreeShow", "UndotreeToggle", "UndotreeHide", "UndotreeFocus" },
  },
  -- misc
  { "christoomey/vim-tmux-navigator", lazy = false },
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },
}
