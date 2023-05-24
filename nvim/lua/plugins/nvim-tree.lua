local function my_on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  local function edit_or_open()
    local node = api.tree.get_node_under_cursor()

    if node.nodes ~= nil then
      -- expand or collapse folder
      api.node.open.edit()
    else
      -- open file
      api.node.open.edit()
      -- Close the tree if file was opened
      api.tree.close()
    end
  end

  -- open as vsplit on current node
  local function vsplit_preview()
    local node = api.tree.get_node_under_cursor()

    if node.nodes ~= nil then
      -- expand or collapse folder
      api.node.open.edit()
    else
      -- open file as vsplit
      api.node.open.vertical()
    end

    -- Finally refocus on tree if it was lost
    api.tree.focus()
  end

  -- h | Collapse current containing folder
  -- H | Collapse Tree
  -- l | Open node if it is a folder, else edit the file and close tree
  -- L | Open node if it is a folder, else create vsplit of file and keep cursor focus on tree
  vim.keymap.set("n", "l", edit_or_open,          opts("Edit Or Open"))
  vim.keymap.set("n", "L", vsplit_preview,        opts("Vsplit Preview"))
  vim.keymap.set("n", "h", api.tree.close,        opts("Close"))
  vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse All"))
  ---
end

return {
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    config = function(_, opt)
      vim.g.loaded = 1
      vim.g.loaded_netwrPlugin = 1
      require("nvim-tree").setup({
        diagnostics = {
          enable = true
        },
        renderer = {
          icons = {
            glyphs = {
              folder = {
                arrow_closed = "", -- arrow when folder is closed
                arrow_open = "", -- arrow when folder is open
              },
            },
          },
        },
        actions = {
          open_file = {
            window_picker = {
              enable = false,
            },
          },
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
