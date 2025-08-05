return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    formatters_by_ft = {

      lua = { 'stylua' },
      rust = { 'rustfmt' },
      python = { 'ruff_fix', 'ruff_format' },
      nix = { 'alejandra' },
      go = { 'goimports', 'gofmt' },

      bash = { 'beautysh' },
      sh = { 'beautysh' },

      javascript = { 'prettier' },
      typescript = { 'prettier' },
      html = { 'prettier' },
      css = { 'prettier' },
      json = { 'prettier' },
      yaml = { 'prettier' },
      markdown = { 'prettier' },

      -- sql = { 'sql-formater' },
    },
  },
}
