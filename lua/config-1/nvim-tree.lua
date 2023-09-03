-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, remap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  -- vim.keymap.set("n", "<C-e>", api.tree.focus, opts("Focus"))
  -- vim.keymap.set("n", "<leader>e", api.tree.toggle, opts("Toggle"))
  -- vim.keymap.set("n", "<leader>e", api.tree.toggle, { remap = true })
end

-- empty setup using defaults
require("nvim-tree").setup({
  on_attach = my_on_attach,
})
