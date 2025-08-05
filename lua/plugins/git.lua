return {
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gs', ':G<CR>', { desc = 'Git Status' })

      local Eulogio_Fugitive = vim.api.nvim_create_augroup('Eulogio_Fugitive', {})

      local autocmd = vim.api.nvim_create_autocmd
      autocmd('BufWinEnter', {
        group = Eulogio_Fugitive,
        pattern = '*',
        callback = function()
          if vim.bo.ft ~= 'fugitive' then
            return
          end

          local bufnr = vim.api.nvim_get_current_buf()
          vim.keymap.set('n', '<leader>p', function()
            vim.cmd.Git 'push'
          end, { buffer = bufnr, remap = false, desc = 'Git push' })

          -- rebase always
          vim.keymap.set('n', '<leader>P', ':Git pull --rebase<CR>',
            { buffer = bufnr, remap = false, desc = 'Git pull' })

          -- NOTE: It allows me to easily set the branch i am pushing and any tracking
          -- needed if i did not set the branch up correctly
          vim.keymap.set('n', '<leader>b', ':Git push -u origin ', { buffer = bufnr, remap = false, desc = 'Set upstream branch' })
        end,
      })

      -- Diff
      vim.keymap.set('n', '<leader>dp', '<cmd>diffput<CR>')
      vim.keymap.set('n', '<leader>dg', '<cmd>diffget<CR>')
      vim.keymap.set('n', '<leader>dh', '<cmd>diffget //2<CR>')
      vim.keymap.set('n', '<leader>dl', '<cmd>diffget //3<CR>')
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },

        on_attach = function(bufnr)
          local gitsigns = require 'gitsigns'

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end
          map('n', ']c', function()
            if vim.wo.diff then
              vim.cmd.normal { ']c', bang = true }
            else
              gitsigns.nav_hunk 'next'
            end
          end, { desc = 'Jump to next git [c]hange' })
          map('n', '[c', function()
            if vim.wo.diff then
              vim.cmd.normal { '[c', bang = true }
            else
              gitsigns.nav_hunk 'prev'
            end
          end, { desc = 'Jump to previous git [c]hange' })
          map('v', '<leader>hs', function()
            gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
          end, { desc = 'git [s]tage hunk' })
          map('v', '<leader>hr', function()
            gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
          end, { desc = 'git [r]eset hunk' })
          map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'git [s]tage hunk' })
          map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'git [r]eset hunk' })
          map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'git [S]tage buffer' })
          map('n', '<leader>hu', gitsigns.stage_hunk, { desc = 'Git [u]ndo stage hunk' })
          map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'Git [R]eset buffer' })
          map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Git [p]review hunk' })
          map('n', '<leader>hb', gitsigns.blame_line, { desc = 'Git [b]lame line' })
          map('n', '<leader>hd', gitsigns.diffthis, { desc = 'Git [d]iff against index' })
          map('n', '<leader>hD', function()
            gitsigns.diffthis '@'
          end, { desc = 'git [D]iff against last commit' })
          map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line' })
          map('n', '<leader>tD', gitsigns.preview_hunk_inline, { desc = '[T]oggle git show [D]eleted' })
        end,
      },
    },
  },
}
