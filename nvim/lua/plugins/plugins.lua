-- Lazy Neovim is package manager for Neovim

-- Any external packages need to be required here


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
        "williamboman/mason-lspconfig.nvim",
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

	-- Auto-completion engine
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"lspkind.nvim", -- Good looking autocomplete tab
            -- cmp- plugins are completion source helpers used by nvim-cmp
			"hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
			"hrsh7th/cmp-buffer", -- buffer auto-completion
			"hrsh7th/cmp-path", -- path auto-completion
			"hrsh7th/cmp-cmdline", -- cmdline auto-completion
		},
		config = function()
			require("plugins.auto_complete")
		end,
	},

    -- Git decoration (show new and deleted lines)
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require('gitsigns').setup()
        end
    },

    -- Lua Line (status line plugin)
    {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
    }
})
