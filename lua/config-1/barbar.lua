local map = vim.api.nvim_set_keymap

function GetOptsWithDesc(desc)
  return {
    noremap = true,
    silent = true,
    desc = desc,
  }
end

-- Move to previous/next
map('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', GetOptsWithDesc("Previous tab"))
map('n', '<Tab>', '<Cmd>BufferNext<CR>', GetOptsWithDesc("Next tab"))
-- Re-order to previous/next
map('n', '<leader><', '<Cmd>BufferMovePrevious<CR>', GetOptsWithDesc("Move buffer left"))
map('n', '<leader>>', '<Cmd>BufferMoveNext<CR>', GetOptsWithDesc("Move buffer right"))
-- Goto buffer in position...
map('n', '<leader>1', '<Cmd>BufferGoto 1<CR>', GetOptsWithDesc("Go to buffer 1"))
map('n', '<leader>2', '<Cmd>BufferGoto 2<CR>', GetOptsWithDesc("Go to buffer 2"))
map('n', '<leader>3', '<Cmd>BufferGoto 3<CR>', GetOptsWithDesc("Go to buffer 3"))
map('n', '<leader>4', '<Cmd>BufferGoto 4<CR>', GetOptsWithDesc("Go to buffer 4"))
map('n', '<leader>5', '<Cmd>BufferGoto 5<CR>', GetOptsWithDesc("Go to buffer 5"))
map('n', '<leader>6', '<Cmd>BufferGoto 6<CR>', GetOptsWithDesc("Go to buffer 6"))
map('n', '<leader>7', '<Cmd>BufferGoto 7<CR>', GetOptsWithDesc("Go to buffer 7"))
map('n', '<leader>8', '<Cmd>BufferGoto 8<CR>', GetOptsWithDesc("Go to buffer 8"))
map('n', '<leader>9', '<Cmd>BufferGoto 9<CR>', GetOptsWithDesc("Go to buffer 9"))
map('n', '<leader>0', '<Cmd>BufferLast<CR>', GetOptsWithDesc("Go to last buffer"))
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', GetOptsWithDesc("Pin buffer"))
-- Close buffer
map('n', '<leader>x', '<Cmd>BufferClose<CR>', GetOptsWithDesc("Close buffer"))
map('n', '<leader>T', '<Cmd>BufferRestore<CR>', GetOptsWithDesc("Reopen last buffer"))
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-P>', '<Cmd>BufferPick<CR>', GetOptsWithDesc("Pick buffer"))
-- Sort automatically by...
map('n', '<leader>bb', '<Cmd>BufferOrderByBufferNumber<CR>', GetOptsWithDesc("Order buffers by buffer number"))
map('n', '<leader>bd', '<Cmd>BufferOrderByDirectory<CR>', GetOptsWithDesc("Order buffers by directory"))
map('n', '<leader>bl', '<Cmd>BufferOrderByLanguage<CR>', GetOptsWithDesc("Order buffers by language"))
map('n', '<leader>bw', '<Cmd>BufferOrderByWindowNumber<CR>', GetOptsWithDesc("Order buffers by window number"))

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used
