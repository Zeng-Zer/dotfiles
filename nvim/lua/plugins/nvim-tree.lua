return {
  {
    "nvim-tree/nvim-tree.lua",
    lazy = true,
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeClose" },
    event = { "BufWinEnter" },
    config = function()
      local function my_on_attach(bufnr)
        local api = require('nvim-tree.api')

        -- quit nvim if nvim is last opened buffer
        vim.api.nvim_create_autocmd("QuitPre", {
          callback = function()
            require("noice.message.router").disable()

            local invalid_win = {}
            local wins = vim.api.nvim_list_wins()
            for _, w in ipairs(wins) do
              local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
              if bufname:match("NvimTree_") ~= nil then
                table.insert(invalid_win, w)
              end
            end

            require("noice.message.router").enable()

            if #invalid_win == #wins - 1 then
              -- Should quit, so we close all invalid windows.
              for _, w in ipairs(invalid_win) do vim.api.nvim_win_close(w, true) end
            end
          end
        })
        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.del('n', '<C-k>', { buffer = bufnr })
      end

      vim.g.loaded = 1
      vim.g.loaded_netwrPlugin = 1

      -- SETUP
      require("nvim-tree").setup({
        diagnostics = {
          enable = true
        },
        actions = {
          open_file = {
            window_picker = {
              enable = false,
            },
          },
        },
        modified = {
          enable = true,
        },
        git = {
          enable = true,
          ignore = true,
          timeout = 500,
        },
        on_attach = my_on_attach,
      })
    end
  },
}
