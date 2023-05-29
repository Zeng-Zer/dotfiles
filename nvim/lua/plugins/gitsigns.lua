return {
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    config = function()
      require('gitsigns').setup{
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 0,
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, { expr = true, desc = "git next hunk"})

          map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, { expr = true, desc = "git prev hunk"})

          -- Actions
          map('n', '<leader>gs', gs.stage_hunk, { desc = "git stage hunk" })
          map('n', '<leader>gr', gs.reset_hunk, { desc = "git reset hunk" })
          map('v', '<leader>gs', function() gs.stage_hunk {vim.fn.line("."), vim.fn.line("v")} end, { desc = "git stage hunk" })
          map('v', '<leader>gr', function() gs.reset_hunk {vim.fn.line("."), vim.fn.line("v")} end, { desc = "git reset hunk" })
          map('n', '<leader>gS', gs.stage_buffer, { desc = "git stage buffer" })
          map('n', '<leader>gR', gs.reset_buffer, { desc = "git reset buffer"})
          map('n', '<leader>gu', gs.undo_stage_hunk, { desc = "git undo stage hunk"})
          map('n', '<leader>gp', gs.preview_hunk, { desc = "git preview hunk"})
          map('n', '<leader>gb', function() gs.blame_line{full=true} end, { desc = "git blame line"})
          map('n', '<leader>gB', gs.toggle_current_line_blame, { desc = "git toggle current line blame"})
          map('n', '<leader>gd', gs.diffthis, { desc = "diff this"})
          map('n', '<leader>gD', function() gs.diffthis('~') end, { desc = "git diff this~"})
          map('n', '<leader>gP', gs.toggle_deleted, { desc = "git toggle deleted"})
          map('n', '<leader>gw', gs.toggle_word_diff, { desc = "git toggle word diff"})

          -- Text object
          map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = "git undo stage hunk"})
        end
      }
    end
  },
}
