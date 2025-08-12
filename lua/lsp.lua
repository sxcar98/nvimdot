local enable = vim.lsp.enable
local config = vim.lsp.config

local servers = {
	"clangd",
	"jsonls",
	"rust_analyzer",
	"lua_ls",
	"pyright",
	"sqls",
}

local on_attach = function(client, bufnr)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false
	local opts = { noremap = true, silent = true, buffer = bufnr }
	local map = vim.keymap.set
	vim.o.updatetime = 300
	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
		end,
	})
end

local options = {
	on_attach = on_attach,
}

for _, lsp in ipairs(servers) do
	config(lsp, options)
	enable(lsp)
end
