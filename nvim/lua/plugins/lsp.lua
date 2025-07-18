-- Require order matters

-- 1. require("mason)
-- 2. require ("mason-lspconfig")
-- 3. require("lspconfig")


-- Mason and mason-lspconfig make it easier to manage LSPs

require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require('mason-lspconfig').setup({
    -- Automatically install these servers

    ensure_installed = {
        'lua_ls', -- Lua LSP
        'rust_analyzer', -- Rust LSP
        'clangd', -- C/C++ LSP
        'pylsp', -- Python LSP

    },
})

-- Different settings for each language

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({ -- Lua settings

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

lspconfig.rust_analyzer.setup{ -- Rust settings
}

lspconfig.clangd.setup{ -- C/C++ settings

}
