local M = {}

function M.format()
  vim.lsp.buf.format { async = false }
  vim.cmd('DartSortImports')
end

return M
