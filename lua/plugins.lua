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
		configs = function()
			require("configs.tree")
		end,
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
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPost", "BufNewFile", "BufWritePost" },
		opts = require("configs.gitsigns"),
	},
	{
		"ibhagwan/fzf-lua",
		event = "VeryLazy",
		config = function()
			require("configs.fzf")
		end,
	},
	{
		"saghen/blink.cmp",
		dependencies = {
			{ "rafamadriz/friendly-snippets" },
		},
		build = "cargo build --release",
		config = function()
			require("configs.blink")
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		lazy = false,
		config = function()
			require("configs.conform")
		end,
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("configs.lint")
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = {
			"markdown",
			"codecompanion",
		},
		config = function()
			require("configs.render-markdown")
		end,
		lazy = true,
	},
	{
		"toppair/peek.nvim",
		event = { "VeryLazy" },
		build = "deno task --quiet build:fast",
		config = function()
			require("configs.peek")
		end,
	},
	{
		"nanotee/sqls.nvim",
		lazy = true,
		ft = {
			"Dbee",
			"sql",
			"mysql",
		},
	},
	{
		"kndndrj/nvim-dbee",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		build = function()
			require("dbee").install("go")
		end,
		config = function()
			require("configs.dbee")
		end,
	},
	{
		"milanglacier/minuet-ai.nvim",
		enabled = false,
		config = function()
			require("configs.minuet")
		end,
	},
	{
		"nvim-neotest/nvim-nio",
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			require("configs.dap")
		end,
	},
	{
		"igorlfs/nvim-dap-view",
		config = function()
			require("configs.dap-view")
		end,
	},
	{
		"GCBallesteros/jupytext.nvim",
		config = function()
			require("configs.jupytext")
		end,
	},
	{
		"benlubas/molten-nvim",
		build = ":UpdateRemotePlugins",
		init = function()
			require("configs.molten")
		end,
	},
	{
		"3rd/image.nvim",
		config = function()
			require("configs.image")
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
	},
}

require("lazy").setup({
	spec = plugins,
	lockfile = vim.fn.stdpath("state") .. "/lazy/lock.json",
	rocks = {
		enabled = false,
	},
})
