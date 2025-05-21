return {
  {
    'rebelot/kanagawa.nvim',
    priority = 1001,
    config = function()
      require('kanagawa').setup {
        transparent = true,
        colors = {
          theme = { all = { ui = { bg_gutter = 'none' } } },
        },
        commentStyle = { italic = false },
        functionStyle = {},
        keywordStyle = { italic = false },
        overrides = function()
          return {
            ['@variable.builtin'] = { italic = false },
          }
        end,
      }
    end,
    init = function()
      vim.cmd.colorscheme 'kanagawa-dragon'
    end,
  },
}
