return {
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- { 'mason-org/mason.nvim', opts = {} },
      -- { 'mason-org/mason-lspconfig.nvim', opts = {} },
      -- 'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      'saghen/blink.cmp',
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
          map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
          map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
          map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
          map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')
          map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')
          map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

        end,
      })

      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
        virtual_text = {
          source = 'if_many',
          spacing = 2,
          format = function(diagnostic)
            if diagnostic.code then
              return string.format('[%s] %s', diagnostic.code, diagnostic.message)
            else
              return diagnostic.message[diagnostic.severity]
            end
          end,
        },
      }

      local servers = {
        ruff = {
          init_options = {
            settings = {
              lineLength = 120,
              logLevel = 'debug',
            },
          },
        },

        pylsp = {
          settings = {
            pylsp = {
              plugins = {
                ruff = { enabled = false },
                pycodestyle = { enabled = false },
                flake8 = { enabled = false },
                pyflakes = { enabled = false },
                mccabe = { enabled = false },
                pylint = { enabled = false },
                autopep8 = { enabled = false },
                yapf = { enabled = false },
                pylsp_mypy = { enabled = false },
                pylsp_black = { enabled = false },
                pylsp_isort = { enabled = false },
                jedi_definition = { enabled = true },
                jedi_completion = { enabled = true },
                jedi_references = { enabled = true },
                jedi_signature_help = { enabled = true },
                jedi_symbols = { enabled = true },
              },
            },
          },
        },

        lua_ls = {
          settings = {
            Lua = {
              completion = { callSnippet = 'Replace' },
              diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },

      gopls = {},
      prettier = {},
      rust_analyzer = {},
      alejandra = {},
      nil_ls = {},

      }

      -- ---@type MasonLspconfigSettings
      -- ---@diagnostic disable-next-line: missing-fields
      -- require('mason-lspconfig').setup {
      --   automatic_enable = vim.tbl_keys(servers or {}),
      --   handlers = {
      --     function(server_name)
      --       local server = servers[server_name] or {}
      --       server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
      --     end,
      --   },
      -- }

      for server_name, config in pairs(servers) do
        vim.lsp.enable(server_name)
        vim.lsp.config(server_name, config)
      end
    end,
  }
}
