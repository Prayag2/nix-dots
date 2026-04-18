local pywal = require('pywal16')
pywal.setup()

local colors = require('pywal16.core').get_colors()

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
vim.api.nvim_set_hl(0, "CursorLine", { bg = colors.color8 })
vim.api.nvim_set_hl(0, "Visual", { bg = colors.color8})
vim.api.nvim_set_hl(0, "VisualNOS", { bg = colors.color8 })
vim.api.nvim_set_hl(0, "Comment", { italic = true })

vim.opt.pumblend = 0
vim.opt.winblend = 0
