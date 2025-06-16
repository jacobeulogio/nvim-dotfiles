return {
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
}
