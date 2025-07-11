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
            dragonGreen2 = '#625e5a',
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
            Pmenu = { bg = '#1c1c1c' },
            PmenuSel = { bg = '#3a3a3a' },
            PmenuThumb = { bg = '#8E9092' },
            PmenuSbar = { bg = '#1c1c1c' },
            WinSeparator = { fg = '#272727'},
            -- NormalFloat = { bg = '#1c1c1c' },
            -- BlinkCmpMenu = { bg = '#1c1c1c' },
            -- BlinkCmpMenuSelection = { bg = '#4e4e4e' },
            -- BlinkCmpScrollBarThumb = { bg = '#8E9092' },
            -- BlinkCmpScrollBarGutter = { bg = '#1c1c1c' },
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
