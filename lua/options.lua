vim.opt.termguicolors = true

-- Indentation
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.breakindent = true

-- Make tabs into spaces
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4


-- Number Lines
vim.opt.number = true
vim.opt.relativenumber = true

-- Mouse
vim.opt.mouse = 'a'
vim.opt.showmode = false

-- Undo History
vim.opt.undofile = true

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Git Signs
vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
-- vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Ask Confirmation
vim.opt.confirm = true

-- vim.opt.formatoptions:remove('c', 'r', 'o')
--
-- vim.cmd 'autocmd BufEnter * set formatoptions-=cro'
-- vim.cmd 'autocmd BufEnter * setlocal formatoptions-=cro'

-- Highlight on Yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.opt.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
