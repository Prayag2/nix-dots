-- Competitive Programming Keybindings
-- Create table for our functions
_G.code_runner = {}

function _G.code_runner.run_current_file()
  vim.cmd('w')
  local file_path = vim.fn.expand('%:p')
  vim.cmd(string.format('!~/.config/scripts/cp.sh "%s"', file_path))
end

function _G.code_runner.run_current_file_dbg()
  vim.cmd('w')
  local file_path = vim.fn.expand('%:p')
  vim.cmd(string.format('!~/.config/scripts/cp.sh "%s" debug', file_path))
end

-- Set the keybinding
vim.api.nvim_set_keymap(
  'n',          -- Normal mode
  '<leader>rr', -- Key combination
  ':wincmd h<CR>:lua _G.code_runner.run_current_file()<CR>',
  { noremap = true, silent = true }
)

-- Set the keybinding
vim.api.nvim_set_keymap(
  'n',          -- Normal mode
  '<leader>rd', -- Key combination
  ':wincmd h<CR>:lua _G.code_runner.run_current_file_dbg()<CR>',
  { noremap = true, silent = true }
)

function _G.ToggleCodePanes()
    local win_count = #vim.api.nvim_list_wins()
    if win_count > 1 then
        vim.cmd('only')
    else
        vim.cmd('vsplit | wincmd l | edit input.txt | vertical resize 50 | split | wincmd j | edit output.txt | wincmd h')
    end
end

vim.api.nvim_set_keymap('n', '<Leader>cp', [[:lua _G.ToggleCodePanes()<CR>]], { noremap = true, silent = true })
