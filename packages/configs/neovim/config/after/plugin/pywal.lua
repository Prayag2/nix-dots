local pywal = require('pywal16')
pywal.setup()

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePrompt", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeResults", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePreview", { bg = "none" })
vim.api.nvim_set_hl(0, "Visual", { fg = "#121212", bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID('Visual')), 'bg') })
vim.api.nvim_set_hl(0, "VisualNOS", { fg = "#121212", bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID('VisualNOS')), 'bg') })
vim.cmd([[highlight Comment cterm=italic gui=italic]])


vim.opt.pumblend = 0
vim.opt.winblend = 0
