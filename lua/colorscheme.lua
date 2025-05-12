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
      }
    end,
  },
  {
    'aktersnurra/no-clown-fiesta.nvim',
    priority = 1000,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('no-clown-fiesta').setup {
        transparent = true,
        styles = {
          comments = {},
          functions = {},
          keywords = {},
          lsp = {},
          match_paren = {},
          variables = {},
          type = {},
        },
        vim.cmd.colorscheme 'kanagawa-dragon',
        -- vim.cmd.colorscheme 'no-clown-fiesta',
      }
    end,
  },
}
