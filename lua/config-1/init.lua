require("config-1.remap")
require("config-1.set")
require("config-1.lazy")
local plugins = {
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{
    "olimorris/onedarkpro.nvim",
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
	{
		'NvChad/nvim-colorizer.lua'
	},
  {
    'numToStr/Comment.nvim',
    lazy = false,
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  },
  {
    'HiPhish/rainbow-delimiters.nvim',
  },
  {
    'm4xshen/autoclose.nvim'
  },
  {
    "lukas-reineke/indent-blankline.nvim",
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  {
    'mbbill/undotree'
  }
}
require("lazy").setup(plugins)
require("config-1.theme")
require("config-1.nvim-tree")
require("config-1.undotree")
require("config-1.lsp-zero")
require("config-1.lualine")
require("config-1.comment")
require("config-1.barbar")
require("config-1.colorizer")
require("config-1.rainbow-delimiters")
require("config-1.autoclose")
require("config-1.indent-blankline")
