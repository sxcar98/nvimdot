local map = vim.keymap.set

vim.g.mapleader = " "

-- Move around splits
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window right" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window down" })

-- Telescope
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, { desc = "Open Telescope to find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Open Telescope to do live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Open Telescope to list buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Open Telescope to show help" })
map("n", "<leader>fo", builtin.oldfiles, { desc = "Open Telescope to list recent files" })
map("n", "<leader>cm", builtin.git_commits, { desc = "Open Telescope to list git commits" })
-- NvimTree
map("n", "<leader>n", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree sidebar" }) -- open/close
map("n", "<leader>nr", ":NvimTreeRefresh<CR>", { desc = "Refresh NvimTree" }) -- refresh
map("n", "<leader>nf", ":NvimTreeFindFile<CR>", { desc = "Search file in NvimTree" }) -- search file

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP Diagnostic loclist" })

-- Comment
map("n", "mm", "gcc", { desc = "Toggle comment", remap = true })
map("v", "mm", "gc", { desc = "Toggle comment", remap = true })
