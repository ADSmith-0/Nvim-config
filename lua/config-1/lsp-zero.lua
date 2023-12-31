local lsp = require("lsp-zero").preset({})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({ buffer = bufnr })
end)

-- (Optional) Configure lua language server for neovim
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

local lsp = require("lsp-zero")
lsp.preset("recommended")

local ls = require("luasnip")

local cmp = require("cmp")
local cmp_mappings = lsp.defaults.cmp_mappings({
  ["<C-n>"] = cmp.mapping(function(fallback)
    local col = vim.fn.col(".") - 1
    if cmp.visible() then
      cmp.select_next_item()
    elseif ls.expand_or_jumpable() then
      ls.expand_or_jump()
    elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
      cmp.complete()
    else
      fallback()
    end
  end, { "i", "s" }),

  ["<C-p>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    elseif ls.jumpable(-1) then
      ls.jump(-1)
    else
      fallback()
    end
  end, { "i", "s" }),

  ["<Tab>"] = cmp.mapping.confirm({ select = false })
})

lsp.setup_nvim_cmp({
  preselect = "item",
  snippet = {
    expand = function(args)
      ls.lsp_expand(args.body)
    end
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
  },
  completion = {
    completeopt = "menu,menuone,noinsert"
  },
  mapping = cmp_mappings,
})

lsp.set_sign_icons({
  error = "",
  warn = "",
  hint = "",
  info = "",
})

lsp.setup()

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function(event)
    function GetOptsWithDesc(desc)
      return {
        buffer = event.buf,
        desc = desc
      }
    end

    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", GetOptsWithDesc("Get info for symbol"))
    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", GetOptsWithDesc("Go to definition"))
    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", GetOptsWithDesc("Go to declaration"))
    vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", GetOptsWithDesc("Go to implementation"))
    vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", GetOptsWithDesc("Get type definition"))
    vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", GetOptsWithDesc("Find references for symbol"))
    vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", GetOptsWithDesc("Signature help"))
    vim.keymap.set("n", "<leader>rs", "<cmd>lua vim.lsp.buf.rename()<cr>", GetOptsWithDesc("Rename symbol"))
    vim.keymap.set({ "n", "x" }, "<leader>fo", "<cmd>lua vim.lsp.buf.format({async = true})<cr>",
      GetOptsWithDesc("Format buffer"))
    vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>",
      { buffer = event.buf, remap = true, desc = "Code action" })

    vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", GetOptsWithDesc("Open diagnostic float"))
    vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", GetOptsWithDesc("Go to previous error"))
    vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", GetOptsWithDesc("Go to next error"))
  end
});
