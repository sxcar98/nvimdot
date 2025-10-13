local render_markdown = require("render-markdown")

render_markdown.setup({
	file_types = {
		"markdown",
		"Avante",
	},
	completions = {
		lsp = {
			enabled = true,
		},
	},
})
