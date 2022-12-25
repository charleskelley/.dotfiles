-- import bufferline plugin safely
local status, barbar = pcall(require, "barbar")
if not status then
	return
end

-- load bufferline using default configuration
barbar.setup({})
