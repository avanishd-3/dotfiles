-- Lazy Neovim is package manager for Neovim

-- Any external packages need to be required here

-- Internal stuff is required at the end of this file


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        -- Tokyo Night color scheme

        "folke/tokyonight.nvim",
        lazy = false, -- Want color scheme to load before everything else
        priority = 1000,
        opts = {},
    },

    {
        -- LSP Manager

        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
    },

    {
        -- Autopairs for [], (), "", '', {}
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },

    {
        --Show indent lines
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config -- Ignore undefined type warning 
        opts = {},
    },

    {
        -- File tree
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false, -- Lazy loading here has no performance benefit & might mess stuff up
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- Adds file icons
        },
        config = function()
            require("nvim-tree").setup {}
        end,
    },

    -- Autocomplete tab looks like vscode
	{
		"onsails/lspkind.nvim",
		event = { "VimEnter" },
	},

	-- Auto-complete
	{

    -- Using blink.cmp b/c it is faster than nvim-cmp, which means better performance on large files


    -- See: https://cmp.saghen.dev/installation.html
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets' },

    -- use a release tag to download pre-built binaries
    version = '1.*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- 'super-tab' for mappings similar to vscode (tab to accept)
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = {
            -- Tab and Shift-Tab to go through menu, similar to nvim-cmp
            -- See: https://github.com/LazyVim/LazyVim/discussions/5152
            preset = 'enter',
            ["<Tab>"] = { 'select_next', 'fallback' },
            ["<S-Tab>"] = { 'select_prev', 'fallback' },
            },

        cmdline = {
            completion = {
                menu = { auto_show = true }, -- Have menu always open
                list = {
                    selection = {
                        -- Unlike insert mode, cannot use enter to accept first suggestion
                        -- This allows using Tab to do so
                        preselect = false,
                    },
                },
            }
        },

        appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
        },

        completion = {
            -- I like it showing the documentation pop-up
            -- If having issues with it slowing autocomplete, add auto_show_delay_ms = 200
            documentation = { auto_show = true },

            -- Add lspkind icons to the completion menu
            -- See: https://cmp.saghen.dev/recipes.html#nvim-web-devicons-lspkind
            menu = {
                draw = {
                    components = {
                        kind_icon = {
                            ellipsis = false, -- Don't truncate icon
                            text = function(ctx)
                                local icon = ctx.kind_icon
                                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                                    local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                                    if dev_icon then
                                        icon = dev_icon
                                    end
                                else
                                    icon = require("lspkind").symbolic(ctx.kind, {
                                        mode = "symbol",
                                    })
                                end

                                return icon .. ctx.icon_gap
                            end,

                            -- Optionally, use highlight groups from nvim-web-devicons
                            -- Can also add the same function for 'kind.highlight' if you want to 
                            -- keep the highlight groups in sync with the icons
                            highlight = function(ctx)
                                local hl = ctx.kind_hl
                                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                                    local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                                    if dev_icon then
                                        hl = dev_hl
                                    end
                                end
                                return hl
                            end,
                        },
                    },
                },
            },
        },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        },

        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
        -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
        --
        -- See the fuzzy documentation for more information
        fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
	},

    -- Git stuff
    {
        -- Show new/deleted lines & can commit hunks
        "lewis6991/gitsigns.nvim",
        config = function()
            require('gitsigns').setup()
        end
    },
    {
        -- Show Git diff view (like VSCode Source Control)
        "sindrets/diffview.nvim"
    },
    {
        -- Add Git commands
        "tpope/vim-fugitive"
    },

    -- Lua Line (status line plugin)
    {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    -- Improved syntax highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        branch = 'main', -- Need to specify b/c master is old branch
        build = ':TSUpdate' -- Makes sure all installed parsers are updated to latest version
    },

    -- Markdown preview
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() -- See: https://github.com/iamcco/markdown-preview.nvim/issues/690
            vim.opt.rtp:prepend(vim.fn.stdpath('data') .. '/lazy/markdown-preview.nvim')
            vim.fn['mkdp#util#install']()
            end,
    },

    -- Typst preview
    {
        'chomosuke/typst-preview.nvim',
        lazy = false, -- or ft = 'typst'
        version = '1.*',
        opts = {}, -- lazy.nvim will implicitly calls `setup {}`
    }
})

-- Require the internal stuff here so main init.lua doesn't need to
require("plugins.colorscheme")
require("plugins.lsp")
require("plugins.status_line")
require("plugins.treesitter")
