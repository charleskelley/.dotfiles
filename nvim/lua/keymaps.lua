vim.g.mapleader = " "

-- a cleaner key mapping function that passes additional options
local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- which-key safe import and configuration
local wk = require("plugins.which-key")

-------------------------------------------------------------------------------
-- general keymaps ------------------------------------------------------------
-------------------------------------------------------------------------------

-- use jk to exit insert mode
map("i", "jk", "<ESC>")

-- clear search highlights
map("n", "<leader>h", ":nohl<CR>", { desc = "Highlights Off" })

-- delete single character without copying into register
map("n", "x", '"_x')

-- toggle file explorer
map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Explore Files Toggle" })

-- quick buffer actions
map("n", "<Tab>", ":BufferNext<CR>", { desc = "Next Tab" })
map("n", "<S-Tab>", ":BufferPrevious<CR>", { desc = "Previous Tab" })
map("n", "<leader>c", ":BufferClose<CR>", { desc = "Close Buffer" })

-- increment/decrement numbers
map("n", "<leader>+", "<C-a>", { desc = "Increment Number" })
map("n", "<leader>-", "<C-x>", { desc = "Decrement Number" })

-- mapping to restart lsp if necessary
map("n", "<leader>R", ":LspRestart<CR>", { desc = "Restart LSP" })

-------------------------------------------------------------------------------
-- grouped keymaps ------------------------------------------------------------
-------------------------------------------------------------------------------

-- plugin management
wk.register({
	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "PackerCompile" },
		i = { "<cmd>PackerInstall<cr>", "PackerInstall" },
		s = { "<cmd>PackerSync<cr>", "PackerSync" },
		S = { "<cmd>PackerStatus<cr>", "PackerStatus" },
		u = { "<cmd>PackerUpdate<cr>", "PackerUpdate" },
	},
}, { prefix = "<leader>" })

-- split window management
wk.register({
	s = {
		name = "Split",
		c = { ":close<CR>", "Close Split" },
		e = { "<C-w>=", "Equal Split" },
		h = { "<C-w>s", "Horizontal Split" },
		m = { "<cmd>MaximizerToggle<cr>", "Maximze Split" },
		v = { "<C-w>v", "Vertical Split" },
	},
}, { prefix = "<leader>" })

-- buffer management
wk.register({
	b = {
		name = "Buffer",
		b = { "<cmd>BufferMovePrevious<cr>", "Backward Move Buffer" },
		f = { "<cmd>BufferMoveNext<cr>", "Forward Move Buffer" },
		n = { "<cmd>BufferNext<cr>", "Next Buffer Tab" },
		p = { "<cmd>BufferPrevious<cr>", "Previous Buffer Tab" },
	},
}, { prefix = "<leader>" })

-- finding stuff
wk.register({
	f = {
		name = "Find",
		f = { "<cmd>Telescope find_files<cr>", "File Find" },
		s = { "<cmd>Telescope live_grep<cr>", "String Find" },
		c = { "<cmd>Telescope grep_string<cr>", "String Under Cursor Find" },
		b = { "<cmd>Telescope buffers<cr>", "Buffer Find" },
		h = { "<cmd>Telescope help_tags<cr>", "Help Tag Find" },
	},
}, { prefix = "<leader>" })

-- git source control
wk.register({
	g = {
		name = "Git",
		b = { "<cmd>Telescope git_branches<cr>", "Branches List" },
		c = { "<cmd>Telescope git_commits<cr>", "Commits List" },
		f = { "<cmd>Telescope git_bcommits<cr>", "File Commits List" },
		s = { "<cmd>Telescope git_status<cr>", "Status Changes List" },
	},
}, { prefix = "<leader>" })
-- map("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
-- map("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
-- map("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
-- map("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- language server protocol
-- wk.register({
-- 	l = {
-- 		name = "LSP",
-- 		b = { "<cmd>Telescope git_branches<cr>", "Branches List" },
-- 		c = { "<cmd>Telescope git_commits<cr>", "Commits List" },
-- 		f = { "<cmd>Telescope git_bcommits<cr>", "File Commits List" },
-- 		s = { "<cmd>Telescope git_status<cr>", "Status Changes List" },
--         t = { , }
-- 	},
-- }, { prefix = "<leader>" })
