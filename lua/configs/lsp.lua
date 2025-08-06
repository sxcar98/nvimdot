local config = vim.lsp.config
local enable = vim.lsp.enable

local function deep_merge(dst, src)
	for key, value in pairs(src) do
		if type(dst[key]) == "table" and type(value) == "function" then
			dst[key] = value(dst[key])
		elseif type(dst[key]) == "table" and vim.islist(dst[key]) and key ~= "dashboard_image" then
			vim.list_extend(dst[key], value)
		elseif type(dst[key]) == "table" and type(value) == "table" and not vim.islist(dst[key]) then
			deep_merge(dst[key], value)
		else
			dst[key] = value
		end
	end
	return dst
end

local on_attach = function(client, bufnr)
	client.server_capabilities.diagnosticProvider = false
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = {
	"clangd",
	"jsonls",
	"rust_analyzer",
	"lua_ls",
	"pyright",
	"sqls",
}

for _, lsp in ipairs(servers) do
	local options = {
		on_attach = on_attach,
		capabilities = capabilities,
	}
	local ok, opt = pcall(require, "lsp." .. lsp)
	if ok then
		options = deep_merge(options, opt)
	end
	config(lsp, options)
	enable(lsp)
end
