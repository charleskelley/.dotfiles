-- save undo history
vim.o.undofile = true

-- non swap file nuisance
vim.o.noswapfile = true

-- line numbers
vim.wo.relativenumber = true
vim.wo.number = true

-- enable mouse mode
vim.o.mouse = "a"

-- tabs, spaces as tabs, and indentation
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true

-- line wrapping and textwidth
vim.o.wrap = false
vim.o.textwidth = 80

-- case insensitive searching unless /c or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

-- cursor line and ruler highlight
vim.o.cursorline = true
vim.o.colorcolumn = "80"

-- truecolor and prefer dark background
vim.o.termguicolors = true
vim.o.background = "dark"

-- allow backspace on indent, end of line or insert mode start position
vim.o.backspace = "indent,eol,start"

-- use system clipboard as default register-- clipboard
vim.opt.clipboard:append("unnamedplus")

-- set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- split veritcal windows up to right and horizontal windows below
vim.o.splitright = true
vim.o.splitbelow = true

-- consider string-string as whole word
vim.opt.iskeyword:append("-")
