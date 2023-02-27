
local M = {}


M.ui = {
  theme_toggle = { "falcon", "gruvbox" },
  theme = "chocolate",
}


-- custom plugins and settings overrides
M.plugins = require "custom.plugins"


-- check core.mappings for table structure
-- M.mappings = require "custom.mappings"


return M
