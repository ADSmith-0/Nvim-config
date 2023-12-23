require("ibl").setup({
  indent = {
    char = "┃",
    tab_char = "┃",
  },
  scope = { enabled = false },
  exclude = {
    buftypes = {
      "terminal"
    },
    filetypes = {
      "help",
      "alpha",
      "dashboard",
      "NvimTree",
      "Trouble",
      "trouble",
      "lazy",
      "mason",
      "notify",
    },
  },
})
