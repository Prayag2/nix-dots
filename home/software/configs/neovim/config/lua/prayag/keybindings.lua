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

-- cpp specific (for competitive programming)
vim.api.nvim_set_keymap(
  'n',   -- Normal mode keymap
  '<leader>rr',   -- Keybinding: <leader>rr to run this command
  [[:w !g++ -std=c++20 -O2 -Wall -Wextra -Wshadow -pedantic -fsanitize=address,undefined -fstack-protector % -o /tmp/%< && /tmp/%< < input.txt > output.txt 2>&1 <CR>]],
  { noremap = true, silent = true }
)

-- Keybinding
vim.api.nvim_set_keymap('n', '<Leader>cp', '[[:vsplit | wincmd l | edit input.txt | vertical resize 50 | split | wincmd j | edit output.txt | wincmd h<CR>]]', { noremap = true, silent = true })
