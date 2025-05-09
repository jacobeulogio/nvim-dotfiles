-- Keybinds

-- Paste from yank
vim.keymap.set('n', '<leader>p', '"0p', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>P', '"0P', { noremap = true, silent = true })

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostics
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit Terminal with ESC-ESC
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Terminal Keymap
vim.api.nvim_set_keymap('n', '\\', ':ToggleTerm size=60 direction=vertical <CR><C-\\><C-n>', { noremap = true, silent = true })

-- Send lines to terminal
local trim_spaces = true
vim.keymap.set('v', '<leader>r', function()
  require('toggleterm').send_lines_to_terminal('visual_selection', trim_spaces, { args = vim.v.count })
end)

local map = function(keys, func, desc, mode)
  mode = mode or 'n'
  vim.keymap.set(mode, keys, func, { desc = desc })
end

-- -- Create an autocommand group for netrw keymaps
-- vim.api.nvim_create_autocmd('FileType', {
--   group = vim.api.nvim_create_augroup('user-netrw-keymaps', { clear = true }),
--   pattern = '*', -- Apply to all filetypes
--   callback = function()
--     map('<leader>ee', ':Explore<CR>', 'Open [E]xplorer in current window')
--     map('<leader>ev', ':Vexplore<CR>', 'Open [E]xplorer in [V]ertical split')
--     map('<leader>eh', ':Sexplore<CR>', 'Open [E]xplorer in [H]orizontal split')
--     map('<leader>et', ':Texplore<CR>', 'Open [E]xplorer in new [T]ab')
--   end,
-- })
