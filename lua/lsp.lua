local enable = vim.lsp.enable
local config = vim.lsp.config

local servers = {
	"clangd",
	"jsonls",
	"rust_analyzer",
	"lua_ls",
	"basedpyright",
	"sqls",
}

local on_attach = function(client, bufnr)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false
	local opts = { noremap = true, silent = true, buffer = bufnr }
	local keymap = vim.keymap.set
	vim.o.updatetime = 300
	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
		end,
	})
	keymap("n", "gd", vim.lsp.buf.definition, opts)
	keymap("n", "K", vim.lsp.buf.hover, opts)
	keymap("n", "gi", vim.lsp.buf.implementation, opts)
	keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
	keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	keymap("n", "gr", vim.lsp.buf.references, opts)
	keymap("n", "[d", vim.diagnostic.goto_prev, opts)
	keymap("n", "]d", vim.diagnostic.goto_next, opts)
	keymap("n", "<leader>q", vim.diagnostic.setloclist, opts)
	keymap("n", "<leader>f", function()
		vim.lsp.buf.format({ async = true })
	end, opts)
end

local options = {
	on_attach = on_attach,
}

for _, lsp in ipairs(servers) do
	config(lsp, options)
	enable(lsp)
end
