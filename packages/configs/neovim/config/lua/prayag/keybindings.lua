-- leader key
vim.g.mapleader = " "

-- snippets
vim.api.nvim_set_keymap('i', '<C-j>', "vsnip#expandable()  ? '<Plug>(vsnip-expand)' : '<C-j>'", { expr = true, noremap = false })
vim.api.nvim_set_keymap('s', '<C-j>', "vsnip#expandable()  ? '<Plug>(vsnip-expand)' : '<C-j>'", { expr = true, noremap = false })

vim.api.nvim_set_keymap('i', '<Tab>', "vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>'", { expr = true, noremap = false })
vim.api.nvim_set_keymap('s', '<Tab>', "vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>'", { expr = true, noremap = false })
vim.api.nvim_set_keymap('i', '<S-Tab>', "vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'", { expr = true, noremap = false })
vim.api.nvim_set_keymap('s', '<S-Tab>', "vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'", { expr = true, noremap = false })

-- navigating windows
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wl", "<C-w>l")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wj", "<C-w>j")

-- buffers
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>")

-- open
vim.keymap.set("n", "<leader>on", "<cmd>NvimTreeToggle<cr>")

-- rename symbols
vim.keymap.set('n', '<F2>', function()
  vim.lsp.buf.rename()
end, { noremap = true, silent = true, desc = "LSP Rename" })
