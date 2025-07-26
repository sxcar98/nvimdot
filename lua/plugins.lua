local plugins = {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = require("configs.tokyonight"),
	},
	{
		"f-person/auto-dark-mode.nvim",
		lazy = false,
		opts = require("configs.auto-dark-mode"),
	},
	{
		"windwp/nvim-autopairs",
		lazy = true,
		event = "InsertEnter",
		config = function()
			require("configs.autopairs")
		end,
	},
	{
		"nvim-lua/plenary.nvim",
	},
	{
		"MunifTanjim/nui.nvim",
	},
	{
		"nvim-tree/nvim-web-devicons",
	},
	{
		"echasnovski/mini.icons",
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		lazy = false,
		opts = require("configs.tree"),
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = require("configs.lualine"),
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = require("configs.noice"),
		dependencies = {
			"rcarriga/nvim-notify",
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPost", "BufNewFile", "BufWritePost" },
		opts = require("configs.gitsigns"),
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufReadPre",
		build = ":TSUpdate",
		cmd = "TSUpdate",
		config = function()
			require("configs.treesitter")
		end,
	},
	{
		"ibhagwan/fzf-lua",
		event = "VeryLazy",
		config = function()
			require("configs.fzf")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			require("configs.lsp")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			{
				"L3MON4D3/LuaSnip",
				build = "make install_jsregexp",
			},
		},
		config = function()
			require("configs.cmp")
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		lazy = false,
		opts = require("configs.conform"),
	},
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPost", "BufWritePost" },
		config = function()
			require("configs.lint")
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
		ft = { "markdown", "codecompanion" },
    lazy = true,
		opts = {},
	},
	{
		"yelog/marklive.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		lazy = true,
		ft = "markdown",
		opts = {},
	},
}

require("lazy").setup({
	spec = plugins,
	lockfile = vim.fn.stdpath("state") .. "/lazy/lock.json",
	rocks = {
		enabled = false,
	},
})
