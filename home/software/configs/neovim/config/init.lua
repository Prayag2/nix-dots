-- including configs
require("prayag")

-- basic settings
vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.clipboard:append('unnamedplus')
vim.o.termguicolors = true
vim.opt.fillchars = { eob = " " }

vim.g.netrw_banner = 0
vim.g.netrw_winsize = 30

vim.o.cmdheight = 0
vim.opt.laststatus = 1
