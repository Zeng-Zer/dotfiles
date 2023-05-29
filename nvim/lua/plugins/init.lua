-- TODO require config from separate files
return {
  -- theme
  "MunifTanjim/nui.nvim",
  { "rebelot/kanagawa.nvim", event = "VeryLazy" },
  { "NvChad/nvim-colorizer.lua", ft = { "css" } },
  -- editor
  {
    "ThePrimeagen/harpoon",
  },
  {
    "nvim-zh/colorful-winsep.nvim",
    event = { "WinNew" },
    config = function()
      local winsep = require("colorful-winsep")
      winsep.setup({
        highlight = {
          fg = "#5c5e6b",
        },
        create_event = function()
          local win_n = require("colorful-winsep.utils").calculate_number_windows()
          if win_n == 2 then
            local win_id = vim.fn.win_getid(vim.fn.winnr('h'))
            local filetype = vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(win_id), 'filetype')
            if filetype == "NvimTree" then
              winsep.NvimSeparatorDel()
            end
          end
        end
      })
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
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
  {
    "folke/which-key.nvim",
    lazy = false,
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
      require("which-key").setup({
        window = {
          border = "single"
        }
      })
    end,
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
