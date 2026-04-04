-- DART
-- format on save
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.dart',
  group = vim.api.nvim_create_augroup('DartFormat', { clear = false }),
  callback = function(_)
    print('Formatting dart file')
    require("lang.dart").format()
  end
})

-- Winbar
local excluded_filetype = {
  "NvimTree",
  "dashboard",
  "help",
  "NvimSeparator",
}

local excluded_filename = {
  "[No Name]",
}
vim.api.nvim_create_autocmd ({ "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost" }, {
  callback = function()
    local readonly = "%{&readonly?\"🔒 \":\"\"}"
    local modified = "%{&modified?\" ●\":\"\"}"
    local filename = vim.api.nvim_eval_statusline("%F", {}).str
    local filetype = vim.bo.filetype
    -- check if the window is floating
    if vim.api.nvim_win_get_config(0).relative ~= "" then
      return
    end
    -- check if the filename is empty
    if filename == "" or filename == nil then
      return
    end
    -- check if the filetype is excluded
    if vim.tbl_contains(excluded_filetype, filetype) then
      return
    end
    -- check if the filename is excluded
    if vim.tbl_contains(excluded_filename, filename) then
      return
    end

    -- print('filetype : ' .. filetype .. ' filename : ' .. filename)

    vim.api.nvim_set_option_value(
      'winbar',
      readonly .. filename .. modified,
      { scope = 'local' }
    )
  end,
})
