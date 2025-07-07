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
            dragonGreen2 = '#7a8382',
            -- dragonRed = '#D6865E',
          },
        },
        commentStyle = { italic = false },
        functionStyle = {},
        keywordStyle = { italic = false },
        overrides = function()
          return {
            ['@variable.builtin'] = { italic = false },
            -- MiniStatuslineModeNormal = { bg = '#000000', bold = true },
            MiniStatuslineDevinfo = { bg = '#101010' },
            MiniStatuslineFileinfo = { bg = '#101010' },
            MiniStatuslineFilename = { bg = '#101010' },
            BlinkCmpMenu = { bg = '#1c1c1c' },
            BlinkCmpMenuSelection = { bg = '#4e4e4e' },
            BlinkCmpScrollBarThumb = { bg = '#8E9092' },
            BlinkCmpScrollBarGutter = { bg = '#1c1c1c' },
            WinSeparator = { fg = '#272727'},
            -- StatusLineNC = { fg = '#C8C093'},
          }
        end,
      }
    end,
    init = function()
      vim.cmd.colorscheme 'kanagawa-dragon'
    end,
  },
}
