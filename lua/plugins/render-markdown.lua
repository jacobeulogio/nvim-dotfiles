return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    completions = { blink = { enabled = true } },
    heading = {
      enabled = true,
      sign = false,
      position = 'inline',
      -- backgrounds = {},

      width = 'block',
      left_pad = 1,
      right_pad = 1,
      icons = { }
    }
  },
}
