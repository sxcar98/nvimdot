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
		"m4xshen/autoclose.nvim",
		lazy = true,
		event = "InsertEnter",
		opts = require("configs.autoclose"),
	},
	{ "nvim-lua/plenary.nvim" },
	{
		"nvim-tree/nvim-tree.lua",
		opts = require("configs.tree"),
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = require("configs.lualine"),
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
		opts = require("configs.treesitter"),
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		cmd = "Telescope",
		config = function()
			require("configs.telescope")
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
		},
		opts = function()
			require("configs.cmp")
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvimtools/none-ls-extras.nvim" },
		lazy = false,
		config = function()
			require("configs.null-ls")
		end,
	},
}

require("lazy").setup({
	spec = plugins,
	lockfile = vim.fn.stdpath("state") .. "/lazy/lock.json",
	rocks = {
		enabled = false,
	},
})
