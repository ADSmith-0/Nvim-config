-- Grey out searches when using leap/flit
vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })

vim.keymap.set({ "n", "x", "o" }, "<leader>s", function()
  local current_window = vim.fn.win_getid()
  require("leap").leap { target_windows = { current_window } }
end, { desc = "Leap forward to" })
