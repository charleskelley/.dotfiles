-- import bufferline plugin safely
local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

-- load bufferline using default configuration
bufferline.setup({})
