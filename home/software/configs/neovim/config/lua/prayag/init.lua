require("prayag.keybindings")
require("prayag.lsp")
require("prayag.completions")
require("prayag.dap")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("transparent").setup({
  groups = {
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
    'EndOfBuffer',
  },
  extra_groups = {
    "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
    "NvimTreeNormal" -- NvimTree
  },
  exclude_groups = {"StatusLine", "StatusLineNC"},
  on_clear = function() end,
})


-- include packer only if you're using this config outside of a nix environment
-- require("prayag.packer")
