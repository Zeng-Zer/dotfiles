return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    lazy = false,
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<C-x>"] = actions.nop,
              ["<C-c>"] = actions.select_horizontal,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<esc>"] = actions.close,
            }
          }
        },
        pickers = {
          buffers = {
            mappings = {
              i = {
                ["<C-x>"] = actions.delete_buffer + actions.move_to_top,
              }
            }
          }
        }
      })
      telescope.load_extension("fzf")
      telescope.load_extension("ui-select")
      telescope.load_extension("flutter")
    end
  },
}
