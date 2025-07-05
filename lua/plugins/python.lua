return {
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
