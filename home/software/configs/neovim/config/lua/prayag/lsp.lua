local lspconf = require('lspconfig')

local border = {
  {"╭", "FloatBorder"},
  {"─", "FloatBorder"},
  {"╮", "FloatBorder"},
  {"│", "FloatBorder"},
  {"╯", "FloatBorder"},
  {"─", "FloatBorder"},
  {"╰", "FloatBorder"},
  {"│", "FloatBorder"},
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
lspconf.pyright.setup {capabilities = capabilities}
lspconf.pylsp.setup {capabilities = capabilities}
lspconf.nil_ls.setup {capabilities = capabilities}
lspconf.bashls.setup {capabilities = capabilities}
lspconf.ts_ls.setup {capabilities = capabilities}
lspconf.clangd.setup {capabilities = capabilities}
