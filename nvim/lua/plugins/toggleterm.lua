-- import toggleterm plugin safely
local status, toggleterm = pcall(require, "toggleterm")
if not status then
	return
end

-- load toggleterm using default configuration
toggleterm.setup({})
