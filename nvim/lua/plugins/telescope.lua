return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      "nvim-telescope/telescope-file-browser.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    lazy = false,
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local action_set = require("telescope.actions.set")
      local shift_next = function(prompt_bufnr)
        action_set.shift_selection(prompt_bufnr, 4)
      end
      local shift_previous = function(prompt_bufnr)
        action_set.shift_selection(prompt_bufnr, -4)
      end

      telescope.setup({
        defaults = {
          sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "top"
            }
          },
          mappings = {
            i = {
              ["<C-n>"] = actions.nop,
              ["<C-p>"] = actions.nop,
              ["<C-x>"] = actions.nop,
              ["<C-c>"] = actions.select_horizontal,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-u>"] = shift_previous,
              ["<C-d>"] = shift_next,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<C-b>"] = actions.preview_scrolling_up,
              ["<C-v>"] = actions.preview_scrolling_down,
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
        },
        extensions = {
          file_browser = {
            grouped = true,
          }
        }
      })
      vim.api.nvim_set_keymap("n", "<leader>fd", ":Telescope file_browser<CR>", { noremap = true })
      telescope.load_extension("fzf")
      telescope.load_extension("ui-select")
      telescope.load_extension("flutter")
      telescope.load_extension("file_browser")
    end
  },
}
