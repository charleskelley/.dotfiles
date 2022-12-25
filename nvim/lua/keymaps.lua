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

-- quick buffer actions
map("n", "<Tab>", ":BufferNext<CR>", { desc = "Next Tab" })
map("n", "<S-Tab>", ":BufferPrevious<CR>", { desc = "Previous Tab" })
map("n", "<leader>c", ":BufferClose<CR>", { desc = "Close Buffer" })

-- increment/decrement numbers
map("n", "<leader>+", "<C-a>", { desc = "Increment Number" })
map("n", "<leader>-", "<C-x>", { desc = "Decrement Number" })

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

-- nvim-tree
map("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
-- map("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
-- map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
-- map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
-- map("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
-- map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

wk.register({
	f = {
		name = "Find",
		f = { "<cmd>Telescope find_files<cr>", "Find File" },
		s = { "<cmd>Telescope live_grep<cr>", "Find String" },
		c = { "<cmd>Telescope grep_string<cr>", "Find String Under Cursor" },
		b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
		h = { "<cmd>Telescope help_tags<cr>", "Find Help Tag" },
	},
}, { prefix = "<leader>" })

-- telescope git commands (not on youtube nvim video)
map("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
map("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
map("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
map("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
map("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary
