-- Require order matters

-- 1. require("mason)
-- 2. require("lspconfig")


-- Mason makes it easier to manage LSPs

-- I used to use mason-lspconfig to help setup LSPs, but the native LSP setup in 0.11 offers the same functionality
-- Mason-lspconfig is useful if you use the :LspInstall command (install LSP based on file type), but I never used it

require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

-- Different settings for each language
-- Use native LSP config for all

-- Vim global warning only goes away when using native LSP setup
vim.lsp.config('lua_ls', { -- Lua settings

    settings = {

        Lua = {
            telemetry = { -- Do not send telemetry to Lua
                enable = false,
            },
            diagnostics = {
                -- Allow LSP to recognize 'vim' global
                -- So it doesn't warn when using vim commands in nvim setup
                globals = {"vim"},
            },
        },
    },
})

vim.lsp.config('rust_analyzer', { -- Rust settings
})

vim.lsp.config('clangd', { -- C/C++settings
})

vim.lsp.config('basedpyright', { -- Python settings
    settings = {
        basedpyright = {
            -- Use Ruff's import organizer
            disableOrganizeImports = true,
        },
        python = {
            analysis = {
                -- Ignore all files for analysis to exclusively use Ruff for linting
                ignore = {'*'},
            }
        }
    }
})

vim.lsp.config('ruff', { -- Ruff settings (linter & formatter for Python)
})

-- Have Ruff defer to Based Pyright for certain capabilities
-- See: https://docs.astral.sh/ruff/editors/setup/#neovim
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then
      return
    end
    if client.name == 'ruff' then
      -- Disable hover in favor of Based Pyright
      client.server_capabilities.hoverProvider = false
    end
  end,
  desc = 'LSP: Disable hover capability from Ruff',
})

-- Enable LSP servers
vim.lsp.enable({
    'lua_ls', -- Lua LSP
    'rust_analyzer', -- Rust LSP
    'clangd', -- C/C++ LSP
    'basedpyright', -- Python LSP
    'ruff',  -- Python formatter & linter
    'marksman' -- Markdown LSP
})
