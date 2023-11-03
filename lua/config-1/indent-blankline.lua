-- local hl_list = {}
-- local theme_colors = require("onedarkpro.helpers")
--
-- for i, color in pairs({ "yellow", "green", "purple", "blue" }) do
--   local name = 'IndentBlanklineIndent' .. i
--   vim.api.nvim_set_hl(0, name, { fg = theme_colors.darken(color, 25, "onedark") })
--   table.insert(hl_list, name);
-- end
require("ibl").setup()
