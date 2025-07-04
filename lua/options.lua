vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- Basic Settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.cursorline = true
vim.opt.splitright = true
vim.opt.splitbelow = true


-- Indentation
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.breakindent = true

-- Make tabs into spaces
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

-- Visual Settings
vim.opt.showmode = false
vim.opt.signcolumn = 'yes'
vim.opt.termguicolors = true
vim.opt.laststatus = 3
vim.opt.fillchars:append {
  vert = '│', -- Vertical separator
  horiz = '─', -- Horizontal separator
}
vim.opt.inccommand = 'split'

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

-- File handling
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand '~/.vim/undodir'
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 0
vim.opt.autoread = true
vim.opt.autowrite = false

-- Behavior settings
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.backspace = 'indent,eol,start'
vim.opt.autochdir = false
vim.opt.iskeyword:append '-'
vim.opt.path:append '**'
vim.opt.selection = 'exclusive'
vim.opt.mouse = 'a'
vim.opt.modifiable = true
vim.opt.encoding = 'UTF-8'
vim.opt.confirm = true

vim.opt.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

-- Highlight on Yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Command-line completion
vim.opt.wildmenu = true
vim.opt.wildmode = 'longest:full,full'
vim.opt.wildignore:append { '*.o', '*.obj', '*.pyc', '*.class', '*.jar' }

-- Better diff options
vim.opt.diffopt:append 'linematch:60'

-- Performance improvements
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

-- Create undo directory if it doesn't exist
local undodir = vim.fn.expand '~/.vim/undodir'
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, 'p')
end
