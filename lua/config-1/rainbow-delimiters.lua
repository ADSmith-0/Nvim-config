local rainbow_delimiters = require 'rainbow-delimiters'

local color = require("onedarkpro.helpers")
local colors = color.get_colors()

vim.cmd('highlight RainbowDelimiterViolet guifg=' .. colors.purple)
vim.cmd('highlight RainbowDelimiterBlue guifg=' .. colors.blue)
vim.cmd('highlight RainbowDelimiterYellow guifg=' .. colors.yellow)

vim.g.rainbow_delimiters = {
  strategy = {
    [''] = rainbow_delimiters.strategy['global'],
  },
  query = {
    [''] = 'rainbow-delimiters',
    lua = 'rainbow-blocks',
    tsx = 'rainbow-parens',
  },
  highlight = {
    'RainbowDelimiterViolet',
    'RainbowDelimiterBlue',
    'RainbowDelimiterYellow',
  },
  blacklist = { 'html', 'jsx', 'svelte', 'tsx', 'svg' }
}
