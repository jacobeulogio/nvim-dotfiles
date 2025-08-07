return {
  {
    'rebelot/kanagawa.nvim',
    priority = 1001,
    config = function()
      require('kanagawa').setup {
        transparent = true,
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = 'none',
                bg_dim = '#141414',
              },
            },
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
            IncSearch = { bg = '#4e4e4e', fg = 'None' },
            MiniStatuslineDevinfo = { fg = '#767676',  bg = theme.ui.bg_dim },
            MiniStatuslineFileinfo = { fg = '#767676', bg = theme.ui.bg_dim },
            MiniStatuslineFilename = { fg = '#767676', bg = theme.ui.bg_dim },
            MiniStatuslineModeNormal = { fg = '#767676', bg = '#1E1E1E' },
            MiniStatuslineModeInsert = { fg = '#767676', bg = '#1E1E1E' },
            MiniStatuslineModeVisual = { fg = '#767676', bg = '#1E1E1E' },
            MiniStatuslineModeReplace = { fg = '#767676', bg = '#1E1E1E' },
            MiniStatuslineModeCommand = { fg = '#767676', bg = '#1E1E1E' },
            Pmenu = { bg = theme.ui.bg_dim },
            PmenuExtra = { bg = theme.ui.bg_dim },
            PmenuSel = { bg = '#1E1E1E' },
            PmenuKind = { bg = theme.ui.bg_dim },
            PmenuKindSel = { bg = '#3E3E3E' },
            PmenuThumb = { bg = '#8E9092' },
            PmenuSbar = { bg = '#3E3E3E' },
            WinSeparator = { fg = '#272727' },
            CurSearch = { fg = 'NONE', bg = '#303030' },
            Search = { fg = 'NONE', bg = '#303030' },
            LspReferenceText = { bg = '#303030' },
            LspReferenceWrite = { bg = '#303030', underline = false },
            NormalFloat = { bg = theme.ui.bg_dim },
            FloatFooter = { bg = theme.ui.bg_dim },
            FloatTitle = { bg = theme.ui.bg_dim },
            FloatBorder = { bg = theme.ui.bg_dim },
            TelescopeTitle = { fg = theme.ui.special, bold = true },
            TelescopePromptNormal = { bg = theme.ui.bg_dim },
            TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_dim },
            TelescopeResultsNormal = { fg = 'None', bg = theme.ui.bg_dim },
            TelescopeResultsBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_dim },
            TelescopePreviewNormal = { bg = theme.ui.bg_dim },
            TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
            Visual = { bg = '#262626' },
            MatchParen = { bg = '#303030', fg = 'None' },
          }
        end,
      }
    end,
    init = function()
      vim.cmd.colorscheme 'kanagawa-dragon'
    end,
  },
}
