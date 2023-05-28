return {
  {
    "zbirenbaum/copilot.lua",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()

      -- close cmp when accepting suggestion
      local cmp = require("cmp")
      local suggestion = require("copilot.suggestion")
      local accept_suggest_close_cmp = function()
        if suggestion.is_visible() then
          suggestion.accept()
          if cmp.visible() then
            cmp.abort()
          end
        end
      end
      -- map <C-f> like fish shell
      vim.keymap.set("i", "<C-f>", accept_suggest_close_cmp, {
        desc = "[copilot] accept suggestion",
        silent = true,
      })

      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = false
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            -- accept = "<C-f>",
            accept = false,
            accept_word = "<C-w>",
            accept_line = "<C-l>",
            next = "<C-n>",
            prev = "<C-p>",
            dismiss = "<C-c>",
          },
        },
        filetypes = {
          lua = true,
          dart = true,
          rust = true,
          javascript = true,
          typescript = true,
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = 'node', -- Node.js version must be > 16.x
      })
    end,
  },
}
