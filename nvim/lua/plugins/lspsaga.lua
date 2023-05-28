return {
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "catppuccin/nvim",
      --Please make sure you install markdown and markdown_inline parser
      "nvim-treesitter/nvim-treesitter"
    },
    config = function()
      require("lspsaga").setup({
        ui = {
          kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
        },
        code_action = {
          num_shortcut = true,
          show_server_name = false,
          extend_gitsigns = false,
          keys = {
            -- string | table type
            quit = { "q", "<ESC>" },
            exec = "<CR>",
          },
        },
        finder = {
          max_height = 0.5,
          min_width = 30,
          force_max_height = false,
          keys = {
            jump_to = 'p',
            expand_or_jump = 'o',
            vsplit = 's',
            split = 'i',
            tabe = 't',
            tabnew = 'r',
            quit = { 'q', '<ESC>' },
            close_in_preview = '<ESC>',
          },
        },
        lightbulb = {
          enable = false,
        },
        symbol_in_winbar = {
          enable = false,
        },
        diagnostic = {
          on_insert = false,
          on_insert_follow = false,
          insert_winblend = 0,
          show_code_action = true,
          show_source = true,
          jump_num_shortcut = true,
          max_width = 0.7,
          max_height = 0.6,
          max_show_width = 0.9,
          max_show_height = 0.6,
          text_hl_follow = true,
          border_follow = true,
          extend_relatedInformation = false,
          keys = {
            exec_action = 'o',
            quit = 'q',
            expand_or_jump = '<CR>',
            quit_in_show = { 'q', '<ESC>' },
          },
        },
        rename = {
          quit = '<ESC>',
          exec = "<CR>",
          mark = "x",
          confirm = "<CR>",
          in_select = true,
        },
      })
    end
  },
}
