-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
	return
end

-- load lualine using default configuration
lualine.setup({})
