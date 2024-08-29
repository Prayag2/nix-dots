-- leader key
vim.g.mapleader = " "

-- navigating windows
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wl", "<C-w>l")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wj", "<C-w>j")

-- buffers
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>")

-- open
vim.keymap.set("n", "<leader>on", "<cmd>NvimTreeToggle<cr>")
