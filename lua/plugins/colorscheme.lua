return {
  {
    'rebelot/kanagawa.nvim',
    priority = 1001,
    config = function()
      require('kanagawa').setup {
        transparent = true,
        colors = {
          theme = {
            all = { ui = { bg_gutter = 'none' } }
          },
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
          local palette = colors.palette
          return {
            ['@variable.builtin'] = { italic = false },
            String = { fg = '#8C907B' },
            IncSearch = { bg = '#4e4e4e', fg='None'},
            MiniStatuslineDevinfo = { bg = theme.ui.bg_dim },
            MiniStatuslineFileinfo = { bg = theme.ui.bg_dim },
            MiniStatuslineFilename = { bg = theme.ui.bg_dim },
            MiniStatuslineModeNormal = {fg = 'None',  bg = theme.ui.bg_p1,},
            MiniStatuslineModeInsert = {fg = 'None', bg = theme.ui.bg_p1 },
            MiniStatuslineModeVisual= {fg = 'None', bg = theme.ui.bg_p1 },
            MiniStatuslineModeReplace = {fg = 'None', bg = theme.ui.bg_p1 },
            MiniStatuslineModeCommand = {fg = 'None', bg = theme.ui.bg_p1 },
            Pmenu = { bg = '#1c1c1c' },
            PmenuExtra = { bg = '#1c1c1c' },
            PmenuSel = { bg = '#3a3a3a' },
            PmenuKind = { bg = '#1c1c1c' },
            PmenuKindSel = { bg = '#3a3a3a' },
            PmenuThumb = { bg = '#8E9092' },
            PmenuSbar = { bg = '#1c1c1c' },
            WinSeparator = { fg = '#272727'},
            CurSearch = { fg = 'NONE', bg = '#303030' },
            Search = { fg = 'NONE', bg = '#303030' },
            LspReferenceText = { bg = '#303030' },
            LspReferenceWrite = { bg = '#303030', underline = false },
            NormalFloat = { bg = theme.ui.bg_dim },
            -- NormalFloat = { bg = '#1c1c1c' },
            FloatFooter = { bg = theme.ui.bg_dim },
            FloatTitle = { bg = theme.ui.bg_dim },
            FloatBorder = { bg = theme.ui.bg_dim },
            TelescopeTitle = { fg = theme.ui.special, bold = true },
            TelescopePromptNormal = { bg = theme.ui.bg_dim },
            TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_dim },
            TelescopeResultsNormal = { fg = 'None',  bg = theme.ui.bg_dim },
            TelescopeResultsBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_dim },
            TelescopePreviewNormal = { bg = theme.ui.bg_dim },
            TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
            Visual = { bg = '#262626' },
            -- ColorColumn = { bg = '#272727' },
            -- IncSearch = { bg = '#8E9092' },
          }
        end,
      }
    end,
    init = function()
      vim.cmd.colorscheme 'kanagawa-dragon'
    end,
  },
}
