return {
  {
    'aktersnurra/no-clown-fiesta.nvim',
    priority = 1000,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('no-clown-fiesta').setup {
        transparent = true,
        styles = {
          -- You can set any of the style values specified for `:h nvim_set_hl`
          comments = {},
          functions = {},
          keywords = {},
          lsp = {},
          match_paren = {},
          type = {},
          variables = {},
        },
      }
      vim.cmd.colorscheme 'no-clown-fiesta'
    end,
  },
}
