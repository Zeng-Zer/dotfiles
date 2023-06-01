return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      "nvim-telescope/telescope-file-browser.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    cmd = 'Telescope',
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
          path_display = {"smart"},
          sorting_strategy = 'ascending',
          layout_strategy = "flex", -- horizontal, vertical, center, flex, cursor, bottom_pane
          layout_config = {
            scroll_speed = 5,
            prompt_position = 'top',
            horizontal = {
              preview_cutoff = 100,
              preview_width = 0.5,
            },
            vertical = {
              mirror = true,
              preview_cutoff = 0.4,
            },
            flex = {
              flip_columns = 110,
            },
            height = 0.94,
            width = 0.86,
          },
          mappings = {
            i = {
              ["<C-n>"] = actions.nop,
              ["<C-p>"] = actions.nop,
              ["<C-v>"] = actions.select_vertical,
              ["<C-c>"] = actions.select_horizontal,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-u>"] = shift_previous,
              ["<C-d>"] = shift_next,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<C-b>"] = actions.preview_scrolling_up,
              ["<C-x>"] = actions.preview_scrolling_down,
              ["<esc>"] = actions.close,
            }
          }
        },
        pickers = {
          buffers = {
            mappings = {
              i = {
                ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
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

      telescope.load_extension("fzf")
      telescope.load_extension("ui-select")
      telescope.load_extension("file_browser")
      -- telescope.load_extension("noice")
      telescope.load_extension("flutter")
    end
  },
}
