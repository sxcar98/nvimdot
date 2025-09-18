local map = vim.keymap.set

-- set space as leader key
vim.g.mapleader = " "

-- Move around splits
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window right" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window down" })

-- fzf-lua
local fzf = require("fzf-lua")
map("n", "<leader>ff", fzf["files"], { desc = "Open fzf-lua to find files" })
map("n", "<leader>fg", fzf["live_grep"], { desc = "Open fzf-lua to do live grep" })
map("n", "<leader>fb", fzf["buffers"], { desc = "Open fzf-lua to list buffers" })
map("n", "<leader>fh", fzf["help_tags"], { desc = "Open fzf-lua to show help" })
map("n", "<leader>fo", fzf["oldfiles"], { desc = "Open fzf-lua to list recent files" })
map("n", "<leader>cm", fzf["git_commits"], { desc = "Open fzf-lua to list git commits" })

-- neo-tree
map("n", "<leader>n", ":Neotree toggle<CR>", { desc = "Toggle neo-tree sidebar" })

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP Diagnostic loclist" })

-- Comment
map("n", "mm", "gcc", { desc = "Toggle comment", remap = true })
map("v", "mm", "gc", { desc = "Toggle comment", remap = true })

-- molten
map("n", "<leader>bb", ":MoltenEvaluateLine<CR>", { desc = "Run current line" })
