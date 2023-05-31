vim.diagnostic.config {
  severity_sort = true,
  underline = true,
  virtual_text = false,
  float = {
    border = 'rounded',
  },
}

-- DIAGNOSTICS icons
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
