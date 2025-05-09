return {

  { 'akinsho/toggleterm.nvim', version = '*', config = true },

  -- {
  --   'benlubas/molten-nvim',
  --   version = '*', -- use version <2.0.0 to avoid breaking changes
  --   dependencies = { '3rd/image.nvim' },
  --   build = ':UpdateRemotePlugins',
  --   init = function()
  --     -- these are examples, not defaults. Please see the readme
  --     vim.g.molten_image_provider = 'image.nvim'
  --     vim.g.molten_output_win_max_height = 20
  --
  --     -- Define keybindings for the Molten plugin
  --     vim.keymap.set('n', '<localleader>mi', ':MoltenInit<CR>', { silent = true, desc = 'Initialize the plugin' })
  --     vim.keymap.set('n', '<localleader>e', ':MoltenEvaluateOperator<CR>', { silent = true, desc = 'run operator selection' })
  --     vim.keymap.set('n', '<localleader>rl', ':MoltenEvaluateLine<CR>', { silent = true, desc = 'evaluate line' })
  --     vim.keymap.set('n', '<localleader>rr', ':MoltenReevaluateCell<CR>', { silent = true, desc = 're-evaluate cell' })
  --     vim.keymap.set('v', '<localleader>r', ':<C-u>MoltenEvaluateVisual<CR>gv', { silent = true, desc = 'evaluate visual selection' })
  --   end,
  -- },
  --
  -- {
  --   -- see the image.nvim readme for more information about configuring this plugin
  --   '3rd/image.nvim',
  --   opts = {
  --     backend = 'kitty', -- whatever backend you would like to use
  --     processor = 'magick_rock',
  --     max_width = 100,
  --     max_height = 12,
  --     max_height_window_percentage = math.huge,
  --     max_width_window_percentage = math.huge,
  --     window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
  --     window_overlap_clear_ft_ignore = { 'cmp_menu', 'cmp_docs', '' },
  --   },
  -- },
  {
    'rolv-apneseth/tfm.nvim',
    lazy = false,
    opts = {
      file_manager = 'yazi',
      replace_netrw = true,
      enable_cmds = true,
      keybindings = {
        ['<ESC>'] = 'q',
        -- Override the open mode (i.e. vertical/horizontal split, new tab)
        -- Tip: you can add an extra `<CR>` to the end of these to immediately open the selected file(s) (assuming the TFM uses `enter` to finalise selection)
        ['<C-v>'] = "<C-\\><C-O>:lua require('tfm').set_next_open_mode(require('tfm').OPEN_MODE.vsplit)<CR>",
        ['<C-x>'] = "<C-\\><C-O>:lua require('tfm').set_next_open_mode(require('tfm').OPEN_MODE.split)<CR>",
        ['<C-t>'] = "<C-\\><C-O>:lua require('tfm').set_next_open_mode(require('tfm').OPEN_MODE.tabedit)<CR>",
      },
      -- Customise UI. The below options are the default
      ui = {
        border = 'rounded',
        height = 1,
        width = 1,
        x = 0.5,
        y = 0.5,
      },
    },
    keys = {
      { '<leader>y', ':Tfm<CR>', desc = 'TFM' },
      -- { "<leader>eh", ":TfmSplit<CR>", desc = "TFM - horizontal split", },
      -- { "<leader>ev", ":TfmVsplit<CR>", desc = "TFM - vertical split", },
      -- { "<leader>et", ":TfmTabedit<CR>", desc = "TFM - new tab", },
    },
  },

  {
    'rmagatti/auto-session',
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      -- log_level = 'debug',
    },
  },
}
