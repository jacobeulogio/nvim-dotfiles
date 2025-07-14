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
            -- dragonGreen2 = '#625e5a',
            -- dragonRed = '#D6865E',
          },
        },
        commentStyle = { italic = false },
        functionStyle = {},
        keywordStyle = { italic = false },
        overrides = function(colors)
          local theme = colors.theme
          return {
            ['@variable.builtin'] = { italic = false },
            String = { fg = '#625e5a' },
            MiniStatuslineDevinfo = { bg = theme.ui.bg_dim },
            MiniStatuslineFileinfo = { bg = theme.ui.bg_dim },
            MiniStatuslineFilename = { bg = theme.ui.bg_dim },
            MiniStatuslineModeNormal = {fg = 'None',  bg = theme.ui.bg_p1,},
            MiniStatuslineModeInsert = {fg = 'None', bg = theme.ui.bg_p1 },
            MiniStatuslineModeVisual= {fg = 'None', bg = theme.ui.bg_p1 },
            MiniStatuslineModeReplace = {fg = 'None', bg = theme.ui.bg_p1 },
            MiniStatuslineModeCommand = {fg = 'None', bg = theme.ui.bg_p1 },
            Pmenu = { bg = '#1c1c1c' },
            PmenuSel = { bg = '#3a3a3a' },
            PmenuThumb = { bg = '#8E9092' },
            PmenuSbar = { bg = '#1c1c1c' },
            WinSeparator = { fg = '#272727'},
            CurSearch = { fg = 'NONE', bg = '#303030' },
            Search = { fg = 'NONE', bg = '#303030' },
            LspReferenceText = { bg = '#303030' },
            LspReferenceWrite = { bg = '#303030', underline = false },
            NormalFloat = { bg = '#1c1c1c' },
            FloatFooter = { bg = '#1c1c1c' },
            FloatTitle = { bg = '#1c1c1c' },
            FloatBorder = { bg = '#1c1c1c' },
            TelescopeTitle = { fg = theme.ui.special, bold = true },
            TelescopePromptNormal = { bg = theme.ui.bg_p1 },
            TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
            TelescopeResultsNormal = { fg = 'None',  bg = theme.ui.bg_m1 },
            TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
            TelescopePreviewNormal = { bg = theme.ui.bg_dim },
            TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
            -- Visual = { bg = '#303030' },
            -- ColorColumn = { bg = '#272727' },
            -- IncSearch = { bg = '#8E9092' },
            -- NormalFloat = { bg = '#1c1c1c' },
          }
        end,
      }
    end,
    init = function()
      vim.cmd.colorscheme 'kanagawa-dragon'
    end,
  },
}
