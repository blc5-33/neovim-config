require("upanshu")
-- print("hello")

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
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		-- or                              , branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{ "rose-pine/neovim", name = "rose-pine", lazy = false},
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
	"theprimeagen/harpoon",
	"mbbill/undotree", -- press " u"
	"tpope/vim-fugitive", -- press " gs", vim-style git management (insane!!!)
	"neovim/nvim-lspconfig",
    "williamboman/mason.nvim",

	-- From LSP Zero docs: https://lsp-zero.netlify.app/v3.x/blog/theprimeagens-config-from-2022.html
	"williamboman/mason-lspconfig.nvim",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"saadparwaiz1/cmp_luasnip",
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",

    -- Debug
    "mfussenegger/nvim-dap",
    {
        'jay-babu/mason-nvim-dap.nvim',

        dependencies = {
            'williamboman/mason.nvim',
            'mfussenegger/nvim-dap',
        },
        opts = {
            handlers = {},
            -- I wanted to do this in a separate file in after/dap.lua
            -- but couldn't figure out how... maybe that's for when I redo
            -- my nvim config later in the future...
            ensure_installed = {
                'codelldb',
            }
        },
    },
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio'},
        config = function ()
            local dap = require('dap')
            local dapui = require('dapui')
            dapui.setup()
            dap.listeners.after.event_initialized['dapui_config'] = function ()
                dapui.open()
            end
            dap.listeners.after.event_terminated['dapui_config'] = function ()
                dapui.close()
            end
            dap.listeners.after.event_exited['dapui_config'] = function ()
                dapui.close()
            end
        end
    },
})
