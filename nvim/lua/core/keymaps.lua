local keymap = vim.keymap

-- GENERAL KEYMAPS
keymap.set({"n", "x", "v", "i"}, "<F1>", "<nop>") -- Remove f1 help
keymap.set("n", "<C-w>c", ":split<CR>") -- Remove f1 help

-- TABS
keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "open tab" })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "close tab" })
keymap.set("n", "[t", ":tabp<CR>", { desc = "previous tab" })
keymap.set("n", "]t", ":tabn<CR>", { desc = "next tab" })

-- NVIM TREE
keymap.set("n", "<leader>ft", ":NvimTreeToggle<CR>", { desc = "toggle NvimTree" })
keymap.set("n", "<leader>fe", ":NvimTreeFocus<CR>", { desc = "focus NvimTree" })

-- TELESCOPE
keymap.set('n', '<leader>hk',  "<cmd>Telescope keymaps<cr>", { desc = "telescope keymaps" })
-- g
keymap.set("n", "<leader>gtC", "<cmd>Telescope git_commits<cr>", { desc = "telescope git commits" }) -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gtc", "<cmd>Telescope git_bcommits<cr>", { desc = "telescope git current file commits" }) -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gtb", "<cmd>Telescope git_branches<cr>", { desc = "telescope git branches" }) -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gts", "<cmd>Telescope git_status<cr>", { desc = "telescope git status" }) -- list current changes per file with diff preview ["gs" for git status]
-- f
keymap.set('n', '<leader>ff', ":Telescope find_files<CR>", { desc = "telescope find files" })
keymap.set('n', '<leader>fg', ":Telescope live_grep<CR>", { desc = "telescope live grep" })
keymap.set('n', '<leader>fc', ":Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope current buffer" })
keymap.set('n', '<leader>fb', ":Telescope buffers<CR>", { desc = "telescope buffers" })
keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "telescope help tags", noremap = true })
keymap.set("n", "<leader>fd", ":Telescope file_browser<CR>", { desc = "telescope file browser", noremap = true })
keymap.set("n", "<leader>fn", ":Telescope noice<CR>", { desc = "telescope noice history", noremap = true })
-- r
keymap.set('n', '<leader>rf', ":Telescope flutter commands<CR>", { desc = "telescope run flutter commands" })

-- LAZY
keymap.set("n", "<leader>lh", ":Lazy home<CR>", { desc = "lazy home" }) -- Display lazy home | lh = lazy home

-- LSP
keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "lsp restart" }) -- mapping to restart lsp if necessary
keymap.set("n", "gf", ":Lspsaga lsp_finder<CR>",  { desc = "lspsaga finder" }) -- show definition, references
keymap.set("n", "gD", ":lua vim.lsp.buf.declaration()<CR>",  { desc = "go to declaration" }) -- got to declaration
keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<CR>",  { desc = "go to definition" }) -- got to definition
keymap.set("n", "gr", ":lua vim.lsp.buf.references()<CR>",  { desc = "go to references" }) -- got to references
keymap.set("n", "gp", ":Lspsaga peek_definition<CR>",  { desc = "lspsaga peek definition" }) -- see definition and make edits in window
keymap.set("n", "gi", ":lua vim.lsp.buf.implementation()<CR>",  { desc = "implementation" }) -- go to implementation
keymap.set("n", "<A-CR>", ":Lspsaga code_action<CR>",  { desc = "lspsaga code action" }) -- see available code actions
keymap.set("x", "<A-CR>", ":Lspsaga range_code_action<CR>",  { desc = "lspsaga range code action" }) -- see available code actions
keymap.set("n", "<leader>lr", ":Lspsaga rename<CR>",  { desc = "lspsaga rename" }) -- smart rename
keymap.set("n", "<leader>lo", ":Lspsaga outline<CR>", { desc = "lspsaga toggle outline" }) -- see outline on right hand side
keymap.set("n", "<leader>ldc", ":Lspsaga show_cursor_diagnostics<CR>",  { desc = "lspsaga cursor diagnostic" }) -- show diagnostics for cursor
keymap.set("n", "<leader>ldl", ":Lspsaga show_line_diagnostics<CR>",  { desc = "lspsaga line diagnostic" }) -- show  diagnostics for line
keymap.set("n", "K", ":Lspsaga hover_doc<CR>",  { desc = "lspsaga show doc" }) -- show documentation for what is under cursor
keymap.set("n", "[d", ":Lspsaga diagnostic_jump_prev<CR>",  { desc = "lspsaga prev diagnostic" })
keymap.set("n", "]d", ":Lspsaga diagnostic_jump_next<CR>",  { desc = "lspsaga next diagnostic" })
-- Diagnostic jump with filters such as only jumping to an error
keymap.set("n", "ge", function()
  require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "lspsaga next error" })
keymap.set("n", "gE", function()
  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "lspsaga prev error" })

-- COPILOT
keymap.set("n", "<leader>co", ":Copilot panel<CR>", { desc = "copilot panel" })

-- HARPOON
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
keymap.set("n", "]h", ":lua require('harpoon.ui').nav_next()<CR>", { desc = "harpoon next", noremap = true })
keymap.set("n", "[h", ":lua require('harpoon.ui').nav_prev()<CR>", { desc = "harpoon prev", noremap = true })

-- TMUX
keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>", { desc = "window left", silent = true })
keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>", { desc = "window right", silent = true })
keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>", { desc = "window down", silent = true })
keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>", { desc = "window up", silent = true })
