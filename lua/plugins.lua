return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
    lazy = false,
    keys = {
      { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    },
    ---@module "neo-tree"
    ---@type neotree.Config?
    opts = {
      window = {
        position = 'right',
        width = 40,
        mappings = {
          ['o'] = 'open',
          ['\\'] = 'close_window',
        },
      },
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
      },
    },
  },
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1

      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'dbui', 'sql', 'mysql', 'plsql' },
        callback = function()
          vim.keymap.set({ 'n', 'v' }, '<leader><CR>', '<Plug>(DBUI_ExecuteQuery)', { buffer = true, silent = true, desc = 'Execute sql query' })
        end,
      })
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

          -- Navigation
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

          -- Actions
          -- visual mode
          map('v', '<leader>hs', function()
            gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
          end, { desc = 'git [s]tage hunk' })
          map('v', '<leader>hr', function()
            gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
          end, { desc = 'git [r]eset hunk' })
          -- normal mode
          map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'git [s]tage hunk' })
          map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'git [r]eset hunk' })
          map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'git [S]tage buffer' })
          map('n', '<leader>hu', gitsigns.stage_hunk, { desc = 'git [u]ndo stage hunk' })
          map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'git [R]eset buffer' })
          map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'git [p]review hunk' })
          map('n', '<leader>hb', gitsigns.blame_line, { desc = 'git [b]lame line' })
          map('n', '<leader>hd', gitsigns.diffthis, { desc = 'git [d]iff against index' })
          map('n', '<leader>hD', function()
            gitsigns.diffthis '@'
          end, { desc = 'git [D]iff against last commit' })
          -- Toggles
          map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line' })
          map('n', '<leader>tD', gitsigns.preview_hunk_inline, { desc = '[T]oggle git show [D]eleted' })
        end,
      },
    },
  },

  {
    'folke/which-key.nvim',
    event = 'VimEnter', -- sets the loading event to 'vimenter'
    opts = {
      delay = 0,
      icons = {
        mappings = vim.g.have_nerd_font,
        keys = {},
      },
      spec = {
        { '<leader>s', group = '[S]earch' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      },
    },
  },

  {
    'rolv-apneseth/tfm.nvim',
    lazy = false,
    opts = {
      file_manager = 'yazi',
      replace_netrw = true,
      enable_cmds = true,
      keybindings = {
        ['<ESC>'] = 'q',
        ['<C-v>'] = "<C-\\><C-O>:lua require('tfm').set_next_open_mode(require('tfm').OPEN_MODE.vsplit)<CR>",
        ['<C-x>'] = "<C-\\><C-O>:lua require('tfm').set_next_open_mode(require('tfm').OPEN_MODE.split)<CR>",
        ['<C-t>'] = "<C-\\><C-O>:lua require('tfm').set_next_open_mode(require('tfm').OPEN_MODE.tabedit)<CR>",
      },
      ui = {
        border = 'rounded',
        height = 1,
        width = 1,
        x = 0.5,
        y = 0.5,
      },
    },
    keys = {
      { '<leader>e', ':Tfm<CR>', desc = 'TFM' },
    },
  },

  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup { n_lines = 500 }

      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v │ %L'
      end

      require('mini.git').setup()

      require('mini.move').setup {
        mappings = {
          left = '<M-h>',
          right = '<M-l>',
          down = '<M-j>',
          up = '<M-k>',
          line_left = '<M-h>',
          line_right = '<M-l>',
          line_down = '<M-j>',
          line_up = '<M-k>',
        },
      }
    end,
  },

  {
    'jpalardy/vim-slime',
    keys = {
      { '<leader>r', ":<C-u>'<,'>SlimeSend<CR>", mode = 'v', desc = 'Slime Send Selection' },
      { '<leader>r', ':SlimeSend<CR>', mode = 'n', desc = 'Slime Send Current Line' },
    },
    config = function()
      vim.g.slime_target = 'tmux'
      vim.g.slime_cell_delimiter = '# %%'
      vim.g.slime_bracketed_paste = 1
      vim.g.slime_default_config = { socket_name = 'default', target_pane = '2' }
      vim.g.slime_dont_ask_default = 1
    end,
  },

  {
    'linux-cultist/venv-selector.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'mfussenegger/nvim-dap',
      'mfussenegger/nvim-dap-python', --optional
      { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },
    },
    lazy = false,
    branch = 'regexp', -- This is the regexp branch, use this for the new version
    keys = {
      { ',v', '<cmd>VenvSelect<cr>' },
    },

    ---@type venv-selector.Config
    opts = {
      search = {
        virtualenvs = {
          command = "$FD 'python$' ~/.virtualenvs --no-ignore-vcs --color never | grep /bin/python",
        },
        cwd = false,
      },
    },
  },
}
