-- Yank and Pasting
vim.keymap.set({ 'n', 'v', 'x' }, '<C-y>', '"+y', { noremap = true, silent = true, desc = 'Yank to clipboard' })
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>p', '"0p', { noremap = true, silent = true, desc = 'Paste latest yanked' })
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>P', '"0P', { noremap = true, silent = true, desc = 'Paste latest yanked' })
vim.keymap.set({'v'}, 'p', 'P', { noremap = true })

-- Movement
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set({ "n", "v" }, "H", '20h', { desc = "move 20 columns to the left" })
vim.keymap.set({ "n", "v" }, "L", '20l', { desc = "move 20 columns to the right" })
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Esc
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<C-c>', '<cmd>nohlsearch<CR>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', '<C-[>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', '<C-c><C-c>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Window
vim.keymap.set({ 'n', 't' }, '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set({ 'n', 't' }, '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set({ 'n', 't' }, '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set({ 'n', 't' }, '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- netrw
vim.keymap.set({ 'n' }, '<leader>n', ':25Vex<CR>', { desc = 'Open Netrw' })

-- Diagnostics
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Diagnostics Toggling
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
vim.keymap.set('n', '<leader>td', Toggle_diagnostics, { noremap = true, silent = true, desc = 'LSP: Toggle diagnostics' })

-- Signature Help
vim.keymap.set('i', '<C-k>', function() require('blink.cmp').signature_help() end, { desc = 'Signature Help' })

