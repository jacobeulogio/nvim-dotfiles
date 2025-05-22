-- Keybinds

-- Paste from clipboard
vim.keymap.set({ 'v', 'x', 'n' }, '<C-y>', '"+y', { noremap = true, silent = true, desc = 'Yank to clipboard' })
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>p', '"0p', { noremap = true, silent = true, desc = 'Paste from clipboard' })
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>P', '"0P', { noremap = true, silent = true, desc = 'Paste from clipboard' })

-- End Highlight
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<C-c>', '<cmd>nohlsearch<CR>')

-- Diagnostics
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit Terminal with ESC-ESC
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', '<C-[>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', '<C-c><C-c>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
vim.keymap.set({ 'n', 't' }, '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set({ 'n', 't' }, '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set({ 'n', 't' }, '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set({ 'n', 't' }, '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<C-w>h', ':vertical resize -5<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-w>l', ':vertical resize +5<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-w>k', ':resize +5<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-w>j', ':resize -5<CR>', { noremap = true, silent = true })
-- Toggle Diagnostics
vim.g['diagnostics_active'] = true
function Toggle_diagnostics()
  if vim.g.diagnostics_active then
    vim.g.diagnostics_active = false
    vim.diagnostic.enable(false)
  else
    vim.g.diagnostics_active = true
    vim.diagnostic.enable()
  end
end
vim.keymap.set('n', '<leader>ud', Toggle_diagnostics, { noremap = true, silent = true, desc = 'Toggle vim diagnostics' })
