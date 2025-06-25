local cmp = require("cmp")

local options = {
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},

	mapping = cmp.mapping.preset.insert({
		-- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
		-- ["<C-f>"] = cmp.mapping.scroll_docs(4),
		-- ["<C-e>"] = cmp.mapping.abort(),
		-- ["<Tab>"] = cmp.mapping(function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_next_item()
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, { "i", "s" }),
		--
		-- ["<S-Tab>"] = cmp.mapping(function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_prev_item()
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, { "i", "s" }),
		-- ["<CR>"] = cmp.mapping({
		-- 	i = function(fallback)
		-- 		if cmp.visible() and cmp.get_active_entry() then
		-- 			cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
		-- 		else
		-- 			fallback()
		-- 		end
		-- 	end,
		-- 	s = cmp.mapping.confirm({ select = true }),
		-- 	c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
		-- }),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "luasnip" },
		{ name = "path" },
	},
}

cmp.setup(options)
