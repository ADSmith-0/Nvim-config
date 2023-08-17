local hl_list = {}
local theme_colors = require("onedarkpro.helpers")
local colors = theme_colors.get_colors()

for i, color in pairs({ colors.yellow, colors.green, colors.purple, colors.blue }) do
  local name = 'IndentBlanklineIndent' .. i
  vim.api.nvim_set_hl(0, name, { fg = color })
  table.insert(hl_list, name);
end
require("indent_blankline").setup {
  char_highlight_list = hl_list,
}
