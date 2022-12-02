-- set colorscheme to falcon with protected call
-- in case it isn't installed
local status, _ = pcall(vim.cmd, "colorscheme falcon")
if not status then
  print("Colorscheme not found!") -- print error if colorscheme not installed
  return
end