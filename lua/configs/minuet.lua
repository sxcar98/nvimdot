local minuet = require("minuet")

local options = {
	virtualtext = {
		auto_trigger_ft = {},
		keymap = {
			-- accept whole completion
			accept = "<A-A>",
			-- accept one line
			accept_line = "<A-a>",
			-- accept n lines (prompts for number)
			-- e.g. "A-z 2 CR" will accept 2 lines
			accept_n_lines = "<A-z>",
			-- Cycle to prev completion item, or manually invoke completion
			prev = "<A-[>",
			-- Cycle to next completion item, or manually invoke completion
			next = "<A-]>",
			dismiss = "<A-e>",
		},
	},
	provider = "openai_fim_compatible",
	provider_options = {
		openai_fim_compatible = {
			model = "deepseek-chat",
			end_point = "https://api.deepseek.com/beta/completions",
			api_key = "DEEPSEEK_API_KEY",
			name = "deepseek",
			stream = true,
			optional = {
				max_tokens = 256,
				top_p = 0.9,
			},
		},
	},
}

minuet.setup(options)
