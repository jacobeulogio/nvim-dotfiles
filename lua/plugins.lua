return {

  { 'akinsho/toggleterm.nvim', version = '*', config = true },

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
    },
  },

  -- {
  --   'rmagatti/auto-session',
  --   lazy = false,
  --
  --   ---enables autocomplete for opts
  --   ---@module "auto-session"
  --   ---@type AutoSession.Config
  --   opts = {
  --     suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
  --     -- log_level = 'debug',
  --   },
  -- },
}
