local keymap = vim.keymap

-- GENERAL KEYMAPS
keymap.set({"n", "x", "v", "i"}, "<F1>", "<nop>") -- Remove f1 help

-- LEADER KEYMAPS
-- s | split views
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- Toggle maximize view

-- t | tabs
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", "tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

-- f | files
keymap.set("n", "<leader>ft", ":NvimTreeToggle<CR>") -- Toggle nvim tree | ft = file tree
keymap.set("n", "<leader>fe", ":NvimTreeFocus<CR>") -- Toggle nvim tree | ft = file tree

-- telescope help
keymap.set('n', '<leader>hk',  "<cmd>Telescope keymaps<cr>", { desc = "show keymaps" })
-- telescope find files
local builtin = require('telescope.builtin')
keymap.set('n', '<leader>ff', builtin.find_files, { desc = "telescope find files" })
keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "telescope live grep" })
keymap.set('n', '<leader>fc', builtin.current_buffer_fuzzy_find, { desc = "telescope find current buffer" })
keymap.set('n', '<leader>fb', builtin.buffers, { desc = "telescope find buffers" })
keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "telescope help tags" })

local telescope = require('telescope')
keymap.set('n', '<leader>rf', telescope.extensions.flutter.commands, { desc = "Telescope flutter commands" })

-- g | git
-- telescope git cmds
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]


-- l | lazy
keymap.set("n", "<leader>lh", ":Lazy home<CR>") -- Display lazy home | lh = lazy home

-- r | restart
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- copilot
keymap.set("n", "<leader>c", ":Copilot panel<CR>")

-- TODO description
-- LSP keybinds
keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts) -- got to definition
keymap.set("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts) -- got to references
keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
keymap.set("n", "<A-CR>", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
keymap.set("x", "<A-CR>", "<cmd>Lspsaga range_code_action<CR>", opts) -- see available code actions
keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
-- Diagnostic jump with filters such as only jumping to an error
keymap.set("n", "ge", function()
  require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)
keymap.set("n", "gE", function()
  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)

-- keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Harpoon
keymap.set("n", "<leader>ha", ":lua require('harpoon.mark').add_file()<CR>", { desc = "harpoon mark file", noremap = true })
keymap.set("n", "<leader>hm", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { desc = "harpoon menu", noremap = true })
keymap.set("n", "<leader>h1", ":lua require('harpoon.ui').nav_file(1)<CR>", { desc = "harpoon file 1", noremap = true })
keymap.set("n", "<leader>h2", ":lua require('harpoon.ui').nav_file(2)<CR>", { desc = "harpoon file 2", noremap = true })
keymap.set("n", "<leader>h3", ":lua require('harpoon.ui').nav_file(3)<CR>", { desc = "harpoon file 3", noremap = true })
keymap.set("n", "<leader>h4", ":lua require('harpoon.ui').nav_file(4)<CR>", { desc = "harpoon file 4", noremap = true })
keymap.set("n", "<leader>h5", ":lua require('harpoon.ui').nav_file(5)<CR>", { desc = "harpoon file 5", noremap = true })
keymap.set("n", "<leader>h6", ":lua require('harpoon.ui').nav_file(6)<CR>", { desc = "harpoon file 6", noremap = true })
keymap.set("n", "<leader>h7", ":lua require('harpoon.ui').nav_file(7)<CR>", { desc = "harpoon file 7", noremap = true })
keymap.set("n", "<leader>h8", ":lua require('harpoon.ui').nav_file(8)<CR>", { desc = "harpoon file 8", noremap = true })
keymap.set("n", "<leader>h9", ":lua require('harpoon.ui').nav_file(9)<CR>", { desc = "harpoon file 9", noremap = true })
keymap.set("n", "<leader>h0", ":lua require('harpoon.ui').nav_file(10)<CR>", { desc = "harpoon file 10", noremap = true })

-- tmux
keymap.set("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "window left" })
keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "window right" })
keymap.set("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "window down" })
keymap.set("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "window up" })
