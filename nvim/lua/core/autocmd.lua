local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd({ "BufLeave", "WinLeave", "FocusLost" }, {
  callback = function()
    local curbuf = vim.api.nvim_get_current_buf()
    if not vim.api.nvim_buf_get_option(curbuf, "modified") or vim.fn.getbufvar(curbuf, "&modifiable") == 0 then
      return
    end

    local filetype = vim.api.nvim_buf_get_option(curbuf, "filetype")
    -- format dart file
    if filetype == "dart" then
      require("lang.dart").format()
    end

    vim.cmd([[silent! update]])
  end,
  pattern = "*",
  group = augroup("autosave"),
})

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
