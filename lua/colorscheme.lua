return {
  {
    'rebelot/kanagawa.nvim',
    priority = 1001,
    config = function()
      require('kanagawa').setup {
        transparent = true,
        colors = {
          theme = { all = { ui = { bg_gutter = 'none' } } },
          palette = {
            dragonGreen2 = '#7E7E7E',
            dragonRed = '#D6865E',
          },
        },
        commentStyle = { italic = false },
        functionStyle = {},
        keywordStyle = { italic = false },
        overrides = function()
          return {
            ['@variable.builtin'] = { italic = false },
            -- MiniStatuslineModeNormal = { bg = '#000000', bold = true },
            MiniStatuslineDevinfo = { fg = '#8E9092', bg = '#101010' },
            MiniStatuslineFileinfo = { fg = '#8E9092', bg = '#101010' },
            MiniStatuslineFilename = { fg = '#8E9092', bg = '#101010' },
          }
        end,
      }
    end,
    init = function()
      vim.cmd.colorscheme 'kanagawa-dragon'
    end,
  },
  {
    'aktersnurra/no-clown-fiesta.nvim',
    priority = 1001,
    config = function()
      require('no-clown-fiesta').setup {
        transparent = true, -- Enable this to disable the bg color
        styles = {
          comments = {},
          functions = {},
          keywords = {},
          lsp = {},
          match_paren = {},
          type = {},
          variables = {},
        },
      }
    end,
  },
}
