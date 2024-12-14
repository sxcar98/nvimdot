local null_ls = require("null-ls")
local bltns = null_ls.builtins

local sources = {
	bltns.formatting.stylua,
	bltns.formatting.clang_format.with({
		filetypes = { "c", "cpp", "cc", "h", "hpp" },
	}),
}

local options = {

	sources = sources,

	-- format on save
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({
				group = vim.api.nvim_create_augroup("LspFormatting", {}),
				buffer = bufnr,
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = vim.api.nvim_create_augroup("LspFormatting", {}),
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						async = false,
					})
				end,
			})
		end
	end,
}

null_ls.setup(options)
