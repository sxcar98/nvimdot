local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Highlight on yank
autocmd("TextYankPost", {
	callback = function()
		vim.hl.on_yank({
			higroup = "IncSearch",
			timeout = "200",
		})
	end,
})

-- Remove whitespace on save
autocmd("BufWritePre", {
	pattern = "",
	command = ":%s/\\s\\+$//e",
})

-- Don"t auto commenting new lines
autocmd("BufEnter", {
	pattern = "",
	command = "set fo-=cro",
})

-- enable wrap and spell in text file
autocmd("Filetype", {
	pattern = { "gitcommit", "markdown", "text" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})
