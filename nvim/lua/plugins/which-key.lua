-- import which-key plugin safely
local which_status, which_key = pcall(require, "which-key")
if not which_status then
	return
end

-- use default which-key configuration by providing none
which_key.setup()

-- module return for easy access in kemaps.lua
return which_key
