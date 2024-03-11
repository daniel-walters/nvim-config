-- INFO: https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
local prettier_filetypes =
  { 'javacsript', 'javacsriptreact', 'typescript', 'typescriptreact' }

local formatters_by_ft = { lua = { 'stylua' }, go = { 'gomft' } }

for _, ft in pairs(prettier_filetypes) do
  formatters_by_ft[ft] = { { 'prettierd', 'prettier' } }
end

return {
  'stevearc/conform.nvim',
  event = 'BufWritepre',
  cmd = 'ConformInfo',
  opts = {
    notify_on_error = true,
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters_by_ft = formatters_by_ft,
  },
}
