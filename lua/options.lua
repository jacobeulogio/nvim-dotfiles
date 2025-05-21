vim.o.termguicolors = true

-- Indentation
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.breakindent = true

-- Number Lines
vim.o.number = true
vim.o.relativenumber = true

-- Mouse
vim.o.mouse = 'a'
vim.o.showmode = false

-- Clipboard
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Undo History
vim.o.undofile = true

-- Searching
vim.o.ignorecase = true
vim.o.smartcase = true

-- Git Signs
vim.o.signcolumn = 'yes'

vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
-- vim.o.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- Ask Confirmation
vim.o.confirm = true

vim.opt.formatoptions:remove('c', 'r', 'o')

vim.cmd 'autocmd BufEnter * set formatoptions-=cro'
vim.cmd 'autocmd BufEnter * setlocal formatoptions-=cro'

-- Highlight on Yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
