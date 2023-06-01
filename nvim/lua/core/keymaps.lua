local keymap = vim.keymap

-- GENERAL KEYMAPS
keymap.set({"n", "x", "v", "i"}, "<F1>", "<nop>") -- Remove f1 help
keymap.set({"n", "x", "v", "i"}, "<F3>", ":MaximizerToggle<CR>") -- Toggle maximize
keymap.set("n", "<C-w>c", ":split<CR>") -- Remove f1 help

-- TABS
keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "open tab" })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "close tab" })
keymap.set("n", "[t", ":tabp<CR>", { desc = "previous tab" })
keymap.set("n", "]t", ":tabn<CR>", { desc = "next tab" })

-- NVIM TREE
keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>", { desc = "nvim tree toggle", silent = true })
keymap.set("n", "<leader>te", ":NvimTreeFocus<CR>", { desc = "nvim tree focus", silent = true })
keymap.set("n", "<leader>tf", ":NvimTreeFindFile<CR>", { desc = "nvim tree focus file", silent = true })

-- TELESCOPE
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
-- keymap.set("n", "<leader>fn", ":Telescope noice<CR>", { desc = "telescope noice history", noremap = true })
keymap.set('n', '<leader>fk', ":Telescope keymaps<CR>", { desc = "telescope keymaps" })
-- r
keymap.set('n', '<leader>rf', ":Telescope flutter commands<CR>", { desc = "telescope run flutter commands" })

-- LAZY
keymap.set("n", "<leader>lh", ":Lazy home<CR>", { desc = "lazy home" }) -- Display lazy home | lh = lazy home

-- NOICE
-- keymap.set("n", "<leader>nl", ":Noice last<CR>", { desc = "noice last" }) -- Display last noice message

-- LSP
keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "lsp restart" })
keymap.set("n", "gf", ":Lspsaga lsp_finder<CR>",  { desc = "lspsaga finder" })
keymap.set("n", "gD", ":lua vim.lsp.buf.declaration()<CR>",  { desc = "go to declaration" })
keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<CR>",  { desc = "go to definition" })
keymap.set("n", "gr", ":lua vim.lsp.buf.references()<CR>",  { desc = "go to references" })
keymap.set("n", "gp", ":Lspsaga peek_definition<CR>",  { desc = "lspsaga peek definition" })
keymap.set("n", "gi", ":lua vim.lsp.buf.implementation()<CR>",  { desc = "implementation" })
keymap.set("n", "<A-CR>", ":Lspsaga code_action<CR>",  { desc = "lspsaga code action" })
keymap.set("x", "<A-CR>", ":Lspsaga range_code_action<CR>",  { desc = "lspsaga range code action" })
keymap.set("n", "<leader>lr", ":Lspsaga rename<CR>",  { desc = "lspsaga rename" })
keymap.set("n", "<leader>lo", ":Lspsaga outline<CR>", { desc = "lspsaga toggle outline" })
keymap.set("n", "<leader>ldc", ":Lspsaga show_cursor_diagnostics<CR>",  { desc = "lspsaga cursor diagnostic" })
keymap.set("n", "<leader>ldl", ":Lspsaga show_line_diagnostics<CR>",  { desc = "lspsaga line diagnostic" })
keymap.set("n", "K", ":Lspsaga hover_doc<CR>",  { desc = "lspsaga show doc" })
-- keymap.set("i", "<C-k>", ":lua vim.lsp.buf.signature_help()<CR>", { desc = "show function signature" })
vim.api.nvim_set_keymap("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "show function signature" })
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

-- GRAPPLE
keymap.set("n", "<leader>mm", ":lua require('grapple').popup_tags()<CR>", { desc = "grapple menu", silent = true })
keymap.set("n", "<leader>mr", ":lua require('grapple').reset()<CR>", { desc = "grapple reset scope", silent = true })
for i = 0, 5 do
  keymap.set(
    "n",
    "<leader>" .. i,
    ":lua require('grapple').select({key = " .. i .. "})<CR>",
    { desc = "select mark " .. i, silent = true }
  )
end
for i = 0, 5 do
  keymap.set(
    "n",
    "<leader>m" .. i,
    ":lua require('grapple').tag({key = " .. i .. "})<CR>",
    { desc = "mark " .. i, silent = true }
  )
end
-- keymap.set(
--   "n",
--   "m",
--   ":lua require('grapple').tag({key = vim.fn.nr2char(vim.fn.getchar())})<CR>",
--   { desc = "grapple mark X key", silent = true }
-- )
-- keymap.set(
--   "n",
--   "`",
--   ":lua require('grapple').select({key = vim.fn.nr2char(vim.fn.getchar())})<CR>",
--   { desc = "grapple select X mark", silent = true }
-- )


-- TMUX
keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>", { desc = "window left", silent = true })
keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>", { desc = "window right", silent = true })
keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>", { desc = "window down", silent = true })
keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>", { desc = "window up", silent = true })
