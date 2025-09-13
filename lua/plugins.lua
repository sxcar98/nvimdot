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
		"folke/which-key.nvim",
		event = "VeryLazy",
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
		lazy = true,
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
			require("dbee").install()
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
		"benlubas/molten-nvim",
		build = ":UpdateRemotePlugins",
		init = function()
			-- I find auto open annoying, keep in mind setting this option will require setting
			-- a keybind for `:noautocmd MoltenEnterOutput` to open the output again
			vim.g.molten_auto_open_output = false

			-- this guide will be using image.nvim
			-- Don't forget to setup and install the plugin if you want to view image outputs
			vim.g.molten_image_provider = "image.nvim"

			-- optional, I like wrapping. works for virt text and the output window
			vim.g.molten_wrap_output = true

			-- Output as virtual text. Allows outputs to always be shown, works with images, but can
			-- be buggy with longer images
			vim.g.molten_virt_text_output = true

			-- this will make it so the output shows up below the \`\`\` cell delimiter
			vim.g.molten_virt_lines_off_by_1 = true
			vim.g.molten_output_win_max_height = 20
		end,
		config = function()
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
		"quarto-dev/quarto-nvim",
		dependencies = {
			"jmbuhr/otter.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("configs.quarto")
		end,
	},
	{
		"GCBallesteros/jupytext.nvim",
		config = function()
			require("configs.jupytext")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		config = function()
			require("configs.textobjects")
		end,
	},
	{
		"nvimtools/hydra.nvim",
		config = function()
			require("configs.hydra")
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
